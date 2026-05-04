#!/bin/bash
# ConsultingOS installer — consulting-os (正本) から同期
set -e

TARGET_DIR="${1:-.}"
SOURCE_REPO="https://github.com/nbyk115/consulting-os.git"
TMP_DIR="/tmp/consulting-os-$$"

echo "🧠 ConsultingOS インストール開始"
echo "正本: $SOURCE_REPO"
echo "対象: $TARGET_DIR"

echo "📥 ソース取得..."
git clone --depth 1 "$SOURCE_REPO" "$TMP_DIR"

echo "📂 ファイルコピー..."
# install.sh 自身は対象リポに不要なので除外
cp "$TMP_DIR/CLAUDE.md" "$TARGET_DIR/CLAUDE.md"

# 既存の .claude/ がある場合、プロジェクト固有ファイルを一時退避
BACKUP_DIR="/tmp/claude-backup-$$"
if [ -d "$TARGET_DIR/.claude" ]; then
  mkdir -p "$BACKUP_DIR"
  [ -d "$TARGET_DIR/.claude/memory" ] && cp -r "$TARGET_DIR/.claude/memory" "$BACKUP_DIR/"
  [ -f "$TARGET_DIR/.claude/codemap.md" ] && cp "$TARGET_DIR/.claude/codemap.md" "$BACKUP_DIR/"
  [ -f "$TARGET_DIR/.claude/settings.local.json" ] && cp "$TARGET_DIR/.claude/settings.local.json" "$BACKUP_DIR/"
  rm -rf "$TARGET_DIR/.claude"
fi

# .claude/ をコピー（install.sh自身は除外）
cp -r "$TMP_DIR/.claude" "$TARGET_DIR/.claude"

# プロジェクト固有ファイルを復元
if [ -d "$BACKUP_DIR" ]; then
  [ -d "$BACKUP_DIR/memory" ] && cp -r "$BACKUP_DIR/memory" "$TARGET_DIR/.claude/memory"
  [ -f "$BACKUP_DIR/codemap.md" ] && cp "$BACKUP_DIR/codemap.md" "$TARGET_DIR/.claude/codemap.md"
  [ -f "$BACKUP_DIR/settings.local.json" ] && cp "$BACKUP_DIR/settings.local.json" "$TARGET_DIR/.claude/settings.local.json"
  rm -rf "$BACKUP_DIR"
fi

# hooks の実行権限設定
chmod +x "$TARGET_DIR/.claude/hooks/"*.sh 2>/dev/null || true

rm -rf "$TMP_DIR"

echo ""
echo "✅ ConsultingOS インストール完了"
echo ""
echo "構成:"
echo "  - 34 エージェント (6部門)"
echo "  - 22 スキル (反証モード/セキュリティ/デバッグ等)"
echo "  - 9 コマンド (/tdd /evolve /check-hallucination 等)"
echo "  - hooks: UserPromptSubmit (毎ターンルール注入), PreToolUse (外部送信警告)"
echo "  - permissions.deny: .env/credentials/force push 等の禁止"
echo ""
echo "次のステップ:"
echo "1. Claude Code を再起動 (または /reset)"
echo "2. CLAUDE.md 末尾にプロジェクト固有情報を追加"
