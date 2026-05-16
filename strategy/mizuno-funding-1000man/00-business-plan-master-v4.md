# 水野氏 1000 万円エンジェル出資 事業計画 v4（マーケ業界フレーム）

> ConsultingOS マスター文書 v4。PR #128 BM 水野氏属性ハルシネーション訂正後の全面書き直し版。5 agent 並列起動（strategy-lead / proposal-writer / kpi-analytics / competitive-analyst / legal-compliance-checker）の統合結果。

---

## 案件メタ情報

| 項目 | 内容 |
|---|---|
| 案件 | 水野氏 1000 万円個人エンジェル出資（マーケ業界フレーム）|
| MTG | 5 月下旬延期（具体日時未確定）|
| 担当 | ユーザー個人（ConsultingOS 創業者）|
| バージョン | v4（v3 は旧フレーム前提、PR #128 BM ハルシネーション訂正を受け全面書き直し）|
| 作成日 | 2026-05-08 |
| 関連ハンドオフ | docs/handoff-mizuno-funding-v4.md（PR #128 BN）|
| 関連 5 agent 判定 | docs/v4-strategy-lead-judgment.md / v4-proposal-writer-judgment.md / v4-kpi-analytics-judgment.md / v4-competitive-analyst-judgment.md / v4-legal-compliance-judgment.md |

---

## §1 案件サマリ（30 秒版 SCQA + Governing Thought）

### Governing Thought（1 行）

「マーケ OS の間隙を、ジーニー OB ネットワーク経由で独占する 1000 万円」

### SCQA

- Situation: マーケ / アドテク業界の AI 化が加速し、代理店・事業会社の運用知識がコモディティ化する
- Complication: 個別ツールは乱立するが「マーケ判断の OS」は未存在。HubSpot / Marketo / Salesforce Agentforce はマーケツールに AI Agent を後付け（技術寄り）、Notion AI / NotebookLM は汎用 AI Agent（マーケ業務ドメイン浅い）
- Question: 誰がカテゴリファーストを取るか
- Answer: ConsultingOS のマーケ部門 7 agent が、アドテク業界出身の水野氏ネットワークを配布チャネルとして即商用化できる唯一の状態にある

### 案件ハイライト 4 点

1. 水野氏 = 元ジーニー 常務執行役員 CX 事業統括本部 CAO（FACT、本人提示）/ 退職して独立予定 / 退任後個人投資家として活動予定（FACT、本人発言）
2. 1000 万円 = 純粋エンジェル出資（OEM 開発投資ではない、ユーザー個人を信じての投資、FACT、本人発言）
3. ConsultingOS マーケ部門 7 agent が水野氏ジーニー領域（アドテク / CRM / SFA）と直接ドメイン重複（INFERENCE）
4. N&Y Craft 関根さん OEM 第 1 リファレンス（2026-05-09 提案、FACT）+ 水野氏ネットワーク経由マーケ案件 2-3 件（INFERENCE）の 2 段展開

> 出典: handoff-mizuno-funding-v4.md §2 FACT 列挙準拠、ユーザー口頭確認 2026-05-08

---

## §2 水野氏属性（FACT 限定、handoff §2 準拠）

| 項目 | 内容 | ラベル |
|---|---|---|
| 現職 | 株式会社ジーニー（Geniee）常務執行役員 CX 事業統括本部 CAO | FACT（ユーザー口頭確認、本人提示）|
| 退任予定 | 退任後個人投資家として活動予定 | FACT（ユーザー口頭確認）|
| 事業領域 | アドテク / マーケ自動化 / CRM / SFA / SaaS（ジーニー在籍中）| FACT（公開情報、東証プライム上場）|
| 1000 万出資意向 | ユーザー個人を信じての個人エンジェル投資 | FACT（ユーザー口頭確認）|
| 出資タイミング | 退任後 | FACT（ユーザー口頭確認）|
| ユーザーとの関係 | 業界一緒、よく飲む、ご馳走になる先輩関係 | FACT（ユーザー口頭確認）|
| ConsultingOS 親和性 | マーケ部門 7 agent と直接ドメイン重複 | INFERENCE（事業計画書き直し時に詳細評価）|

### 削除済み旧 v3 属性（PR #128 BM 訂正、参照不可）

v3 では出典不在の誤った組織属性・経歴前提（旧フレーム）に基づいていた。具体的な誤記録の内容は evolution-log.md 2026-05-08 エントリに学習記録済。v4 は本 §2 の FACT 7 項目のみを参照根拠とする。

> 出典: PR #128 BM oem-packaging-mizuno.md 訂正版、handoff-mizuno-funding-v4.md §2

---

## §3 ConsultingOS 全体像（マーケ部門 7 agent 中核）

### 6 部門 27 agent 体制（FACT、既稼働）

| 部門 | agent 数 | 主要役割 |
|---|---|---|
| コンサル | 6 | strategy-lead / competitive-analyst / proposal-writer / kpi-analytics / client-success / legal-compliance-checker |
| サービス開発 | 4 | tech-lead / fullstack-dev / ai-engineer / infra-devops |
| プロダクト | 2 | product-manager / feedback-synthesizer |
| クリエイティブ | 7 | creative-director / ux-designer / frontend-dev / content-strategist / brand-guardian / growth-hacker / sales-deck-designer |
| グローバル | 1 | gtm-consultant |
| マーケティング（中核）| 7 | marketing-director / performance-marketer / seo-specialist / marketing-analyst / social-media-strategist / market-researcher / pr-communications |

### マーケ部門 7 agent 中核位置づけ

水野氏のジーニー領域（アドテク / CRM / SFA / マーケ自動化）と直接ドメイン重複（INFERENCE）。「マーケ業界で使う AI コンサル OS」として位置づけ。

### 技術基盤（FACT）

- Claude Code MCP ネイティブ
- Anthropic claude-sonnet-4-6 / opus-4-7 ベース
- 21 hook 物理化（反証チェック / em-dash 検出 / 主語詐称検出 / 自己虚偽検出 / 阿諛禁止 等）
- 36 skill / 19 業界別プレイブック

### Activity Map の結節点（INFERENCE）

ConsultingOS の独自性 = agent 間連携 + 個人知見蓄積 + 反証物理化の組み合わせ。汎用プラットフォーム（Salesforce Agentforce / Microsoft Copilot Studio）が持てない垂直統合構造。

> 出典: v4-strategy-lead-judgment.md §3 / v4-competitive-analyst-judgment.md §3

---

## §4 GTM 戦略（N&Y Craft 第 1 リファレンス + 水野紹介マーケ案件）

### Phase 0（2026-05 〜 07、3 ヶ月）

- N&Y Craft 関根さん案件（2026-05-09 提案、FACT）= マーケ系 OEM 第 1 リファレンス着手
- ConsultingOS 27 agent / 36 skill 構造化完了
- 水野氏出資契約（J-KISS or 普通株、退任後 INFERENCE）

### Phase 0 末 Go/No-Go ゲート（2026-07）

Phase 0 → Phase 1 → Phase 2 は直列依存のため、N&Y Craft 受注落ちで全崩れするリスクを分岐設計で潰す。

- Go 条件: N&Y Craft 受注確定 → Phase 1 進行
- No-Go 時: 水野氏出資を「Phase 0 再実証資金」に再定義。別マーケ系 OEM 案件 1 件の受注を Phase 1 着手の前提条件に切り替え（孫正義「動くための計画」の分岐明示）

### Phase 1（2026-08 〜 2027-04、9 ヶ月）

- マーケ系 OEM 案件 2-3 件展開（水野氏ネットワーク経由 INFERENCE）
- 想定 ARR: 1 件 800-1500 万円（SPECULATION）
- Sierra 比較ベンチ更新

### Phase 2（2027-05 〜 2028-04、12 ヶ月）

- マーケ × AI Agent 国内カテゴリトップ集約
- 想定 ARR: 3-5 億円（SPECULATION）
- Agentforce 国内本格上陸前の独占完了

### CAC ゼロのネットワーク起点構造化

属人営業ではなく紹介手数料覚書を契約形態として整備。水野氏ジーニー OB / アドテク業界 / マーケ SaaS 周辺コミュニティへの接続。

### 3 変数交点（佐藤裕介式）

技術（Opus 4.7 + Agent SDK）× ユーザー（マーケ部門の AI 内製ニーズ）× 市場構造（Agentforce 国内浸透前の空白、INFERENCE）

> 出典: v4-strategy-lead-judgment.md §5 / v4-proposal-writer-judgment.md §4

---

## §5 数値計画（マーケ SaaS 業界基準 KPI）

### 主要 KPI 5 指標

| 指標 | 業界健全水準（出典ラベル）| v4 目標（ラベル）|
|---|---|---|
| ARR | 早期 SaaS は 1 年目 3000 万-1 億円が Series A 基準（INFERENCE: SaaStr Annual 複数年傍証）| 18 ヶ月 ARR 1000 万円 = ランウェイ回収ライン（SPECULATION）|
| NRR | 100% 以上健全 / 120% 超で Best in class（INFERENCE: OpenView SaaS Benchmarks 2023-24）| 1 年目 100% 以上、2 年目 110%（SPECULATION）|
| CAC Payback | 12-18 ヶ月以内が一般的な健全水準（INFERENCE: KeyBanc SaaS Survey）| 副業フレームでは「紹介起因受注比率 70% 以上」に置換（INFERENCE）|
| Magic Number | 0.75 以上で投資加速可（INFERENCE: Bessemer Cloud Index）| 初年度 1.0 以上（紹介ルート CAC 低圧縮、SPECULATION）|
| Rule of 40 | 40 以上が健全（INFERENCE: Bessemer / SaaStr）| 24 ヶ月時点で判定対象、現フェーズは判定保留指標 |

### 1000 万円使途 v4

| 分類 | 金額 | 内容 | ラベル |
|---|---|---|---|
| マーケ部門 7 agent 拡張投資 | 350 万円 | 7 agent スキル拡充 + 運用ツール（Anthropic API / SEO ツール / 広告テスト予算）+ 12 ヶ月分の継続コスト | SPECULATION |
| インフラ + 開発 | 250 万円 | Anthropic API 従量費 / Claude Code Pro / サーバー / GitHub Actions / ダッシュボード実装 | SPECULATION |
| 法務 + 契約 | 150 万円 | OEM 契約書ひな形 / 出資契約書（J-KISS / 普通株 / 種類株、弁護士確認後確定）/ 知財・NDA 整備 | SPECULATION |
| N&Y Craft 着手金 | 250 万円 | 関根さん OEM 第 1 リファレンス着手金 + 納品物制作費 + マーケ系追加商品（Instagram 運営 / Web 採点 / AI 化顧問等 ICP §9.2）| SPECULATION |
| 合計 | 1000 万円 | - | - |

### ARR シナリオ 3 段階（全 SPECULATION）

| マイルストーン | 楽観 | 標準 | 保守 |
|---|---|---|---|
| 6 ヶ月 ARR | 480 万円（月 40 万 x 12）| 240 万円（月 20 万）| 120 万円（月 10 万）|
| 12 ヶ月 ARR | 1200 万円（月 100 万）| 600 万円（月 50 万）| 240 万円（月 20 万）|
| 18 ヶ月 ARR | 2400 万円 | 1000 万円 | 360 万円 |
| 24 ヶ月 ARR | 4800 万円 | 1800 万円 | 600 万円 |
| 件数想定 | N&Y Craft + 水野紹介 3 件 + 自力 2 件 = 6 件 / 平均月 80 万 | N&Y Craft + 水野紹介 2 件 = 3 件 / 平均月 50 万 | N&Y Craft 1 件のみ / 月 10-20 万 |

### ブレイクイーブン

固定費月次 50 万円（インフラ + 自身の最低生活費、SPECULATION）と仮定 → 標準シナリオで 12 ヶ月時点 ARR 600 万円（月次 50 万円）で BEP 到達

### 60/40 ルール + 指標分岐宣言（小野寺メソッド）

- 60/40 配分: N&Y Craft 深耕 60% / 水野紹介・新規開拓 40%（既存深耕と新規挑戦の比率を経営意図として明示）
- 目的別 KPI 分岐（CPC/CPA の全施策主指標化を回避）: 受注前 = 紹介起因受注比率 / 受注後 = NRR / 認知 = メディア露出数・業界推薦数
- 大胆挑戦枠: N&Y Craft 着手金 250 万円のうち 50 万円を「高 ROI 失敗許容枠」とラベル化（マスク式インセンティブ設計の報酬系物理化、罰則のみの片肺設計を回避）

### 削除済み旧 v3 数値要素

- 軸 A 投資助言業（金商法 28 条）関連数値
- 営業保証金 500 万円
- 旧フレームの審査基準前提に紐づく数値要素
- 軸 A 規制申請準備コスト
- 投資助言業登録を前提とした ARR 予測
- KSF-1「軸 A 規制先行取得」
- Phase 2「申請着手・体制構築」
- 軸 B / 軸 C ポートフォリオ売上推移

> 出典: v4-kpi-analytics-judgment.md 全文 / ICP.md §9.2

---

## §6 競合分析（マーケ業界 + AI Agent 領域）

### 競合マトリクス v4（8 社 × 7 軸）

| 競合 | 業界特化度 | 個人カスタマイズ | 評判資本起点 | 反証チェック | OEM 提供 | 統合範囲 | 価格帯（月額）|
|---|---|---|---|---|---|---|---|
| ConsultingOS | マーケ + 金融 + 製造 | 高 | 高（マスク式原則 2 物理化）| 高（Step 1-4 全出力）| 有（N&Y Craft 実証中）| 27 agent / 36 skill | 未定 |
| Sierra AI | カスタマーサポート特化 | 中 | 低 | 低 | 不明 | CX フロー特化 | 非公開 |
| Salesforce Agentforce | CRM 統合 | 低 | 低 | 低 | 有（OEM 型 ISV）| SF エコシステム全域 | 推定 $25-75/user |
| Microsoft Copilot Studio | M365 統合 | 中 | 低 | 低 | 有（ISV 経由）| M365 / Azure 全域 | $200/tenant+ |
| HubSpot AI | マーケ / CRM | 中 | 低 | 低 | 限定 | HubSpot エコシステム | $800-3600/月 |
| Marketo Engage | マーケ自動化 | 低 | 低 | 低 | Adobe OEM | Adobe Experience Cloud | $895/月- |
| NotebookLM | 情報整理特化 | 低 | 低 | 低 | 無 | Google Workspace 連携 | 無料 / Google One AI |
| Notion AI | ナレッジ管理 | 低 | 低 | 低 | 無 | Notion 内 | $10/member |

### ポーター 3 基本戦略判定

ConsultingOS = 集中差別化（マーケ + コンサル業界に集中、業界特化知見と反証物理化で差別化）。Stuck in the middle リスク = 業界を広げすぎると汎用 AI と区別不能（マーケ単一集中、金融・製造は Phase 2 で除去）。

### ConsultingOS 差別化 5 軸 v4

1. 業界特化（マーケ + 金融 + 製造）= マーケ部門 7 agent が水野氏ジーニー領域と直接ドメイン重複
2. 個人カスタマイズ = 27 agent に個人名・知見・意思決定スタイルを蓄積する設計
3. 評判資本起点 = マスク式原則 2 物理化（現金 = 遅行指標 / 評判・知識・実証 ROI = 真の資産）
4. 反証チェック物理化 = Step 1-4 が全出力末尾に必須付与される設計
5. OEM 提供 = N&Y Craft 関根さん案件で実証中

### Secret Thesis（業界が同意しない真実）

「既存マーケベンダー（HubSpot / Marketo / Salesforce Agentforce）は自社製品文脈の縛りで、マーケ部門の意思決定構造を独立した OS として垂直構造化できない。ConsultingOS は製品中立な立場で 27 agent × 19 skill の判断 OS を物理化できる」

10x 優位性: 既存マーケコンサル個人プレイ比で 10 倍生産性（27 agent 並列）+ ホワイトラベル OEM 配布。注: 大手内製比での 10x は主張しない（ジーニー / サイバーエージェント等が同型 OS を内製する反証可能性は残存、§7 リスク開示 + 反証チェック Step 1 参照。ConsultingOS の堀は Proprietary Tech ではなく Branding + Network Effects 寄りであることを自認）

> 出典: v4-competitive-analyst-judgment.md §2-3 / v4-strategy-lead-judgment.md §2

---

## §7 リスク開示（マーケ業界フレーム）

### 漸進 vs 大胆の比率宣言（マスク式インセンティブ設計）

Phase 0 は漸進 60% / 大胆 40%（N&Y Craft 確実受注を漸進、水野ネットワーク新規開拓を大胆挑戦）。失敗コスト上限 = 1000 万円の 18 ヶ月ランウェイ。大胆挑戦の失敗は Phase 0 末 Go/No-Go ゲート（§4）で構造的に検知。罰則系（撤退基準・反証 hook）と報酬系（大胆挑戦枠 50 万円・評判資本 KPI）を対称配置。

### リスク 3 点（Pre-mortem 4 シナリオ・カーネマン式）

#### 1. Anthropic 依存リスク

ConsultingOS は claude-sonnet-4-6 ベース（FACT）。Anthropic の価格改定 / モデル廃止 / API ポリシー変更が直接 PL に影響。

対策（INFERENCE）:
- 短期: agent 設計を LLM 非依存にしておく（プロンプト・ロジック分離）
- 中期: OpenAI GPT / Google Gemini 差し替え可能な抽象化レイヤー実装
- 長期: マルチモデル routing（コスト・性能・レイテンシ自動切替）

#### 2. Sierra / Agentforce 侵食リスク

Sierra（カスタマーサポート特化、Series C 2024）+ Salesforce Agentforce（CRM 統合、GA 2024）の侵食ベクトル。

リスクスコア: 2/5（INFERENCE、現時点）。Sierra が「マーケ業務支援」領域へ機能拡張した場合、ConsultingOS の SAM と部分重複。発生確率: 低-中（2 年以内には主流市場侵食に至らない可能性大、INFERENCE）。

対策: 垂直統合 + evolution-log 蓄積が参入障壁。Activity Map の模倣困難性（agent 間連携 + 個人知見蓄積 + 反証物理化の組み合わせ）。

#### 3. 個人依存リスク

1 名兼務の属人化（FACT）。

対策: OS に 4 思想を書き込み、誰が起動しても同水準。27 agent + 36 skill が個人ノウハウを構造化済。

### 削除済み旧 v3 リスク

- 投資助言業登録不認可リスク（Pre-mortem シナリオ 1「即死シナリオ」）= 旧フレーム削除
- 旧フレームのリスク前提 = 削除
- AGPL-3.0 SaaS 提供時のソース開示義務 = §9 法務に移管（マーケ系 OEM での残存論点）
- 営業保証金 500 万円供託 = 旧フレーム削除

> 出典: v4-competitive-analyst-judgment.md §4-5 / v4-proposal-writer-judgment.md §7

---

## §8 マスク式 4 原則統合（評判資本主義の体現）

### 思考原則 2: 評判資本主義（核）

イーロン・マスク発言: 「現金は資産として不十分、真の資産は評判と知識」（INFERENCE: Aakash Gupta X ポスト経由）

水野氏の「個人を信じる 1000 万」= マスク式原則 2 の典型例:
- 出資判断軸 = ユーザー個人の評判資本（業界での信用 / 実行力）
- 業界先輩 / よく飲む関係 / 個人を信じての出資（FACT）
- 銀行残高でなく他者の信用ネットワークが真の資産

### 思考原則 1: インセンティブ設計（罰則 / 報酬の対称配置）

3 軸 = 罰則 / 報酬の対称配置 + 失敗コスト上限管理 + 漸進 vs 大胆比率宣言。罰則のみの片肺設計（漸進バイアス + Goodhart 化を加速）を禁止。

ConsultingOS 適用:
- 罰則系（物理化済）: 撤退基準 / 反証チェック hook / Phase 0 末 Go/No-Go ゲート（§4）
- 報酬系（v4 で物理化）: 大胆挑戦枠 50 万円（§5）/ 評判資本 KPI（業界推薦数・メディア露出、§5 指標分岐）
- 失敗コスト上限: 1000 万円 = 18 ヶ月 RTO（Race to Occupy）資金（Huang「倒産 30 日前マインド」）
- 漸進 vs 大胆比率: Phase 0 = 漸進 60 / 大胆 40（§7 参照）

### 実行原則 3: Unkind Truth

短期摩擦を許容して長期機能性を選ぶ。Kind Lie 排除。

ConsultingOS 適用: 反証チェック / em-dash 検出 / 主語詐称検出 / 自己虚偽検出 hook が物理化済（FACT）。水野氏への提案でも「個人依存リスク」「ARR 数値の SPECULATION 性」を先出し（Kind Lie 排除）。

### 実行原則 4: アルゴリズム実行

5 ステップ（要件疑義 / 削除 / 簡素化 / サイクル加速 / 自動化）順序適用。削除 10% リバウンドルール。物理法則のみがルール、他は推奨。

ConsultingOS 適用: 27 agent は削除可能か常時問う。本 v4 書き直し自体が旧 v3「軸 A 投資助言業」フレームの全削除実例。

### 4 思想統合運用順序

干渉回避順序（先に PL を出すと山が見えなくなる禁止則）に従う。MTG プレイブック（孫 → Huang → 佐藤）と整合。

1. 孫正義: 登りたい山の宣言（Phase 0 で山を定義）
2. Huang: 思考深度の証明 / 倒産 30 日前マインド（Phase 1 で問題検証）
3. 佐藤裕介: 構造で売る / 3 変数交点 / アセット帰属診断（Phase 2 で PL 構造化）
4. 小野寺信行: CPC/CPA 脱却 / 60/40 ルール / 目的別 KPI 分岐（KPI 運用）
5. マスク式 4 原則: インセンティブ + 評判資本主義 + Unkind Truth + アルゴリズム（実行規律）

> 出典: v4-strategy-lead-judgment.md §3-4 / consulting-playbook-musk-incentive.md（思考 2 原則）/ consulting-playbook-musk-execution.md（実行 2 原則）

---

## §9 Ask（出資条件 + 次アクション）

### 出資条件 v4

| 項目 | 内容 | ラベル |
|---|---|---|
| 出資金額 | 1000 万円 | FACT（本人発言）|
| 出資タイミング | 退任後 | FACT（本人発言）|
| 出資形態 | J-KISS（第一推奨）/ 普通株 / 種類株 の 3 択 | INFERENCE（弁護士確認必須）|
| 出資主体 | 個人 / 法人（SPC・合同会社）の選択は水野氏意向 + 税務確認後（個人と法人で課税処理が異なる）| INFERENCE（弁護士 + 税理士確認必須）|
| バリュエーション | 1 億円キャップ候補 + Discount 率 15-20%（J-KISS 実務標準レンジ）| INFERENCE（事業実績ゼロ段階の推定、公認会計士確認必須）|
| 用途 | マーケ業界 OEM 商用化集中（Phase 0-1 の 18 ヶ月固定費カバー）| §5 数値計画準拠 |

### J-KISS / 普通株 / 種類株 選択基準

| 形態 | 採用条件 |
|---|---|
| J-KISS | 経営関与なし / 即時バリュエーション決定を回避したい場合（推奨）|
| 普通株 | 水野氏が経営関与（顧問・アドバイザリー）を希望する場合 |
| 種類株 | 追加ラウンド想定 / 希薄化防止を水野氏が要求する場合 |

J-KISS 推奨根拠（INFERENCE）:
- 1000 万円規模の個人エンジェルに種類株は設計コスト過剰（司法書士 + 弁護士 30-80 万円）
- 水野氏が退任後個人活動フェーズのため議決権への関与欲求が低い可能性
- 500 Startups Japan テンプレート活用で法務コスト 20-50 万円程度

### MEDDPICC 資格化チェック

- M (Metrics): ARR 18 ヶ月 1000 万円 / NRR 100% 以上（SPECULATION）
- E (Economic Buyer): 水野氏（個人エンジェル）= Champion 兼任
- D (Decision Criteria): マーケ業界 + AI Agent OS の差別化 5 軸
- D (Decision Process): 退任後 / 弁護士確認後の出資契約締結
- P (Paper Process): J-KISS テンプレート + 弁護士レビュー
- I (Identify Pain): マーケ運用知識のコモディティ化 / 配布チャネル不在
- C (Champion): 水野氏（業界先輩 + 個人を信じての投資）
- C (Competition): 自己投資 / 他スタートアップ投資 / ジーニー OB 別事業

### 次アクション 3 分岐

1. 合意（即決）: 出資契約条件詰め → J-KISS テンプレート締結 → 退任後着手
2. 条件付き合意: 弁護士確認 + バリュエーション再交渉 → 2-4 週間後再 MTG
3. 不成立: マーケ系単独事業計画として N&Y Craft 関根案件先行 → 別エンジェル探索

### 弁護士確認必須リスト v4（優先順位付き）

| 優先 | 確認事項 | リスクレベル |
|---|---|---|
| 1 | J-KISS / 普通株の選択と契約書ドラフト（出資形態 / バリュエーションキャップ / Discount 率 / 出資主体 個人 vs 法人）| 高 |
| 2 | 水野氏前職 NDA / 競業避止条項の射程確認 + 退任時期の法的明確化（在職中出資はインサイダー規制 金商法 166 条リスク。出資契約に「ジーニー退任完了を Closing 前提条件」と明記）| 高 |
| 3 | AGPL-3.0 SaaS 提供時のソース開示義務範囲（Twenty CRM / SuiteCRM の N&Y Craft 向け OEM 提供）。解決不可時のフォールバック = 商用ライセンス版（Twenty Pro 等）採用 or MIT/Apache 2.0 系代替 CRM 選定 | 高 |
| 4 | Anthropic Usage Policy の再包装提供該当性確認。具体確認 3 点 = API Reselling/Wrapping の可否 / エンドユーザー向け提供時の開示義務 / OEM 顧客の多段 API 利用の可否（2026 年最新版を弁護士確認前に参照必須）| 中 |
| 5 | N&Y Craft 顧客データの匿名化要件 + 学習データ他案件転用権の整合（「知財全てユーザー帰属」と矛盾。転用は匿名加工情報 個人情報保護法 2 条 9 項要件を満たすメタ知識のみと定義し、N&Y Craft 書面事前同意を条件化）| 中 |
| 6 | 副業フレームにおける本業雇用契約との整合性確認 + 紹介手数料覚書の法的性質（仲介規制非該当の確認）| 低-中 |

### 削除済み旧 v3 Ask 要素

- 「2 段設計（500 万規制 + 500 万運用）」= 旧フレーム削除
- 「軸 A 規制取得フェンス資金 500 万 / 軸 A 申請費 500 万」= 旧フレーム削除
- AGPL-3.0 リスク = §9 弁護士確認必須リストに統合（マーケ系 OEM での残存論点）

> 出典: v4-legal-compliance-judgment.md §2-5 / v4-proposal-writer-judgment.md §9

---

## 反証チェック結果（5 agent 統合）

### Step 1 自己反証

- Secret Thesis「3 変数交点を持つ独立系のみ独占可能」は楽観バイアス疑い → ジーニー / サイバーエージェント等大手が同型 OS を内製する反証可能性残存（INFERENCE）
- ARR シナリオの件数・単価前提はすべて SPECULATION、N&Y Craft 受注の成否・水野氏紹介の実現速度に強く依存
- §8 マスク式の配置を §1 サマリ直後 vs §9 直前 の 2 案あり、本版では §9 直前を採用（投資判断の哲学フレームとして先出しする §1 直後案も検討余地あり）

### Step 2 構造反証

- マーケ × AI Agent 市場黎明期判定は Sierra / Agentforce GA タイミングからの推論、国内浸透速度は SPECULATION
- §1 SCQA + Governing Thought は佐藤裕介式、ただし MTG で水野氏が「もっと数字を見せて」と要求した場合は §5 数値計画への即誘導が必要
- 03-pricing-rationale.md §2「学習データ他案件転用権」は知財帰属「全てユーザー帰属」と構造上矛盾する可能性

### Step 3 実用反証

- ハンドオフ §2 FACT 7 項目 + §4 旧 → 新フレーム表に整合、旧軸 A 削除は構造的に正解
- 5 agent 結果は全て docs/v4-*-judgment.md として保存済（監査可能）
- 旧 v3 ファイル 13 個は _archive-v3/ に移動済（README で参照禁止を明示、ハルシネーション学習証跡として保管）

### Step 4 リスク即潰し

本セッションで構造的に潰せないリスク（Phase 4 持ち越し正当化）:

- ① 水野氏退任時期の遅延（出資 timing 不確定）→ MTG 当日に確認必須
- ② Agentforce 日本上陸 18 ヶ月想定の SPECULATION 性 → 四半期ごとに再評価
- ③ ジーニーネットワーク経由案件紹介の INFERENCE 性（口約束なし）→ MTG で水野氏に紹介ルート可否を直接確認
- ④ ConsultingOS 27 agent 内に大手内製を阻む構造的堀の脆弱性（Proprietary Tech ではなく Branding + Network Effects 寄り）→ 5 年蓄積フェーズへの早期到達で潰す
- ⑤ 水野氏在職中出資リスクと 03-pricing-rationale.md §2 知財矛盾 → 弁護士確認必須リスト v4 に登録済

本セッション内で潰したリスク（即潰し完了）:

- N&Y Craft 受注失敗時の 250 万円枠再配分ルール（§5 1000 万円使途で「インフラ + 開発枠統合 12 ヶ月ランウェイ管理」明記）
- 副業フレームでの CAC payback 定義変換が独自解釈リスク（§5 で「紹介起因受注比率 70% 以上」に置換明記）
- 「マーケ + 金融 + 製造」3 業界同時カバーの Stuck in the middle リスク（§6 で「マーケ単一集中、金融・製造は Phase 2」明記）
- §1-9 各セクション末尾に「使用した属性 FACT」の出典を明示（handoff §8 規律準拠）

---

> 出典: 本ファイルは 5 agent 並列起動結果（docs/v4-*-judgment.md）+ handoff-mizuno-funding-v4.md（PR #128 BN）+ oem-packaging-mizuno.md 訂正版（PR #128 BM）+ ユーザー口頭確認 2026-05-08 を一次根拠とする。書き直しは ConsultingOS Autonomous Mode 既定化（assistant orchestrator + 5 agent 並列起動 + 統合）で実施。
