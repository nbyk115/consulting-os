"""Agent loader: parse .claude/agents/<dept>/<name>.md into Agent objects."""

from __future__ import annotations

import re
from pathlib import Path

from consulting_os.types import Agent

FRONTMATTER_PATTERN = re.compile(r"^---\s*\n(.*?)\n---\s*\n(.*)", re.DOTALL)


def _parse_frontmatter(text: str) -> tuple[dict[str, str], str]:
    match = FRONTMATTER_PATTERN.match(text)
    if not match:
        return {}, text
    raw_meta, body = match.group(1), match.group(2)
    meta: dict[str, str] = {}
    for line in raw_meta.splitlines():
        if ":" not in line:
            continue
        key, _, value = line.partition(":")
        meta[key.strip()] = value.strip()
    return meta, body


def load_agent(file_path: Path) -> Agent:
    text = file_path.read_text(encoding="utf-8")
    meta, body = _parse_frontmatter(text)

    name = meta.get("name") or file_path.stem
    description = meta.get("description", "")
    model = meta.get("model", "sonnet")
    department = file_path.parent.name

    return Agent(
        name=name,
        description=description,
        model=model,
        department=department,
        system_prompt=body.strip(),
        file_path=str(file_path),
    )


def load_all_agents(agents_root: Path | str = ".claude/agents") -> dict[str, Agent]:
    root = Path(agents_root)
    if not root.exists():
        raise FileNotFoundError(f"Agents directory not found: {root}")

    agents: dict[str, Agent] = {}
    for md_file in sorted(root.rglob("*.md")):
        agent = load_agent(md_file)
        if agent.name in agents:
            raise ValueError(f"Duplicate agent name: {agent.name}")
        agents[agent.name] = agent
    return agents


def get_agent(name: str, agents_root: Path | str = ".claude/agents") -> Agent:
    agents = load_all_agents(agents_root)
    if name not in agents:
        available = ", ".join(sorted(agents.keys()))
        raise KeyError(f"Agent '{name}' not found. Available: {available}")
    return agents[name]
