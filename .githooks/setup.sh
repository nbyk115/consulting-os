#!/bin/bash
# .githooks/ をリポジトリの hooks パスとして登録
# 初回 clone 後に 1 度実行: bash .githooks/setup.sh

set -e

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

git config core.hooksPath .githooks
chmod +x .githooks/pre-commit

echo "✅ Layer 0 機密スキャン pre-commit hook を有効化しました"
echo "   検証: git config core.hooksPath で .githooks が表示されれば OK"
