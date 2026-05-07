# ConsultingOS: 製品仕様書

ConsultingOS を外販・OEM 配布可能な AI エージェント OS 製品として位置付ける製品仕様書。OEM 配布時のみクライアント独自ブランドへ rebrand。

| 項目 | 値 |
|---|---|
| 製品名 | ConsultingOS |
| カテゴリ | AI エージェント OS (multi-agent operating system) |
| Version | v1.0.0 |
| Author | ConsultingOS Team |
| 最終更新 | 2026-05-07 |
| 公開ステータス | OEM 配布開始 (N.Y.CRAFT 案件起点) |
| ライセンス | プライベート (OEM 契約に基づく個別配布) |

---

## 1. 製品定義

### 1.1 What is it

ConsultingOS は、コンサル / サービス開発 / プロダクト / クリエイティブ / グローバル / マーケティング の 6 部門に跨る 27 エージェント + 34 スキル + 6 コマンド + 規律レイヤーで構成される、Claude Code 上で稼働する AI エージェント OS。

### 1.2 What it is NOT

- 単独 SaaS 製品 (Claude Code 上で稼働する設定パッケージ)
- LLM そのもの (Anthropic Claude を runtime として使用)
- ノーコードツール (markdown + bash + Claude Code への深い理解が前提)
- ChatGPT 互換 (Claude Code / Anthropic SDK 専用設計)

### 1.3 解く課題

| 課題 | 従来 | ConsultingOS |
|---|---|---|
| プロのコンサル知見が属人化 | パートナー依存・再現性なし | 27 エージェント + 34 スキルで体系化 |
| AI ツール導入が散在 | ChatGPT / Notion AI / Copilot 個別運用 | Claude Code 上に統合・1 つの規律で運用 |
| 提案資料の品質ばらつき | 担当者次第 | sales-deck-designer + brand-guardian で機械検証 |
| 規律違反の再発 | 学習が個人記憶 | evolution-log + hooks で物理化 |
| クライアント案件の OS 化 | 一品ごとの作業 | テンプレ化 + OEM 配布で再販可能 |

---

## 2. 構成 (Capabilities)

### 2.1 Agent Layer (27 名)

| 部門 | 人数 | 主要 Agent |
|---|---|---|
| Consulting | 6 | strategy-lead / competitive-analyst / proposal-writer / kpi-analytics / client-success / legal-compliance-checker |
| Service Dev | 4 | tech-lead / fullstack-dev / ai-engineer / infra-devops |
| Product | 2 | product-manager / feedback-synthesizer |
| Creative | 7 | creative-director / ux-designer / frontend-dev / content-strategist / brand-guardian / growth-hacker / sales-deck-designer |
| Global | 1 | gtm-consultant |
| Marketing & Research | 7 | marketing-director / performance-marketer / seo-specialist / marketing-analyst / social-media-strategist / market-researcher / pr-communications |

### 2.2 Skill Layer (34 件)

| カテゴリ | 主要 Skill |
|---|---|
| 規律 | falsification-check / brand-guidelines / cybersecurity-playbook |
| コンサル | consulting-playbook / monopoly-positioning-framework / industry-playbooks |
| 開発 | engineering-playbook / debug-methodology / claude-code-ops |
| クリエイティブ | creative-playbook / sales-deck-review / website-audit |
| マーケ | marketing-research-playbook / aeo-playbook / revenue-growth-framework |
| グローバル | global-expansion-playbook |
| AI 案件 | ai-kpi-framework / ai-readiness-assessment |
| 提案 iteration | proposal-iteration-playbook (NEW: N.Y.CRAFT v1-v19 学習) |
| OEM | oem-packaging-mizuno / workload-allocation-management |

### 2.3 Command Layer (6 件)

`/check-hallucination` / `/review-agent-essence` / `/security-scan` / `/tdd` / `/review-pr` / `/analyze`

### 2.4 規律レイヤー (Hard Rule 17 項)

- 反証チェック必須 / 出典なし数値禁止 / セキュリティ操作禁止 / Squash and merge 必須 / 1 コミット 1 目的 等
- 詳細: `CLAUDE.md` § 3 Hard Rules

### 2.5 物理防御層 (6 層)

| Layer | 内容 |
|---|---|
| L1 意図 | CLAUDE.md ハードルール |
| L2 手順 | brand-guidelines 詳細 |
| L3 検証 | brand-guardian REJECT |
| L4 物理通知 | 5 hook 注入 |
| L5 記録 | evolution-log |
| L6 物理ブロック | PreToolUse hook |

---

## 3. 配布モデル (Deployment Models)

### 3.1 Self-Hosted (自社利用)

- ConsultingOS リポジトリを `git clone` して `install.sh` 実行
- 自社 CLAUDE.md として運用
- 価格: 無償 (社内利用)

### 3.2 OEM Distribution (今回の N.Y.CRAFT モデル)

- クライアント名 + ブランド名で vendor-invisible 配布
- 内部実装は ConsultingOS、外部から見ると Client OS
- 配布時に `scripts/deploy-oem.sh` で brand swap
- 価格: 初期 100 万 ~ 300 万 + 月次 30 万 ~ 100 万 (案件規模次第)

### 3.3 White-Label (ホワイトレーベル)

- パートナーが独自ブランドで再販可能
- 内部実装は ConsultingOS、UI 含めパートナーブランド
- 配布時に追加カスタマイズ層を上書き
- 価格: 個別契約 (OEM の上位プラン)

### 3.4 Custom Build (個別開発)

- クライアント独自要件で agent / skill を新規開発
- 配布物は ConsultingOS + 個別カスタム部分
- 価格: 工数ベース (1 agent 開発 = 約 30 万 ~ 50 万)

---

## 4. 配布フロー (OEM Distribution)

### Step 1: Pre-Sales

- `strategy/n-y-craft-oem-case/` テンプレを基に提案資料生成
- `proposal-iteration-playbook` 5 phase で v1-v19 反復
- 価格は `03-pricing-rationale.md` フレームで提示

### Step 2: Contract

- `legal-compliance-checker` agent で OEM 契約テンプレ生成
- vendor-invisibility 条項 / 保守責任分界点 / 違反時 SLA を明記

### Step 3: Deploy

```bash
# クライアント環境で実行
./scripts/deploy-oem.sh \
  --client "N.Y.CRAFT" \
  --brand "TEAM CRAFT OS" \
  --vendor-invisible true \
  --target-dir /path/to/client/repo
```

### Step 4: Customization

- クライアント業界の playbook を `industry-playbooks/` に追加
- vocabulary / ICP を `ICP.md` に反映
- 必要 agent を業界特化版に派生 (例: `sales-deck-designer-fashion.md`)

### Step 5: Operation

- 月次定例で `/audit` + `/level-up` 実行
- evolution-log を共有 (vendor-invisible 加工後)
- KPI: agent 起動回数 / 規律違反検知数 / 案件 ROI

---

## 5. 価格モデル (Pricing)

### 5.1 OEM ライセンス

| プラン | 初期 | 月次 | 内訳 |
|---|---|---|---|
| Starter | 100 万 | 30 万 | 5 agent + 10 skill + 月次定例 1 回 |
| Standard | 200 万 | 60 万 | 15 agent + 20 skill + 月次定例 2 回 + brand swap |
| Enterprise | 300 万 + | 100 万 + | 全 agent + 全 skill + 専任サポート + custom build |

### 5.2 Custom Build

- 1 agent 新規開発: 30 万 ~ 50 万
- 1 skill 新規開発: 10 万 ~ 30 万
- 業界 playbook 新規開発: 50 万 ~ 100 万

### 5.3 サポート

- Slack / メール: 営業日 24h 以内
- 緊急対応: 別契約 (24/7)
- 月次定例: 60 分 / 1 回

---

## 6. 競合比較

| 軸 | ConsultingOS | LangGraph | CrewAI | AutoGen | Custom Built |
|---|---|---|---|---|---|
| LLM 選択 | Claude (Opus 4.7) 専用 | 任意 | 任意 | 任意 | 任意 |
| Agent 数 | 27 (即運用可) | 0 (要構築) | 0 (要構築) | 0 (要構築) | 0 (要構築) |
| Skill 数 | 34 (即運用可) | 0 | 0 | 0 | 0 |
| 規律レイヤー | Hard Rule 17 + 6 層防御 | なし | なし | なし | 個別実装 |
| OEM 配布 | scripts/deploy-oem.sh | 不可 (要自前構築) | 不可 | 不可 | 不可 |
| 提案 iteration | proposal-iteration-playbook | なし | なし | なし | なし |
| 反証モード | 全アウトプット必須 | なし | なし | なし | なし |
| 立ち上げ期間 | 1 週 (install.sh) | 1-3 ヶ月 | 1-3 ヶ月 | 1-3 ヶ月 | 6 ヶ月 + |

「敵地で戦わない」原則: 単純な OSS フレームワーク比較ではなく、即運用可能な完成済みエージェント群 + 規律レイヤー + 提案 iteration ノウハウの 3 点セットで戦う。

---

## 7. ロードマップ

### v1.0 (2026 Q2 - 現在)

- 6 部門 / 27 agent / 34 skill 完成
- OEM 配布スクリプト (deploy-oem.sh) 実装
- N.Y.CRAFT 案件をリファレンス事例化

### v1.1 (2026 Q3)

- agent 自律オーケストレーション (cross-agent calling 強化)
- 月次 audit + level-up 自動化
- 業界別 playbook 拡充 (SaaS / D2C / 製造業 / 金融 + 3 業界)

### v1.2 (2026 Q4)

- 多言語化 (英語 / 中国語 OEM 配布対応)
- ダッシュボード (agent 起動回数 / KPI 可視化)
- 認定パートナー制度 (white-label 再販)

### v2.0 (2027 H1)

- API 化 (REST / GraphQL での agent 呼び出し)
- Marketplace (3rd party agent / skill の出品 + 配布)
- Enterprise Edition (SSO / SAML / 監査ログ強化)

---

## 8. 関連ドキュメント

- 司令塔: `CLAUDE.md`
- 内部アーキテクチャ: `docs/agent-routing.md` / `docs/agent-collaboration-patterns.md`
- 規律: `.claude/skills/falsification-check.md` / `.claude/skills/brand-guidelines.md`
- 提案 iteration: `.claude/skills/proposal-iteration-playbook.md`
- 配布スクリプト: `scripts/deploy-oem.sh`
- リファレンス事例: `strategy/n-y-craft-oem-case/`
- 思想的基盤: `.claude/skills/consulting-playbook.md` (佐藤裕介 / 小野寺信行)

---

## 9. Definition of Done (Product Readiness)

| 項目 | 基準 | 現状 |
|---|---|---|
| Agent 数 | 25 以上 | ✓ 27 |
| Skill 数 | 30 以上 | ✓ 34 |
| 規律レイヤー | Hard Rule 15 項以上 | ✓ 17 項 |
| 物理防御層 | 5 層以上 | ✓ 6 層 |
| 配布スクリプト | OEM brand swap 対応 | ✓ deploy-oem.sh |
| リファレンス事例 | 1 件以上 | ✓ N.Y.CRAFT |
| 提案 iteration ノウハウ | playbook 化 | ✓ proposal-iteration-playbook (v1-v19) |
| Self-Hosted 配布 | install.sh 1 行で完了 | ✓ install.sh 58 行 |
| OEM 配布 | scripts/deploy-oem.sh 1 行で完了 | ✓ deploy-oem.sh |
| 真の 100 (実クライアント ROI) | 1 件以上 | △ N.Y.CRAFT 提案中 (契約後測定) |

「真の 100」到達は実クライアント ROI 実証 + Phase 4 採点ロジック AutoHarness 化が条件 (CLAUDE.md Hard Rule 17 § 真の 100 原則)。
