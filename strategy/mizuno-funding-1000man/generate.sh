#!/usr/bin/env bash
# 提案スライド生成 + 日本語字形機械検証スクリプト
# 出典: brand-guidelines.md §日本語字形検知方法（OS ハードルール 10 準拠）
#
# 使い方: cd strategy/mizuno-funding-1000man && ./generate.sh
# Case A（21 スライド）/ Case B（10 スライド圧縮版）/ Case C（1 ページサマリ）を一括生成

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

CHROME_PATH="${CHROME_PATH:-/opt/pw-browsers/chromium-1194/chrome-linux/chrome}"
MARP="npx --yes @marp-team/marp-cli@latest"

# 0. 環境前提チェック
command -v pdffonts >/dev/null 2>&1 || { echo "❌ pdffonts (poppler-utils) 必須。 apt-get install -y poppler-utils"; exit 1; }
command -v fc-list >/dev/null 2>&1 || { echo "❌ fontconfig 必須"; exit 1; }
fc-list :lang=ja | grep -qi "noto.*cjk.*jp\|noto.*sans.*jp\|ipa" || { echo "❌ 日本語フォント未インストール。apt-get install -y fonts-noto-cjk fonts-ipafont-gothic"; exit 1; }

# 生成対象（3 ケース）
TARGETS=(
  "02-proposal-to-mizuno"
  "03-proposal-to-mizuno-condensed"
  "04-proposal-to-mizuno-1page"
)

for BASE in "${TARGETS[@]}"; do
  SOURCE="${BASE}.slides.md"
  HTML="${BASE}.html"
  PDF="${BASE}.pdf"
  PPTX="${BASE}.pptx"

  if [ ! -f "$SOURCE" ]; then
    echo "⏭️  Skip $SOURCE (not found)"
    continue
  fi

  echo ""
  echo "============================================================"
  echo "==> Building $BASE"
  echo "============================================================"

  rm -f "$HTML" "$PDF" "$PPTX"

  echo "[1/3] Generating $HTML"
  CHROME_PATH="$CHROME_PATH" $MARP "$SOURCE" -o "$HTML" --html
  echo "[2/3] Generating $PDF"
  CHROME_PATH="$CHROME_PATH" $MARP "$SOURCE" -o "$PDF" --html --no-sandbox
  echo "[3/3] Generating $PPTX"
  CHROME_PATH="$CHROME_PATH" $MARP "$SOURCE" -o "$PPTX" --html --no-sandbox

  # 日本語字形機械検証（OS ハードルール 10）
  echo ""
  echo "==> 機械検証 ($BASE)"

  echo "[PDF] 埋込フォント:"
  pdffonts "$PDF" | awk 'NR>2 {print $1}' | sort -u | sed 's/^/  /'
  if pdffonts "$PDF" | grep -iqE "noto sans cjk[^j]|noto sans cjk sc|noto sans cjk tc|noto sans cjk hk|noto sans cjk kr|source han sans[^j]|simsun|microsoft yahei|wenquan"; then
    echo "❌ PDF に違反フォント検出 ($BASE)"
    exit 1
  fi
  echo "✅ PDF: 違反なし ($BASE)"

  echo "[HTML] lang attribute:"
  grep -oE 'lang="[^"]*"' "$HTML" | sort -u | sed 's/^/  /'
  if grep -iqE '"noto sans cjk"|"noto sans cjk (sc|tc|hk|kr)"|"source han sans"[^J]|simsun|microsoft yahei|wenquan' "$HTML"; then
    echo "❌ HTML に違反フォント参照 ($BASE)"
    exit 1
  fi
  echo "✅ HTML: 違反なし ($BASE)"

  echo "✅ $BASE: 全形式 OS ハードルール 10 準拠"
done

# 単位整合性チェック（brand-guidelines §5.5 準拠・2026-05-02 学習）
echo ""
echo "============================================================"
echo "==> 単位整合性チェック（億ドル / billion / 兆円）"
echo "============================================================"
for BASE in "${TARGETS[@]}"; do
  SOURCE="${BASE}.slides.md"
  if [ ! -f "$SOURCE" ]; then continue; fi
  HITS=$(grep -nE '億ドル|billion|兆円' "$SOURCE" | wc -l || true)
  if [ "$HITS" -gt 0 ]; then
    echo ""
    echo "[$BASE] 数値・単位を含む行 (${HITS} 件):"
    grep -nE '億ドル|billion|兆円' "$SOURCE" | sed 's/^/  /'
  fi
done
echo ""
echo "⚠️  上記の数値・単位は brand-guidelines §5.5 のクロスチェック手順 5 項目で検証してください"
echo "    1. 単位の自己整合性 / 2. summary vs table の突き合わせ / 3. 桁数の常識感覚"
echo "    4. 出典機関の数値レンジ / 5. 通貨換算（USD × 150 = JPY）"

echo ""
echo "============================================================"
echo "✅ 全ケース（A/B/C）生成完了"
echo "============================================================"
