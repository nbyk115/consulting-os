# Agent View 統合運用ガイド（2026-05-09 PR DK 物理化）

> Claude Code 公式機能「Agent View」(Research Preview、2026-05) を ConsultingOS 27 agent 並列起動運用に統合するガイド。`claude-code-ops/SKILL.md` のサブ参照。

## 1. Agent View 機能概要（FACT、Anthropic 公式）

Claude Code が「1 チャットでコードを書くツール」から「複数 AI 作業員を同時に動かす開発 OS」へ進化。

機能:
- 複数 Claude Code セッションを 1 画面で一覧管理
- 各セッションのステータス可視化（実行中 / 入力待ち / 完了）
- 必要なセッションだけ覗く / インライン返信
- フルセッション復帰
- `/bg` で既存セッションをバックグラウンド化
- `claude --bg "task"` で最初から裏で実行
- ターミナルタブ占有せずに継続実行

起動: `claude agents`

出典: x.com/claudeai (Research Preview、2026-05 発表、INFERENCE: 一次出典 URL 未確認、ユーザー提示テキスト経由)

## 2. ConsultingOS 14 原則との対応

| 原則 | Agent View 対応 |
|---|---|
| アルトマン式原則 1 AI 1 人チーム | 複数セッション 1 画面管理 = 1 人で 27 agent 並列の物理実装 |
| アルトマン式原則 2 エージェント管理 CEO スキル | インライン返信 + フルセッション復帰 = mid-turn correction |
| マスク式原則 4 アルゴリズム | `/bg` + `claude --bg` = サイクル加速 + 自動化 |
| マスク式 Step 4 リスク即潰し | 入力待ちステータス即座覗き + 軌道修正 |
| FDE 時代戦略原則 5 不可視 orchestrator | バックグラウンド継続実行 = ユーザーが意識しない裏稼働 |

## 3. ConsultingOS 27 agent 並列起動への適用

### 3.1 大規模案件の標準フロー（関根さん / 水野さん級）

```bash
# 1. 戦略統合判定（フォアグラウンド）
claude agents
# → strategy-lead + competitive-analyst + kpi-analytics 起動

# 2. 並行して長時間タスクをバックグラウンド化
claude --bg "市場調査: 日本 AI コンサル新興 3 社の最新動向"
claude --bg "競合分析: Sierra / Agentforce / Genspark 最新機能"
claude --bg "業界別プレイブック更新: SaaS / D2C 2026 トレンド反映"

# 3. Agent View で全セッション管理
# 入力待ちステータスのみ介入、他は自動継続
```

### 3.2 案件別 agent 配置パターン

| 案件タイプ | フォアグラウンド | バックグラウンド |
|---|---|---|
| 新規 OEM 提案 | strategy-lead + proposal-writer | competitive-analyst + market-researcher（長時間調査）|
| 法務レビュー | legal-compliance-checker | privacy-legal / commercial-legal（並行レビュー）|
| visual 制作 | creative-director + ux-designer | frontend-dev（実装）+ brand-guardian（検証）|
| 商談準備 | strategy-lead + client-success | kpi-analytics（ROI 試算）+ market-researcher（顧客背景調査）|

### 3.3 mid-turn correction の物理運用

- 入力待ちステータス検知 → 即座 Agent View で覗く → インライン返信で軌道修正
- 完了ステータス検知 → 結果確認 → 次 agent へハンドオフ判断
- 実行中で長時間化 → `/bg` でバックグラウンド化、別タスクに集中

マスク式 Step 4「リスク即潰し」+ アルトマン式「認知的帯域上限まで活用」の物理実装。

## 4. 規律遵守（Agent View 利用時の注意）

### 4.1 主語詐称禁止（ハードルール 17 §2.3）

YOU MUST: バックグラウンド agent が完了 → 結果を統合する際、agent が実行したものは「agent が」、assistant が直接 Edit したものは「assistant が直接」と明記。Agent View で複数並列していても、各 agent の実行範囲を主語に明示。

### 4.2 規律 hook の継続稼働

バックグラウンド実行でも以下 hook は継続稼働:
- reality-check.sh (完了系断言検証)
- self-fraud-check.sh (主語詐称検出)
- em-dash-detector.sh (字形検証)
- block-main-push.sh (main 直 push 物理ブロック)
- stop-validator.sh (反証チェック未付与検出)

バックグラウンド agent 完了時も stop hook が発火 = 規律違反の機械検出継続。

### 4.3 価値マップ確認（orchestration-protocol §2.7）

複数 agent 並列起動前に「Enterprise Value Map → KPI Prioritization → Innovation Roadmap」3 ステップ内省必須。Agent View で並列起動の「楽さ」が、起動前ゲートをスキップする誘惑を生む（形骸化リスク）。

## 5. ConsultingOS 自己診断（Agent View 統合後）

| 軸 | 統合前 | 統合後 |
|---|---|---|
| 27 agent 並列管理 | tmux / ターミナル多重化 / 手動 | Agent View 1 画面 |
| バックグラウンド実行 | 不可（フォアグラウンド占有）| `/bg` + `claude --bg` |
| mid-turn correction | フルセッション切替必要 | インライン返信即時 |
| 規律 hook 継続稼働 | フォアグラウンドのみ | 全セッションで稼働（INFERENCE: 公式仕様要確認）|
| 認知的帯域上限 | 手動管理で疲弊 | Agent View で可視化 + 優先度判定 |

## 6. 関根さん / 水野さん案件への適用

### 6.1 関根さん N&Y Craft OEM 案件

Phase 1 構築（3 ヶ月）期間中の運用想定:
- フォアグラウンド: 関根さん業務委託壁打ち（週次）
- バックグラウンド常時稼働: 業界動向監視 / 競合更新 / 関根版 skill 改善
- mid-turn correction: 週次レビューで方向性軌道修正

### 6.2 水野さん 1000 万案件

事業計画 v4 書き直し（次セッション課題）:
- フォアグラウンド: proposal-writer + strategy-lead 統合
- バックグラウンド: competitive-analyst + market-researcher（ジーニー / マーケ業界調査）+ kpi-analytics（ROI 試算）
- Agent View で全並列 5-7 agent を管理

## 7. 関連参照

- 出典: x.com/claudeai (Agent View Research Preview、2026-05、INFERENCE)
- ConsultingOS 14 原則体系: マスク 4 (`consulting-playbook-musk-*.md`) + アルトマン 5 (`consulting-playbook-altman-solopreneur.md`) + FDE 5 (`consulting-playbook-fde-era.md`)
- orchestration-protocol §2.7 (Strategy ⇄ Execution 循環): `docs/orchestration-protocol.md`
- 親 skill: `.claude/skills/claude-code-ops/SKILL.md`

## 8. 反証チェック（Step 1-3 圧縮）

- Step 1: Agent View 機能仕様は Research Preview = 正式リリース前、仕様変更可能性あり SPECULATION / 一次出典 URL (Anthropic 公式 docs) は別途確認推奨
- Step 2: ConsultingOS 14 原則体系 + orchestration-protocol §2.7 と整合 / 規律 hook 継続稼働は INFERENCE (公式仕様要確認、`/bg` でも stop hook が発火するか)
- Step 3: 本 skill は運用ガイドのため実機検証は次の Agent View 実利用後 (関根さん Phase 1 構築期間中に検証推奨)
