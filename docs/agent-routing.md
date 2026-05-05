# エージェントルーティング詳細

> CLAUDE.md から分離した「スマートルーティング判定ツリー」と「ハンドオフプロトコル」の詳細版。複数部門にまたがる依頼の振り分けルールと、エージェント間連携時の標準フォーマット。

---

## Step 0: エージェント使うべき 4 条件ゲート（前段判定）

> 出典: Anthropic Applied AI チーム（Hannah & Jeremy）公式知見。エージェント起動前に必ず確認、1 つでも NO ならエージェント不要・別手段で解決。

| 条件 | 判定 | NO の場合 |
|---|---|---|
| 1. タスクが複雑（人間が手順を順番に書き出せないレベル）| YES → 進む | 単発スクリプト・コマンド・Bash 一発で十分、エージェント起動不要 |
| 2. 価値が高い（粗利インパクト・時間節約効果が大きい）| YES → 進む | 形骸化リスク、エージェント不要・直接対応 |
| 3. 必要なツールを AI に渡せる | YES → 進む | ツール整備（MCP / API / CLI）が先、エージェント起動は後 |
| 4. エラーが検知・修正可能（取り返しがつく）| YES → 進む | 物理ブロック層（PreToolUse hook）必須、または対象外 |

判定が全 YES の場合のみ Step 1 に進む。NO が 1 つでもある場合は「エージェント不要 + 代替手段」をユーザーに提示。

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
├─ 海外動向・国際情勢 → gtm-consultant + market-researcher（global-journalist 機能吸収 PR #48）
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
├─ リード・商談 → proposal-writer（MEDDPICC 資格化）+ client-success（期待値引き継ぎ）（lead-qualifier 機能統合 PR #48）
├─ AI導入・DX → strategy-lead + ai-engineer（ペア起動・専任agent廃止）
├─ キャンペーン・施策カレンダー → growth-hacker + content-strategist
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
└─ SEO・AIO/GEO → seo-specialist + content-strategist（旧agentic-content吸収）
```

### Step 2e: グローバル系
```
何をグローバルに？
├─ 海外市場参入・GTM → gtm-consultant
├─ 海外ニュース・動向調査 → gtm-consultant + market-researcher（global-journalist 機能吸収 PR #48）
├─ 海外拠点・オペレーション・パートナーシップ → gtm-consultant（Post-Entry節吸収）
├─ 翻訳・ローカライズ → gtm-consultant（L1-L5 ローカライズ統括）+ ハードルール 11「英語出力に日本語訳併記必須」（business-translator 廃止 PR #48）
├─ グローバルプラットフォームの日本上陸 GTM・代理店戦略アライアンス・共同 R&D → gtm-consultant（主担当 / GTM 設計）+ performance-marketer（補助 / 媒体・計測スタック評価）+ competitive-analyst（補助 / 日本市場ポジショニング）+ legal-compliance-checker（NDA・上場会社 MNPI 該当判定）。電通デジタル / DDGC / DJIB / DII 型の越境ビジネス案件・Expert Network 回答もこのルートを使う（2026-05-05 違反学習：performance-marketer 単独起動は誤）
└─ 海外法規制チェック → legal-compliance-checker + gtm-consultant
```

### Step 2f: マーケティング系
```
何をマーケティング？
├─ 全体戦略・チャネルミックス・予算 → marketing-director
├─ 広告運用・SEM/PPC・ROAS → performance-marketer
├─ テクニカルSEO・サイト構造・CWV → seo-specialist
├─ GA4・アトリビューション・CDP → marketing-analyst
├─ CRM・MA・ナーチャリング・メール → client-success（ナーチャリング・LTV）+ marketing-director（MA 戦略承認）（crm-ma-strategist 機能分散 PR #48）
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

---

## エージェント起動前 4 点ゲート（2026-05-04 必須運用）

> 2026-05-04 失敗事例（legal-compliance-checker がファイル不在のままデフォルト判定）の再発防止。assistant がエージェント起動時に機械的に確認。

| # | ゲート | 確認方法 | NG 時 |
|---|---|---|---|
| 1 | ブランチ | `git branch --show-current` | 切替 or ユーザー確認 |
| 2 | 対象ファイル存在 | Bash `ls <path>` or Read | 起動中止、ユーザー報告 |
| 3 | 依存先存在 | 連携エージェント・参照スキル・参照ドキュメントの ls | 起動中止、依存解決後再起動 |
| 4 | ICP/DESIGN（マーケ・セールス・UI 系のみ） | `ls ICP.md DESIGN.md` | ハードルール 8/9 違反、起動中止 |

詳細・適用例外: `.claude/skills/claude-code-ops/SKILL.md` Orchestration プロトコル節

## エージェント出力フォーマット規律（必須項目）

全エージェントの出力に以下を必ず含める（含まない出力は assistant が再起動 or 単独切替判断）:

1. 参照ファイルパス: 判定根拠とした実ファイルの絶対パス（複数なら全て列挙）
2. 反証チェック Step 1-3 + 残存リスク（短文時は 2-3 行圧縮可、完全省略禁止）
3. 出典 3 ラベル: 数値・年次予測・予測値には FACT / INFERENCE / SPECULATION ラベル明示
4. 結論 → 根拠 → 具体アクションの順序

### 出力検証ゲート（assistant 受領後の機械的確認）

- [ ] 出力に「参照ファイルパス」が含まれているか（不在ならファイル参照なし判定の可能性）
- [ ] 反証チェック Step 1-3 + 残存リスクが含まれているか
- [ ] 「ファイル不在」「権限エラー」等の警告が出力に含まれていないか
- [ ] 出典 3 ラベルが明示されているか
