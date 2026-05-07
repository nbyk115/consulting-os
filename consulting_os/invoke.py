"""Main API: format prompt + validate output.

ConsultingOS は Claude Code (ユーザー既存契約) を runtime として使う。
本モジュールは Anthropic API を直接叩かず、以下のみ提供:
1. format_prompt() - agent + skill + 規律 instruction を統合してプロンプト整形 (zero cost)
2. validate_output() - 応答テキストに対して規律チェック (zero cost)

実 runtime = Claude Code 契約。本パッケージで API 課金は発生しない。
"""

from __future__ import annotations

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


def format_prompt(
    agent: str,
    request: str,
    context: Optional[dict[str, Any]] = None,
    *,
    agents_root: str | Path = ".claude/agents",
    skills_root: str | Path = ".claude/skills",
    auto_skill: bool = True,
) -> dict[str, str]:
    agent_obj = get_agent(agent, agents_root=agents_root)

    skill_bodies: list[str] = []
    if auto_skill:
        skills = load_all_skills(skills_root=skills_root)
        for skill in find_skills_for_request(request, skills):
            skill_bodies.append(skill.body)

    parts = [agent_obj.system_prompt]
    if skill_bodies:
        parts.append("\n\n## 参照スキル (ConsultingOS が自動付与)\n")
        for body in skill_bodies:
            parts.append(body[:4000])
            parts.append("\n---\n")
    parts.append(FALSIFICATION_INSTRUCTION)
    parts.append(SOURCE_LABEL_INSTRUCTION)
    system_prompt = "\n".join(parts)

    user_message = request
    if context:
        ctx_lines = [f"- {k}: {v}" for k, v in context.items()]
        user_message = request + "\n\n## 追加コンテキスト\n" + "\n".join(ctx_lines)

    return {
        "agent": agent,
        "model_hint": agent_obj.model,
        "system": system_prompt,
        "user": user_message,
    }


def validate_output(output: str, *, agent: str = "", request: str = "") -> Result:
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
        raw_response=None,
    )


def invoke(*args, **kwargs):
    raise RuntimeError(
        "ConsultingOS は Anthropic API を直接叩かず、Claude Code を runtime として使います。\n"
        "用途別 API:\n"
        "  - プロンプト整形: format_prompt(agent, request, context)\n"
        "  - 応答検証:       validate_output(output_text)\n"
        "Claude Code への引き渡しは format_prompt() の戻り値を使ってください。"
    )
