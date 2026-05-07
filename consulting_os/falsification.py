"""Falsification check enforcer (CLAUDE.md Hard Rule 1)."""

from __future__ import annotations

import re

from consulting_os.types import FalsificationCheck

STEP1_PATTERN = re.compile(r"Step\s*1[^\n]*?\(?自己反証\)?", re.IGNORECASE)
STEP2_PATTERN = re.compile(r"Step\s*2[^\n]*?\(?構造反証\)?", re.IGNORECASE)
STEP3_PATTERN = re.compile(r"Step\s*3[^\n]*?\(?実用反証\)?", re.IGNORECASE)
RESIDUAL_PATTERN = re.compile(r"残存リスク", re.IGNORECASE)
HEADER_PATTERN = re.compile(r"反証チェック結果", re.IGNORECASE)


def _extract_section(text: str, pattern: re.Pattern[str], stop_patterns: list[re.Pattern[str]]) -> str:
    match = pattern.search(text)
    if not match:
        return ""
    start = match.end()
    end = len(text)
    for stop in stop_patterns:
        stop_match = stop.search(text, start)
        if stop_match and stop_match.start() < end:
            end = stop_match.start()
    return text[start:end].strip()


def parse_falsification(output: str) -> FalsificationCheck:
    has_header = bool(HEADER_PATTERN.search(output))
    step1_match = bool(STEP1_PATTERN.search(output))
    step2_match = bool(STEP2_PATTERN.search(output))
    step3_match = bool(STEP3_PATTERN.search(output))
    residual_match = bool(RESIDUAL_PATTERN.search(output))

    step1 = _extract_section(
        output, STEP1_PATTERN, [STEP2_PATTERN, STEP3_PATTERN, RESIDUAL_PATTERN]
    )
    step2 = _extract_section(
        output, STEP2_PATTERN, [STEP3_PATTERN, RESIDUAL_PATTERN]
    )
    step3 = _extract_section(output, STEP3_PATTERN, [RESIDUAL_PATTERN])
    residual = _extract_section(output, RESIDUAL_PATTERN, [])

    has_all = has_header and step1_match and step2_match and step3_match and residual_match

    return FalsificationCheck(
        step1_self=step1,
        step2_structural=step2,
        step3_practical=step3,
        residual_risk=residual,
        has_all_steps=has_all,
    )


FALSIFICATION_INSTRUCTION = """
【出力末尾に必ず付与すべき反証チェック (CLAUDE.md Hard Rule 1)】

【反証チェック結果】

Step 1 (自己反証): 自分の出力に対する反対意見と、その反証
Step 2 (構造反証): 出力構造の妥当性確認
Step 3 (実用反証): 実測コマンド + 実出力で証明
残存リスク: 解消できなかったリスク (即潰しの方針も含めて記載)

省略・形骸化禁止。narrative のみは無効、Step 3 は実コマンド出力を必ず添付。
"""
