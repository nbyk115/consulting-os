#!/bin/bash
# ConsultingOS: OEM Deployment Script
# vendor-invisible でクライアント環境に ConsultingOS を配布 (rebrand 付き)
#
# 使用例:
#   ./scripts/deploy-oem.sh \
#     --client "N.Y.CRAFT" \
#     --brand "TEAM CRAFT OS" \
#     --vendor-invisible true \
#     --target-dir /tmp/n-y-craft-os
#
# 規律:
#   - vendor-invisible モードでは "ConsultingOS" 表記をブランド名で機械置換
#   - install.sh をベースに brand swap 層を追加
#   - 配布前に dry-run で差分を必ず確認

set -e

# Default values
CLIENT_NAME=""
BRAND_NAME=""
VENDOR_INVISIBLE="false"
TARGET_DIR=""
DRY_RUN="false"
SOURCE_REPO="https://github.com/nbyk115/consulting-os.git"

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --client)
      CLIENT_NAME="$2"
      shift 2
      ;;
    --brand)
      BRAND_NAME="$2"
      shift 2
      ;;
    --vendor-invisible)
      VENDOR_INVISIBLE="$2"
      shift 2
      ;;
    --target-dir)
      TARGET_DIR="$2"
      shift 2
      ;;
    --dry-run)
      DRY_RUN="true"
      shift
      ;;
    --source)
      SOURCE_REPO="$2"
      shift 2
      ;;
    -h|--help)
      head -25 "$0"
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

# Validation
if [[ -z "$CLIENT_NAME" || -z "$BRAND_NAME" || -z "$TARGET_DIR" ]]; then
  echo "ERROR: --client, --brand, --target-dir は必須です"
  echo "使用例: ./scripts/deploy-oem.sh --client \"N.Y.CRAFT\" --brand \"TEAM CRAFT OS\" --target-dir /path"
  exit 1
fi

echo "================================================================"
echo "ConsultingOS - OEM Deployment"
echo "================================================================"
echo "Client            : $CLIENT_NAME"
echo "Brand             : $BRAND_NAME"
echo "Vendor Invisible  : $VENDOR_INVISIBLE"
echo "Target Directory  : $TARGET_DIR"
echo "Source Repository : $SOURCE_REPO"
echo "Dry Run           : $DRY_RUN"
echo "================================================================"

# Step 1: Target directory check
if [[ -d "$TARGET_DIR" && "$DRY_RUN" == "false" ]]; then
  echo "WARN: $TARGET_DIR は既に存在します"
  read -p "上書きしますか? (y/N): " confirm
  if [[ "$confirm" != "y" ]]; then
    echo "中断します"
    exit 1
  fi
fi

# Step 2: Clone source
TMP_DIR="/tmp/consulting-os-deploy-$$"
echo "[1/5] ソース取得中..."
if [[ "$DRY_RUN" == "false" ]]; then
  git clone --depth 1 "$SOURCE_REPO" "$TMP_DIR"
else
  echo "  (dry-run: skipped) git clone --depth 1 $SOURCE_REPO $TMP_DIR"
  TMP_DIR="$(pwd)"
fi

# Step 3: Brand swap (vendor-invisible mode)
echo "[2/5] ブランド置換中..."
if [[ "$VENDOR_INVISIBLE" == "true" ]]; then
  # Files to process for brand replacement
  FILES_TO_REWRITE=(
    "CLAUDE.md"
    "README.md"
    "docs/consulting-os-product.md"
    "docs/agent-routing.md"
    "docs/agent-collaboration-patterns.md"
  )

  for file in "${FILES_TO_REWRITE[@]}"; do
    if [[ -f "$TMP_DIR/$file" ]]; then
      echo "  Processing: $file"
      if [[ "$DRY_RUN" == "false" ]]; then
        # Replace ConsultingOS -> BRAND_NAME
        # Replace ConsultingOS -> BRAND_NAME (only when vendor-invisible)
        sed -i.bak \
          -e "s/ConsultingOS/$BRAND_NAME/g" \
          -e "s/consulting-os/${BRAND_NAME,,}/g" \
          "$TMP_DIR/$file"
        rm -f "$TMP_DIR/$file.bak"
      else
        echo "    (dry-run) sed s/ConsultingOS/$BRAND_NAME/g"
      fi
    fi
  done

  # Step 4: Add client metadata
  echo "[3/5] クライアントメタデータ追加中..."
  if [[ "$DRY_RUN" == "false" ]]; then
    cat > "$TMP_DIR/CLIENT.md" <<EOF
# $BRAND_NAME

クライアント: $CLIENT_NAME
配布日: $(date +%Y-%m-%d)
配布モード: OEM (vendor-invisible)
ベース: ConsultingOS v1.0.0 (multi-agent operating system)

## カスタマイズ層

このリポジトリはクライアント向けにカスタマイズされた AI エージェント運用基盤です。
ベースとなる規律 / agent / skill は MA (Master Agreement) に基づきライセンス供与されています。

### 主要機能

- 27 エージェント (consulting / service-dev / product / creative / global / marketing)
- 34 スキル (consulting-playbook / brand-guidelines / falsification-check 他)
- 6 コマンド (/check-hallucination / /security-scan 他)
- Hard Rule 17 項 (規律レイヤー)
- 6 層物理防御

### 連絡先

技術サポート: ライセンス契約書 § サポート条項を参照
緊急連絡: 別途指定の Slack / メールアドレス
EOF
  else
    echo "  (dry-run) Would create CLIENT.md with $CLIENT_NAME / $BRAND_NAME metadata"
  fi
else
  echo "  vendor-invisible=false のためブランド置換スキップ"
fi

# Step 5: Copy to target
echo "[4/5] ターゲットへコピー中..."
if [[ "$DRY_RUN" == "false" ]]; then
  mkdir -p "$TARGET_DIR"

  # Backup existing project-specific files
  BACKUP_DIR="/tmp/oem-backup-$$"
  if [[ -d "$TARGET_DIR/.claude/memory" ]]; then
    mkdir -p "$BACKUP_DIR"
    cp -r "$TARGET_DIR/.claude/memory" "$BACKUP_DIR/"
  fi

  # Copy core files (exclude .git, install scripts, deploy scripts themselves)
  rsync -a \
    --exclude='.git' \
    --exclude='install.sh' \
    --exclude='scripts/deploy-oem.sh' \
    --exclude='strategy/' \
    --exclude='examples/' \
    "$TMP_DIR/" "$TARGET_DIR/"

  # Restore project-specific
  if [[ -d "$BACKUP_DIR/memory" ]]; then
    cp -r "$BACKUP_DIR/memory" "$TARGET_DIR/.claude/memory"
    rm -rf "$BACKUP_DIR"
  fi
else
  echo "  (dry-run) rsync -a $TMP_DIR/ $TARGET_DIR/"
fi

# Step 6: Generate deployment manifest
echo "[5/5] デプロイメント記録生成中..."
MANIFEST_FILE="$TARGET_DIR/.deploy-manifest.json"
if [[ "$DRY_RUN" == "false" ]]; then
  cat > "$MANIFEST_FILE" <<EOF
{
  "deployment_type": "oem",
  "client": "$CLIENT_NAME",
  "brand": "$BRAND_NAME",
  "vendor_invisible": $VENDOR_INVISIBLE,
  "deployed_at": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "source_repo": "$SOURCE_REPO",
  "source_commit": "$(cd $TMP_DIR && git rev-parse HEAD 2>/dev/null || echo 'unknown')",
  "consulting_os_version": "v1.0.0"
}
EOF
  echo "  Manifest: $MANIFEST_FILE"
fi

# Cleanup
if [[ "$DRY_RUN" == "false" && -d "$TMP_DIR" && "$TMP_DIR" != "$(pwd)" ]]; then
  rm -rf "$TMP_DIR"
fi

echo "================================================================"
if [[ "$DRY_RUN" == "true" ]]; then
  echo "DRY RUN COMPLETE - 実際のデプロイは行われていません"
else
  echo "OEM Deployment Complete"
  echo ""
  echo "Next Steps:"
  echo "  1. cd $TARGET_DIR"
  echo "  2. Review CLIENT.md and verify brand replacements"
  echo "  3. git init && git add . && git commit -m \"Initial $BRAND_NAME deployment\""
  echo "  4. クライアント環境のリモートに push"
fi
echo "================================================================"
