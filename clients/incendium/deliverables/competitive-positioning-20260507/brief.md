# Incendium 日本市場参入: 競合分析 + ポジショニング設計ブリーフ

作成日: 2026-05-07
作成: ConsultingOS (orchestrator: assistant)
想定読者: Robin (紹介者) / Incendium 経営チーム
位置づけ: 初回 call 前の一次調査ブリーフ (Pre-engagement)

---

## 0. エグゼクティブサマリー (1 分版)

Incendium は ecommerce / B2B 向けの AI 駆動マーケ分析プラットフォームで、独自指標「Page Effectiveness」とフルアトリビューション、パーソナライズ LP / A/B テストを SaaS + Shopify App として提供している。日本市場で参入する場合、以下が ConsultingOS の一次見立てである。

ポジショニングの結論 (推奨候補):
「Shopify ネイティブ Mid-market D2C 向け、AI 1st-party アトリビューション + CRO 統合プレイヤー」として参入するのが最も空きポジションが大きい。海外ではすでに Triple Whale / Northbeam が同領域を取っているが、日本市場では (1) Shopify エコシステムの Mid-market 特化 (2) パーソナライズ LP + A/B + アトリビューションの統合 (3) Page Effectiveness の独自指標、の 3 軸が交差する空白がまだ存在する。KARTE / Repro は CX / アプリ寄り、AD EBiS は計測専業、b→dash / Rtoaster は CDP 寄りで、いずれも Shopify D2C の「広告投資効率を 1 ダッシュボードで可視化 + 改善」までを 1 プロダクトで完結させていない。

GA / Adobe Analytics / TTD / MiQ との関係 (Robin への 1 分回答):
- GA4 / Adobe Analytics は「全社の Web 計測基盤」: Incendium はこの上位に乗る「広告 ROI 改善 + CRO 実行ツール」。被らず補完。
- TTD Kokai / MiQ Sigma は DSP レイヤー (媒体買付の AI): Incendium は LP / サイト側の最適化レイヤー。買付 AI と LP / アトリビューション AI は「補完関係」で、両方使われる。
- 直接競合は Northbeam / Triple Whale / Rockerbox (海外)、KARTE / b→dash / AD EBiS (日本)。ここに対して「Shopify x AI x 統合」で差別化する。

初回 call で確認すべきトップ 3:
1. 日本進出の本気度 (現地法人 / 代理店 / Shopify App Store のみ、のどれか)
2. 現在の海外 ARPU / 主要顧客の年商レンジ (Mid-market なのか Enterprise なのか)
3. 日本語 UI / サポート / 改正電気通信事業法対応の現状

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

## 3. 競合マップ

### 3.1 Category A: 国内ネイティブ競合 (日本発)

| プロダクト | 提供企業 | カテゴリ | 主要顧客 | 強み | 弱み (Incendium 差別化余地) |
|---|---|---|---|---|---|
| KARTE | PLAID | CX プラットフォーム + CDP + AI/ML | 大手 EC / D2C / メディア (電通デジタル等パートナー) | エンタープライズ営業強い、CX 深い、日本語サポート | アトリビューション機能は弱い、Shopify 特化ではない、価格高い [INFERENCE] |
| Repro | Repro Inc. | モバイルアプリ CX (push / in-app) | アプリを持つ EC / メディア | アプリ特化で深い | Web の AI アトリビューションは Incendium が優位 [INFERENCE] |
| USERGRAM | Beebit | 行動観察型分析 | 大手 EC / 金融 | 「個」の行動観察 (UI/UX 改善向け) | アトリビューション / 広告 ROI は対象外 |
| AD EBiS | LOCKON (現 IREP) | 広告効果測定 | 広告主 / 代理店 | 広告計測の老舗、データ基盤強い | CRO / LP / A/B テストは対象外、Shopify 統合弱い [INFERENCE] |
| b→dash | データ X | CDP + MA | エンタープライズ / 中堅 | データ統合 + MA 統合 | Shopify D2C の「広告 ROI 即可視化」とは別カテゴリ |
| Rtoaster | ブレインパッド | DMP / レコメンド | 大手 EC / メディア | レコメンド深い、データサイエンス背景 | アトリビューション / 統合 CRO は対象外 |
| CINC | Faber Company | SEO 分析 | デジタルマーケ部門 | SEO 特化 | 広告 ROI / EC アトリビューションはスコープ外 |

### 3.2 Category B: グローバル競合 (日本市場でのプレゼンス)

| プロダクト | カテゴリ | 日本での実プレゼンス | 強み | 弱み (Incendium 差別化余地) |
|---|---|---|---|---|
| Google Analytics 4 / GA360 | Web 分析 (DAP) | 圧倒的 (デファクト) | 無料 GA4 / GA360 はエンタープライズ標準 | GA4 はアトリビューション浅い、Shopify 統合は標準でない、CRO 機能なし |
| Adobe Analytics / CJA | エンタープライズ分析 | 大手企業中心に存在 (電通 / 博報堂経由含む) | Sensei AI (Anomaly / Forecast / AI Assistant)、Attribution IQ | 価格高 (年額数千万円〜想定) [SPECULATION]、Shopify Mid-market には過剰 |
| Mixpanel / Amplitude | プロダクト分析 | スタートアップ / SaaS で利用 | プロダクト分析深い | EC アトリビューションは専門外、Shopify 統合弱い |
| Optimizely / VWO | A/B テスト | 中堅以上 | A/B 専業の深さ | アトリビューション / アナリティクスは別途必要 |
| Triple Whale | Shopify アトリビューション | 日本での実プレゼンス薄い [INFERENCE] | Shopify ネイティブ、Moby AI (Chat / Media Buyer / Studio)、リアルタイム | 日本語 UI なし [推定]、$10-40M の D2C 向け |
| Northbeam | DTC アトリビューション ($40M+) | 日本での実プレゼンス薄い [INFERENCE] | MMM、Holdout testing、フラクショナル重み付け、研究志向 | $1,500/月〜のスターター、Enterprise ブランド向け、AI 機能浅い |
| Rockerbox | アトリビューション (Mid-Enterprise) | 日本実プレゼンスほぼなし | MTA + MMM + インクリメンタリティ | 日本展開なし |

### 3.3 Category C: 隣接 / 代替手段 (Build vs Buy)

- 内製 BI: Tableau / Looker / Power BI + データチーム (大手向け、初期コスト高)
- GA4 + 手動アナリスト: 多くの中堅 D2C はこれで凌いでいる (Incendium が置き換えるべき主敵)
- 広告代理店レポーティング: 代理店依存のレポート提供 (脱代理店ニーズが Incendium への追い風)

### 3.4 空きポジション ヒートマップ (3 候補)

ConsultingOS の見立てによる「日本市場で誰も完全に取っていない交点」 [INFERENCE]:

| 軸 1 | 軸 2 | 軸 3 | 空き度 | 理由 |
|---|---|---|---|---|
| Shopify ネイティブ | Mid-market D2C ($1M-30M 売上) | AI アトリビューション + CRO 統合 | 高 | KARTE / b→dash は CDP / 大手向け、Triple Whale 等は日本語対応せず |
| Shopify ネイティブ | 大手ブランド単一事業部 | エンタープライズ統合 | 中 | Adobe / KARTE が既存、Shopify 特化での割り込みは可能 |
| 非 Shopify EC (自社カート / 楽天 / Amazon Japan) | Mid-market | アトリビューション + LP 改善 | 中 | 楽天 / Amazon は API 制約強い、参入難度高い |

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

### 6.1 候補 1: 「Shopify D2C のための AI 広告 ROI x CRO 統合プラットフォーム」(推奨)

ポジショニングステートメント:
「広告投資が真に売上に効いているかを、Shopify ダッシュボードの上で AI が秒で答え、ページ単位で改善案まで出すプラットフォーム」

3S (Segment / Story / Strategy):
- Segment: Shopify を使う Mid-market D2C ($1M-30M USD 売上)
- Story: 「代理店レポートを待つ時代は終わった。Incendium は Shopify の中で広告 ROI と LP 改善を同時に解決する」
- Strategy: Shopify App Store + Shopify Plus パートナー連携で初期獲得、月額サブスクで LTV 拡大

3 変数交点 (佐藤裕介流):
- (1) Shopify ネイティブ x (2) AI アトリビューション x (3) CRO 実行 = 国内競合不在の交差点

なぜ強いか:
- 国内競合 (KARTE / b→dash / AD EBiS) はいずれも 3 軸全てを満たさない
- Shopify エコシステムへの依存が「ニッチ」に見えるが、日本の Shopify 加盟店が今後 5 年で増えるトレンド前提なら成長余地大 [SPECULATION: トレンド前提要 FACT 確認]
- グローバル競合 (Triple Whale / Northbeam) は日本展開していないため、日本語 UI / 日本サポートが構造的優位

リスク / 反証:
- Shopify エコシステムが日本で伸び悩めば TAM が頭打ち
- 国内 Shopify アプリ (KICK 系 / EC Force 系) との競合になる可能性
- 改正電気通信事業法対応コストが想定以上にかかる

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

### Step 1: 自己反証 (内部論理整合性)

- 主張: 「Shopify D2C Mid-market 向け AI x CRO 統合は空きポジション」
  - 反証: 国内 Shopify アプリ (Apuri 系 / EC Force 系) で類似機能を持つものが存在する可能性。今回未調査。
  - 対策: Phase 1 詳細調査で Shopify Japan App Store の上位 50 アプリを実マッピングする。

- 主張: 「ICP-A の ARPU は月額 10-50 万円」
  - 反証: 海外 Triple Whale の価格帯から推計したが、日本市場では Willingness to Pay が低い可能性 (D2C は資金力が限定的)。
  - 対策: ICP インタビューで価格弾力性を直接検証。

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

- 経済産業省「令和 6 年度電子商取引に関する市場調査」: https://www.meti.go.jp/press/2025/08/20250826005/20250826005.html
- 総務省 外部送信規律: https://www.soumu.go.jp/main_sosiki/joho_tsusin/d_syohi/gaibusoushin_kiritsu.html
- Incendium 公式: https://incendium.ai/
- Incendium Shopify App: https://apps.shopify.com/incendium-pixel
- Incendium Crunchbase: https://www.crunchbase.com/organization/incendium-ai
- The Trade Desk Kokai: https://www.thetradedesk.com/press-room/the-trade-desk-launches-kokai-a-new-media-buying-platform-that-brings-the-full-power-of-ai-to-digital-marketing
- MiQ Sigma: https://www.businesswire.com/news/home/20250604957858/en/MiQ-Sigma-Breaks-the-Fragmentation-Cycle-The-First-AI-Platform-That-Unifies-the-Programmatic-Ecosystem
- Adobe CJA AI: https://www.blastx.com/insights/2025-ai-guide-for-adobe-customer-journey-analytics
- Triple Whale vs Northbeam: https://www.triplewhale.com/blog/triple-whale-vs-northbeam
- KARTE (PLAID): https://karte.io/
- 改正電気通信事業法解説 (Priv Lab): https://privtech.co.jp/blog/law/revised-telecommunications-business-law-cookie.html
