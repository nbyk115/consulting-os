"""Test falsification check parser."""

from consulting_os.falsification import parse_falsification


def test_complete_falsification_block():
    output = """
回答本文。

【反証チェック結果】

Step 1 (自己反証): 自分の主張に反対する立場を取ると、A という反論が成立する。これに対し、B という根拠で反証可能。

Step 2 (構造反証): 出力構造として、C の論理整合性を確認した。

Step 3 (実用反証): grep -c "X" file.txt の実出力 = 5、検証 PASS。

残存リスク: D が想定外に発生した場合のフォールバック未整備。次セッションで対応予定。
"""
    check = parse_falsification(output)
    assert check.has_all_steps is True
    assert "A という反論" in check.step1_self
    assert "C の論理整合性" in check.step2_structural
    assert "grep" in check.step3_practical
    assert "フォールバック未整備" in check.residual_risk


def test_missing_residual_risk_fails():
    output = """
【反証チェック結果】
Step 1 (自己反証): X
Step 2 (構造反証): Y
Step 3 (実用反証): Z
"""
    check = parse_falsification(output)
    assert check.has_all_steps is False


def test_missing_header_fails():
    output = """
Step 1 (自己反証): X
Step 2 (構造反証): Y
Step 3 (実用反証): Z
残存リスク: W
"""
    check = parse_falsification(output)
    assert check.has_all_steps is False


def test_no_falsification_at_all():
    output = "ただの回答です。反証なし。"
    check = parse_falsification(output)
    assert check.has_all_steps is False
