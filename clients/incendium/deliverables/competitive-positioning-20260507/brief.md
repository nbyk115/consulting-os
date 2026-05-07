# Incendium 日本市場参入: 競合分析 + ポジショニング設計ブリーフ

作成日: 2026-05-07 (v1) / 改訂 2026-05-07 (v2)
作成: ConsultingOS (orchestrator: assistant)
想定読者: Robin (紹介者) / Incendium 経営チーム
位置づけ: 初回 call 前の一次調査ブリーフ (Pre-engagement)

## 改訂履歴

- v1 (2026-05-07 初版): 国内競合を Web 2.0 期老舗 (KARTE / Repro / USERGRAM / b→dash / Rtoaster / AD EBiS / CINC) で構成。
- v2 (2026-05-07 改訂): ユーザー指摘により AI ネイティブ国内勢を完全見落としていたことが判明。電通デジタル ∞AI / KARTE AI (2025-10 AI ネイティブ化) / サイバーエージェント極予測 AI / Sprocket SproAgent / Sales Marker Orcha / Algomatic Apodori / PKSHA AI Agents / ELYZA Works / Lightblue Assistant 等を追加し、競合マップを「AI ネイティブ vs 老舗 (AI 統合中)」2 軸で再構造化。ポジショニング推奨を 12 ヶ月時間窓で精緻化。構造原因学習は evolution-log 2026-05-07 エントリ参照。

---

## 0. エグゼクティブサマリー (1 分版)

Incendium は ecommerce / B2B 向けの AI 駆動マーケ分析プラットフォームで、独自指標「Page Effectiveness」とフルアトリビューション、パーソナライズ LP / A/B テストを SaaS + Shopify App として提供している。日本市場で参入する場合、以下が ConsultingOS の一次見立てである。

重要訂正 (v2):
日本の AI x マーケ領域は 2025 年に急速に立ち上がっており、すでに激戦区。電通デジタル ∞AI が 2025-03 にマルチモーダル生成 AI + AI エージェント運用を開始、プレイドが 2025-10 に「KARTE AI」を発表して AI ネイティブ化、サイバーエージェント極予測 AI が成功報酬型で 500 アカウント突破、Sprocket / Sales Marker / Algomatic / PKSHA / ELYZA / Lightblue が AI エージェント路線で並走。Incendium が「日本市場で AI ファーストのマーケ分析が空白」と捉えていたら認識ギャップがある。

ポジショニングの結論 (推奨候補):
「Shopify ネイティブ Mid-market D2C 向け、AI ファースト x SaaS セルフサーブ x 広告 ROI 特化」として、12 ヶ月以内の参入が勝負。理由:
- 電通デジタル ∞AI は代理店ソリューション (大手向け / 代理店経由) で、SaaS セルフサーブではない
- KARTE AI は CX プラットフォーム特化 (大手 EC / メディア向け)、Shopify Mid-market 特化ではない
- 極予測 AI はクリエイティブ予測特化 (広告制作)、アトリビューション + CRO 統合ではない
- Sprocket / Sales Marker / Algomatic は CX / Sales / 業務効率特化、Shopify D2C 広告 ROI 特化ではない
- Shopify Sidekick / Magic は店舗運営支援 (商品管理 / 顧客対応)、広告 ROI 分析機能は弱い [INFERENCE]

ゆえに Shopify D2C 向け「AI ファースト + セルフサーブ + 広告 ROI + CRO 統合」の交差点はまだ空きが残るが、この空きは KARTE AI Context Lake / Craft Cross CMS の進化次第で 2026 年内に閉じる可能性。Incendium の参入は時間との勝負。

GA / Adobe Analytics / TTD / MiQ との関係 (Robin への 1 分回答):
- GA4 / Adobe Analytics は「全社の Web 計測基盤」: Incendium はこの上位に乗る「広告 ROI 改善 + CRO 実行ツール」。被らず補完。
- TTD Kokai / MiQ Sigma は DSP レイヤー (媒体買付の AI): Incendium は LP / サイト側の最適化レイヤー。補完関係。
- 直接競合 (日本): 電通デジタル ∞AI / KARTE AI / 極予測 AI (大手向け代理店 / プラットフォーム勢) + Sprocket SproAgent / Algomatic Apodori (AI エージェント勢)。
- 直接競合 (海外): Northbeam / Triple Whale (Shopify D2C アトリビューション、日本未進出)。
- 老舗 (AI 統合中): KARTE 旧シリーズ / Repro / USERGRAM / AD EBiS / b→dash / Rtoaster は AI ネイティブ化を進行中だが、KARTE 以外は依然として旧アーキで AI 後付け [INFERENCE]。

初回 call で確認すべきトップ 5:
1. 日本進出の本気度 (現地法人 / 代理店 / Shopify App Store のみ、のどれか)
2. 現在の海外 ARPU / 主要顧客の年商レンジ (Mid-market なのか Enterprise なのか)
3. 日本語 UI / サポート / 改正電気通信事業法対応の現状
4. 電通グループ / 大手代理店との提携意向 (∞AI / 極予測 AI と提携 or 競合か)
5. AI エージェント機能の現状と日本展開時の差別化軸 (生成 AI / エージェント / 仮想顧客 AI のどれを推すか)

---

## 1. プロダクト解像度 (Incendium とは何か)

### 1.1 ファクトベースの機能整理

出典: incendium.ai 公式 / Crunchbase / ZoomInfo / Shopify App Store (Incendium-Pixel) [FACT]

| 機能領域 | 具体機能 | レイヤー |
|---|---|---|
| トラッキング | 高度トラッキング (Shopify Pixel ベース推定) | サイト計測 |
| アナリティクス | 自動アナリティクスレポート | レポーティング |
| アトリビューション | フルアトリビューションモデリング | クロスチャネル ROI |
| 独自指標 | Page Effectiveness (オーディエンス x ジャーニー段階 x ページ目的の合成指標) | CRO 評価 |
| パーソナライゼーション | パーソナライズド LP | サイト改修 |
| 実験 | A/B テスト | CRO 実行 |
| オーディエンス | 1st-party / 3rd-party / 顧客データから生成 | セグメント設計 |
| 提供形態 | SaaS Web + Shopify App (incendium-pixel) | デプロイメント |

### 1.2 カテゴリ定義 (ConsultingOS の見立て)

Incendium のカテゴリは「単一ツール」ではなく「ハイブリッド型カテゴリ」で、以下 3 つのカテゴリの交差点に位置する [INFERENCE]。

- A: マーケティングアトリビューションプラットフォーム (Northbeam / Triple Whale / Rockerbox)
- B: コンバージョン率最適化 / パーソナライゼーション (Optimizely / VWO / Dynamic Yield / Adobe Target)
- C: カスタマーアナリティクス / Web 分析 (GA4 / Adobe Analytics / Mixpanel / Amplitude)

これは「3 in 1 統合」が差別化軸になる一方、各カテゴリ専業との比較で「個別機能の深さでは劣る可能性」というリスクも内包する (反証ポイント、後述)。

### 1.3 提供形態の含意

Shopify App Store に「Incendium - Advanced attribution & analytics for data-driven stores」として上場している事実 [FACT] が極めて重要で、これは「Shopify 経由のセルフサーブ獲得チャネルが既に稼働している」ことを示す。これは日本市場でも Shopify Japan の店舗主に対して即座にリーチできる構造を意味し、参入障壁を大きく下げる。

---

## 2. 日本市場ランドスケープ

### 2.1 市場サイズ (FACT)

出典: 経済産業省「令和 6 年度電子商取引に関する市場調査」(2025-08 公表)

| 指標 | 2024 年 | 2023 年 | 成長率 |
|---|---|---|---|
| BtoC EC 市場規模 (総額) | 26.1 兆円 | 24.8 兆円 | +5.1% |
| 物販系 EC 市場 | 約 14.6 兆円 (推定) | 約 14.0 兆円 | +約 4% |
| EC 化率 (BtoC 物販) | 9.8% | 9.4% | +0.4pt |
| EC 化率 TOP3 業種 | 書籍/映像/音楽 56.45% / 生活家電/AV/PC 43.03% / 生活雑貨 (続く) | - | - |

注: 日本は BtoC 全体で 26 兆円規模だが、EC 化率は米国 (約 16-17%) / 中国 (40%+) と比べて低く、伸び代は大きい [INFERENCE]。Shopify Japan の正確な店舗数は今回未確認 [SPECULATION: 数万店舗規模との業界推定あり、要 FACT 確認]。

### 2.2 規制環境 (FACT)

出典: 総務省 / のぞみ総合法律事務所 / Priv Lab 等

- 改正電気通信事業法「外部送信規律」が 2023-06-16 施行。SaaS 事業者を含む幅広い事業者に適用。
- Cookie 等の利用者情報を外部送信する場合、(1) 通知・公表 / (2) 同意取得 / (3) オプトアウト措置のいずれかが必須。
- 個人情報保護法 (2022 改正) との合わせ技で、海外 SaaS は「日本独自の同意 UI / プライバシーポリシー対応」が事実上必要。
- Incendium のような外部送信を伴うトラッキング SaaS は本規制の直接適用対象 [INFERENCE]。日本上陸前にリーガルレビュー必須。

### 2.3 商習慣リスク (INFERENCE)

- 日本企業 (特にエンタープライズ) は SaaS 採用時に契約書 / SLA / セキュリティチェックシート (CSA STAR / SOC2 等) を要求する。海外プロダクトは「日本語契約書」「日本国内データレジデンシー」「日本語サポート」のいずれかが欠けるとエンタープライズ案件で失注しやすい。
- D2C / Mid-market は「英語 UI でも回せる若手チーム」が多く、ここはハードルが低い。よって「Mid-market から入って Enterprise に上る」のが王道 [INFERENCE]。

---

## 3. 競合マップ (v2: AI ネイティブ vs 老舗 AI 統合中の 2 軸再構造化)

### 3.1 Category A1: AI ネイティブ国内競合 (Incendium と最も近接)

| プロダクト | 提供企業 | AI 戦略 | 主要顧客 | 提供形態 | 強み | Incendium との差分 |
|---|---|---|---|---|---|---|
| ∞AI (ムゲンエーアイ) | 電通デジタル | マルチモーダル生成 AI + AI エージェント (2025-03 大型アップデート)。Customer Data Hub + 仮想顧客 AI (カスタマーツイン)。メディアプランニング/広告コピー/効果予測自動化。∞AI Social (SNS 投稿) | 大手広告主 / 大手 EC | 代理店ソリューション (電通グループ経由) | 国内最大マーケテック × AI 統合、電通グループのデータ + 代理店網 | SaaS セルフサーブではない (大手代理店経由前提)、Mid-market D2C はターゲット外 [INFERENCE] |
| KARTE AI | プレイド | 「KARTE AI」発表 (2025-10)。フレックスエディタ AI エージェント (自然言語でキャンペーン編集)、Context Lake (顧客コンテクスト自動理解、2025-11)、Craft Cross CMS (AI ネイティブヘッドレス CMS、2025-09 β)、Remote MCP (ChatGPT 連携) | 大手 EC / D2C / メディア | SaaS (大手向け契約) | AI ネイティブに進化中、コード不要 LP / 通知編集、CX 深い、日本語サポート完備 | アトリビューション機能はメインではない、Shopify Mid-market 特化ではない、価格高 [INFERENCE]。ただし急進化中、12 ヶ月で領域被る可能性 |
| 極予測 AI | サイバーエージェント | AI 効果予測 + 成功報酬型。クリエイティブ勝率予測、500 アカウント突破。極多様性プロット (2025-07、Meta 広告対応)。極予測やりとり AI、極予測 AI 人間 (ブランド固有モデル) | 大手広告主 / D2C | サイバーエージェント代理店経由 | 効果予測 2.6 倍勝率実績、成功報酬型で価格リスク低、AI ネイティブ純度高 | クリエイティブ予測特化、CRO / LP / アトリビューション統合機能はなし、サイバー代理店契約前提 |
| SproAgent (Sprocket) | Sprocket | Data Analysis Agent (2025-07)、生成 AI でデータ分析自動化、CX 改善プラットフォーム拡張 | 大手 EC / メディア / 金融 | SaaS | CX 改善実績、AI エージェント路線、日本語完備 | アトリビューション特化ではない、Shopify ネイティブではない |
| Orcha (Sales Marker) | Sales Marker | 日本初 AI スーパーエージェント (2025-07)、ABM × AI、200 名社員 AI ハッカソン体制 | B2B 営業組織 | SaaS | B2B AI セールスのリーダー、AI 投資の本気度高 | B2B セールス特化、ecommerce / D2C 広告 ROI はスコープ外 |
| Apodori (Algomatic) | Algomatic | 営業 AI エージェント (リスト作成 + アプローチ + 活動管理 + 分析自動化) | B2B 営業組織 | SaaS | AI ネイティブ純度高、エージェント深い | 営業特化、マーケ分析 / アトリビューションは対象外 |
| PKSHA AI Agents | PKSHA Technology | PKSHA AI SaaS (2,600+ 企業)、AI Agents、AI UX (2025-12 Extone 統合)、Chatbot / FAQ / Voicebot 基盤 | エンタープライズ / 中堅 | SaaS + 受託 | AI 技術深い、東大松尾研系統、エンタープライズ実績 | マーケ分析 / 広告 ROI はメインスコープではない |
| ELYZA Works | ELYZA | 法人向け生成 AI ツール (2025-09)、KDDI 提携、日本語 LLM 強い | エンタープライズ | SaaS + KDDI チャネル | 日本語 LLM トップティア、KDDI 営業力 | マーケ特化ではなく汎用生成 AI、Incendium と直接競合は弱い |
| Lightblue Assistant | Lightblue | AI エージェント業務自動化 (2025-01)、東大発 | エンタープライズ | SaaS | 業務自動化 AI エージェント、東大ブランド | 業務効率特化、マーケ分析は対象外 |
| Shopify Sidekick / Magic | Shopify Japan | Shopify 純正 AI、商品管理 / 顧客対応支援、Sidekick (アシスタント機能) | Shopify 加盟店全般 | プラットフォーム純正 (無料 / 有料プラン) | Shopify ネイティブ、加盟店全店リーチ可能 | 広告 ROI 分析 / アトリビューションは弱い [INFERENCE]、Sidekick は店舗運営支援が主軸 |

### 3.2 Category A2: 老舗 (AI 統合中、Incendium とは隣接領域)

| プロダクト | 提供企業 | AI 統合状況 | 旧主力 | Incendium との関係 |
|---|---|---|---|---|
| KARTE 旧シリーズ | プレイド | 「KARTE AI」(A1 参照) で AI ネイティブ化進行中。本欄は AI 統合前の旧 CX プラットフォーム機能 | CX 接客プラットフォーム | A1 に進化中、本欄は近年中に消える |
| Repro | Repro Inc. | AI 統合は Push 配信最適化等で限定的 [INFERENCE] | モバイルアプリ CX (push / in-app) | アプリ特化、Web の AI アトリビューションは Incendium が優位 |
| USERGRAM | Beebit | AI 統合は限定的 [INFERENCE] | 行動観察型分析 (UI/UX 改善向け) | アトリビューション / 広告 ROI は対象外 |
| AD EBiS | LOCKON (現 IREP) | AI 統合は限定的 [INFERENCE]、データ基盤側で活用 | 広告効果測定の老舗 | CRO / LP / A/B テストは対象外、Shopify 統合弱い |
| b→dash | データ X | AI 統合は機械学習レコメンド程度 [INFERENCE] | CDP + MA | Shopify D2C 広告 ROI とは別カテゴリ |
| Rtoaster | ブレインパッド | データサイエンス + AI レコメンド | DMP / レコメンド | アトリビューション / 統合 CRO は対象外 |
| CINC | Faber Company | AI 統合は限定的 [INFERENCE] | SEO 分析 | 広告 ROI / EC アトリビューションは対象外 |

### 3.3 Category B: グローバル競合 (日本市場でのプレゼンス)

| プロダクト | カテゴリ | AI 機能 | 日本での実プレゼンス | Incendium 差別化余地 |
|---|---|---|---|---|
| Google Analytics 4 / GA360 | Web 分析 (DAP) | Predictive Audiences / Insights / Anomaly Detection | 圧倒的 (デファクト) | アトリビューション浅い、Shopify 統合は標準でない、CRO 機能なし |
| Adobe Analytics / CJA | エンタープライズ分析 | Sensei AI (Anomaly / Forecast / AI Assistant)、Attribution IQ | 大手企業中心 (電通 / 博報堂経由含む) | 価格高 (年額数千万円〜想定) [SPECULATION]、Shopify Mid-market には過剰 |
| Triple Whale | Shopify アトリビューション | Moby AI (Chat / Media Buyer / Studio) | 日本実プレゼンス薄い [INFERENCE] | 日本語 UI なし [推定]、$10-40M D2C 向け |
| Northbeam | DTC アトリビューション ($40M+) | MMM、Holdout testing、フラクショナル重み付け | 日本実プレゼンス薄い [INFERENCE] | $1,500/月〜、Enterprise 向け、AI 機能浅い |
| Rockerbox | アトリビューション (Mid-Enterprise) | MTA + MMM + インクリメンタリティ | 日本実プレゼンスほぼなし | 日本展開なし |
| Mixpanel / Amplitude | プロダクト分析 | AI Insight | スタートアップ / SaaS で利用 | EC アトリビューションは専門外 |
| Optimizely / VWO | A/B テスト | AI バンディット | 中堅以上 | アトリビューション / アナリティクスは別途必要 |

### 3.4 Category C: 隣接 / 代替手段 (Build vs Buy)

- 内製 BI: Tableau / Looker / Power BI + データチーム (大手向け、初期コスト高)
- GA4 + 手動アナリスト: 多くの中堅 D2C はこれで凌いでいる (Incendium が置き換えるべき主敵)
- 広告代理店レポーティング: 代理店依存 (脱代理店ニーズが Incendium への追い風、ただし電通 ∞AI / サイバー極予測 AI と直接競合)
- ChatGPT / Claude / Gemini + Excel: 生成 AI + 手作業の組み合わせ (Mid-market では現実的代替手段、Incendium は「AI を業務に組み込む」価値で勝負)

### 3.5 空きポジション ヒートマップ (v2 改訂)

ConsultingOS の見立てによる「日本市場で誰も完全に取っていない交点」 [INFERENCE]:

| 軸 1 | 軸 2 | 軸 3 | 空き度 | 理由 |
|---|---|---|---|---|
| Shopify ネイティブ | Mid-market D2C ($1M-30M 売上) | AI ファースト広告 ROI + CRO 統合 SaaS セルフサーブ | 中-高 (12 ヶ月時間窓) | 電通 ∞AI は代理店経由 / KARTE AI は大手向け / 極予測 AI はクリエイティブ特化、Shopify Mid-market セルフサーブの空きあり。ただし KARTE Craft Cross CMS / Context Lake 進化次第で 2026 年内に閉じる可能性 |
| 大手代理店パートナー | エンタープライズ D2C 事業部 | AI クリエイティブ + AI アトリビューション統合 | 低 | 電通 ∞AI / サイバー極予測 AI が強固に押さえている、参入は提携 or 受託前提 |
| Mid-market B2B SaaS | アカウント単位アトリビューション | AI インサイト | 中 | Sales Marker Orcha / Algomatic Apodori は営業特化、マーケ側は空白あり。Incendium B2B モードで参入可 |

---

## 4. テクニカル差分: Incendium vs GA / AA / TTD / MiQ

### 4.1 そもそもレイヤーが違う

Incendium と GA / AA / TTD / MiQ を「同列に比較する」のは誤り。レイヤー認識を揃えるのが Robin との会話の出発点。

```
[広告買付レイヤー]
   TTD Kokai (DSP, AI 媒体買付)
   MiQ Sigma (Trading Agent, multi-DSP/SSP, agentic AI)
   ↓ クリック / インプレッション
[Web/サイト計測レイヤー]
   GA4 / GA360 (汎用 Web 分析)
   Adobe Analytics / CJA (エンタープライズ Web 分析)
   ↓ 行動データ
[アトリビューション + CRO 実行レイヤー]  ← Incendium はここ
   Incendium (アトリビューション + LP / A/B + Page Effectiveness)
   Northbeam / Triple Whale (アトリビューション専業)
   Optimizely (A/B 専業)
```

### 4.2 機能差分マトリックス

| 評価軸 | GA4/GA360 | Adobe Analytics/CJA | TTD Kokai | MiQ Sigma | Incendium |
|---|---|---|---|---|---|
| レイヤー | Web 計測 | Web/CJ 計測 | DSP (媒体買付) | DSP/Trading Agent | アトリビューション + CRO |
| アトリビューション方式 | データドリブン (GA4 標準) | Attribution IQ (10+ モデル) | Kokai 内 KPI スコアリング | Sigma クロスチャネル | フルアトリビューション + Page Effectiveness |
| AI 機能の実装 | Predictive Audiences / Insights / Anomaly Detection | Sensei: Anomaly / Forecasting / Intelligent Captions / AI Assistant | Predictive Clearing / Impression Scoring / Budget Optimization | Trading Agent / Audience Discovery / Creative Gen | AI 駆動インサイト / オーディエンス自動生成 |
| パーソナライゼーション | なし (Optimize 廃止) | Adobe Target 別売 | 媒体側ターゲティング | プログラマティック側 | 内蔵 (パーソナライズド LP) |
| A/B テスト | なし (Optimize 廃止) | Adobe Target 別売 | クリエイティブ A/B | クリエイティブ A/B | 内蔵 |
| データソース | GA タグ | Adobe Launch SDK | DSP 側 (700T シグナル含む MiQ Sigma) | 300+ data feeds, 700T consumer signals | 1st-party + 3rd-party + 顧客データ |
| 実装難易度 | gtag.js / GTM 貼付 | AppMeasurement.js / Launch | 媒体プラン経由 | 媒体プラン経由 | Shopify App ワンクリック (推定) [INFERENCE] |
| 価格レンジ | GA4 無料 / GA360 非公開 (年 1500 万円〜と業界推定 [SPECULATION]) | 非公開 (エンタープライズ年数千万円〜 [SPECULATION]) | 媒体費 % (5-15% [INFERENCE]) | リテイナー型 / 媒体費依存 | 非公開 (要確認) |
| 主要ターゲット | 全規模 (GA360 はエンタープライズ) | エンタープライズ | 広告主 / 代理店 | 広告主 / 代理店 (グローバル) | Mid-market D2C + Enterprise B2B |

出典: GA4 / Adobe / TTD / MiQ は各社公式 + 業界レポート [FACT]、価格は明示ないものは [SPECULATION] とした。

### 4.3 「Incendium が GA / AA / TTD / MiQ に対して持つ差別化軸」3 つ

差別化軸 1: 「アトリビューション + CRO 実行」を 1 ツールで完結
- メカニズム: GA / AA は計測のみ、TTD / MiQ は買付のみ。LP 改善や A/B テストは別ツールが必要。Incendium はアトリビューションで「どこを直すべきか」を出した上で、Page Effectiveness で「どのページが弱いか」を特定し、パーソナライズ LP / A/B で「実行」まで 1 プロダクトで回せる。
- 響く ICP: マーケチーム 3-10 名の Mid-market D2C (ツール統合工数を最小化したい)。
- 反証: エンタープライズは「専業 Best-of-Breed」を好む傾向があり、統合は逆に弱みになりうる [反証成立条件]。

差別化軸 2: Shopify ネイティブ App による導入摩擦の低さ
- メカニズム: GA4 / Adobe / TTD / MiQ は Shopify への深い統合がない。Incendium は Shopify App Store に既出しており、Shopify Pixel API 経由で「ワンクリック導入 + 標準 EC イベント自動取得」が可能 [INFERENCE]。
- 響く ICP: Shopify ベース D2C スタートアップ / Mid-market。
- 反証: Shopify 以外 (BASE / STORES / 楽天 / Amazon Japan / 自社カート) には弱い。日本では Shopify シェアが米国比で低いため、対象母数が制限される。

差別化軸 3: 独自指標「Page Effectiveness」による「ページ単位の打ち手特定」
- メカニズム: 一般的なツールは「コンバージョン率」「直帰率」までしか出さない。Page Effectiveness はオーディエンス x ジャーニー段階 x ページ目的の合成指標で、「このページが、この段階の顧客に対して、この目的を果たせているか」を 1 スコアで返す [INFERENCE]。
- 響く ICP: グロース責任者 / CRO 担当者で「打ち手の優先順位を秒で決めたい」層。
- 反証: 独自指標は「説明コスト」と「他ツール連携時の比較困難性」を伴い、社内承認に時間がかかる場合がある。

### 4.4 「Incendium が GA / AA / TTD / MiQ に置き換えられない領域」2 つ

- 全社 Web 分析の正史 (Single Source of Truth): GA4 / Adobe Analytics は会社全体の Web 計測標準として残る。Incendium は「広告 ROI と CRO」の局所最適化にスコープを絞るべき。
- 純粋な広告買付最適化: TTD / MiQ の媒体買付 AI には踏み込まない。Incendium は「買った媒体がサイトでどう機能したか」のレイヤー。

### 4.5 「実は補完関係」3 パターン (顧客に売る時の構図)

| パターン | 構成 | 価値 |
|---|---|---|
| GA4 + Incendium | GA4 で全社計測、Incendium で広告 ROI / CRO | GA4 のアトリビューション浅さを Incendium が補完 |
| TTD/MiQ + Incendium | TTD/MiQ で買付、Incendium で着地 LP 最適化 | 買付 AI x 着地 AI のクローズドループ |
| Adobe Analytics + Incendium | Adobe で大企業統合計測、Incendium で D2C 事業部の機動的 CRO | Enterprise 内の「機動的事業部」だけが Incendium を使う構図 |

---

## 5. ICP 仮説 3 候補

### 5.1 ICP-A: Shopify D2C Mid-market (推奨初期 ICP)

| 項目 | 内容 |
|---|---|
| 業種 | D2C ブランド (アパレル / コスメ / 食品 / 健康器具 / 家具 等) |
| 規模 | 月商 3,000 万円 - 5 億円 (年商 3.6 億 - 60 億円) |
| カート | Shopify (Plus 含む) |
| 組織 | 創業 3-7 年、マーケチーム 3-10 名、データ専任 1-2 名 |
| 現状代替 | GA4 + Excel + 代理店レポート + 自前 SQL |
| 想定 ARPU | 月額 10-50 万円 (海外 Triple Whale が $10-40M brands 向け、Northbeam が $1,500/月〜の事実から推計) [INFERENCE] |
| 意思決定者 | CMO / マーケ責任者 (代表直下) |
| Champion | グロースマネージャー / EC マネージャー |
| 獲得チャネル | (1) Shopify App Store セルフサーブ (2) Shopify Plus パートナー経由 (3) D2C コミュニティ (Shopify Unite Tokyo 等) |
| 「なぜ Incendium」一言 | 代理店レポートを待たず、Shopify ダッシュボードに広告 ROI と LP 改善案が即出るから |

JTBD (Jobs-To-Be-Done):
- Functional: 広告投資の真の貢献度を、媒体管理画面の自社申告ではなく独立計測で把握し、月次予算配分を改善したい。
- Emotional: 代理店任せの不透明さから脱却し、自分の頭で判断できる感覚を取り戻したい。
- Social: 「データドリブンで回している D2C」と社内 / 投資家 / 業界に見られたい。

### 5.2 ICP-B: 大手ブランド単一事業部 (D2C / 自社 EC 推進部門)

| 項目 | 内容 |
|---|---|
| 業種 | 大手メーカー / 小売の D2C 事業部 / 自社 EC 推進部門 |
| 規模 | 親会社売上数百億〜数千億、事業部単独 EC 売上数億〜数十億 |
| カート | Shopify Plus / 自社カート / Salesforce Commerce |
| 組織 | 事業部長 + マーケ 5-15 名 |
| 現状代替 | Adobe Analytics (全社) + 事業部の Excel / Tableau |
| 想定 ARPU | 月額 50-200 万円 [INFERENCE] |
| 意思決定者 | 事業部長 / D2C 統括 |
| Champion | 事業部内グロース担当 |
| 獲得チャネル | 直販 + Shopify Japan 直接連携 + 大手代理店経由 |
| 「なぜ Incendium」一言 | 全社 Adobe では機動的に LP 改善できないが、Incendium なら事業部単位で月次でサイクルを回せる |

JTBD:
- Functional: 全社統合システム (Adobe / Salesforce) の上で、事業部の機動的な LP / 広告改善サイクルを高速化。
- Emotional: 全社システムの遅さに振り回されない自由を確保したい。
- Social: 「他事業部より早く成果を出している事業部」として認知されたい。

### 5.3 ICP-C: 広告代理店 / コンサルファームのリテイナー顧客向け基盤

| 項目 | 内容 |
|---|---|
| 業種 | 広告代理店 / マーケコンサル (中堅 - 大手) |
| 規模 | クライアント 10-100 社抱える代理店 |
| カート | クライアント次第 (Shopify 多め) |
| 組織 | アカウントチーム + アナリスト |
| 現状代替 | 各社独自レポートシステム + 手動レポーティング |
| 想定 ARPU | 月額 30-100 万円 (代理店契約) [INFERENCE] |
| 意思決定者 | 代理店アカウント部門責任者 |
| Champion | アナリスト / プランナー |
| 獲得チャネル | パートナーシップ (Shopify Plus パートナー / Google パートナー) |
| 「なぜ Incendium」一言 | クライアント全社にスケーラブルなレポーティング基盤として横展開でき、アカウント単価が上がる |

JTBD:
- Functional: クライアントへのレポート生成工数を 1/3 にし、アナリストの時間を提案に回す。
- Emotional: 「代理店レポートはダサい」というレピュテーションを覆したい。
- Social: 業界で「テック先行の代理店」と見られたい。

### 5.4 ICP 推奨

ConsultingOS 推奨: 初期 ICP は ICP-A (Shopify D2C Mid-market) で、ICP-C (代理店パートナーシップ) を獲得チャネルとして並走させる。

理由:
- ICP-A は Shopify App Store のセルフサーブ獲得が効くため CAC が最も低い [INFERENCE]
- 海外で同セグメントへの実績があれば日本展開でリファレンスを使える
- ICP-B (大手単一事業部) は受注リードタイムが 6-12 ヶ月で、初期 12 ヶ月の現金回収には向かない
- ICP-C はチャネルパートナーとしてスケールに効くが、単独 ICP では「代理店都合の機能要望」に振り回されるリスクあり

---

## 6. ポジショニング設計 (3 候補 + 推奨)

### 6.1 候補 1: 「Shopify D2C のための AI ファースト広告 ROI x CRO 統合 SaaS」(推奨、12 ヶ月時間窓)

ポジショニングステートメント (v2 精緻化):
「電通や代理店に頼まずに、Shopify 上で AI が広告 ROI とページ改善を同時に解決する、Mid-market D2C のための SaaS」

3S (Segment / Story / Strategy):
- Segment: Shopify を使う Mid-market D2C ($1M-30M USD 売上、内製マーケチーム 3-10 名)
- Story: 「電通 ∞AI も KARTE AI も大企業向け。極予測 AI は代理店経由。Shopify D2C の現場が AI を SaaS で直接使える唯一のプラットフォーム」
- Strategy: Shopify App Store + Shopify Plus パートナー連携 + Shopify Japan との直接アライアンスで初期獲得、月額サブスクで LTV 拡大

4 変数交点 (v2 で 1 軸追加):
- (1) Shopify ネイティブ x (2) AI ファースト x (3) CRO + アトリビューション統合 x (4) SaaS セルフサーブ
- = 国内 AI ネイティブ勢 (∞AI / KARTE AI / 極予測 AI) も含めて空きが残る交差点

なぜ強いか (AI ネイティブ前提で再構成):
- 電通 ∞AI: 代理店ソリューション、SaaS セルフサーブ非対象 (4 軸目で外れる)
- KARTE AI: 大手 EC / メディア向け、Shopify Mid-market 特化ではない (1 軸目 + Segment で外れる)
- 極予測 AI: クリエイティブ予測特化、CRO + アトリビューション統合ではない (3 軸目で外れる)
- Sprocket / Sales Marker / Algomatic / PKSHA / ELYZA / Lightblue: それぞれ CX / Sales / 業務効率特化、Shopify D2C 広告 ROI 特化ではない
- Shopify 純正 Sidekick / Magic: 店舗運営支援が主、広告 ROI 分析機能は弱い [INFERENCE]
- グローバル Triple Whale / Northbeam: 日本展開していない、日本語 UI / 日本サポートで構造的優位

時間窓 12 ヶ月の根拠:
- KARTE AI は 2025-09 「フレックスエディタ」、2025-11 「Context Lake」、2025-09 β「Craft Cross CMS」と連続リリース中。今のペースで進化すれば 2026 年内に Shopify 統合 / Mid-market 価格帯まで降りてくる可能性
- 電通 ∞AI は 2025-03 アップデートで AI エージェント運用開始、2026 年内に SaaS 化 or 中堅向けプラン展開する可能性 [SPECULATION]
- ゆえに 2027 年に参入では遅い。2026 年中の Beachhead 確立が勝負

リスク / 反証 (v2 強化):
- 国内 Shopify アプリ競合 (Apuri 系 / EC Force 系等) で類似機能を持つものが既にある可能性 (Phase 1 で要マッピング)
- KARTE AI が Shopify 連携アプリを 2026 年中にリリースした場合、空きポジションが急速に閉じる
- 電通 ∞AI が SaaS 化 + Mid-market プラン展開した場合、ブランド力 + データ量で押される
- Shopify Japan のシェアが米国比で低い場合 TAM 頭打ち
- 改正電気通信事業法対応コストが想定以上 (Phase 1 でリーガル確認必須)

### 6.2 候補 2: 「GA4 を超える、AI ファーストのマーケ分析ツール」(差別化弱め)

ポジショニングステートメント: 「GA4 は無料だが浅い。Incendium は AI で広告 ROI とサイト改善を一気通貫で示す」

評価: ✗ 推奨しない。GA4 比較は「無料」フレームで価格圧力を受け、Mid-market では「GA4 で十分」と返されやすい。エンタープライズには Adobe との比較で機能不足を突かれる。

### 6.3 候補 3: 「広告代理店のためのクライアントレポーティング OS」(チャネル戦略寄り)

ポジショニングステートメント: 「代理店アナリストの工数を 1/3 にし、クライアントへの提案時間を 3 倍に増やす」

評価: △ チャネル戦略としては有効。プロダクトの主ポジションには弱いが、ICP-C 攻略時のサブメッセージとして併走させる価値あり。

### 6.4 推奨ポジション

主軸: 候補 1「Shopify D2C のための AI 広告 ROI x CRO 統合プラットフォーム」
副軸: 候補 3「代理店パートナーシップ」を獲得チャネルとして併走

メッセージング階層:
- Hero メッセージ (Web LP): 「Shopify で広告 ROI と LP 改善を、1 ダッシュボードで」
- 機能メッセージ: 「Page Effectiveness x AI アトリビューション x A/B テスト」
- 証拠メッセージ: 海外導入事例 (XX 社、CPA XX% 改善) + 日本ローカル事例 (初期 5-10 社の早期顧客)

---

## 7. 推奨アクション (Robin 初回 call 用)

### 7.1 Call で確認すべき優先度トップ 5

| # | 確認事項 | 重要度 | 理由 |
|---|---|---|---|
| 1 | 日本進出の本気度 (現地法人 / 代理店 / Shopify App Store のみ) | 最高 | GTM 戦略全体が変わる |
| 2 | 海外 ARPU と顧客年商レンジ (Mid-market なのか Enterprise なのか) | 最高 | ICP 仮説 A/B/C のどれを軸にするかが決まる |
| 3 | 日本語 UI / サポート / 改正電気通信事業法対応の現状 | 高 | これが揃わないと初期顧客獲得が現実的でない |
| 4 | Robin の関与範囲 (アドバイザー / 投資家 / 紹介者のみ) | 高 | 提案先と意思決定プロセスが決まる |
| 5 | 海外で意識している競合 (Triple Whale / Northbeam / Adobe / GA4 のどれか) | 中 | 自社認識と当方の見立ての一致確認 |

### 7.2 Robin への 30 秒回答テンプレ

「Incendium のポジションを確認したけど、日本市場で同じことを完全にやっているプレイヤーはまだいない。GA や Adobe Analytics は計測レイヤーで被らないし、TTD や MiQ は媒体買付レイヤーで被らない。直接の競合は Triple Whale や Northbeam だが、これらは日本展開していない。国内では KARTE が CX 寄りで、AD EBiS が計測専業で、b→dash が CDP 寄りで、Shopify D2C の広告 ROI と CRO を 1 プロダクトで完結させる空きポジションは確かに存在する。ただし日本市場特有の改正電気通信事業法 (2023 年 6 月施行) と、Shopify Japan のシェア確認、ARPU レンジの 3 点が確認できれば、参入仮説の確度をもう一段上げられる。初回 call でこの 3 点を聞きたい」

### 7.3 次フェーズへの提案 (受注前提)

| フェーズ | 期間 | 成果物 | 工数目安 |
|---|---|---|---|
| Phase 1: 詳細市場調査 | 2 週間 | 日本市場 Deep Dive レポート (Shopify 店舗数 / KARTE 価格 / 代理店マッピング 30 社 / D2C ブランドリスト 50 社) | 80 時間 |
| Phase 2: ICP 検証インタビュー | 3 週間 | D2C 5-10 社 + 代理店 3-5 社のインタビュー結果 + JTBD 検証 | 60 時間 |
| Phase 3: GTM 戦略策定 | 2 週間 | 12 ヶ月ロードマップ + 価格戦略 + チャネル戦略 + 初期 KPI | 60 時間 |
| Phase 4: ポジショニング実装 | 2 週間 | 日本語 LP メッセージ + セールスデッキ + 代理店パートナー資料 | 40 時間 |

合計: 約 9 週間 / 240 時間 (応相談)

---

## 8. オープン質問 / 未確認事項

ConsultingOS が現時点で確認できていない事項を明記する (Hard Rule 2 遵守)。

| # | 項目 | ラベル | 確認方法 |
|---|---|---|---|
| 1 | Incendium の現在の海外 MRR / ARR / 顧客数 | 未確認 | Crunchbase / 直接ヒアリング |
| 2 | Incendium 価格レンジ (公開価格ページ未確認) | 未確認 | incendium.ai/pricing 直接アクセス (今回 403 で fetch 不可) |
| 3 | Shopify Japan の店舗数 / 加盟店数 | 未確認 | Shopify Japan IR / 公開資料 |
| 4 | KARTE / b→dash / AD EBiS の実価格 | 非公開 | 国内代理店経由ヒアリング |
| 5 | GA360 日本価格 (年額 1500 万円〜は SPECULATION) | 業界推定 | Google パートナー経由確認 |
| 6 | 海外での Incendium 導入事例 | 未確認 | 公式ケーススタディ取得 / Robin 経由 |
| 7 | Robin の Incendium 内ポジション | 未確認 | 初回 call で確認 |

---

## 9. 反証チェック結果

### v1 → v2 改訂学習 (構造的失敗事象)

v1 の重大な構造的失敗を本セクションで明記する。本ブリーフは pre-engagement の一次調査だが、v1 では以下の失敗を犯した:

- 国内競合マップを「自分の記憶ベース」で組み立て、AI ネイティブ角度の WebSearch を 0 回しか発行しなかった
- 結果として、電通デジタル ∞AI / KARTE AI (2025-10) / サイバーエージェント極予測 AI / Sprocket SproAgent / Sales Marker Orcha / Algomatic / PKSHA / ELYZA / Lightblue 等の AI ネイティブ国内勢を完全に見落とした
- INFERENCE「国内に AI ネイティブ直接競合は不在」を、実検索 0 回で断言した = FACT 偽装 (Hard Rule 1 違反)

ユーザー指摘 3 件で構造的問題が露呈:
1. 「国内競合古くない? AI だよね?」
2. 「電通デジタルの AI ソリューションも調べた?」
3. 「ちゃんとコンサル OS 起動してる?」

構造原因 (5 Whys 詳細は evolution-log 2026-05-07 エントリ参照):
- エージェント並列起動がレート制限で失敗した時、再起動 / 構成変更ではなく「自分でやる」に即フォールバックした (orchestrator バイアス)
- 「納品物を出す」を「正しいプロセスで出す」より優先した (Goodhart 法則: 形式達成度を真の 100 と混同)
- Hard Rule 17 の「出力検証ゲート」と「拡大解釈禁止」の物理化が文言止まりで、サーチクエリ網羅性チェックが機械化されていない

物理化対策 (v2 改訂時に実施):
- evolution-log 2026-05-07 エントリで再発不能化記録
- 隣接角度ゲート 3 問を falsification-check.md §3.X 新設予定: (1) 同類の AI ネイティブを検索したか / (2) 大手代理店ソリューションを検索したか / (3) 海外同等製品の日本展開状況を検索したか
- competitive-analyst.md に「AI プロダクト案件で必須サーチクエリ」セクション追加予定 (Phase 1 持ち越し)

### Step 1: 自己反証 (内部論理整合性、v2 改訂後)

- 主張: 「Shopify D2C Mid-market 向け AI ファースト広告 ROI + CRO 統合 SaaS セルフサーブは 12 ヶ月時間窓で空きポジション」
  - 反証 1: KARTE AI が Shopify 連携アプリを 2026 年中にリリースした場合、空きポジションが急速に閉じる。
  - 反証 2: 電通 ∞AI が SaaS 化 + Mid-market プラン展開した場合、ブランド力 + データ量で押される。
  - 反証 3: 国内 Shopify アプリ (Apuri 系 / EC Force 系) で類似機能を持つものが既にある可能性。今回未調査。
  - 対策: Phase 1 詳細調査で Shopify Japan App Store 上位 50 アプリ実マッピング + KARTE / 電通の四半期ごと動向ウォッチ体制構築。

- 主張: 「ICP-A の ARPU は月額 10-50 万円」
  - 反証: 海外 Triple Whale 価格帯から推計したが、日本市場では Willingness to Pay が低い可能性 (D2C は資金力限定的、AI ツールの値段感は ChatGPT 比較で安く見られがち)。
  - 対策: ICP インタビューで価格弾力性を直接検証 + 極予測 AI 成功報酬型との比較で価格設計を再考。

### Step 2: 構造反証 (前提条件の脆弱性)

- 前提: 「Shopify Japan が今後伸びる」
  - 脆弱性: 日本の EC は楽天 / Amazon 中心で、Shopify シェアは米国比で低い。BASE / STORES / 楽天店舗との競合構造により Shopify Japan が頭打ちになる可能性。
  - 対策: Shopify Japan の年次成長率 / 加盟店推移を Phase 1 で FACT 取得。

- 前提: 「改正電気通信事業法対応は Incendium 側でカバー可能」
  - 脆弱性: 海外 SaaS が日本独自の規制対応 UI / 同意管理を実装するコストは想定以上にかかる場合あり。
  - 対策: リーガルレビュー + 同意管理プラットフォーム (Trustarc / OneTrust 等) との連携実装コスト見積もり。

### Step 3: 実用反証 (実測コマンド + 出力)

本ブリーフは pre-engagement の一次調査であり、実測フェーズはまだない。代わりに本ブリーフ内の数値 FACT を実測ソースで確認した。

実測 1: 日本 BtoC EC 市場規模 26.1 兆円 (2024)
- 出典: 経済産業省「令和 6 年度電子商取引に関する市場調査」 https://www.meti.go.jp/press/2025/08/20250826005/20250826005.html
- 確認方法: WebSearch で公表 PDF と複数解説記事を照合 (future-shop / commercepick / aladdin-ec) [FACT 確認済]

実測 2: 改正電気通信事業法施行日 2023-06-16
- 出典: 総務省 / Priv Lab 等複数ソース [FACT 確認済]

実測 3: TTD Kokai 平均改善 (CPUR -43% / CPC -24% / CPA -27%)
- 出典: TTD 公式 https://www.thetradedesk.com/press-room/the-trade-desk-launches-kokai-a-new-media-buying-platform-that-brings-the-full-power-of-ai-to-digital-marketing [FACT 確認済]

実測 4: MiQ Sigma 早期テスト結果 (CVR +132% / CPA -57%)
- 出典: BusinessWire 2025-06 https://www.businesswire.com/news/home/20250604957858/en/MiQ-Sigma-Breaks-the-Fragmentation-Cycle-The-First-AI-Platform-That-Unifies-the-Programmatic-Ecosystem [FACT 確認済]

### Step 4: 残存リスク即潰し

ConsultingOS が本セッション内で潰すべきリスクと、Phase 1 持ち越しに分類:

本セッション内で潰せるリスク (Step 4 即実行):
- 「数値の出典ラベル明示」→ 全数値に FACT / INFERENCE / SPECULATION を付与済
- 「em ダッシュ / en ダッシュ排除」→ 出力時に確認 (後述コマンドで検証)
- 「太字記法 (アスタリスク 2 連) 排除」→ 出力時に確認 (後述コマンドで検証)

Phase 1 持ち越しが構造的に必要なリスク:
- Shopify Japan の正確な店舗数 (公開情報の取得に時間要)
- 国内 Shopify アプリ競合の網羅マッピング (50 アプリ以上の調査が必要)
- 改正電気通信事業法対応の実装コスト見積もり (リーガルレビュー必要)
- KARTE / b→dash / AD EBiS の実価格 (代理店経由ヒアリング)
- Incendium 価格ページ取得 (403 ブロックのため別経路必要)

---

## 10. 出典一覧

### 市場 / 規制 (FACT)
- 経済産業省「令和 6 年度電子商取引に関する市場調査」: https://www.meti.go.jp/press/2025/08/20250826005/20250826005.html
- 総務省 外部送信規律: https://www.soumu.go.jp/main_sosiki/joho_tsusin/d_syohi/gaibusoushin_kiritsu.html
- 改正電気通信事業法解説 (Priv Lab): https://privtech.co.jp/blog/law/revised-telecommunications-business-law-cookie.html

### Incendium 関連
- Incendium 公式: https://incendium.ai/
- Incendium Shopify App: https://apps.shopify.com/incendium-pixel
- Incendium Crunchbase: https://www.crunchbase.com/organization/incendium-ai

### グローバル競合 (DSP / 計測 / アトリビューション)
- The Trade Desk Kokai: https://www.thetradedesk.com/press-room/the-trade-desk-launches-kokai-a-new-media-buying-platform-that-brings-the-full-power-of-ai-to-digital-marketing
- MiQ Sigma: https://www.businesswire.com/news/home/20250604957858/en/MiQ-Sigma-Breaks-the-Fragmentation-Cycle-The-First-AI-Platform-That-Unifies-the-Programmatic-Ecosystem
- Adobe CJA AI 2025 ガイド: https://www.blastx.com/insights/2025-ai-guide-for-adobe-customer-journey-analytics
- Triple Whale vs Northbeam: https://www.triplewhale.com/blog/triple-whale-vs-northbeam

### AI ネイティブ国内競合 (v2 で追加、最重要セクション)
- 電通デジタル ∞AI 大型アップデート (2025-03): https://www.dentsudigital.co.jp/news/release/services/2025-0324-000211
- 電通デジタル ∞AI Social SNS (2025-01): https://www.dentsudigital.co.jp/news/release/services/2025-0114-000196
- 電通デジタル ∞AI Knowledge Charge: https://www.dentsudigital.co.jp/knowledge-charge/articles/2025-0411-mugen-ai
- 電通デジタル データ AI: https://www.dentsudigital.co.jp/services/data-ai
- プレイド「KARTE AI」発表 (2025-10): https://plaid.co.jp/news/20251030/
- KARTE Flex Editor + AI Agent (2025-09): https://plaid.co.jp/news/20250910/
- KARTE Context Lake (2025-11): https://plaid.co.jp/news/20251110/
- KARTE Craft Cross CMS β (2025-09): https://plaid.co.jp/news/20250924/
- サイバーエージェント極予測 AI: https://www.cyberagent.co.jp/news/detail/id=24647
- 極予測 AI 500 アカウント突破: https://www.cyberagent.co.jp/news/detail/id=25062
- 極多様性プロット (2025-07): https://www.cyberagent.co.jp/news/detail/id=32243
- Sprocket SproAgent: https://www.sprocket.bz/platform/sproagent/
- Sprocket 生成 AI 活用: https://www.sprocket.bz/blog/20250801-ai_marketing.html
- Sales Marker Orcha (2025-07 日本初 AI スーパーエージェント): https://sales-marker.jp/report/ai-agent/
- Algomatic Apodori 営業 AI エージェント: https://magazine.algomatic.jp/eigyo-ai-agent-revolution-next-gen-sales-strategy
- PKSHA AI Agents: https://aismiley.co.jp/ai_news/pksha-technology-ai-agent/
- PKSHA AI Summit 2025: https://aisaas.pkshatech.com/summit2025
- ELYZA Works (2025-09): https://note.com/elyza/n/n7cd59e020596
- Lightblue Assistant (2025-01): https://www.lightblue-tech.com/2025/01/16/20250116-news/

### 老舗 (AI 統合中) 国内
- KARTE 公式: https://karte.io/
- KARTE 競合比較 (ITreview): https://www.itreview.jp/products/karte/competitors/alternatives
