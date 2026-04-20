#!/bin/bash
# ConsultingOS installer — consulting-os 正本から配布
set -e

TARGET_DIR="${1:-.}"
SOURCE_REPO="https://github.com/nbyk115/consulting-os.git"
TMP_DIR="/tmp/consulting-os-install-$$"

echo "🧠 ConsultingOS インストール開始"
echo "対象ディレクトリ: $TARGET_DIR"

# 1. Clone source (sparse — CLAUDE.md + .claude のみ取得)
echo "📥 ソース取得..."
git clone --depth 1 --filter=blob:none --sparse "$SOURCE_REPO" "$TMP_DIR" 2>/dev/null
cd "$TMP_DIR"
git sparse-checkout set CLAUDE.md .claude
cd - > /dev/null

# 2. Copy core files
echo "📂 ファイルコピー..."
cp "$TMP_DIR/CLAUDE.md" "$TARGET_DIR/CLAUDE.md"
mkdir -p "$TARGET_DIR/.claude"
cp -r "$TMP_DIR/.claude/agents" "$TARGET_DIR/.claude/" 2>/dev/null || true
cp -r "$TMP_DIR/.claude/skills" "$TARGET_DIR/.claude/" 2>/dev/null || true
cp -r "$TMP_DIR/.claude/commands" "$TARGET_DIR/.claude/" 2>/dev/null || true
cp -r "$TMP_DIR/.claude/hooks" "$TARGET_DIR/.claude/" 2>/dev/null || true
cp "$TMP_DIR/.claude/settings.json" "$TARGET_DIR/.claude/settings.json" 2>/dev/null || true

# 3. Clean project-specific leftovers
rm -rf "$TARGET_DIR/.claude/memory"
rm -f "$TARGET_DIR/.claude/codemap.md"
rm -f "$TARGET_DIR/.claude/settings.local.json"

# 4. Cleanup
rm -rf "$TMP_DIR"

echo ""
echo "✅ ConsultingOS インストール完了"
echo ""
echo "次のステップ:"
echo "  1. Claude Code 再起動 (または /reset)"
echo "  2. CLAUDE.md 末尾にプロジェクト固有情報を追記"
echo "     - currentDate"
echo "     - プロジェクト名 / ICP / 技術スタック"
echo ""
echo "構成:"
echo "  - 34 エージェント (Consulting/Service Dev/Product/Creative/Global/Marketing)"
echo "  - 22 スキル (反証モード/デバッグ/セキュリティ等)"
echo "  - 10 コマンド (/tdd /evolve /check-hallucination 等)"
echo "  - UserPromptSubmit hook (毎ターンルール注入)"
echo ""
echo "ソース: $SOURCE_REPO"
