# Meta 広告プロダクト戦略と Zuckerberg 発言 Curation（2024-2026）

対象期間: 2024年初頭から2026年5月時点の公開情報。知識カットオフ2025年8月 + WebSearch補完。

---

## 1. Meta 広告プロダクトスタック（2024-2026）

- Advantage+ Shopping Campaigns: Meta 公式発表によれば Q4 2024 に前年比70% 成長（FACT, Meta IR）。AIが自動でターゲティング・入札・クリエイティブ配信を最適化する e-commerce 向けキャンペーン。手動との比較で ROAS 約16% 改善とする第三者テストあり（INFERENCE, 出典: Top Growth Marketing / imm.com 記事）。

- Conversions API (CAPI): ブラウザを経由せずサーバーからイベントデータを Meta に直送し、ATT 後の計測断絶を補完する（FACT）。Event Match Quality スコアが 6 未満だとマッチング精度が低下するため、メールアドレスを含む PII ハッシュ送信が最重要パラメータ（FACT, Meta Business Help / ingestlabs.com）。

- Andromeda: 2024年12月に Engineering at Meta ブログで発表された次世代広告リトリーバルエンジン。旧システム比で約10,000倍のアド候補数（数千万単位）を競売ごとにリアルタイム評価（FACT, engineering.fb.com/2024/12/02）。NVIDIA Grace Hopper Superchip 上で動作し、クリエイティブが実質的なターゲティングシグナルになる設計思想を採用。

- GEM (Generative Ads Recommendation Model): LLM スケールで構築された広告推薦ファウンデーションモデル（FACT, engineering.fb.com/2025/11/10）。Reels 初期導入時にコンバージョン最大5% 改善を実現。従来の推薦モデル比4倍の効率を公表。

- Lattice: キャンペーン目的別・配置別に分散していた複数ランキングモデルを統合した単一アーキテクチャ（FACT, Meta for Business ブログ）。広告品質を最大12%、コンバージョンを最大6% 改善と公表。GEM が上位知識源として全モデルを横断的に教育する構造。

- Click-to-Message Ads / WhatsApp Business Ads: WhatsApp・Messenger のビジネス AI エージェントと組み合わせたメッセージング起点の広告フォーマット。Zuckerberg は messaging マネタイズを AI 投資の優先軸の一つとして明言（FACT, Q3 2025 earnings call, acquirersmultiple.com）。

- Threads Ads: 2025年1月に米国・日本での限定テスト開始、2025年4月に全世界の適格広告主に開放（FACT, TechCrunch 2025/04/23）。画像・動画・カルーセル形式に対応し、Advantage+ および手動キャンペーンから自動配置可能。CFO Susan Li は「2025年中は全体収益への貢献は限定的」と明言（FACT, Meta Q4 2024 earnings call）。

---

## 2. Zuckerberg の広告事業に関する経営判断

- AI 広告投資の優先順位: Q3 2025 earnings call で「AI は広告推薦・ターゲティング・コンテンツ発見・メッセージングの4軸に集中投資」と発言（FACT, acquirersmultiple.com）。2026年の AI 関連 capex は $115B-$135B の見通しで、広告収益がその投資原資（FACT, Meta Q4 2025 earnings call, qz.com）。

- ATT 後の回復戦略: iOS 14.5（2021年4月）以降、IDFA 取得率が激減したことへの対応として CAPI、Aggregated Event Measurement (AEM)、SKAdNetwork の3層構造を整備（FACT, adsmurai.com）。直接出典として Zuckerberg が ATT 影響を "a significant headwind" と 2021年Q3 earnings call で表明した記録あり（FACT）。CAPIによる失われたコンバージョンの回復率は第三者測定で 23-40% 程度とされるが、公式数値は未公表（INFERENCE, munalytics.com / ingestlabs.com）。

- 完全自動化 AI 広告と代理店不要論: 2025年5月の公開発言で「ビジネスが目標と銀行口座を提供するだけで、クリエイティブ・ターゲティング・計測設計は Meta AI が担う世界」を目指すと表明（FACT, eweek.com / winbuzzer.com 2025/05/02）。「広告カテゴリの再定義」と言及。代理店の創造的余地を縮小する方向性を示唆するが、実現時期は明言なし（INFERENCE）。

- Llama / Meta AI と広告の統合: Llama 4 は MoE（Mixture-of-Experts）アーキテクチャを採用し、広告推薦効率への転用が進むとされる（INFERENCE, getabovethefold.com）。Zuckerberg は Meta AI、Llama、広告システムの3つを「統合された単一インテリジェンス」として捉え、trillions の推薦を一元最適化する構想を発言（INFERENCE, Q4 2024 earnings 関連報道）。ただし Llama のオープンソース戦略が広告最適化に直接寄与するルートは公式には未詳細（SPECULATION）。

- Threads マネタイズ方針: 2025年4月時点で月間 4億 MAU（FACT, Meta 公式）。Zuckerberg は「最終的に10億人規模の discussion プラットフォームを目指す」と発言（FACT, TechCrunch / CNBC 2025）。広告収益への本格貢献は2026年以降と CFO が明示（FACT, Q4 2024 earnings）。

---

## 3. Instagram プロダクト戦略（Mosseri / Zuckerberg）

- Reels 優先方針: Mosseri は 2025年1月に「ウォッチタイム / リーチ当たりいいね / DM 送信数」を Reels の最重要ランキング信号として公式確認（FACT, Mosseri AMA）。Reels 広告は Instagram 全広告の過半数を占め、Zuckerberg は Q3 2025 決算で年間ランレート $50B 超と明言（FACT, CNBC 2026/01/20 / Tubefilter 2025/10/30）。

- Original Content 優遇 / 推薦システム: 2025年12月のアルゴリズム更新で「アグリゲーター（転載）アカウント」を排除し、オリジナルクリエイターのリーチを 40-60% 引き上げたと複数分析が報告（INFERENCE, ALM Corp 2025/12）。TikTok / CapCut 透かし入り動画は推薦対象外と Mosseri が明示。

- AI 推薦システムの多層化: Instagram は 2025年に「単一アルゴリズム」表現を廃止、Feed / Stories / Reels / Explore を個別 AI 推薦モデルで運用と公式発表（FACT, Meta 公式）。Zuckerberg は「AI モデルのスケーリング 1 改善が Facebook Reels のウォッチタイムを 15% 増加」と決算で開示（FACT, Q3 2025 earnings）。

- Threads 戦略 (ActivityPub / Fediverse): Mosseri は ActivityPub 対応を公約し、2025年時点で全 Fediverse サーバーの 75% 超と相互接続済み（FACT, Mosseri Threads 投稿 / Platformer）。「分散型が SNS の未来」と言明、ユーザーがフォロワーを他プラットフォームに持ち出せる設計を選択。

- Shop の方針転換: 2023年1月にナビゲーションから Shop タブを撤廃、ライブショッピングも同年3月に終了（FACT）。2026年3月に Mosseri が Reels アフィリエイトコマース機能を再導入、クリエイターが Reels 内に最大 30 商品をタグ付けし Meta Commerce カタログ経由で成果報酬を得る仕組みを発表（FACT, NetInfluencer 2026/03）。

- Creator Monetization: Subscriptions は 40 カ国以上で提供中、Gifts (Stars 形式) は Reels 投げ銭として機能、Reels 広告収益の 55% をクリエイターに分配するモデルを 2024年末に拡大適用（FACT, Meta Help）。一方、クリエイタープロフィールへの広告配置ボーナスプログラムは 2025年1月に終了（FACT, NetInfluencer 2025）。

- DM マネタイズ: Click-to-DM 広告は公式メニューとして拡充中、DM 送信数が Reels のアルゴリズム最上位信号であることから Meta は DM を広告接点 (会話型コマース) かつ配信シグナルとして二重活用する設計意図が読み取れる（INFERENCE, bot.space Click-to-DM Guide）。DM 単体の直接課金モデルは 2025年時点で未公表。

---

## 4. Zuckerberg 主要発言ソース（時系列）

- 2024-07-24: Llama 3.1 405B のオープンソース公開にあたり「オープンソース AI はクローズドな AI への最良のカウンターバランスだ」と発言。Meta がデータセンター開放 (Open Compute Project) で実施したことを AI でも繰り返すという戦略を明示 (FACT, Stratechery 2024)。

- 2024-Q2 Earnings Call: 「広告主はビジネス目標と予算を伝えるだけでよくなる。クリエイティブ生成から配信最適化まで Meta AI が担う」と述べ、AI 主導の広告自動化ビジョンを提示 (FACT, Marketing Dive 2024)。

- 2025-01-10: Joe Rogan Experience #2255 にて「2025 年中に Meta を含む複数社が、中堅エンジニア相当のコードを書ける AI を持つことになる。最終的にはアプリの大半のコードを AI エンジニアが書くようになる」と発言 (FACT, Singju Post Transcript)。

- 2025-Q1 Earnings Call: Reels の広告年間換算売上が $50B 超に達したと報告。Meta AI 広告ツール全体では $60B 超の年間換算収益を記録 (FACT, Tubefilter 2025/10/30)。

- 2025-07-30: Meta 公式ブログ「Personal Superintelligence for Everyone」にて「AI の超知性 (superintelligence) は視野に入った。個人の能動性を拡張し、人々が自分の望む方向で世界を改善できる新時代が始まる」と宣言 (FACT, Meta Newsroom 2025/07/30)。

- 2025 Stratechery インタビュー (Ben Thompson): Llama を Meta 過去 20 年のプラットフォーム戦略の延長として位置づけ、ソーシャルグラフから AI レイヤーへの移行を説明 (FACT, Stratechery 2025)。

---

## 5. Founder Mode / Open Source AI 戦略

- Founder Mode (2024-09 Paul Graham エッセイ後): Zuckerberg が直接「Founder Mode」という語を使った発言の一次ソースは現時点で未確認。Graham のエッセイ内で「Move fast and break things」が典型例として言及されているが、Zuckerberg 本人のコメントは現時点 SPECULATION レベル (SPECULATION, Paul Graham essay)。

- Open Source AI 戦略の論拠: Meta がオープンソース戦略を採る理由は「コンテンツは商品であるべき」という事業モデルと整合しており、Llama の普及はプラットフォームへのコンテンツ流入量を増やすため自社利益と一致する (INFERENCE, Stratechery "Meta and Open" 2024)。

- Open Source の限界 (2025-07-30): 超知性レベルのモデルについては「全てをオープンソースにはしない可能性が高い」と TechCrunch が報道。スケール次第で方針転換する可能性を示唆 (FACT, TechCrunch 2025/07/30)。

---

出典一覧:
- engineering.fb.com/2024/12/02: https://engineering.fb.com/2024/12/02/production-engineering/meta-andromeda-advantage-automation-next-gen-personalized-ads-retrieval-engine/
- engineering.fb.com/2025/11/10: https://engineering.fb.com/2025/11/10/ml-applications/metas-generative-ads-model-gem-the-central-brain-accelerating-ads-recommendation-ai-innovation/
- Meta for Business (Lattice): https://www.facebook.com/business/news/ai-innovation-in-metas-ads-ranking-driving-advertiser-performance
- TechCrunch (Threads Ads): https://techcrunch.com/2025/04/23/metas-threads-opens-up-ads-to-global-advertisers/
- eWeek (AI advertising automation): https://www.eweek.com/news/meta-ads-ai-automation/
- acquirersmultiple.com (Q3 2025 earnings): https://acquirersmultiple.com/2025/11/meta-platforms-q3-2025-ai-expansion-drives-strong-growth-amid-record-investment/
- CNBC (AI capex 2026): https://www.cnbc.com/2025/07/30/metas-big-ai-spending-blitz-will-continue-into-2026-.html
- CNBC (Instagram Reels 2025 ad share): https://www.cnbc.com/2026/01/20/most-of-instagrams-ads-ran-on-reels-in-2025-data-shows.html
- Tubefilter (Reels $50B annual run rate Q3 2025): https://www.tubefilter.com/2025/10/30/meta-reels-ad-revenue-q3-2025-earnings-report/
- ALM Corp (Instagram Algorithm Update Dec 2025): https://almcorp.com/blog/instagram-algorithm-update-december-2025/
- TechCrunch (Meta AI Reel recommendations): https://techcrunch.com/2023/04/26/meta-says-time-spent-on-instagram-grew-24-thanks-to-tiktok-style-ai-reel-recommendations/
- Mosseri Threads 投稿 (ActivityPub commitment): https://www.threads.com/@mosseri/post/CuRtcYTNY3J
- Platformer (Meta unspools Threads): https://www.platformer.news/meta-unspools-threads/
- NetInfluencer (Instagram re-enters creator affiliate commerce): https://www.netinfluencer.com/instagram-re-enters-creator-affiliate-commerce-years-after-rivals-built-lead/
- NetInfluencer (Reels bonus program shutdown): https://www.netinfluencer.com/instagram-reels-bonus-program-shutting-down/
- Meta Help (Instagram Partner Monetization Policies): https://help.instagram.com/512371932629820
- bot.space (Click-to-Instagram DM Ads Guide): https://www.bot.space/blog/click-to-instagram-dm-ads-the-ultimate-guide-to-converting-conversations-into-customers
- Stratechery (Llama 3.1 / Open Source AI 2024): https://stratechery.com/2024/llama-3-1-zuckerberg-on-open-source-ai-kamala-harris-europe-and-tech-innovation/
- Marketing Dive (Meta Q2 2024 GenAI ads): https://www.marketingdive.com/news/meta-q2-2024-earnings-mark-zuckerberg-generative-ai/723039/
- Singju Post (Joe Rogan #2255 transcript): https://singjupost.com/transcript-of-mark-zuckerberg-on-joe-rogan-podcast/
- Meta Newsroom (Personal Superintelligence for Everyone 2025/07/30): https://about.fb.com/news/2025/07/personal-superintelligence-for-everyone/
- Stratechery (Zuckerberg AI / Social Media Evolution 2025): https://stratechery.com/2025/an-interview-with-meta-ceo-mark-zuckerberg-about-ai-and-the-evolution-of-social-media/
- Paul Graham (Founder Mode essay): https://paulgraham.com/foundermode.html
- Stratechery (Meta and Open 2024): https://stratechery.com/2024/meta-and-open/
- TechCrunch (Zuckerberg superintelligence open source limit 2025/07/30): https://techcrunch.com/2025/07/30/zuckerberg-says-meta-likely-wont-open-source-all-of-its-superintelligence-ai-models/
