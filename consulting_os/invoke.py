"""Main invoke API: callable entry point for ConsultingOS agents.

Anthropic SDK が production reliability を担保し、本モジュールが規律 enforcement を担う。
"""

from __future__ import annotations

import os
from pathlib import Path
from typing import Any, Optional

from consulting_os.agent_loader import get_agent
from consulting_os.falsification import (
    FALSIFICATION_INSTRUCTION,
    parse_falsification,
)
from consulting_os.skill_loader import find_skills_for_request, load_all_skills
from consulting_os.source_label import SOURCE_LABEL_INSTRUCTION, parse_labels
from consulting_os.types import Result

DEFAULT_MODEL_MAP = {
    "opus": "claude-opus-4-7",
    "sonnet": "claude-sonnet-4-6",
    "haiku": "claude-haiku-4-5-20251001",
}


def _build_system_prompt(agent_system: str, skill_bodies: list[str]) -> str:
    parts = [agent_system]
    if skill_bodies:
        parts.append("\n\n## 参照スキル (ConsultingOS が自動付与)\n")
        for body in skill_bodies:
            parts.append(body[:4000])
            parts.append("\n---\n")
    parts.append(FALSIFICATION_INSTRUCTION)
    parts.append(SOURCE_LABEL_INSTRUCTION)
    return "\n".join(parts)


def invoke(
    agent: str,
    request: str,
    context: Optional[dict[str, Any]] = None,
    *,
    agents_root: str | Path = ".claude/agents",
    skills_root: str | Path = ".claude/skills",
    auto_skill: bool = True,
    max_tokens: int = 4096,
    client: Any = None,
) -> Result:
    agent_obj = get_agent(agent, agents_root=agents_root)

    skill_bodies: list[str] = []
    if auto_skill:
        skills = load_all_skills(skills_root=skills_root)
        for skill in find_skills_for_request(request, skills):
            skill_bodies.append(skill.body)

    system_prompt = _build_system_prompt(agent_obj.system_prompt, skill_bodies)

    user_message = request
    if context:
        ctx_lines = [f"- {k}: {v}" for k, v in context.items()]
        user_message = request + "\n\n## 追加コンテキスト\n" + "\n".join(ctx_lines)

    if client is None:
        try:
            import anthropic
        except ImportError as exc:
            raise RuntimeError(
                "anthropic package not installed. Run: pip install 'consulting-os[anthropic]'"
            ) from exc
        api_key = os.environ.get("ANTHROPIC_API_KEY")
        if not api_key:
            raise RuntimeError(
                "ANTHROPIC_API_KEY env var not set. Set it before invoking."
            )
        client = anthropic.Anthropic(api_key=api_key)

    model_id = DEFAULT_MODEL_MAP.get(agent_obj.model, agent_obj.model)

    response = client.messages.create(
        model=model_id,
        max_tokens=max_tokens,
        system=system_prompt,
        messages=[{"role": "user", "content": user_message}],
    )

    output = _extract_text(response)
    falsification = parse_falsification(output)
    sources = parse_labels(output)

    violations: list[str] = []
    if not falsification.has_all_steps:
        violations.append("反証チェック Step 1-3 + 残存リスクが不完全 (Hard Rule 1)")
    if sources.bare_numbers:
        violations.append(
            f"出典なし数値断言 {len(sources.bare_numbers)} 件 (Hard Rule 2)"
        )

    return Result(
        agent=agent,
        request=request,
        output=output,
        falsification=falsification,
        sources=sources,
        discipline_pass=not violations,
        violations=violations,
        raw_response={"id": getattr(response, "id", None), "model": model_id},
    )


def _extract_text(response: Any) -> str:
    content = getattr(response, "content", None)
    if content is None:
        return str(response)
    if isinstance(content, list):
        parts: list[str] = []
        for block in content:
            text = getattr(block, "text", None)
            if text:
                parts.append(text)
        return "\n".join(parts)
    return str(content)
