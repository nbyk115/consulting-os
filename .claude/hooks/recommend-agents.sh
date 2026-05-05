#!/bin/bash
# UserPromptSubmit hook: ユーザープロンプトのキーワード分析 → 関連エージェント推奨
# Phase 5-1 実装 — 2026-05-04
# 入力: stdin から JSON ペイロード（CLAUDE_USER_PROMPT 環境変数も参照）
# 出力: stdout に {"additionalContext": "..."} 形式
# 絵文字禁止（CLAUDE.md ハードルール 16 準拠）

set -e

# --- 環境変数 ---
# CONSULTINGOS_AGENT_ENFORCEMENT=off|suggest|warn|block（default: suggest）
# block モードでも UserPromptSubmit では exit 2 しない（物理ブロック責務は orchestration-block.sh に一元化）
ENFORCEMENT="${CONSULTINGOS_AGENT_ENFORCEMENT:-suggest}"

# off モードは即時通過
if [ "$ENFORCEMENT" = "off" ]; then
  exit 0
fi

# --- プロンプト取得 ---
# Claude Code は UserPromptSubmit フックに対して stdin へ JSON を渡す
# 形式: {"prompt": "ユーザー入力全文", ...}
STDIN_INPUT=$(cat 2>/dev/null || true)

# stdin から prompt キーを抽出
USER_PROMPT=""
if [ -n "$STDIN_INPUT" ]; then
  USER_PROMPT=$(echo "$STDIN_INPUT" | jq -r '.prompt // empty' 2>/dev/null || true)
fi

# stdin に prompt がなければ環境変数にフォールバック
if [ -z "$USER_PROMPT" ]; then
  USER_PROMPT="${CLAUDE_USER_PROMPT:-}"
fi

# プロンプトが空なら通過
if [ -z "$USER_PROMPT" ]; then
  exit 0
fi

# --- 短文スキップ（10文字未満: 雑談・確認質問への過剰起動防止）---
PROMPT_LEN=${#USER_PROMPT}
if [ "$PROMPT_LEN" -lt 10 ]; then
  exit 0
fi

# --- TSV ルーティング表のパス解決 ---
# git rev-parse でプロジェクトルートを特定
ROOT=$(git rev-parse --show-toplevel 2>/dev/null || echo "$(pwd)")
TSV="$ROOT/.claude/agents.routing.tsv"

# TSV が存在しなければ通過（false positive 防止）
if [ ! -f "$TSV" ]; then
  exit 0
fi

# --- キーワードマッチング ---
# TSV 形式: priority\tagent\tregex（ヘッダ行は # で始まる）
# bash の while + grep で priority 昇順に収集（awk system() の引数エスケープ問題回避）
MATCHED_AGENTS=$(
  while IFS=$'\t' read -r priority agent pattern; do
    case "$priority" in
      \#*|"") continue ;;
    esac
    if [ -z "$agent" ] || [ -z "$pattern" ]; then
      continue
    fi
    if printf '%s' "$USER_PROMPT" | grep -qiE -- "$pattern" 2>/dev/null; then
      printf '%s\t%s\n' "$priority" "$agent"
    fi
  done < "$TSV" | sort -t$'\t' -k1,1n | awk -F'\t' '{print $2}' | head -6
)

# マッチなし → 推奨なし → additionalContext を出力しない（additionalContext が空でも JSON 返却は必要）
if [ -z "$MATCHED_AGENTS" ]; then
  # 推奨なしの場合は空の additionalContext を返す（prompt-rules.sh と共存させるため exit 0 のみ）
  exit 0
fi

# --- エージェント一覧をリスト形式に整形 ---
# 1行1エージェント → "- agent-name" 形式
AGENT_LIST=$(echo "$MATCHED_AGENTS" | awk '{print "- " $0}')

# 上位件数カウント
AGENT_COUNT=$(echo "$MATCHED_AGENTS" | wc -l | tr -d ' ')

# --- モード別メッセージ生成 ---
# suggest: 推奨表示のみ
# warn: 推奨 + 未起動リスクを強調
# block は UserPromptSubmit では exit 2 しない（PreToolUse の orchestration-block.sh に委譲）

if [ "$ENFORCEMENT" = "warn" ]; then
  PREFIX="[ConsultingOS エージェント推奨・未起動は CLAUDE.md ハードルール 17 違反リスク]"
else
  PREFIX="[ConsultingOS 関連エージェント推奨]"
fi

MSG="${PREFIX} この依頼に関連するエージェント（上位${AGENT_COUNT}件）:

${AGENT_LIST}

起動前 4 点ゲートを確認してから関連エージェントを並列起動してください（CLAUDE.md ハードルール 17）。形式変換（HTML/PPT/PDF 等）を伴う成果物生成は必ずエージェント起動が必要です。"

# --- JSON 出力 ---
# jq で適切にエスケープして additionalContext を生成
jq -n --arg ctx "$MSG" '{"additionalContext": $ctx}'

exit 0
