#!/usr/bin/env bash
# subject-fraud-check.sh
# Hard Rule 17 主語詐称禁止原則の機械検証 hook
# Stop hook として assistant 応答末尾を検査:
# - 「ConsultingOS が」「OS が自律」「orchestrator として自律」等の主語使用時、
#   同 session 内で agent 起動 (Task tool 呼出) が 1 回以上あったか transcript から検証
# - agent 起動ゼロなら exit 2 で警告 (block ではなく feedback、reactive correction loop 回避)
# - 検出パターン + agent 起動ログ照合は transcript jsonl 解析で実施
#
# 動作モード (環境変数):
#   CONSULTINGOS_SUBJECT_FRAUD_ENFORCEMENT=off   : 即時通過
#   CONSULTINGOS_SUBJECT_FRAUD_ENFORCEMENT=warn  : stderr 警告のみ (default)
#   CONSULTINGOS_SUBJECT_FRAUD_ENFORCEMENT=block : exit 2 でブロック

set -uo pipefail

MODE="${CONSULTINGOS_SUBJECT_FRAUD_ENFORCEMENT:-warn}"
[ "$MODE" = "off" ] && exit 0

INPUT=$(cat)

# Stop hook payload から transcript_path + last assistant message 抽出
TRANSCRIPT_PATH=$(echo "$INPUT" | grep -o '"transcript_path":[[:space:]]*"[^"]*"' | sed 's/.*"\([^"]*\)"$/\1/')
[ -z "$TRANSCRIPT_PATH" ] && exit 0
[ ! -f "$TRANSCRIPT_PATH" ] && exit 0

# 主語詐称パターン (Hard Rule 17 禁止フレーズ一覧)
FRAUD_PATTERNS='(ConsultingOS が|OS が自律|orchestrator として自律|OS 自律実行|OS 自律完結|OS 自律報告|私たちの ConsultingOS が|OS が|ConsultingOSとして自律)'

# 最終 assistant メッセージ抽出
LAST_ASSISTANT=$(tail -200 "$TRANSCRIPT_PATH" | grep '"type":"assistant"' | tail -1)
[ -z "$LAST_ASSISTANT" ] && exit 0

# 主語詐称フレーズ検出
if ! echo "$LAST_ASSISTANT" | grep -qE "$FRAUD_PATTERNS"; then
  exit 0
fi

# 同 session 内 agent 起動 (Task tool) 検出
AGENT_INVOCATIONS=$(grep -c '"name":"Task"' "$TRANSCRIPT_PATH" 2>/dev/null || echo 0)

if [ "$AGENT_INVOCATIONS" -ge 1 ]; then
  exit 0
fi

MSG="[subject-fraud-check] Hard Rule 17 違反候補: 主語詐称フレーズ検出 (agent 起動 0 件)"
MSG="$MSG / 「assistant が今ターン直接実装」「私が直接書いた」と明記必須"

case "$MODE" in
  block)
    echo "$MSG" >&2
    exit 2
    ;;
  warn|*)
    echo "$MSG" >&2
    exit 0
    ;;
esac
