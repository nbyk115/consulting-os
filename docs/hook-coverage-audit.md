# Hook Coverage Audit (2026-05-07)

ConsultingOS の 18 hook (本 PR の auto-validate-discipline.sh 追加で 18 件) が CLAUDE.md Hard Rule 17 項のうち何を機械的に enforce しているか、loophole はどこかを 1 表で提示する。

## Hook 一覧 (Phase / 起動点別)

| Hook | Phase | 役割 | 物理 enforce する Hard Rule |
|---|---|---|---|
| session-start.sh | SessionStart | 規律リマインド + branch 状態確認 | Rule 4 / Rule 7 |
| session-start-reminder.sh | SessionStart | evolution-log 直近違反の再通知 | Rule 13 (形骸化防止) |
| score-os-health.sh | SessionStart | OS 健全性スコア計算 (形式達成度 100/100) | Rule 17 (真の 100 区別) |
| workload-tracking.sh | SessionStart | 業務負荷配分追跡 | Rule 17 (orchestrator 規律) |
| prompt-rules.sh | UserPromptSubmit | 反証必須 / `**` 禁止 / 字形検証 等を注入 | Rule 1 / 10 / 16 |
| recommend-agents.sh | UserPromptSubmit | agent 起動推奨 + 4 点ゲート未通過 block | Rule 17 (gate) |
| agent-zero-warning.sh | UserPromptSubmit | 「agent 起動ゼロ」での主語詐称検知 | Rule 17 (主語詐称禁止) |
| reality-check.sh | PreToolUse | 「完了」「撲滅」断言の機械検証 | Rule 1 (Step 3 実コマンド必須) |
| orchestration-block.sh | PreToolUse | MCP 書き込み + main 直接 push を exit 2 で物理 block | Rule 4 / 5 / 7 |
| 各種 inline (PreToolUse) | PreToolUse | git push --force / rm -rf / chmod 777 等の dangerous 検知 | Rule 4 |
| 各種 inline (PostToolUse) | PostToolUse | PDF/PPTX/DOCX 生成時の pdffonts 検証案内 | Rule 10 |
| emdash-detector.sh | PostToolUse + Stop | em/en ダッシュ検知 (U+2014 / U+2013) | Rule 16-⑥ |
| evolution-log.sh | PostToolUse | 違反検知時の evolution-log 自動追記 | Rule 13 (再評価カレンダー) |
| template-injection-check.sh | PostToolUse | sales-deck-designer template の必須 CSS / version 表記検証 | Rule 17 (B10 等) |
| stop-validator.sh | Stop | 反証チェック未付与 + 禁止フレーズ検知 (grep 駆動) | Rule 1 / 17 |
| stop-os-check.sh | Stop | コミット未 push 検知 | Rule 7 |
| self-fraud-check.sh | Stop | 「ConsultingOS が」「自律実行」等の主語詐称検知 | Rule 17 (主語詐称禁止) |
| auto-validate-discipline.sh (新規) | Stop | consulting_os.validate_output() で構造化検証 (反証 / 出典 / 裸数値) | Rule 1 / 2 |

## Hard Rule カバレッジマトリクス

| Hard Rule | Hook 物理 enforce | Loophole |
|---|---|---|
| 1. 反証チェック必須 | prompt-rules / stop-validator / auto-validate-discipline | Claude 自己違反 (連続出力中の中間 narrative では介入不能) |
| 2. 出典なし数値断言禁止 | auto-validate-discipline (新規) | 既存 hook で機械検証なし → 本 PR で潰した |
| 3. .env / secrets 操作禁止 | orchestration-block (PreToolUse) | 環境変数経由読み出しは検知不能 |
| 4. push --force / reset --hard / rm -rf 禁止 | inline PreToolUse + orchestration-block | エイリアス経由実行は検知不能 |
| 5. 外部 API POST/PUT/DELETE 承認必須 | orchestration-block | curl 直接実行は検知漏れの可能性 |
| 6. PR Squash and merge 必須 | mcp__github__merge_pull_request 呼び出し時に merge_method 指定 | 物理 enforce hook なし |
| 7. main 直接 push 禁止 | orchestration-block (exit 2) | 既に物理 block 済 |
| 8. DESIGN.md 参照 | なし | UI 制作時の人間規律のみ |
| 9. ICP.md 参照 | なし | マーケ制作時の人間規律のみ |
| 10. 中国字形フォールバック禁止 | inline PostToolUse + brand-guidelines.md | pdffonts は手動実行必要 |
| 11. 英語出力に日本語訳併記必須 | なし | 物理 enforce hook なし |
| 12. 1 コミット = 1 目的 | なし | 人間規律のみ |
| 13. 形骸化ルール追加禁止 | session-start-reminder | 検知精度低 |
| 14. 反証モード Step 1-3 + 削除前 grep | reality-check (PreToolUse) | grep 漏れ検知不能 |
| 15. 不可逆操作の承認必須 | orchestration-block + Claude Code v2.1.122 事前確認 | 二重防御済 |
| 16. 出力フォーマット規律 (`**` / 改行 / em-dash 等) | emdash-detector + stop-validator | `**` 検知 hook なし → 残課題 |
| 17. ConsultingOS 起動 + orchestrator 検証 | recommend-agents + agent-zero-warning + self-fraud-check | 主語詐称検知の精度向上余地 |

## Loophole 残課題

| 優先 | Loophole | 対応案 |
|---|---|---|
| 高 | Rule 16 `**` 太字の Stop hook 検知なし | stop-validator に grep `\*\*` 追加 |
| 高 | Rule 11 英語出力日本語訳の検知なし | content-strategist + brand-guardian 起動時 hook で言語比率検知 |
| 中 | Rule 6 Squash merge の物理 enforce なし | PR merge 時の merge_method 値検証 hook (PreToolUse mcp__github) |
| 中 | Rule 4 エイリアス経由 dangerous command | shell history monitor (高 false-positive リスク) |
| 低 | Rule 8 / 9 / 12 は人間規律 | UserPromptSubmit hook で参照リマインドのみ |

## 結論

- 17 Hard Rule 中 14 件は何らかの hook で物理 enforce 済
- 3 件 (Rule 8 / 9 / 12) は人間規律で hook 不要
- 残課題: Rule 16 `**` Stop hook 検知 / Rule 11 言語混合検知 / Rule 6 merge_method 検証

本 PR は Rule 2 (出典なし数値) の loophole を auto-validate-discipline.sh で構造的に潰した。残 3 件は次 PR で対応予定。
