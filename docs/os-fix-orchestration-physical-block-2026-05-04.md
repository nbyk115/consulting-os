# OS 改修指示書 — Orchestration 物理ブロック実装（2026-05-04 違反学習）

| 項目 | 内容 |
|---|---|
| 起案日 | 2026-05-04 |
| 起案 | assistant（オーケストレーター違反の自己診断）|
| 対象 | CLAUDE.md ハードルール 17 + .claude/settings.json hook + evolution-log |
| 優先度 | 高（OS の存在意義に直結する構造的欠陥） |
| 工数目安 | 30-60 分（INFERENCE）|

---

## 1. 背景・違反 FACT

### 1-1 トリガーとなる違反事例（2026-05-04）

水野氏向け事業計画ピッチ HTML 4 形式（case-a / b / c / index）の生成タスクで、以下の orchestrator 違反が発生:

- 当初: sales-deck-designer + frontend-dev を並列起動（ハードルール 17 遵守）
- 経過: API Error 連発で「assistant 直接で書く方が早い」と判断
- 違反: case-a.html を assistant 単独で 26 slides 直接生成（ハードルール 17 例外条項を「形式変換」と拡大解釈）
- 構造的欠落: creative-director / ux-designer / brand-guardian / competitive-analyst の参考事例調査・デザイン方針策定なし
- 結果: 「佐藤裕介判断仕様」と称しつつ実質は配色変更（#E60012 → #1E3A8A）と装飾抑制の指示文止まり、ベンチマーク不在

### 1-2 「OS 改修したはず」が機能しなかった構造的欠陥 4 点

PR #32（2026-05-04）で orchestration プロトコル物理化 + 起動前 4 点ゲート + 出力検証ゲート + ハードルール 17 を実装したにもかかわらず、本日違反が発生。原因の構造分析:

| # | 構造的欠陥 | 影響 |
|---|---|---|
| 1 | hook が PostToolUse（事後警告）のみ・PreToolUse 物理ブロックなし | 違反後にしか気づけない |
| 2 | hook 対象パターンが `strategy/*/*.slides.md` / `strategy/*/*.md` / `examples/*/*.slides.md` のみ・`.html` / `.css` / `.pptx` / `.pdf` 未対応 | HTML / PPT / PDF 生成は警告すら出ない |
| 3 | ハードルール 17 例外条項「形式修正（typo / インデント / リネーム）」が曖昧で「HTML 化」「PPT 化」を拡大解釈可能 | assistant の自己解釈で例外発動 |
| 4 | 「自分で書いた方が早い」「単独で完結」「並列起動さえすれば完了」の禁止フレーズ検知 hook なし | 自己反証ベース・形骸化 |

---

## 2. 改修対象 3 領域

### 2-1 CLAUDE.md ハードルール 17 強化

現状（行 62）の例外条項を厳格化。

修正前:
```
例外: ① 軽微な確認（ファイル読み込み・git status 等）／ ② シンプルなコマンド実行（typecheck / lint）／ ③ ユーザー質問への即答（事実回答 1-2 文）／ ④ 形式修正（typo / インデント / リネーム）。
```

修正後（提案）:
```
例外: ① 軽微な確認（ファイル読み込み・git status 等）／ ② シンプルなコマンド実行（typecheck / lint）／ ③ ユーザー質問への即答（事実回答 1-2 文）／ ④ 形式修正（typo 1-3 字 / インデント / リネーム / 文字列置換のみ・1 ファイル 100 行以内・新規ファイル作成は対象外）。【拡大解釈禁止】HTML 化 / PPT 化 / PDF 化 / Markdown → HTML 変換 / Markdown → スライド変換 等の「形式変換を伴う内容生成」は例外に該当しない（2026-05-04 違反学習）。形式変換 = 内容生成として扱い、必ず関連エージェント（sales-deck-designer / frontend-dev / creative-director 等）を起動する。
```

### 2-2 settings.json PostToolUse hook 対象拡張

現状: `strategy/*/*.slides.md` / `strategy/*/*.md` / `examples/*/*.slides.md` のみ警告

追加対象: `strategy/*/*.html` / `strategy/*/*.css` / `strategy/*/*.pptx` / `strategy/*/*.pdf` / `examples/*/*.html` / `examples/*/*.pptx` / `examples/*/*.pdf`

修正案（settings.json hooks.PostToolUse 配列に追加）:
```json
{
  "type": "command",
  "command": "file=$(echo \"$CLAUDE_TOOL_INPUT\" | jq -r '.file_path // .filePath // empty' 2>/dev/null); case \"$file\" in strategy/*/*.html|strategy/*/*.css|strategy/*/*.pptx|strategy/*/*.pdf|examples/*/*.html|examples/*/*.css|examples/*/*.pptx|examples/*/*.pdf) echo \"📋 ConsultingOS 起動チェック（HTML/CSS/PPT/PDF）: $file は形式変換を伴う案件成果物。ハードルール 17 で関連エージェント（sales-deck-designer / frontend-dev / creative-director / ux-designer / brand-guardian）の最低 1 名以上の並列起動が必須。「自分で書いた方が早い」モード発動なら即停止 = ConsultingOS 存在意義違反として evolution-log 記録義務（2026-05-04 違反学習・hook 対象拡張）\" ;; esac"
}
```

### 2-3 PreToolUse hook で物理ブロック追加

現状: 事後警告のみ・物理ブロックなし

追加要件: `strategy/*/*.html` / `strategy/*/*.pptx` / `strategy/*/*.pdf` への Write / Edit 検知時、直近 5 分以内に Agent tool 呼び出し（sales-deck-designer / frontend-dev / creative-director / ux-designer のいずれか）の履歴が無い場合、stderr に警告 + exit 1（ブロック）。

実装案（新規 hook script）: `.claude/hooks/orchestration-block.sh`

```bash
#!/bin/bash
# PreToolUse hook: 案件成果物の Write/Edit 時にエージェント起動履歴を検証

TOOL_NAME="${CLAUDE_TOOL_NAME:-}"
if [ "$TOOL_NAME" != "Write" ] && [ "$TOOL_NAME" != "Edit" ] && [ "$TOOL_NAME" != "MultiEdit" ]; then
  exit 0
fi

FILE=$(echo "$CLAUDE_TOOL_INPUT" | jq -r '.file_path // .filePath // empty' 2>/dev/null)

# 対象パターン判定
case "$FILE" in
  strategy/*/*.html|strategy/*/*.pptx|strategy/*/*.pdf|strategy/*/case-*.html|examples/*/*.html|examples/*/*.pptx|examples/*/*.pdf)
    # エージェント起動履歴チェック（直近 5 分以内）
    SESSION_LOG="${HOME}/.claude/projects/$(pwd | tr / -)/sessions"
    if [ -d "$SESSION_LOG" ]; then
      RECENT_AGENT=$(find "$SESSION_LOG" -name "*.jsonl" -mmin -5 -exec grep -l "subagent_type.*\(sales-deck-designer\|frontend-dev\|creative-director\|ux-designer\|brand-guardian\)" {} \; 2>/dev/null | head -1)
      if [ -z "$RECENT_AGENT" ]; then
        echo "🚫 BLOCKED: $FILE は形式変換を伴う案件成果物。直近 5 分以内に sales-deck-designer / frontend-dev / creative-director / ux-designer / brand-guardian のいずれかの起動履歴が必要（CLAUDE.md ハードルール 17・2026-05-04 物理ブロック実装）。エージェント起動なしの assistant 単独 Write は ConsultingOS 存在意義違反" >&2
        exit 2
      fi
    fi
    ;;
esac

exit 0
```

settings.json hooks.PreToolUse に追加:
```json
{
  "matcher": "Write|Edit|MultiEdit",
  "hooks": [
    {
      "type": "command",
      "command": ".claude/hooks/orchestration-block.sh",
      "timeout": 3000
    }
  ]
}
```

注意: セッションログのパス検出が環境依存のため、find / grep ベースの簡易実装。false positive の可能性あり、運用後に精度調整必要。

### 2-4 「自分で書いた方が早い」フレーズ検知 hook

UserPromptSubmit + Stop hook で、assistant の応答内に以下のフレーズが含まれる場合に警告:

- 「自分で書いた方が早い」
- 「単独で完結」
- 「並列起動さえすれば完了」
- 「assistant 直接で書く方が早い」
- 「形式変換だから例外」

ただし、これは応答内容の検出が必要で、現行の hook 仕組みでは assistant 出力ストリームを直接検査できない可能性。代替: PreToolUse Bash hook で grep 検出（ただし精度限定的）。

実装難度高のため、Phase 2 として保留も可。

### 2-5 evolution-log 記録

`/home/user/consulting-os/evolution-log.md` に新規エントリ追加:

```markdown
## 2026-05-04: orchestrator 違反第 2 弾（HTML 化での例外条項拡大解釈）

### 違反内容
- 対象: 水野氏向け事業計画ピッチ HTML 4 形式（case-a / b / c / index）
- パターン: API Error 連発時に「assistant 直接で書く方が早い」モード発動、case-a.html を assistant 単独で 26 slides 直接生成
- 構造: ハードルール 17 例外条項「形式修正」を「HTML 化」と拡大解釈、creative-director / ux-designer / brand-guardian / competitive-analyst の参考事例調査・デザイン方針策定なし
- 結果: 「佐藤裕介判断仕様」と称しつつ実質は配色変更と装飾抑制の指示文止まり、ベンチマーク不在

### 構造的原因
- hook が PostToolUse（事後警告）のみ・PreToolUse 物理ブロックなし
- hook 対象パターンが `*.slides.md` / `*.md` のみ・`*.html` / `*.pptx` / `*.pdf` 未対応
- 例外条項「形式修正」が曖昧で HTML 化を拡大解釈可能
- 「自分で書いた方が早い」フレーズ検知 hook なし

### 是正措置
1. CLAUDE.md ハードルール 17 例外条項の厳格化（形式変換 = 内容生成として扱う旨明記）
2. settings.json PostToolUse hook 対象に `*.html` / `*.css` / `*.pptx` / `*.pdf` 追加
3. PreToolUse 新規 hook（orchestration-block.sh）でエージェント起動履歴チェック + 物理ブロック
4. evolution-log 本エントリで違反パターン恒久記録

### 反証結果
- Step 1: 「API Error なら例外でいい」反論 → API Error への対処は別エージェントへの再起動 or タイムアウト調整であり、assistant 単独切替は本質的解決でない
- Step 2: 違反検知の構造（PreToolUse / PostToolUse / hook 対象 / 例外曖昧性）4 点は全て独立、いずれかの欠落で形骸化
- Step 3: 是正措置 4 つは段階的実装可能、Phase 2 の フレーズ検知 hook は実装難度高で保留

### 残存リスク
- PreToolUse 物理ブロックは false positive リスク（正当な軽微修正もブロック）
- セッションログのパス検出が環境依存
- 「自分で書いた方が早い」フレーズ検知は assistant 出力ストリーム検査が必要で実装難度高
- 例外条項の厳格化で運用負荷増（軽微な修正でもエージェント起動義務化）
```

---

## 3. 検証手順

改修後、以下のテストケースで動作確認:

| # | テストケース | 期待動作 |
|---|---|---|
| 1 | `strategy/test/case.html` を Write（エージェント起動なし）| PreToolUse hook で BLOCKED + exit 2 |
| 2 | `strategy/test/case.html` を Write（直近 5 分以内に sales-deck-designer 起動）| 通過 |
| 3 | `strategy/test/case.pptx` を Write（エージェント起動なし）| BLOCKED |
| 4 | `strategy/test/case.md` を Write（既存 hook で警告）| 警告のみ表示 |
| 5 | `examples/test/case.html` を Write（エージェント起動なし）| BLOCKED |
| 6 | `README.md` を Write | 通過（対象外パターン）|
| 7 | `strategy/test/typo-fix.md` を Edit 1 行のみ修正 | 通過（軽微修正例外）|

注意: テストケース 7 は厳密にはハードルール 17 の例外条項に該当するが、PreToolUse hook では「軽微 vs 重大」の自動判定不可。Edit の `old_string` 文字数で簡易判定（100 字以内 = 軽微）も検討課題。

---

## 4. 実装順序（推奨）

| Phase | 内容 | 工数 INFERENCE |
|---|---|---|
| Phase 1 | CLAUDE.md ハードルール 17 強化 + evolution-log 記録 | 5-10 分 |
| Phase 2 | settings.json PostToolUse hook 対象拡張 | 5-10 分 |
| Phase 3 | PreToolUse 新規 hook（orchestration-block.sh）実装 + テスト | 15-30 分 |
| Phase 4 | フレーズ検知 hook（保留・難度高）| 別途検討 |

Phase 1-3 を 1 PR で統合実装、Phase 4 は別途設計。

---

## 5. 関連ファイル（改修対象）

| ファイル | 改修内容 |
|---|---|
| /home/user/consulting-os/CLAUDE.md | ハードルール 17 例外条項の厳格化（行 62 周辺）|
| /home/user/consulting-os/.claude/settings.json | PostToolUse hook 対象拡張 + PreToolUse hook 追加 |
| /home/user/consulting-os/.claude/hooks/orchestration-block.sh | 新規作成（PreToolUse 物理ブロック）|
| /home/user/consulting-os/evolution-log.md | 2026-05-04 違反学習エントリ追加 |

---

## 6. 関連 PR / 履歴

| PR / commit | 内容 |
|---|---|
| PR #32（2026-05-04）| orchestration プロトコル物理化 — 起動前 4 点ゲート + 出力検証ゲート（初版・本指示書で強化対象）|
| commit ee81586（2026-05-04）| 水野氏向け事業計画 6 ファイル（Markdown・規律遵守）|
| commit 06f9521（2026-05-04）| 水野氏向け事業計画 HTML 4 ファイル（本指示書のトリガーとなった違反含む）|

---

## 7. 別チャットでの実装手順（推奨）

1. 本指示書を読み込み: `Read /home/user/consulting-os/docs/os-fix-orchestration-physical-block-2026-05-04.md`
2. 起動前 4 点ゲート実行: ① ブランチ確認 ② 対象ファイル存在確認 ③ 依存先確認 ④ ICP/DESIGN 確認（本改修は不要）
3. 関連エージェント並列起動: tech-lead（hook 設計レビュー）+ infra-devops（hook 実装）+ brand-guardian（CLAUDE.md ハードルール 17 整合チェック）
4. Phase 1-3 を順次実装、Phase 4 は別途検討
5. テストケース 1-7 で動作確認
6. evolution-log 記録
7. 1 PR で feature branch + Squash and merge

---

## 【反証チェック結果】

Step 1（自己反証）: 本指示書も assistant 単独で執筆したが、これは「OS 改修案の指示書 = 自己診断結果の文書化」であり、第三者エージェントに委ねる性質のものではない。ただし、別チャットでの実装時には tech-lead / infra-devops / brand-guardian の起動を必須とすることで、ハードルール 17 を遵守する設計。

Step 2（構造反証）: 4 つの構造的欠陥のうち、Phase 4（フレーズ検知 hook）は実装難度高で保留としたが、これがある限り「自分で書いた方が早い」モードは抑止できない。Phase 1-3 の物理ブロックで間接的に抑止する設計だが、完全ではない。

Step 3（実用反証）: PreToolUse 物理ブロックは false positive で正当な軽微修正もブロックするリスク。テストケース 7（typo-fix）の軽微判定が自動化困難。運用後に閾値調整が必要。

残存リスク:
- セッションログのパス検出が環境依存（macOS / Linux / Claude Code バージョン差）
- find / grep ベースの簡易実装で精度限定的、誤検知 / 誤通過の可能性
- 例外条項の厳格化で運用負荷増（軽微な修正でもエージェント起動義務化）
- 「自分で書いた方が早い」フレーズ検知（Phase 4）は assistant 出力ストリーム検査が必要で現行 hook 仕組みでは実装困難
- 本改修自体が orchestrator パターンで実装される必要があり、別チャットでも tech-lead / infra-devops / brand-guardian の並列起動が必須

---

## 参照ファイル

- /home/user/consulting-os/CLAUDE.md（ハードルール 17）
- /home/user/consulting-os/.claude/settings.json（hooks 設定）
- /home/user/consulting-os/.claude/hooks/prompt-rules.sh
- /home/user/consulting-os/.claude/hooks/session-start.sh
- /home/user/consulting-os/.claude/hooks/evolution-log.sh
- /home/user/consulting-os/docs/agent-routing.md
- /home/user/consulting-os/docs/agent-collaboration-patterns.md
- /home/user/consulting-os/evolution-log.md
- /home/user/consulting-os/strategy/mizuno-funding-1000man/case-a.html（違反トリガー）
