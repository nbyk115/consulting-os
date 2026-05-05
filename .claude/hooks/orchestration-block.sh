#!/bin/bash
# PreToolUse hook: 案件成果物の Write/Edit/MultiEdit 時にエージェント起動履歴を検証
# 対象: strategy/*/*.html|*.pptx|*.pdf / examples/*/*.html|*.pptx|*.pdf
# 直近5分以内にエージェント（sales-deck-designer/frontend-dev/creative-director/ux-designer/brand-guardian）
# の起動履歴がなければ stderr に警告 + exit 2 で物理ブロック
# 2026-05-04 違反学習: orchestration 物理ブロック実装

set -e

# 2026-05-05 F1 修正: false positive オーバーライド機構（Docker / CI / セッションログ検出不可環境）
# CONSULTINGOS_ORCHESTRATION_BYPASS=1 で全体スキップ（escape hatch）
if [ "${CONSULTINGOS_ORCHESTRATION_BYPASS:-0}" = "1" ]; then
  exit 0
fi

TOOL_NAME="${CLAUDE_TOOL_NAME:-}"

# Write / Edit / MultiEdit のみ対象
case "$TOOL_NAME" in
  Write|Edit|MultiEdit) ;;
  *) exit 0 ;;
esac

FILE=$(echo "$CLAUDE_TOOL_INPUT" | jq -r '.file_path // .filePath // empty' 2>/dev/null)

# ファイルパス未取得なら通過（false positive 防止）
if [ -z "$FILE" ]; then
  exit 0
fi

# テストケース7対応: Edit の場合、old_string が 200 バイト以内なら軽微修正として通過
# （typo 1-3 字 / インデント等の形式修正は物理ブロック対象外）
if [ "$TOOL_NAME" = "Edit" ]; then
  OLD_STR=$(echo "$CLAUDE_TOOL_INPUT" | jq -r '.old_string // empty' 2>/dev/null)
  OLD_LEN=${#OLD_STR}
  if [ "$OLD_LEN" -le 200 ]; then
    exit 0
  fi
fi

# プロジェクトルート検出（case 判定の前に移動: 2026-05-05 C1 修正）
ROOT=$(git rev-parse --show-toplevel 2>/dev/null || echo "$(pwd)")

# 絶対パス対応: ROOT を剥がして相対化（Claude Code は絶対パスを渡す）
REL_FILE="${FILE#$ROOT/}"

# 対象パターン判定（Phase 4 強化 2026-05-04: docx / md も対象に追加）
case "$REL_FILE" in
  strategy/*/*.html|strategy/*/*.css|strategy/*/*.pptx|strategy/*/*.pdf|\
  strategy/*/*.docx|strategy/*/*.md|\
  strategy/*/case-*.html|strategy/*/index.html|\
  examples/*/*.html|examples/*/*.css|examples/*/*.pptx|examples/*/*.pdf|\
  examples/*/*.docx|examples/*/*.md)
    ;;
  *)
    exit 0
    ;;
esac

# エージェント起動履歴チェック（Claude Code projects ディレクトリ内の最近5分セッション）
# パス候補: ~/.claude/projects/<encoded-path>/ 配下の *.jsonl
# 2026-05-05 F-CRIT-1 修正: フォールバック ${HOME}/.claude/projects（プロジェクト全体走査）削除
# 別プロジェクトの履歴を拾う false negative リスク解消、PROJECT_HASH 厳格化 + ハイフン先頭バリアント追加
PROJECT_HASH=$(echo "$ROOT" | tr '/' '-' | sed 's/^-//')
SESSION_DIRS=(
  "${HOME}/.claude/projects/${PROJECT_HASH}"
  "${HOME}/.claude/projects/-${PROJECT_HASH}"
  "${HOME}/.claude/projects/$(basename "$ROOT")"
)

RECENT_AGENT=""
for SDIR in "${SESSION_DIRS[@]}"; do
  if [ -d "$SDIR" ]; then
    RECENT_AGENT=$(find "$SDIR" -name "*.jsonl" -mmin -5 \
      -exec grep -l \
        -E '"subagent_type".*"(sales-deck-designer|frontend-dev|creative-director|ux-designer|brand-guardian)"|"agent_name".*"(sales-deck-designer|frontend-dev|creative-director|ux-designer|brand-guardian)"' \
        {} \; 2>/dev/null | head -1)
    if [ -n "$RECENT_AGENT" ]; then
      break
    fi
  fi
done

if [ -z "$RECENT_AGENT" ]; then
  # セッションログディレクトリ自体が存在しない環境でも動作させる
  # ログが見つからない = 起動履歴なし OR ログ検出不可
  # ログ検出不可の場合は false positive リスクがあるため stderr 警告 + exit 2 でブロック
  echo "BLOCKED: $FILE は形式変換を伴う案件成果物です。直近5分以内に sales-deck-designer / frontend-dev / creative-director / ux-designer / brand-guardian のいずれかの起動履歴が確認できませんでした（CLAUDE.md ハードルール 17・2026-05-04 物理ブロック実装）。1. 関連エージェントを起動してください。2. 起動済みの場合はセッションログが検出できない環境のため手動確認が必要です。エージェント起動なしの assistant 単独 Write/Edit は ConsultingOS 存在意義違反 = evolution-log 記録義務。" >&2
  exit 2
fi

exit 0
