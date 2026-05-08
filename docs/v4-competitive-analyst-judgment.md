# competitive-analyst v4 競合分析判定（2026-05-08 セッション）

> ConsultingOS 引き継ぎドキュメント。マーケ業界 + AI Agent 領域の競合分析 v4。

---

## 1. 結論（市場での勝ち筋）

ConsultingOS の勝ち筋は「マーケ業界 × 個人カスタマイズ × 評判資本起点」の交点に集中特化することにある（INFERENCE）。汎用 AI エージェントプラットフォームが押さえる「水平展開 × エンタープライズ統合」のポジションは取りに行かない。

トレードオフ明示: エンタープライズ CRM 統合・IT 部門向けノーコード機能・価格競争を捨て、「特定業界に精通した個人コンサルタントの武器」としてのポジションを取る。

---

## 2. 競合マトリクス v4（7 社 × 7 軸）

FACT: 各社の公開情報（公式サイト・IR・プレスリリース）を一次根拠とする。スコアは INFERENCE（公開情報からの定性推定）。

| 競合 | 業界特化度 | 個人カスタマイズ | 評判資本起点 | 反証チェック | OEM 提供 | 統合範囲 | 価格帯（月額）|
|---|---|---|---|---|---|---|---|
| ConsultingOS | マーケ + 金融 + 製造（設計上）| 高: 個人 agent 名称・知見蓄積 | 高: マスク式原則 2 物理化 | 高: Step 1-4 全出力 | 有: N&Y Craft 実証中（FACT）| 27 agent / 36 skill | 未定（FACT）|
| Sierra AI | カスタマーサポート特化（高）| 中: テンプレート型 | 低: 組み込まず | 低: 組み込まず | 不明（INFERENCE）| CX フロー特化 | 非公開（FACT）|
| Salesforce Agentforce | CRM 統合（高）| 低: Salesforce 生態系依存 | 低 | 低 | 有（OEM 型 ISV）| SF エコシステム全域 | 推定 $25-75/user（INFERENCE）|
| Microsoft Copilot Studio | M365 統合（高）| 中: Power Platform 連携 | 低 | 低 | 有（ISV 経由）| M365 / Azure 全域 | $200/tenant+（FACT、公開 pricing）|
| HubSpot AI | マーケ / CRM（高）| 中: HubSpot 内設定 | 低 | 低 | 限定（INFERENCE）| HubSpot エコシステム | $800-3600/月（FACT、公開 pricing）|
| Marketo Engage | マーケ自動化（高）| 低: Adobe 依存 | 低 | 低 | Adobe OEM（FACT）| Adobe Experience Cloud | $895/月-（FACT、公開情報）|
| NotebookLM | 情報整理特化（中）| 低: ドキュメント蓄積のみ | 低 | 低 | 無（FACT）| Google Workspace 連携 | 無料 / Google One AI（FACT）|
| Notion AI | ナレッジ管理（低）| 低: ページ内 AI | 低 | 低 | 無（FACT）| Notion 内 | $10/member（FACT）|

ポーターの 3 基本戦略判定: ConsultingOS は「集中差別化」に分類（マーケ + コンサル業界に集中し、業界特化知見と反証物理化で差別化）。Stuck in the middle リスク: 業界を広げすぎると汎用 AI と区別不能になる（ハードルール トレードオフ）。

---

## 3. ConsultingOS 差別化 5 軸 v4

軸 1 業界特化（マーケ + 金融 + 製造）: マーケ部門 7 agent（marketing-director / performance-marketer / seo-specialist / marketing-analyst / social-media-strategist / market-researcher / pr-communications）は水野氏のジーニー領域（アドテク / CRM / SFA）と直接ドメイン重複。これは汎用プラットフォームが持てない Activity Map の結節点（INFERENCE）。

軸 2 個人カスタマイズ: 27 agent に個人名・知見・意思決定スタイルを蓄積する設計は、エンタープライズ向け Copilot Studio / Agentforce にはないポジション。水野氏への訴求点は「あなたのコンサル知見が乗る OS」（INFERENCE）。

軸 3 評判資本起点（マスク式原則 2 物理化）: consulting-playbook.md §マスク式 4 原則に明示されている通り、「現金 = 遅行指標 / 評判・知識・実証 ROI = 真の資産」という設計思想は競合 7 社いずれも採用していない（FACT: 公開情報に該当記述なし）。水野氏の「個人を信じての 1000 万」はこの思想と整合する。

軸 4 反証チェック物理化: Step 1-4 が全出力末尾に必須付与される設計は、コンサル業界の AI ツールとして独自性が高い（INFERENCE: 競合 7 社の公開資料に同等機能の記述なし）。

軸 5 OEM 提供: N&Y Craft 関根さん案件（2026-05-09 提案）が受注成功した場合、OEM 実証 1 件目として機能する。受注前の現時点では「実証中」（FACT）。

---

## 4. Sierra 侵食リスク評価（INFERENCE）

クリステンセン判定: Sierra はカスタマーサポート特化でローエンドから参入した破壊的イノベーター候補（INFERENCE）。現在の侵食ベクトルは CX フロー特化から「コンサル業務支援」への拡張には向いていない可能性が高い。ただし Sierra が「マーケ業務支援」領域へ機能拡張した場合、ConsultingOS の SAM と部分重複するリスクが存在する（INFERENCE）。発生確率: 低-中（2 年以内には主流市場侵食に至らない可能性大、INFERENCE）。

Activity Map の模倣困難性: ConsultingOS の強みは agent 間連携 + 個人知見蓄積 + 反証物理化の組み合わせであり、Sierra の CX 特化技術スタックからは再現コストが高い（INFERENCE）。ただし資金調達後の Sierra が M&A で対抗した場合は別途評価が必要。

リスクスコア: 2/5（現時点、INFERENCE）。トレードオフ: Sierra が侵食してくる頃には ConsultingOS は 5 年蓄積フェーズに入っている想定で、業界精通ルールを早期実装することが侵食への最善の防御となる。

---

## 5. Anthropic 依存リスク評価 + マルチプロバイダー戦略

現状リスク（FACT + INFERENCE）: ConsultingOS は Claude claude-sonnet-4-6 をベースとした実装。Anthropic の価格改定・モデル廃止・API ポリシー変更が直接 PL に影響する構造的依存がある。

マルチプロバイダー戦略（INFERENCE）:
- 短期: Anthropic 一択でも agent 設計を LLM 非依存にしておく（プロンプト・ロジック分離）
- 中期: OpenAI GPT / Google Gemini を差し替え可能な抽象化レイヤー実装
- 長期: マルチモデル routing（コスト・性能・レイテンシで自動切替）

水野氏への開示義務: 1000 万出資の判断材料として Anthropic 依存リスクを明示する必要がある。隠蔽は Unkind Truth 原則違反（マスク式原則 3）。

---

## 6. ジーニー業界ネットワーク経由案件機会評価（水野氏接続性、INFERENCE）

ジーニー（Geniee）は東証プライム上場のアドテク企業（FACT: 公開情報）。同社の事業領域はアドプラットフォーム / CRM / SFA / MA に及ぶ（FACT: 公式 IR）。

水野氏退任後ネットワーク活用の案件機会（INFERENCE）:
- アドテク業界の中小エージェンシー（マーケ部門 7 agent の直接ターゲット層）
- SaaS / MA ツール乗り換え検討中のマーケ担当者層（OEM 経由で接触可能）
- ジーニー元同僚・取引先コミュニティ（水野氏の評判資本が直接機能する接点）

期待シナリオ（SPECULATION）: 水野氏が退任後に 3-5 社のマーケ案件を ConsultingOS 経由で紹介した場合、年間 ARR 100-300 万円規模になる可能性がある。これは N&Y Craft 受注と合わせた「実証 2 件目」として機能しうる。

---

## 反証チェック結果

- Step 1 自己反証: 競合マトリクスの「個人カスタマイズ」軸について、HubSpot AI や Notion AI が提供するカスタマイズ機能を ConsultingOS と比較した場合、機能差の根拠が薄い可能性がある。各社の詳細機能仕様を確認していない（WebSearch 未実行）。本分析は公開情報 + 推定ベースの INFERENCE として扱う必要がある。
- Step 2 構造反証: Sierra 侵食リスクを「低-中」と評価したが、Sierra の資金調達規模・機能拡張ロードマップは非公開であり、過小評価のリスクがある。クリステンセン判定の「ベクトルが CX 特化から外れる」根拠は公開情報のみで確認しており、INFERENCE の信頼度は中程度。
- Step 3 実用反証: 競合各社の価格帯は HubSpot / Marketo / Microsoft Copilot Studio については公式 pricing ページから確認可能な FACT、Sierra と Salesforce Agentforce の詳細価格は非公開のため INFERENCE ラベルで記載済。WebSearch を実行すれば一部 INFERENCE を FACT に格上げできるが、本分析はハンドオフ参照資料 + 公開知識の範囲で完結させている。
- Step 4 残存リスク即潰し: 最大の残存リスクは「ConsultingOS が『集中差別化』に成功している」という前提が INFERENCE であること。「マーケ + 金融 + 製造」の 3 業界を同時にカバーする場合、ポーターの Stuck in the middle に陥るリスクが構造的に存在する。即潰しの方向性: 水野氏への提案では「まずマーケ業界単一に集中、金融・製造は Phase 2」と明示することで、Stuck in the middle リスクを構造的に除去することを推奨する。

> 出典: competitive-analyst agent 並列起動 2026-05-08 16:25 UTC、handoff-mizuno-funding-v4.md（PR #128 BN）+ consulting-playbook.md Sierra 比較 PR #125-127 統合 + 各社公式 pricing ページ + IR 資料。
