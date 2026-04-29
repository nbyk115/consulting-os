# エージェントルーティング詳細

> CLAUDE.md から分離した「スマートルーティング判定ツリー」と「ハンドオフプロトコル」の詳細版。複数部門にまたがる依頼の振り分けルールと、エージェント間連携時の標準フォーマット。

---

## スマートルーティング判定ツリー

### Step 1: 依頼の本質を判定
```
依頼の核心は？
├─ 「知りたい・調べたい・分析したい」 → 調査系（Step 2a）
├─ 「作りたい・実装したい・直したい」 → 実行系（Step 2b）
├─ 「売りたい・伸ばしたい・改善したい」 → 成長系（Step 2c）
├─ 「確認したい・チェックしたい」 → 品質系（Step 2d）
├─ 「海外に・グローバルに・翻訳したい」 → グローバル系（Step 2e）
└─ 「広告・SEO・PR・SNS・CRM」 → マーケティング系（Step 2f）
```

### Step 2a: 調査系
```
何を調査？
├─ 市場・競合 → competitive-analyst
├─ 数値・KPI → kpi-analytics
├─ 法務・契約 → legal-compliance-checker
├─ ユーザーの声 → feedback-synthesizer
├─ 技術的調査 → tech-lead
├─ 海外動向・国際情勢 → global-journalist
├─ 消費者調査・セグメンテーション → market-researcher
└─ マーケティングデータ・アトリビューション → marketing-analyst
```

### Step 2b: 実行系
```
何を作る？
├─ コード・API・DB → fullstack-dev、tech-lead が設計レビュー
├─ AI機能・RAG・プロンプト → ai-engineer
├─ LP・UI・デザイン → creative-director → ux-designer → frontend-dev
├─ コンテンツ・記事 → content-strategist
├─ インフラ・CI/CD → infra-devops
└─ 提案書・資料 → proposal-writer
```

### Step 2c: 成長系
```
何を伸ばす？
├─ 売上・事業 → strategy-lead
├─ CVR・ファネル → growth-hacker
├─ 顧客維持・LTV → client-success
├─ リード・商談 → lead-qualifier
├─ AI導入・DX → ai-consultant
├─ キャンペーン → campaign-planner
└─ 海外市場・グローバル展開 → gtm-consultant
```

### Step 2d: 品質系
```
何をチェック？
├─ コード品質 → tech-lead + code-quality-gates
├─ セキュリティ → fullstack-dev + /security-scan
├─ ブランド・トーン → brand-guardian + brand-guidelines
├─ 法令準拠 → legal-compliance-checker
├─ UX・アクセシビリティ → ux-designer
└─ SEO・AIO → agentic-content
```

### Step 2e: グローバル系
```
何をグローバルに？
├─ 海外市場参入・GTM → gtm-consultant
├─ 海外ニュース・動向調査 → global-journalist
├─ 海外拠点・オペレーション → global-business
├─ 翻訳・ローカライズ → business-translator
└─ 海外法規制チェック → legal-compliance-checker + global-business
```

### Step 2f: マーケティング系
```
何をマーケティング？
├─ 全体戦略・チャネルミックス・予算 → marketing-director
├─ 広告運用・SEM/PPC・ROAS → performance-marketer
├─ テクニカルSEO・サイト構造・CWV → seo-specialist
├─ GA4・アトリビューション・CDP → marketing-analyst
├─ CRM・MA・ナーチャリング・メール → crm-ma-strategist
├─ SNS戦略・コミュニティ・インフルエンサー → social-media-strategist
├─ 消費者調査・セグメンテーション・価格 → market-researcher
└─ PR・広報・メディアリレーション → pr-communications
```

### Step 3: チーム編成の判断
```
単独で完結する？
├─ Yes → 起点エージェント単体で実行
└─ No → Agent Team を編成
    ├─ 2部門またがり → 起点 + 連携先1名
    └─ 3部門以上 → 起点 + Agent Team
```

---

## ハンドオフプロトコル

> エージェント間でタスクを引き継ぐ時の標準フォーマット。品質の断絶を防ぐ。

### 引き継ぎテンプレート（全エージェント共通）
```
【From】送り元エージェント名
【To】送り先エージェント名
【タスク】依頼内容（1文）
【背景】なぜこのタスクが必要か（2-3文）
【インプット】提供するデータ・分析結果・ファイル
【期待アウトプット】何を・どの形式で・いつまでに
【制約】守るべきルール・使ってはいけない手法
【参照スキル】このタスクで使うべきスキルファイル
```

### 部門間ハンドオフの注意点

| From → To | 必ず渡すもの | よくある失敗 |
|---|---|---|
| Consulting → Service Dev | PLインパクト数値・優先順位・期限 | 「いい感じに作って」で丸投げ |
| Consulting → Creative | ターゲットの文脈・訴求ポイント・トーン指定 | デザイン方針なしで依頼 |
| Service Dev → Creative | API仕様・データ構造・技術制約 | フロントに必要な情報が不足 |
| Product → Service Dev | ユーザーストーリー・受け入れ基準・優先度 | 「この機能作って」だけ |
| Product → Consulting | ユーザーインサイト・データ根拠・仮説 | 感覚ベースの要望 |
| Creative → Service Dev | デザイントークン・コンポーネント仕様・レスポンシブ定義 | 「Figma見て」だけ |
| Global → Consulting | 海外市場データ・競合情報・規制情報（ソース付き） | ソースなし・未検証データで渡す |
| Global → Service Dev | i18n要件・多言語対応仕様・現地決済要件 | 「多言語対応して」だけ |
| Consulting → Global | ターゲット市場の仮説・評価基準・PLシミュレーション条件 | 「海外展開したい」だけ |
| Marketing → Consulting | チャネル別ROAS・LTV分析・ファネルデータ（ソース付き） | 加工済みデータだけで生データなし |
| Marketing → Creative | ターゲットペルソナ・チャネル特性・広告フォーマット要件 | 「バナー作って」だけ |
| Marketing → Service Dev | GA4設計書・GTM仕様・CDP連携要件・計測タグ一覧 | 「計測入れて」だけ |
| Consulting → Marketing | 事業KPI・ターゲットセグメント・予算制約・PLシミュレーション条件 | 「広告回して」だけ |
| Product → Marketing | リリース日程・機能説明・ターゲットペルソナ・差別化ポイント | ローンチ直前に丸投げ |

### 品質ゲート: ハンドオフ前チェック
- [ ] インプットデータは具体的か（「市場データ」ではなく実際の数値）
- [ ] 期待アウトプットの形式が明確か
- [ ] 参照スキルを指定したか
- [ ] 成功基準を定義したか
