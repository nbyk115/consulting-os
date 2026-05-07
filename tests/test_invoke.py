"""Test format_prompt + validate_output (zero cost, no API calls)."""

from pathlib import Path

import pytest

from consulting_os.invoke import format_prompt, invoke, validate_output

REPO_ROOT = Path(__file__).resolve().parent.parent


def test_format_prompt_returns_system_and_user():
    prompt = format_prompt(
        agent="strategy-lead",
        request="N.Y.CRAFT の OEM 戦略",
        agents_root=REPO_ROOT / ".claude" / "agents",
        skills_root=REPO_ROOT / ".claude" / "skills",
        auto_skill=False,
    )
    assert "system" in prompt
    assert "user" in prompt
    assert "agent" in prompt
    assert prompt["agent"] == "strategy-lead"
    assert "反証チェック結果" in prompt["system"]
    assert "FACT" in prompt["system"]
    assert "N.Y.CRAFT" in prompt["user"]


def test_format_prompt_with_context():
    prompt = format_prompt(
        agent="strategy-lead",
        request="戦略策定",
        context={"client": "TestCorp", "budget": "100万"},
        agents_root=REPO_ROOT / ".claude" / "agents",
        skills_root=REPO_ROOT / ".claude" / "skills",
        auto_skill=False,
    )
    assert "TestCorp" in prompt["user"]
    assert "100万" in prompt["user"]


def test_validate_output_passes_complete_response():
    output = """
回答本文。市場規模は 100 億円 (INFERENCE: 推定)。

【反証チェック結果】
Step 1 (自己反証): A への反証は B
Step 2 (構造反証): C の整合性確認
Step 3 (実用反証): grep の実出力 = 5
残存リスク: D は次セッションで対応
"""
    result = validate_output(output, agent="strategy-lead")
    assert result.discipline_pass is True
    assert result.falsification is not None
    assert result.falsification.has_all_steps is True
    assert result.violations == []


def test_validate_output_detects_falsification_violation():
    result = validate_output("ただの回答で反証なし")
    assert result.discipline_pass is False
    assert any("反証チェック" in v for v in result.violations)


def test_validate_output_detects_bare_number():
    output = """
市場規模 500 億円。

【反証チェック結果】
Step 1 (自己反証): A
Step 2 (構造反証): B
Step 3 (実用反証): C
残存リスク: D
"""
    result = validate_output(output)
    assert result.discipline_pass is False
    assert any("出典なし数値" in v for v in result.violations)


def test_invoke_raises_runtime_error_with_helpful_message():
    with pytest.raises(RuntimeError) as exc_info:
        invoke()
    assert "Claude Code" in str(exc_info.value)
    assert "format_prompt" in str(exc_info.value)
