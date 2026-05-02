#!/usr/bin/env bash
# 提案スライド生成＋日本語字形機械検証スクリプト
# 出典: brand-guidelines.md §日本語字形検知方法（OS ハードルール 10 準拠）
#
# 使い方: cd strategy/mizuno-funding-1000man && ./generate.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

SOURCE="02-proposal-to-mizuno.slides.md"
HTML="02-proposal-to-mizuno.html"
PDF="02-proposal-to-mizuno.pdf"
PPTX="02-proposal-to-mizuno.pptx"

CHROME_PATH="${CHROME_PATH:-/opt/pw-browsers/chromium-1194/chrome-linux/chrome}"
MARP="npx --yes @marp-team/marp-cli@latest"

# 0. 環境前提チェック
command -v pdffonts >/dev/null 2>&1 || { echo "❌ pdffonts (poppler-utils) 必須。 apt-get install -y poppler-utils"; exit 1; }
command -v fc-list >/dev/null 2>&1 || { echo "❌ fontconfig 必須"; exit 1; }
fc-list :lang=ja | grep -qi "noto.*cjk.*jp\|noto.*sans.*jp\|ipa" || { echo "❌ 日本語フォント未インストール。apt-get install -y fonts-noto-cjk fonts-ipafont-gothic"; exit 1; }

# 1. 古い成果物削除
rm -f "$HTML" "$PDF" "$PPTX"

# 2. 生成（HTML / PDF / PPTX）
echo "==> Generating $HTML"
CHROME_PATH="$CHROME_PATH" $MARP "$SOURCE" -o "$HTML" --html
echo "==> Generating $PDF"
CHROME_PATH="$CHROME_PATH" $MARP "$SOURCE" -o "$PDF" --html --no-sandbox
echo "==> Generating $PPTX"
CHROME_PATH="$CHROME_PATH" $MARP "$SOURCE" -o "$PPTX" --html --no-sandbox

# 3. 日本語字形機械検証（OS ハードルール 10）
echo ""
echo "==> 機械検証 (OS ハードルール 10 準拠)"

# PDF: pdffonts で埋込フォント検証
echo "[PDF] 埋込フォント:"
pdffonts "$PDF" | awk 'NR>2 {print $1}' | sort -u | sed 's/^/  /'
if pdffonts "$PDF" | grep -iqE "noto sans cjk[^j]|noto sans cjk sc|noto sans cjk tc|noto sans cjk hk|noto sans cjk kr|source han sans[^j]|simsun|microsoft yahei|wenquan"; then
  echo "❌ PDF に違反フォント検出"
  exit 1
fi
echo "✅ PDF: 違反なし"

# HTML: lang 属性 + font-family 違反検査
echo "[HTML] lang attribute:"
grep -oE 'lang="[^"]*"' "$HTML" | sort -u | sed 's/^/  /'
if grep -iqE '"noto sans cjk"|"noto sans cjk (sc|tc|hk|kr)"|"source han sans"[^J]|simsun|microsoft yahei|wenquan' "$HTML"; then
  echo "❌ HTML に違反フォント参照"
  grep -ioE '"noto sans cjk"|"noto sans cjk (sc|tc|hk|kr)"|"source han sans"[^J]|simsun|microsoft yahei|wenquan' "$HTML" | sort -u
  exit 1
fi
echo "✅ HTML: 違反なし"

# PPTX: Marp は画像埋込型なので PDF と同じレンダリング → 検証は PDF で代替済
echo "[PPTX] Marp 画像埋込型 (PDF と同一レンダリング、追加検証不要)"
echo "✅ PPTX: PDF 検証で担保"

echo ""
echo "✅ 全形式 OS ハードルール 10 準拠を確認"
