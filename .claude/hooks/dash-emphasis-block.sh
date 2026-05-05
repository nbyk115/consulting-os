#!/bin/bash
# PostToolUse hook: em-dash / en-dash / ** 強調記法の物理ブロック
# CLAUDE.md ハードルール 16 (vi)(i) 準拠
# 2026-05-05 実装 (機能する OS 化・佐藤裕介判断)
# 2026-05-05 ROOT バグ修正 + LC_ALL UTF-8 明示 (infra-devops 反証)

export LC_ALL=C.UTF-8

ENFORCEMENT="${CONSULTINGOS_DASH_BLOCK:-on}"
if [ "$ENFORCEMENT" = "off" ]; then
  exit 0
fi

FILE=$(echo "$CLAUDE_TOOL_INPUT" | jq -r '.file_path // .filePath // empty' 2>/dev/null)
if [ -z "$FILE" ]; then
  exit 0
fi

# .md / .txt / .html / .slides.md のみ対象（バイナリ・コード系は除外）
case "$FILE" in
  *.md|*.txt|*.html|*.slides.md) ;;
  *) exit 0 ;;
esac

# 書き込み内容を取得（Write: content / Edit: new_string）
CONTENT=$(echo "$CLAUDE_TOOL_INPUT" | jq -r '.content // .new_string // empty' 2>/dev/null)
if [ -z "$CONTENT" ]; then
  exit 0
fi

# コードブロック除外: ``` で囲まれた範囲を除去してからチェック
CONTENT_STRIPPED=$(printf '%s' "$CONTENT" | perl -0777 -pe 's/```.*?```//gs' 2>/dev/null || printf '%s' "$CONTENT")

ROOT=$(git -C "$(dirname "$FILE")" rev-parse --show-toplevel 2>/dev/null || echo "")
if [ -z "$ROOT" ]; then
  exit 0
fi
REL_FILE="${FILE#$ROOT/}"

# ファイル分類判定
classify_file() {
  case "$REL_FILE" in
    # 投資家視認ファイル: block 対象
    strategy/*|examples/*|docs/*|clients/*|\
    ICP.md|DESIGN.md|README.md)
      echo "investor" ;;
    # 規律定義書: warn のみ（** は YOU MUST/IMPORTANT/NEVER 例外のためスキップ）
    .claude/agents/*|.claude/skills/*|\
    CLAUDE.md|evolution-log.md)
      echo "rulebook" ;;
    # その他: スキップ
    *)
      echo "other" ;;
  esac
}

CATEGORY=$(classify_file)

if [ "$CATEGORY" = "other" ]; then
  exit 0
fi

# ダッシュ検出 (U+2014 em-dash / U+2013 en-dash)
# grep パターン内での使用は技術的不可避として許容（CLAUDE.md 制約）
DASH_HITS=$(printf '%s' "$CONTENT_STRIPPED" | grep -nP "[\x{2013}\x{2014}]" 2>/dev/null || true)
EMPHASIS_HITS=$(printf '%s' "$CONTENT_STRIPPED" | grep -n '\*\*' 2>/dev/null || true)

HAS_DASH=""
HAS_EMPHASIS=""
[ -n "$DASH_HITS" ] && HAS_DASH="yes"
[ -n "$EMPHASIS_HITS" ] && HAS_EMPHASIS="yes"

# --- 投資家視認ファイル: ダッシュ OR ** 検出 = exit 2 ブロック ---
if [ "$CATEGORY" = "investor" ]; then
  if [ -n "$HAS_DASH" ] || [ -n "$HAS_EMPHASIS" ]; then
    {
      echo "BLOCKED [dash-emphasis-block]: $REL_FILE に Hard Rule 16 違反を検出しました。"
      if [ -n "$HAS_DASH" ]; then
        echo "  [DASH] em-dash (U+2014) / en-dash (U+2013) 検出行:"
        printf '%s' "$DASH_HITS" | head -5 | sed 's/^/    /'
        echo "  => Hard Rule 16(vi): ダッシュ使用禁止。代替: コロン / カンマ / 句読点 / セミコロン / 括弧"
      fi
      if [ -n "$HAS_EMPHASIS" ]; then
        echo "  [EMPHASIS] ** 太字記法検出行:"
        printf '%s' "$EMPHASIS_HITS" | head -5 | sed 's/^/    /'
        echo "  => Hard Rule 16(i): ** 禁止。代替: 「」 or 大文字英語キーワード (IMPORTANT/NEVER 等)"
        echo "  => 例外: .claude/agents/* / .claude/skills/* / CLAUDE.md 内の YOU MUST/IMPORTANT/NEVER ラベルのみ許可"
      fi
      echo "  投資家視認ファイル ($REL_FILE) への書き込みをブロックしました。修正後に再実行してください。"
    } >&2
    exit 2
  fi
  exit 0
fi

# --- 規律定義書: ダッシュのみ warn / ** はスキップ ---
if [ "$CATEGORY" = "rulebook" ]; then
  if [ -n "$HAS_DASH" ]; then
    {
      echo "WARNING [dash-emphasis-block]: $REL_FILE に Hard Rule 16(vi) 潜在違反を検出しました。"
      echo "  [DASH] em-dash (U+2014) / en-dash (U+2013) 検出行:"
      printf '%s' "$DASH_HITS" | head -5 | sed 's/^/    /'
      echo "  規律定義書内のダッシュは外部出力への転記時に違反になります。コードポイント表記 (U+2014) で代替を検討してください。"
      echo "  (** 強調: YOU MUST/IMPORTANT/NEVER ラベルは規律定義書内で許可されているため検査スキップ)"
    } >&2
    exit 1
  fi
  exit 0
fi

exit 0
