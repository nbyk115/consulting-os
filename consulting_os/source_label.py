"""Source label enforcer (CLAUDE.md Hard Rule 2): FACT / INFERENCE / SPECULATION."""

from __future__ import annotations

import re

from consulting_os.types import SourceLabels

NUMBER_WITH_UNIT = re.compile(
    r"(?P<number>\d+(?:\.\d+)?(?:\s*[兆億万千百]+)?(?:\s*(?:%|％|円|万円|億円|倍|人|社|件|時間|分|日|月|年|時間|GB|MB|TB)))",
)

FACT_LABEL = re.compile(r"FACT\b")
INFERENCE_LABEL = re.compile(r"INFERENCE\b")
SPECULATION_LABEL = re.compile(r"SPECULATION\b")


def _line_has_label(line: str) -> bool:
    return bool(
        FACT_LABEL.search(line)
        or INFERENCE_LABEL.search(line)
        or SPECULATION_LABEL.search(line)
    )


def _line_has_source_url(line: str) -> bool:
    return "<a href=" in line or "](http" in line or "出典" in line


def detect_bare_numbers(text: str) -> list[str]:
    bare: list[str] = []
    for line in text.splitlines():
        stripped = line.strip()
        if not stripped or stripped.startswith("#"):
            continue
        for match in NUMBER_WITH_UNIT.finditer(stripped):
            number = match.group("number")
            if _line_has_label(stripped) or _line_has_source_url(stripped):
                continue
            bare.append(f"{number} (line: {stripped[:80]})")
            break
    return bare


def parse_labels(text: str) -> SourceLabels:
    labels = SourceLabels()
    for line in text.splitlines():
        stripped = line.strip()
        if not stripped:
            continue
        if FACT_LABEL.search(stripped):
            labels.facts.append(stripped)
        elif INFERENCE_LABEL.search(stripped):
            labels.inferences.append(stripped)
        elif SPECULATION_LABEL.search(stripped):
            labels.speculations.append(stripped)
    labels.bare_numbers = detect_bare_numbers(text)
    return labels


SOURCE_LABEL_INSTRUCTION = """
【数値の扱い (CLAUDE.md Hard Rule 2)】

具体数値 (X 割 / X% / 金額 / 年次予測) を出すときは必ず以下のいずれかを併記:
1. FACT: 出典 URL + 発行年を明示
2. INFERENCE: 推定根拠 + 「INFERENCE」ラベル
3. SPECULATION: 不確実性の度合い + 「SPECULATION」ラベル

出典なし数値の断言は禁止。
"""
