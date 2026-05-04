#!/bin/bash
# SessionStart hook: 規律違反防止 + 再評価期限通知 + 形骸化防止
# 2026-05-01: 反証モード規律違反学習を hook 層で恒久化

set -e

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
EVOLUTION_LOG="$REPO_ROOT/evolution-log.md"
CLAUDE_MD="$REPO_ROOT/CLAUDE.md"

# 通知メッセージ蓄積
MESSAGES=()

# 1. evolution-log 4週間更新ゼロチェック（auto-archive 提案）
if [ -f "$EVOLUTION_LOG" ]; then
  LAST_MOD=$(stat -c %Y "$EVOLUTION_LOG" 2>/dev/null || stat -f %m "$EVOLUTION_LOG" 2>/dev/null)
  NOW=$(date +%s)
  DAYS_SINCE=$(( (NOW - LAST_MOD) / 86400 ))
  if [ "$DAYS_SINCE" -gt 28 ]; then
    MESSAGES+=("📦 evolution-log.md が ${DAYS_SINCE}日 未更新。CLAUDE.md規律により archive 検討（4週間更新ゼロが基準）")
  fi
fi

# 2. CLAUDE.md 月1レビュー期限（Boris #3 ruthlessly edit）
if [ -d "$REPO_ROOT/.git" ]; then
  CLAUDE_LAST_COMMIT=$(cd "$REPO_ROOT" && git log -1 --format=%ct -- CLAUDE.md 2>/dev/null || echo "0")
  if [ "$CLAUDE_LAST_COMMIT" != "0" ]; then
    NOW=$(date +%s)
    DAYS_SINCE_REVIEW=$(( (NOW - CLAUDE_LAST_COMMIT) / 86400 ))
    if [ "$DAYS_SINCE_REVIEW" -gt 30 ]; then
      MESSAGES+=("📅 CLAUDE.md 最終更新から ${DAYS_SINCE_REVIEW}日 経過。Boris #3「ruthlessly edit」月1レビュー期限超過")
    fi
  fi
fi

# 3. 反証モード規律のリマインド（恒久）
MESSAGES+=("🔺 反証モード厳守: 全応答末尾に【反証チェック結果】Step 1-3 + 残存リスク必須。短文・端的回答でも省略禁止（圧縮版2-3行は可）")
MESSAGES+=("📊 出典管理3ラベル: 出典なし具体数値（X割/X%/金額/年次予測）の断言禁止。FACT/INFERENCE/SPECULATION を明示")
MESSAGES+=("🇯🇵 日本語字形検証: PDF/DOCX/PPTX 生成時はスタイル指定だけで満足せず、pdffonts/unzip+grep で埋込フォント・ロケールを機械検証必須（2026-05-01 違反学習）")
MESSAGES+=("📝 出力フォーマット規律（2026-05-01 学習）: Markdown 太字 ** 禁止／一文中改行禁止／表は Word/PPT で中央揃え／PPT/PDF はページ収まり必須／出力直前に佐藤裕介 W チェック（内容＋形式）必須")

# 4. 再評価カレンダー期限チェック（evolution-log.md の「再評価カレンダー」セクションから）
if [ -f "$EVOLUTION_LOG" ] && grep -q "## 再評価カレンダー" "$EVOLUTION_LOG"; then
  TODAY=$(date +%Y-%m-%d)
  # 「YYYY-MM-DD: 再評価対象」形式の行を抽出して期限超過を検出
  awk -v today="$TODAY" '
    /^## 再評価カレンダー/ { in_section=1; next }
    /^## / && in_section { in_section=0 }
    in_section && /^- [0-9]{4}-[0-9]{2}-[0-9]{2}:/ {
      date = substr($0, 3, 10)
      if (date <= today) print "⏰ 再評価期限到達: " substr($0, 3)
    }
  ' "$EVOLUTION_LOG" | while IFS= read -r line; do
    [ -n "$line" ] && echo "$line"
  done
fi

# 出力（additionalContext 形式で Claude に注入）
if [ ${#MESSAGES[@]} -gt 0 ]; then
  CONTEXT=""
  for msg in "${MESSAGES[@]}"; do
    CONTEXT="${CONTEXT}${msg}\n"
  done
  printf '{"additionalContext": "【セッション開始時チェック】\\n%s"}\n' "$CONTEXT"
fi

exit 0
