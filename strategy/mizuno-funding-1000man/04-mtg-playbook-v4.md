# MTG プレイブック v4: 水野氏 1000 万円エンジェル出資（マーケ業界フレーム）

> ConsultingOS MTG プレイブック v4。PR #128 BM 水野氏属性ハルシネーション訂正後の全面書き直し版。00-business-plan-master-v4.md + 5 agent 判定（docs/v4-*-judgment.md）と整合。

| 項目 | 内容 |
|---|---|
| 対象 | 水野氏（元ジーニー 常務執行役員 CX 事業統括本部 CAO、退職して独立予定、退任後個人投資家）|
| MTG | 5 月下旬延期（具体日時未確定）想定 60 分 |
| 形式 | タイムテーブル + Q&A 想定問答 + Fess Up Early 規律 |
| バージョン | v4（v3 は旧フレーム前提、PR #128 BM ハルシネーション訂正を受け全面書き直し）|

---

## 1. 60 分タイムテーブル

### 0-5 分 関係性温め（孫正義 山の宣言）

開口一番、1 文で山を開示する。「マーケ業界の意思決定構造を AI Agent の OS として物理化し、代理店・事業会社が大企業品質のマーケ判断を内製できる世界を作っています」と宣言し、会話の評価軸を先制して渡す。

トーン設定: 主語を「私たちは」ではなく「これが起きている世界は」に統一し、個人営業でなく市場変化の記述として話す。水野氏とは業界先輩 / よく飲む関係（FACT）のため、過度なフォーマルさは不要、対等な業界談義のトーンを基調とする。

### 5-15 分 Huang テスト 3 点（Go/No-Go ゲート）

3 点を水野氏と一緒に検証する形で問う。

- 問 1「マーケ運用知識は今後コモディティ化するか」答えを相手に言わせる
- 問 2「マーケ判断を AI Agent の OS として構造化する技術的障壁は今消えつつあるか」Claude Code 実演で即回答
- 問 3「マーケ × AI Agent 領域で既に規模化したプレイヤーがいるか」最大の審査ポイント（後述 Q3 と連動）

3 点全て水野氏が「なるほど」と言えない場合は佐藤裕介 3 変数交点に進まず、問 2-3 の深掘りに留まる。

### 15-30 分 佐藤裕介 3 変数交点 + 数値計画 + アセット帰属

3 変数が今この瞬間に重なっていることを 1 枚マトリクスで示す。1 つでも欠けると「良いプロダクトだが負ける」になる理由を対比表で。

- 技術変化: Claude Code MCP / Opus 4.7 / Agent SDK 化（FACT）
- ユーザー変化: マーケ部門の AI 内製ニーズ急上昇（INFERENCE）
- 市場構造変化: Agentforce 国内浸透前の空白（INFERENCE）

数値計画の開示シーケンス（00-business-plan-master-v4.md §5 準拠）:
- ARR シナリオ 楽観 / 標準 / 保守の 3 段階を見せる（全 SPECULATION、N&Y Craft 受注前の仮説と明記）
- 「実証前のため全て SPECULATION ラベル、N&Y Craft 受注後に実測値で更新する」と先制宣言（誇張数値を見せない、Unkind Truth 原則）
- アセット帰属診断: 顧客が OS を使い込むほど ConsultingOS の知識資産（evolution-log・スキル群）が蓄積される構造を説明

### 30-40 分 マスク式アルゴリズム削ぎ落とし + Ask

1000 万円の用途を 4 分類で提示（00-business-plan-master-v4.md §5）。「マーケ部門 7 agent 拡張投資 350 万 / インフラ + 開発 250 万 / 法務 + 契約 150 万 / N&Y Craft 着手金 250 万、これ以外は使わない」と宣言する。

Ask: 金額と条件を明示（J-KISS 推奨、バリュエーション 1 億円キャップ候補は要協議）。「これを合意するには何が必要か」を水野氏に問い返して MTG を一方通行にしない。

### 40-55 分 Q&A 想定問答

後述「2. 想定 Q&A 10 問」参照。

### 55-60 分 次回アクションの合意

3 パターンを想定し、いずれの場合も Next Action を相手から言わせる。出口は「合意 / 持ち帰り / 再協議条件の明示」の 3 択で水野氏に選ばせる。沈黙で終わらせない。

### MTG 前 弁護士依頼スケジュール（v4 必須、legal-compliance 判定準拠）

| 優先 | 依頼内容 | 担当 |
|---|---|---|
| 1 | J-KISS / 普通株の選択と契約書ドラフト（出資形態・バリュエーションキャップ）| legal-compliance-checker → 弁護士 |
| 2 | 水野氏前職 NDA / 競業避止条項の射程確認（ジーニー退任後の活動制約）| legal-compliance-checker → 弁護士 |
| 3 | AGPL-3.0 SaaS 提供時のソース開示義務範囲（Twenty CRM / SuiteCRM の N&Y Craft 向け OEM 提供）| legal-compliance-checker → 弁護士 |
| 4 | Anthropic Usage Policy の再包装提供該当性確認（ConsultingOS SaaS 化）| legal-compliance-checker → 弁護士 |

旧 v3 の「投資助言業登録の要否確認 / Cordys CRM ライセンス特定」は v4 で削除（マーケ業界フレームに前提転換）。

---

## 2. 想定 Q&A 10 問（v4、マーケ業界フレーム）

各回答は能動形 + FACT / INFERENCE / SPECULATION ラベル付き。

### Q1 OSS で配っているなら誰でも真似できるのでは

ConsultingOS のコードは公開可能な構造を持つが（FACT）、5 年間の一次情報蓄積（evolution-log・スキル群・顧客案件ログ）が差別化の本体であり、コードを取得した翌日に同等の判断品質を出すことはできない（INFERENCE）。佐藤裕介「5 年蓄積前提の業界精通」原則を適用。Activity Map 観点では CLAUDE.md / ICP.md / DESIGN.md / 反証ゲートが相互依存しており、1 ピース単独の模倣では機能しない構造（INFERENCE）。

### Q2 Anthropic 自身が同じものを作るのでは

Anthropic は LLM の研究・開発・API 提供が本業であり（FACT）、特定業種（マーケ）向けのドメイン特化 ConsultingOS を内製する動機は現時点で観測されていない（INFERENCE）。ConsultingOS は Claude Code という基盤の上にしか成立しない設計であり、Anthropic とはエコシステム拡張の関係（INFERENCE）。ただし Anthropic 依存リスクそのものは Q5 で正面から扱う。

### Q3 Sierra / Agentforce 等の競合があるのでは

主要プレイヤーは認識している（FACT）。競合マトリクス 8 社分析済（00-business-plan-master-v4.md §6）。Sierra はカスタマーサポート特化（FACT）、Salesforce Agentforce は CRM 統合（FACT）、Microsoft Copilot Studio は M365 汎用（FACT）。いずれも「自社製品文脈の縛り」でマーケ判断 OS を垂直構造化できない（INFERENCE）。ConsultingOS の差別化は 5 軸: 業界特化 / 個人カスタマイズ / 評判資本起点 / 反証チェック物理化 / OEM 提供。マーケ × AI Agent 領域で国内 OEM 事例はほぼ未観測（INFERENCE）。直接競合の継続調査は正直に開示（Fess Up Early 適用）。

### Q4 マーケ判断は人がやる仕事では

高度判断・最終責任・クライアント関係構築は今後も人が担う（INFERENCE）。ConsultingOS が置き換えるのは情報収集・型化・レポート生成・KPI 追跡であり、マーケ担当者の稼働時間の大部分を占める低付加価値作業の代替（INFERENCE）。水野氏のジーニー CX 事業統括経験から、マーケ運用の「定型作業 vs 判断作業」の比率は実感として共有できるはず。

### Q5 Anthropic 依存リスクは（旧 Q5「投資助言業」を差し替え）

正直、構造的リスクです（Unkind Truth 原則で先出し）。ConsultingOS は claude-sonnet-4-6 / opus-4-7 ベース（FACT）、Anthropic の価格改定・モデル廃止・API ポリシー変更が直接 PL に影響する。対策は 3 段階（INFERENCE）: 短期 = agent 設計を LLM 非依存に保つ（プロンプト・ロジック分離）/ 中期 = OpenAI GPT・Google Gemini を差し替え可能な抽象化レイヤー実装 / 長期 = マルチモデル routing。隠さず開示するのが投資判断の誠実な材料提供です。

### Q6 1 名兼務体制は属人化では

現状 1 名兼務であることは事実（FACT）。ConsultingOS の設計思想は「人ではなく構造が動く」であり（FACT）、CLAUDE.md・27 agent・36 skill・evolution-log を参照すれば別の担当者が同水準のアウトプットを出せる状態を目指している（INFERENCE）。1000 万円の用途には「2 名目の担当者オンボーディング」を含めない（Phase 2 以降）。代替案: 顧問契約 or 業務委託で 4 思想分散（水野氏の要求次第）。

### Q7 1000 万円使い切ったらどうする

1000 万円の設計は「Phase 0-1 の 18 ヶ月固定費カバー + N&Y Craft 受注 → 水野紹介 2-3 件受注の確実性を資金で買う」が目的（INFERENCE）。ARR シナリオ標準で 12 ヶ月時点 ARR 600 万円（月次 50 万円）でブレイクイーブン到達（SPECULATION、kpi-analytics 試算）。最小構成（フルリモート + 役員報酬最小）なら長期ランウェイ確保可能。撤退判断の数値基準は事前定義（標準シナリオ未達 2 ヶ月連続 = 固定費削減）。

### Q8 3 年後の出口戦略は

3 パターンを提示し水野氏に選ばせる。
(a) 有償 OEM ARR の自己増殖（ブートストラップ・推奨）
(b) マーケ系 SaaS / 広告代理店グループへの事業売却
(c) Phase 2 国内マーケ × AI Agent カテゴリトップ集約後の資金調達 or 上場（SPECULATION・現時点では蓋然性評価困難）
水野氏に「どのパターンが最もリターン設計と合致するか」を問い返し、一方的な宣言にしない。

### Q9 私が出資するメリットは何か（v4 更新）

3 点を能動的に提示。
(1) マーケ × AI Agent 市場の初期参入ポジション（INFERENCE）
(2) エンジェルとしての情報優位: マーケ業界 × AI Agent 化の一次情報が継続的に水野氏に流れる構造（FACT・ConsultingOS の顧客事例は出資者と共有する設計）
(3) 水野氏のジーニーネットワーク（アドテク / マーケ SaaS 業界）経由のマーケ系 OEM 案件紹介 = 水野氏の評判資本が ConsultingOS の GTM に直結する相互価値（INFERENCE、口約束ではなく紹介手数料覚書として契約形態化を提案）

### Q10 他にも出資検討者はいるのか

現在の検討状況を正直に開示する（Fess Up Early 規律）。実情を隠蔽せず、過剰な希少性演出はしない（pr-communications.md 隠蔽提案を反証モードで自動却下適用）。条件変更の可能性がある場合はその旨も明示する（FACT として開示できる範囲のみ）。

---

## 3. MTG 後の対外コミュニケーション設計（Dorsey Fess Up Early 規律）

### 合意成立時

当日または翌日に feature ブランチを切り、合意内容のサマリーを commit。main への Squash and merge 後に短文プレスリリース草稿を準備（配信は法務確認後）。合意後 48 時間以内を目安に note または X でソートリーダーシップ記事を配信し、信頼の蓄積に変換する（pr-communications.md アーンドメディア優先原則、マスク式評判資本主義原則 2 と整合）。

### 部分成立時（条件付き合意）

条件クリアまでの間、対外発信は封印。ただし「封印」は沈黙ではなく、note / X で業界論考・事例分析の寄稿を月 1 本ペースで継続する。信頼残高を積み上げながら条件充足を進める（INFERENCE）。

### 不成立時

短文で事実だけを開示する。過度な弁明・理由の詳細説明・攻撃的発言は禁止。evolution-log に「不成立 / 構造的失敗の理由」を記録。N&Y Craft 関根案件の受注実証が揃い次第、再協議を申し入れる布石として「実証 1 件目が揃い次第、改めてご報告します」と 1 文添える。

---

## 反証チェック結果

- Step 1 自己反証: 孫 → Huang → 佐藤 → マスク式の順序に必然性があるか。水野氏とは「よく飲む先輩関係」（FACT）のため、フォーマルな 4 思想展開が逆に距離を作るリスク（反証成立）。対策: タイムテーブルは骨格として保持しつつ、実際は業界談義の自然な流れに乗せ、4 思想は「水野氏の質問に答える形」で散りばめる。
- Step 2 構造反証: Q&A の Fess Up Early 適用が「過剰開示」になるリスク。特に Q5 Anthropic 依存リスクの先出しが投資意欲を損なう可能性（反証成立）。対策: 開示と同時に必ず 3 段階の対策をセットで提示、「リスクを認識し対策済」の構図にする。
- Step 3 実用反証: 本プレイブックは 04-mtg-playbook.md（旧 v3、162 行）を 5 agent 判定（docs/v4-*-judgment.md）+ 00-business-plan-master-v4.md と整合させて書き直し。MTG 日付は「5 月下旬延期」で確定情報なし、当日確定後にタイムテーブルの時間配分を再調整。
- 残存リスク: ① 水野氏の退任時期が未確定で出資タイミングがずれる可能性 → MTG 冒頭で確認／ ② Q9(3) ジーニーネットワーク経由案件紹介は INFERENCE（口約束なし）、MTG で紹介ルート可否を直接確認し紹介手数料覚書の合意可否を打診／ ③ §8 マスク式の MTG 内での提示順序（00-business-plan-master-v4.md §8 が §9 直前配置）、対話の流れ次第で前倒し判断が必要／ ④ HTML pitch v4 が未派生のため MTG 当日の視覚資料が 00-business-plan-master-v4.md（テキスト）のみ、次セッションで case-a-v4.html 等の派生が必要

---

## 参照ファイル

- /home/user/consulting-os/strategy/mizuno-funding-1000man/00-business-plan-master-v4.md
- /home/user/consulting-os/docs/v4-strategy-lead-judgment.md
- /home/user/consulting-os/docs/v4-proposal-writer-judgment.md
- /home/user/consulting-os/docs/v4-kpi-analytics-judgment.md
- /home/user/consulting-os/docs/v4-competitive-analyst-judgment.md
- /home/user/consulting-os/docs/v4-legal-compliance-judgment.md
- /home/user/consulting-os/docs/handoff-mizuno-funding-v4.md
- /home/user/consulting-os/.claude/skills/consulting-playbook.md

> 出典: 本ファイルは 04-mtg-playbook.md（旧 v3）+ 5 agent 並列起動結果（docs/v4-*-judgment.md）+ 00-business-plan-master-v4.md + handoff-mizuno-funding-v4.md（PR #128 BN）を一次根拠とする。
