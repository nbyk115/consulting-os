"""Smoke test for invoke API with mock Anthropic client."""

from pathlib import Path
from unittest.mock import MagicMock

from consulting_os.invoke import invoke

REPO_ROOT = Path(__file__).resolve().parent.parent


def _mock_client(response_text: str) -> MagicMock:
    block = MagicMock()
    block.text = response_text
    response = MagicMock()
    response.content = [block]
    response.id = "msg_test_001"

    client = MagicMock()
    client.messages.create.return_value = response
    return client


def test_invoke_returns_result_with_discipline_pass():
    response_text = """
回答本文。市場規模は 100 億円 (INFERENCE: 推定)。

【反証チェック結果】
Step 1 (自己反証): A への反証は B
Step 2 (構造反証): C の整合性確認
Step 3 (実用反証): grep の実出力 = 5
残存リスク: D は次セッションで対応
"""
    result = invoke(
        agent="strategy-lead",
        request="N.Y.CRAFT の OEM 戦略を 3 軸で",
        agents_root=REPO_ROOT / ".claude" / "agents",
        skills_root=REPO_ROOT / ".claude" / "skills",
        client=_mock_client(response_text),
    )
    assert result.agent == "strategy-lead"
    assert result.falsification is not None
    assert result.falsification.has_all_steps is True
    assert result.discipline_pass is True
    assert result.violations == []


def test_invoke_detects_falsification_violation():
    response_text = "回答だけで反証なし"
    result = invoke(
        agent="strategy-lead",
        request="任意",
        agents_root=REPO_ROOT / ".claude" / "agents",
        skills_root=REPO_ROOT / ".claude" / "skills",
        client=_mock_client(response_text),
    )
    assert result.discipline_pass is False
    assert any("反証チェック" in v for v in result.violations)


def test_invoke_detects_bare_number_violation():
    response_text = """
市場規模 500 億円。

【反証チェック結果】
Step 1 (自己反証): A
Step 2 (構造反証): B
Step 3 (実用反証): C
残存リスク: D
"""
    result = invoke(
        agent="strategy-lead",
        request="任意",
        agents_root=REPO_ROOT / ".claude" / "agents",
        skills_root=REPO_ROOT / ".claude" / "skills",
        client=_mock_client(response_text),
    )
    assert result.discipline_pass is False
    assert any("出典なし数値" in v for v in result.violations)


def test_invoke_passes_system_prompt_to_client():
    client = _mock_client("dummy with 反証チェック結果 Step 1 自己反証 X Step 2 構造反証 Y Step 3 実用反証 Z 残存リスク W")
    invoke(
        agent="strategy-lead",
        request="任意のリクエスト",
        agents_root=REPO_ROOT / ".claude" / "agents",
        skills_root=REPO_ROOT / ".claude" / "skills",
        auto_skill=False,
        client=client,
    )
    call_kwargs = client.messages.create.call_args.kwargs
    assert "system" in call_kwargs
    assert "反証チェック結果" in call_kwargs["system"]
    assert "FACT" in call_kwargs["system"]
