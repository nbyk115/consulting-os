"""Skill loader: parse .claude/skills/**/*.md into Skill objects."""

from __future__ import annotations

from pathlib import Path

from consulting_os.types import Skill


def load_skill(file_path: Path) -> Skill:
    text = file_path.read_text(encoding="utf-8")
    lines = text.splitlines()

    title = file_path.stem if file_path.stem != "SKILL" else file_path.parent.name
    description = ""

    for i, raw in enumerate(lines):
        stripped = raw.strip()
        if stripped.startswith("# "):
            title = stripped[2:].strip()
            for next_line in lines[i + 1 :]:
                next_stripped = next_line.strip()
                if next_stripped and not next_stripped.startswith("#"):
                    description = next_stripped
                    break
            break

    return Skill(
        name=title,
        description=description,
        body=text,
        file_path=str(file_path),
    )


def load_all_skills(skills_root: Path | str = ".claude/skills") -> dict[str, Skill]:
    root = Path(skills_root)
    if not root.exists():
        raise FileNotFoundError(f"Skills directory not found: {root}")

    skills: dict[str, Skill] = {}
    for md_file in sorted(root.rglob("*.md")):
        if md_file.name == "SKILL.md":
            key = md_file.parent.name
        else:
            key = md_file.stem
        if key in skills:
            continue
        skills[key] = load_skill(md_file)
    return skills


def find_skills_for_request(
    request: str,
    skills: dict[str, Skill],
    keywords_per_skill: int = 3,
) -> list[Skill]:
    request_lower = request.lower()
    matches: list[tuple[int, Skill]] = []
    for skill in skills.values():
        score = 0
        for token in skill.name.lower().replace("-", " ").split():
            if len(token) >= 3 and token in request_lower:
                score += 1
        if score > 0:
            matches.append((score, skill))
    matches.sort(key=lambda pair: pair[0], reverse=True)
    return [skill for _, skill in matches[:keywords_per_skill]]
