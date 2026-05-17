# Active Engagements: ConsultingOS 案件レジストリ

> ConsultingOS が複数ブランチで並行する案件を一元管理する。各セッションの orchestrator は session 開始時に本ファイルを必ず参照し、ブランチ横断で案件状況を把握する。2026-05-15 PR #220 物理化 (案件のブランチ横断把握ができていなかった構造盲点の対策)。

## 進行中案件

| 案件 | 担当ブランチ | 内容 | ステータス | 備考 |
|---|---|---|---|---|
| よるのことば | 別リポ `nbyk115/yorunokotoba` / ブランチ `claude/design-tokens-canon` (PR #103 進行中、CI 確認中) | 自社プロダクト = 女性向け占いアプリ。/goal = 副収入 月 10-20 万 (月 ¥980 課金換算)。Phase 1 コンテンツエンジン完了 (PR #98-101 merged) / Phase 3 デザイントークン正典化 進行中 (PR #103) / 次 = ビジュアル抜本リデザイン (creative 系) | 進行中 | 別リポのため consulting-os の GitHub MCP では直接更新不可。当該リポ assistant が実態ステータスを提供、本行はその転記 (2026-05-15 更新) |
| 関根さん (nycraftOS 案件) | `claude/session-status-check-pmiIG` | N&Y Craft OEM / nycraftOS 構築案件 | 進行中 | 詳細は当該ブランチの作業ログ参照 |
| 個人コンサル案件 | `main` | 個人向けコンサル案件 (関根さん案件は別ブランチのため除く) + ConsultingOS 規律本体 | 進行中 | 規律本体 (CLAUDE.md / skills / agents / hooks) も main で並行管理 |
| 水野さん v4 投資テーゼ | `claude/mizuno-funding-v4` | 1000 万円エンジェル出資 pitch deck + 投資テーゼ (派生: mizuno-funding-pitch / personal-cfo-system-mizuno / hmm-mizuno-watchlist) | 進行中 | 起点ドキュメント: `docs/handoff-mizuno-funding-v4.md` |
| GTM 案件 | `claude/gtm-consulting-os-launch-Q1yOm` | Go-to-Market 案件 (ConsultingOS ローンチ GTM、詳細は当該ブランチ要確認) | 進行中 | 担当 agent: gtm-consultant、詳細は当該ブランチの作業ログ参照 |

## 運用ルール

YOU MUST:

- session 開始時に orchestrator は本ファイルを参照し、作業対象案件のブランチ + ステータスを確認する
- 案件ブランチで作業した場合、該当案件行の「ステータス」「備考」を当該セッション末に更新する
- 新規案件が発生したら本テーブルに行を追加する
- 案件完了時は行を「完了案件」セクション (本ファイル下部) へ移動する
- 本ファイルは main で管理。案件ブランチでの更新は main へ merge して全ブランチ反映 (Hard Rule 18 cross-branch sync と整合)

## 完了案件

(完了次第ここへ移動)

## 反証チェック (Step 1-4 圧縮)

- Step 1: 3 案件のブランチ対応はユーザー提示 FACT (2026-05-15、よるのことば = brand-fix-phase2 / 個人コンサル = main / 水野さん = mizuno-funding-v4) / 各案件の詳細ステータスは当該ブランチ未確認のため INFERENCE、当該ブランチ assistant の更新で FACT 化
- Step 2: Hard Rule 18 cross-branch sync + PR #194 主語詐称 hook + session-handoff-export (PR #157) と整合、案件のブランチ横断把握の構造盲点を本レジストリで物理化
- Step 3 実用反証: git ls-remote 実測で水野さん 5 ブランチ特定、よるのことば / 個人コンサルはユーザー提示で確定、リモート 163 ブランチに案件が埋もれる構造盲点を本ファイルで一元化
- Step 4 リスク即潰し: 案件のブランチ横断把握不能 → 本レジストリ + session 開始時参照ルールで構造的回避 / レジストリ形骸化 → 各セッション末の更新ルール + 4 週間更新ゼロ検出 (evolution-log 同型) / 中身の不正確 → 当該ブランチ未確認部分は INFERENCE 明記、各ブランチ assistant の更新で FACT 化
