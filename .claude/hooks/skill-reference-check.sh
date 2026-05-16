#!/bin/bash
# skill-reference-check.sh
# PreToolUse hook (matcher: Task): agent 委任プロンプトに参照スキルの明示があるか機械チェック
# 2026-05-15 PR #230 物理化: PR #219「委任プロンプトに skill 明示」運用ルールの機械強制版
#
# 構造盲点 (PR #229 診断): 主要 playbook に frontmatter なし = Skill 自動トリガー対象外、
# agent description の参照スキルは列挙のみ。agent は委任プロンプトで明示されないと skill を読まない。
# 本 hook は Task tool 起動時、委任プロンプトに skill 参照指示があるかを検証する。
#
# 環境変数 CONSULTINGOS_SKILL_REF_ENFORCEMENT=off で無効化 / warn (default) / block

set -e

ENFORCEMENT="${CONSULTINGOS_SKILL_REF_ENFORCEMENT:-warn}"
if [ "$ENFORCEMENT" = "off" ]; then
  exit 0
fi

PROMPT=$(echo "$CLAUDE_TOOL_INPUT" | jq -r '.prompt // empty' 2>/dev/null)
SUBAGENT=$(echo "$CLAUDE_TOOL_INPUT" | jq -r '.subagent_type // empty' 2>/dev/null)

# プロンプト未取得は通過 (false positive 防止)
if [ -z "$PROMPT" ]; then
  exit 0
fi

# 汎用 agent (skill 参照不要) は除外
case "$SUBAGENT" in
  Explore|general-purpose|Plan|claude|statusline-setup|claude-code-guide)
    exit 0
    ;;
esac

# 委任プロンプトに skill 参照指示があるか検証
# 合格パターン: ".claude/skills/" パス明示、または "skill" + "Read/参照/読ん" の組合せ
if echo "$PROMPT" | grep -q '\.claude/skills/' 2>/dev/null; then
  exit 0  # skill パス明示あり = PASS
fi
if echo "$PROMPT" | grep -qE '(スキル|skill|playbook|プレイブック)' 2>/dev/null && \
   echo "$PROMPT" | grep -qE '(Read|参照|読ん|読み込)' 2>/dev/null; then
  exit 0  # skill + Read 指示の組合せあり = PASS
fi

# skill 明示参照なし
echo "[ConsultingOS skill 参照チェック] agent 委任プロンプトに参照スキルの明示がありません (subagent: ${SUBAGENT:-未指定})" >&2
echo "  PR #219 / #229: agent は委任プロンプトで明示されないと skill を自動で読みません。" >&2
echo "  委任プロンプトに「着手前に .claude/skills/<該当skill>.md を Read」を明記してください。" >&2
echo "  (誤検出時は CONSULTINGOS_SKILL_REF_ENFORCEMENT=off で無効化可)" >&2

if [ "$ENFORCEMENT" = "block" ]; then
  echo "BLOCKED: skill 明示参照なしの agent 起動を block (CONSULTINGOS_SKILL_REF_ENFORCEMENT=block)" >&2
  exit 2
fi

exit 0  # warn モード: alert のみで通過
