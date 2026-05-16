#!/usr/bin/env bash
# distribute-os-skills.sh
# ConsultingOS の skill / agent / hook を別リポ案件環境に物理配布する。
# 2026-05-15 PR #234 物理化: skill が案件環境 (yorunokotoba / nycraftOS 等) に
# 物理的に存在しない構造盲点 (symlink は同一環境内のみ有効) への対策。
#
# 使い方: 案件リポのルートで実行する。
#   bash <(curl -s https://raw.githubusercontent.com/nbyk115/consulting-os/main/scripts/distribute-os-skills.sh)
# または consulting-os を clone 済なら:
#   bash /path/to/consulting-os/scripts/distribute-os-skills.sh
#
# 配布対象: .claude/skills/ (規律本体) / .claude/agents/ / docs/handoff-os-activation-template.md
# 配布しない: .claude/hooks/ (案件リポ固有の settings.json 連携が必要、手動判断)
#            .claude/settings.json (案件リポ固有設定を上書きしないため)

set -euo pipefail

COS_REPO="https://github.com/nbyk115/consulting-os.git"
TARGET_ROOT="$(pwd)"
TMP_DIR="$(mktemp -d)"

trap 'rm -rf "$TMP_DIR"' EXIT

echo "[distribute-os-skills] ConsultingOS skill を $TARGET_ROOT に配布します"

# 案件リポのルートか簡易確認 (.git の存在)
if [ ! -d "$TARGET_ROOT/.git" ]; then
  echo "[distribute-os-skills] WARN: $TARGET_ROOT は git リポジトリのルートではありません" >&2
  echo "  案件リポのルートで実行してください" >&2
  exit 1
fi

# consulting-os を一時 clone (最新 main)
echo "[distribute-os-skills] consulting-os main を取得中..."
git clone --depth 1 --branch main "$COS_REPO" "$TMP_DIR/cos" 2>/dev/null || {
  echo "[distribute-os-skills] ERROR: consulting-os の clone 失敗" >&2
  exit 1
}

# 配布先ディレクトリ作成
mkdir -p "$TARGET_ROOT/.claude/skills" "$TARGET_ROOT/.claude/agents" "$TARGET_ROOT/docs"

# skill 配布 (references/ サブディレクトリ含む)
cp -r "$TMP_DIR/cos/.claude/skills/." "$TARGET_ROOT/.claude/skills/"
SKILL_COUNT=$(find "$TARGET_ROOT/.claude/skills" -name '*.md' | wc -l | tr -d ' ')
echo "[distribute-os-skills] skill 配布完了: $SKILL_COUNT 件 (.md)"

# agent 配布
cp -r "$TMP_DIR/cos/.claude/agents/." "$TARGET_ROOT/.claude/agents/"
AGENT_COUNT=$(find "$TARGET_ROOT/.claude/agents" -name '*.md' | wc -l | tr -d ' ')
echo "[distribute-os-skills] agent 配布完了: $AGENT_COUNT 件"

# 機能化ハンドオフテンプレート配布
cp "$TMP_DIR/cos/docs/handoff-os-activation-template.md" "$TARGET_ROOT/docs/" 2>/dev/null || true
echo "[distribute-os-skills] handoff-os-activation-template.md 配布完了"

echo ""
echo "[distribute-os-skills] 配布完了。案件セッションは以下を実行:"
echo "  1. docs/handoff-os-activation-template.md を Read"
echo "  2. .claude/skills/ の該当 skill を委任プロンプトに明示 (PR #219/#230)"
echo "  3. 定期再実行で ConsultingOS 規律を最新化 (Hard Rule 18)"
echo ""
echo "注意: .claude/hooks/ と settings.json は案件リポ固有設定があるため配布対象外。"
echo "  hook が必要な場合は consulting-os の .claude/hooks/ + settings.json を手動参照。"
