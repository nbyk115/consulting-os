"""Tests for auto-validate-discipline.sh hook (smoke + Python wrapper integration)."""

import json
import subprocess
import textwrap
from pathlib import Path

import pytest

REPO_ROOT = Path(__file__).resolve().parent.parent
HOOK = REPO_ROOT / ".claude" / "hooks" / "auto-validate-discipline.sh"


@pytest.fixture
def transcript_with_response(tmp_path: Path):
    def _build(text: str) -> Path:
        path = tmp_path / "transcript.jsonl"
        events = [
            {
                "type": "assistant",
                "message": {
                    "content": [{"type": "text", "text": text}],
                },
            }
        ]
        path.write_text("\n".join(json.dumps(e) for e in events))
        return path

    return _build


def _run_hook(transcript_path: Path, enforcement: str = "warn") -> subprocess.CompletedProcess:
    stdin = json.dumps({"transcript_path": str(transcript_path)})
    return subprocess.run(
        ["bash", str(HOOK)],
        input=stdin,
        text=True,
        capture_output=True,
        env={
            "PATH": "/usr/bin:/bin:/usr/local/bin",
            "PYTHONPATH": str(REPO_ROOT),
            "CONSULTINGOS_AUTO_VALIDATE": enforcement,
            "CONSULTINGOS_VALIDATE_LOG": str(REPO_ROOT / "tests" / "_tmp_validate.log"),
        },
        cwd=str(REPO_ROOT),
        check=False,
    )


def test_hook_passes_complete_response(transcript_with_response):
    response = textwrap.dedent("""
    回答本文。市場規模は 100 億円 (INFERENCE: 推定)。

    【反証チェック結果】
    Step 1 (自己反証): A への反証は B
    Step 2 (構造反証): C の整合性確認
    Step 3 (実用反証): grep の実出力 = 5
    残存リスク: D は次セッションで対応
    """).strip()
    transcript = transcript_with_response(response)
    result = _run_hook(transcript, enforcement="warn")
    assert result.returncode == 0
    assert "規律違反検出" not in result.stderr


def test_hook_warns_on_missing_falsification(transcript_with_response):
    response = "ただの回答で反証なし"
    transcript = transcript_with_response(response)
    result = _run_hook(transcript, enforcement="warn")
    assert result.returncode == 0
    assert "規律違反検出" in result.stderr
    assert "反証チェック" in result.stderr


def test_hook_blocks_on_violation_when_block_mode(transcript_with_response):
    response = "違反入り回答"
    transcript = transcript_with_response(response)
    result = _run_hook(transcript, enforcement="block")
    assert result.returncode == 2
    assert "規律違反検出" in result.stderr


def test_hook_off_mode_skips_validation(transcript_with_response):
    response = "違反だらけだが off モード"
    transcript = transcript_with_response(response)
    result = _run_hook(transcript, enforcement="off")
    assert result.returncode == 0
    assert result.stderr == ""


def test_hook_handles_missing_transcript_gracefully(tmp_path: Path):
    fake_path = tmp_path / "nonexistent.jsonl"
    stdin = json.dumps({"transcript_path": str(fake_path)})
    result = subprocess.run(
        ["bash", str(HOOK)],
        input=stdin,
        text=True,
        capture_output=True,
        env={
            "PATH": "/usr/bin:/bin:/usr/local/bin",
            "PYTHONPATH": str(REPO_ROOT),
            "CONSULTINGOS_AUTO_VALIDATE": "warn",
        },
        cwd=str(REPO_ROOT),
        check=False,
    )
    assert result.returncode == 0
