# 引き継ぎ: ConsultingOS Bootstrap Guard 改修

起票: 2026-05-07
起票元事象: `claude/oem-sales-strategy-gVMWp` (関根さん案件) で v1〜v13 全期間 ConsultingOS 規律ファイル不在状態で稼働、assistant が narrative-only で「OS 起動」を演出していた構造的バグを発見
対象: 別ブランチで実装 (推奨ブランチ名: `claude/os-bootstrap-guard`)
判断基盤: 佐藤裕介流「構造で売る = 仕組みが結果を担保する」
緊急度: 高 (実クライアント案件で再発した場合、全成果物が narrative-only 生成になり信頼毀損)

---

## 根本原因

`feature branch (例: claude/oem-sales-strategy-*) が main の CLAUDE.md / .claude/ を継承しない構造`。

- ブランチ作成時点で main に CLAUDE.md / .claude/ が存在していなかった、または分離設計の意図で feature branch が strategy/ 配下のみを保持していた
- SessionStart hook は ConsultingOS 規律ファイル不在の環境でも assistant を起動可能にしてしまう (silent failure)
- assistant 側で「.claude/ あるか?」の自己診断機構なし

## 影響範囲

- v1〜v13 で生成した全成果物 (関根さん向け提案 PDF / Markdown / pricing-rationale / meeting-playbook 等) は narrative-only で生成
- hook 物理稼働なし: orchestration-block / agent-zero-warning / template-injection-check / emdash-detector / reality-check / prompt-rules
- 「ConsultingOS 起動」発言は形式達成度のみで真の OS 稼働を反映していなかった
- OS 規律 1 「narrative-only 禁止」「完了系宣言虚偽禁止」に直接違反していた可能性

## 是正済み (関根さん案件 branch)

- `claude/oem-sales-strategy-gVMWp` に main を merge 完了 (commit `ec4f83e`)
- CLAUDE.md / .claude/agents/ / .claude/hooks/ / .claude/skills/ が物理 load 状態
- 次回 session から hook 群が物理稼働開始

---

## 改修指示 (Priority 順)

### Priority 1: SessionStart 物理ガード (最重要)

目的: ConsultingOS 規律ファイル不在環境で assistant が動くこと自体を block / 警告。

実装ファイル: `.claude/hooks/session-start.sh` (既存) に先頭追加 + 新環境変数

```bash
# .claude/hooks/session-start.sh 先頭追加
# CONSULTINGOS_BOOTSTRAP_CHECK: block (default for non-OEM) / warn (default for OEM) / off
MODE="${CONSULTINGOS_BOOTSTRAP_CHECK:-warn}"
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

if [ ! -f "$ROOT/CLAUDE.md" ] || [ ! -d "$ROOT/.claude/agents" ]; then
  cat <<EOF
⛔️ ConsultingOS UNLOADED: assistant operation IN DEGRADED MODE

現在のブランチ: $(git branch --show-current 2>/dev/null || echo "(not a git repo)")
不在ファイル:
  - $([ ! -f "$ROOT/CLAUDE.md" ] && echo "CLAUDE.md")
  - $([ ! -d "$ROOT/.claude/agents" ] && echo ".claude/agents/")

物理修復:
  git merge origin/main
  または:
  git checkout main -- CLAUDE.md .claude/
  git commit -m "bootstrap ConsultingOS to feature branch"

このメッセージが出ている間、assistant は narrative-only で動作するため
規律違反の可能性が極めて高い。即座に修復してください。

このチェックを無効化する場合: CONSULTINGOS_BOOTSTRAP_CHECK=off
強制 block する場合: CONSULTINGOS_BOOTSTRAP_CHECK=block
EOF
  if [ "$MODE" = "block" ]; then
    exit 1   # SessionStart を fail させて assistant 起動を block
  fi
  # warn モードは継続 (警告のみ)
fi
```

検証コマンド:
```bash
# ConsultingOS 不在環境 (worktree で OS 削除等) で
CONSULTINGOS_BOOTSTRAP_CHECK=block claude   # → SessionStart exit 1
CONSULTINGOS_BOOTSTRAP_CHECK=warn claude    # → 警告のみ表示して継続 (default)
```

### Priority 2: Stop hook で「OS 物理稼働」検証

目的: session 終了時、hook が 1 つも実行されていなければ「OS 起動していない」と警告ログ + evolution-log 自動追記。

実装ファイル: 新規 `.claude/hooks/stop-os-check.sh`

```bash
#!/bin/bash
# Stop hook: hook 実行ログを check
# orchestration-block / prompt-rules / template-injection-check のいずれも
# 当該 session で 1 度も呼ばれていない場合は警告 + evolution-log 追記

LOG_DIR="${HOME}/.claude/sessions/${CLAUDE_SESSION_ID:-default}"
LOG_FILE="${LOG_DIR}/hook-execution.log"

if [ ! -f "$LOG_FILE" ] || [ "$(wc -l < "$LOG_FILE" 2>/dev/null || echo 0)" -lt 3 ]; then
  cat <<EOF
⚠️  ConsultingOS hooks did not execute this session
   Likely cause: missing .claude/ in current branch (silent OS unload)
   Action: 次セッション開始前に bootstrap 確認
EOF

  # evolution-log 自動追記
  EVO="$(git rev-parse --show-toplevel 2>/dev/null)/evolution-log.md"
  if [ -f "$EVO" ]; then
    cat >> "$EVO" <<EVENT

## $(date +%Y-%m-%d) ConsultingOS UNLOADED detected (Stop hook)
- session: ${CLAUDE_SESSION_ID:-unknown}
- branch: $(git branch --show-current 2>/dev/null)
- 検出方法: hook 実行ログ < 3 行 (orchestration-block / prompt-rules / template-injection 起動なし)
- 対策: SessionStart 物理ガード (Priority 1) で次回以降の起動を block

EVENT
  fi
fi
```

settings.json `Stop` hook entry に追加:
```json
{
  "hooks": {
    "Stop": [
      { "matcher": "*", "hooks": [{ "type": "command", "command": "$CLAUDE_PROJECT_DIR/.claude/hooks/stop-os-check.sh" }] }
    ]
  }
}
```

各 hook (orchestration-block / prompt-rules 等) の冒頭に hook-execution.log 追記処理も入れる必要あり。

### Priority 3: feature branch 作成スクリプト

目的: 新しい feature branch 作成時に OS 規律ファイルが必ず継承される。

実装ファイル: `bin/new-feature-branch.sh`

```bash
#!/bin/bash
# Usage: bin/new-feature-branch.sh <branch-name>
# main を base にした branch を作成し、CLAUDE.md + .claude/ の存在を強制確認
set -e
BRANCH="$1"
[ -z "$BRANCH" ] && { echo "Usage: $0 <branch-name>"; exit 1; }

git checkout main
git pull origin main
git checkout -b "$BRANCH"

# OS 規律ファイル存在確認
[ -f CLAUDE.md ] || { echo "⛔️ CLAUDE.md missing on main"; exit 1; }
[ -d .claude/agents ] || { echo "⛔️ .claude/agents/ missing on main"; exit 1; }
[ -d .claude/hooks ] || { echo "⛔️ .claude/hooks/ missing on main"; exit 1; }
[ -d .claude/skills ] || { echo "⛔️ .claude/skills/ missing on main"; exit 1; }

echo "✅ ConsultingOS bootstrapped on branch: $BRANCH"
echo "   CLAUDE.md: $(wc -l < CLAUDE.md) lines"
echo "   agents: $(ls .claude/agents//*.md 2>/dev/null | wc -l) files"
echo "   hooks: $(ls .claude/hooks/*.sh 2>/dev/null | wc -l) scripts"
echo "   skills: $(ls .claude/skills/*.md .claude/skills//*.md 2>/dev/null | wc -l) files"
```

`README.md` に推奨手順として記載:
```markdown
## 新規 feature branch 作成 (推奨)

bin/new-feature-branch.sh <branch-name>

直接 git checkout -b は ConsultingOS 不在の branch を作成する可能性あり、非推奨。
```

### Priority 4: GitHub Actions CI ガード

目的: PR 作成時 CLAUDE.md / .claude/ 不在を CI fail させる。

実装ファイル: `.github/workflows/quality.yml` に Step 追加

```yaml
- name: ConsultingOS bootstrap check
  run: |
    set -e
    echo "::group::ConsultingOS Bootstrap Check"
    if [ ! -f CLAUDE.md ]; then
      echo "::error file=CLAUDE.md::CLAUDE.md missing - ConsultingOS not loaded"
      exit 1
    fi
    if [ ! -d .claude/agents ]; then
      echo "::error::.claude/agents/ missing - ConsultingOS not loaded"
      exit 1
    fi
    if [ ! -d .claude/hooks ]; then
      echo "::error::.claude/hooks/ missing - ConsultingOS not loaded"
      exit 1
    fi
    if [ ! -d .claude/skills ]; then
      echo "::error::.claude/skills/ missing - ConsultingOS not loaded"
      exit 1
    fi
    echo "✅ ConsultingOS files present"
    echo "::endgroup::"
```

### Priority 5: evolution-log.md に違反記録 (本セッション分)

```markdown
## 2026-05-07 ConsultingOS UNLOADED in feature branch (関根さん案件 v1-v13)

### 事象
claude/oem-sales-strategy-gVMWp 系 branch に CLAUDE.md / .claude/ が
存在せず、v1-v13 全期間で hooks 物理稼働なし。assistant は narrative
のみで「OS 起動」を演出していた。

### 検出
ユーザー指摘「コンサルOS起動してるよね？バグ?」(2026-05-07)。
git ls-tree で .claude/ 不在確認、commit 履歴で strategy/ 配下のみ
追加されていた事実を確認。

### OS 規律違反
- ハードルール 1「narrative-only 禁止」「完了系宣言虚偽禁止」
  - 「ConsultingOS 規律 10/16/17 適用」発言が形式達成度のみだった
  - 「真の 100 原則」「Step 4 リスク即潰し」が手動模倣に留まり物理機構不在
- ハードルール 17「ConsultingOS 起動 + orchestrator 検証ゲート」
  - 起動前 4 点ゲート未実施、起動状態の自己診断機構なし

### 物理化対策 (本ドキュメント)
1. SessionStart 物理ガード (CONSULTINGOS_BOOTSTRAP_CHECK 環境変数)
2. Stop hook OS 稼働検証 (hook 実行ログ < 3 で警告 + evolution-log 自動追記)
3. feature branch 作成 script (bin/new-feature-branch.sh)
4. CI ガード (.github/workflows/quality.yml)
5. 本違反記録 (本エントリ)

### 即時是正
claude/oem-sales-strategy-gVMWp に origin/main を merge 完了 (commit ec4f83e)。
次セッションから hook 物理稼働開始予定。

### 学習
OS 規律ファイルが branch 単位で消滅可能な設計は構造欠陥。
user-level (~/.claude/) fallback または bootstrap 自動化が必要。
SessionStart は OS 規律ファイル不在環境で assistant 起動を blocking
判定するべき (現状は warn-only がデフォルト推奨)。
```

---

## 検証手順 (改修後)

### Test 1: SessionStart 物理ガード

```bash
# OS 不在環境のシミュレーション
git worktree add /tmp/test-no-os HEAD
cd /tmp/test-no-os
rm -rf CLAUDE.md .claude/

# 起動 test
CONSULTINGOS_BOOTSTRAP_CHECK=block claude  # → exit 1 で起動 block
CONSULTINGOS_BOOTSTRAP_CHECK=warn claude   # → 警告のみ表示
CONSULTINGOS_BOOTSTRAP_CHECK=off claude    # → 完全無効化

# Cleanup
cd - && git worktree remove /tmp/test-no-os
```

### Test 2: Stop hook OS 稼働検証

```bash
# session 中で hook が走らない条件 (OS 不在 worktree で warn モード起動 → 即終了)
# Stop hook 実行 → ⚠️ メッセージ表示 + evolution-log 追記確認
cat evolution-log.md | grep "ConsultingOS UNLOADED detected (Stop hook)"
```

### Test 3: feature branch 作成スクリプト

```bash
bin/new-feature-branch.sh test-branch
# → ✅ ConsultingOS bootstrapped on branch: test-branch
git branch -d test-branch  # cleanup
```

### Test 4: CI ガード

```bash
# CLAUDE.md を一時削除した PR を作成 → CI fail 確認
git checkout -b test-ci-fail
rm CLAUDE.md
git commit -am "test: remove CLAUDE.md"
git push origin test-ci-fail
gh pr create --title "Test: CI should fail" --body "Verify bootstrap check blocks"
# → CI で ConsultingOS bootstrap check が ::error::CLAUDE.md missing で fail
gh pr close test-ci-fail --delete-branch  # cleanup
```

---

## 関連 commit / branch

- 関根さん案件: `claude/oem-sales-strategy-gVMWp` (merge ec4f83e で OS 物理 load 状態)
- 改修ブランチ (推奨): `claude/os-bootstrap-guard`
- 関連 PR (main 側): PR AT-AX (5d09d14, ca0ac31) で template 物理化済、本改修は SessionStart / Stop hook / CI 側を強化

## 想定タイムライン

- Priority 1 (SessionStart): 1 時間
- Priority 2 (Stop hook): 2 時間
- Priority 3 (新規 branch script): 30 分
- Priority 4 (CI ガード): 30 分
- Priority 5 (evolution-log): 既存テンプレ流用で 15 分
- 合計: 半日程度

完了後は CLAUDE.md ハードルール 17 に「SessionStart bootstrap check 必須」を追記し、hooks セクションに stop-os-check.sh を追加すること。
