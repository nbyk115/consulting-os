#!/bin/bash
# Stop hook: assistant 応答完了時に応答内容を検証
# Phase 5-3 実装 — 2026-05-05
# 70 点で出して実運用しながら改修（佐藤裕介流）
#
# 検知対象:
# 1. 禁止フレーズ（CLAUDE.md ハードルール 17）— 絞り込み錯覚 / orchestrator 規律違反シグナル
# 2. 反証チェック未付与（CLAUDE.md ハードルール 1）— 全アウトプット末尾必須
#
# 環境変数 CONSULTINGOS_STOP_ENFORCEMENT=off|warn|block （default: warn）
# 初期は警告運用、誤検知率検証後に block 移行判断

set -e

ENFORCEMENT="${CONSULTINGOS_STOP_ENFORCEMENT:-warn}"

# off モードは即時通過
if [ "$ENFORCEMENT" = "off" ]; then
  exit 0
fi

# stdin から JSON 受信（Stop hook 入力）
STDIN_INPUT=$(cat 2>/dev/null || true)

if [ -z "$STDIN_INPUT" ]; then
  exit 0
fi

# transcript_path 抽出
# SPECULATION: Claude Code Stop hook の stdin JSON フォーマットは公式ドキュメント未確認
# - transcript_path フィールドの存在: SPECULATION（v2.x 仕様、実装テストで確認）
# - jq でのトランスクリプト抽出: SPECULATION（transcript スキーマ非公開）
# - フォールバック: 取得失敗時は exit 0（false positive 防止 + SDK 仕様変更時の互換性）
# - 検証期日: 2026-05-12 までに stderr ログで実動作確認、結果を evolution-log 記録
TRANSCRIPT_PATH=$(echo "$STDIN_INPUT" | jq -r '.transcript_path // .transcriptPath // empty' 2>/dev/null)

# transcript の最終 assistant message を取得
LATEST_RESPONSE=""
if [ -n "$TRANSCRIPT_PATH" ] && [ -f "$TRANSCRIPT_PATH" ]; then
  # 2026-05-05 M7 修正: 長文応答（コンサル納品物等）の前半に禁止フレーズがある場合の検出漏れ防止
  LATEST_RESPONSE=$(jq -r 'select(.type == "assistant") | .message.content[]? | select(.type == "text") | .text' "$TRANSCRIPT_PATH" 2>/dev/null | tail -300)
fi

# transcript アクセス失敗時は通過（false positive 防止、SDK 仕様変更時の互換性確保）
if [ -z "$LATEST_RESPONSE" ]; then
  exit 0
fi

# --- 検知 1: 禁止フレーズ ---
FORBIDDEN_PHRASES=(
  "自分で書いた方が早い"
  "assistant 直接で書く方が早い"
  "単独で完結"
  "並列起動さえすれば完了"
  "形式変換だから例外"
)

DETECTED_PHRASES=""
for PHRASE in "${FORBIDDEN_PHRASES[@]}"; do
  if printf '%s' "$LATEST_RESPONSE" | grep -qF -- "$PHRASE" 2>/dev/null; then
    DETECTED_PHRASES="${DETECTED_PHRASES}  - ${PHRASE}"$'\n'
  fi
done

# --- 検知 2: 反証チェック未付与 ---
HAS_FALSIFICATION="yes"
if ! printf '%s' "$LATEST_RESPONSE" | grep -qE '反証チェック結果|Step 1.*自己反証|Step 2.*構造反証|Step 3.*実用反証' 2>/dev/null; then
  HAS_FALSIFICATION="no"
fi

# --- 結果判定 ---
HAS_VIOLATION="no"
if [ -n "$DETECTED_PHRASES" ] || [ "$HAS_FALSIFICATION" = "no" ]; then
  HAS_VIOLATION="yes"
fi

if [ "$HAS_VIOLATION" = "no" ]; then
  exit 0
fi

# --- 違反警告メッセージ生成 ---
WARNING_MSG="[ConsultingOS Stop hook 違反検知]"$'\n'

if [ -n "$DETECTED_PHRASES" ]; then
  WARNING_MSG="${WARNING_MSG}禁止フレーズ検出（CLAUDE.md ハードルール 17）:"$'\n'
  WARNING_MSG="${WARNING_MSG}${DETECTED_PHRASES}"
  WARNING_MSG="${WARNING_MSG}これらは絞り込み錯覚 / orchestrator 規律違反のシグナルです。次回応答で関連エージェント並列起動 + 反証 Step 1-3 必須。"$'\n'
fi

if [ "$HAS_FALSIFICATION" = "no" ]; then
  WARNING_MSG="${WARNING_MSG}反証チェック未付与検出（CLAUDE.md ハードルール 1）: 全アウトプット末尾に【反証チェック結果】Step 1-3 + 残存リスク必須。短文・端的回答でも省略禁止（圧縮版 2-3 行は可）。"$'\n'
fi

# --- 出力 ---
echo "$WARNING_MSG" >&2

if [ "$ENFORCEMENT" = "block" ]; then
  exit 2
fi

# warn モードは exit 0 で通過、stderr 警告のみ
exit 0
