# strategy-lead v4 戦略判定（2026-05-08 セッション）

> ConsultingOS 引き継ぎドキュメント。水野氏 1000 万円エンジェル出資 v4 全面書き直しの strategy-lead 完了判定（残 4 agent はレート制限再起動中、結果待ち）。

---

## 1. 旧軸 A 削除根拠 + 削除対象リスト

旧軸 A（投資助言業 / 金商法 28 条）削除根拠（FACT 3 点）

- 水野氏 = ジーニー CX 事業統括本部 CAO（マーケ / アドテク / SaaS）。銀行 / 投資助言ドメイン非該当
- 1000 万 = 個人エンジェル出資、OEM 開発投資ではない
- 関根さん N&Y Craft 案件 = マーケ系 OEM、金融助言業と直交

横断削除対象（既存 7 ファイル + HTML 4 形式）

- `00-business-plan-master.md`: 軸 A 章節全削除 / Plan A・B 二層化破棄 / 銀行審査部 3 共通点削除
- `01-pitch-case-a.slides.md` + `case-a.html`: 投資助言業フレーム全削除 → 廃止 or マーケ × AI Agent 軸へ流用
- `04-mtg-playbook.md`: Q5「投資助言業不認可リスク」削除、Anthropic 依存 + Sierra 侵食リスクへ差し替え
- `demo-consultingos-financial.html`: 金融エージェント特化を マーケ Agent demo へ全面差し替え
- `05-corrections-and-fact-check.md`: Pivot Markets / 三菱 UFJ / 銀行審査部 grep + 全削除（PR BM 残置確認）

## 2. Secret Thesis 再定義

採用案: 「マーケ業界 + AI Agent 統合 OS の間隙独占」

業界コンセンサス（賛同される定説）

- HubSpot / Marketo / Salesforce Agentforce = マーケツールに AI Agent を後付け（技術寄り、PMF は既存ツール文脈）
- Notion AI / NotebookLM = 汎用 AI Agent（マーケ業務ドメイン浅い）

Secret Thesis（業界が同意しない真実、1 文）

「マーケ部門の意思決定構造を 27 agent × 19 skill の OS として物理化できるのは、コンサル経験 × OEM 配布チャネル × Anthropic Opus 4.7 の 3 変数交点を持つ独立系プレイヤーだけであり、既存ベンダーは自社製品文脈の縛りで構造化できない」

10x 優位性: 既存マーケコンサル個人プレイの 10 倍生産性（27 agent 並列）+ ホワイトラベル OEM 配布で個社コンサル単発受注を破壊。
タイミング: マーケ × AI Agent 市場 = 黎明期（Agentforce GA 2024 / Sierra Series C 2024 / 国内 OEM 事例ほぼなし、INFERENCE）。

## 3. 4 思想統合 v4 アップデート

- 佐藤裕介: 3 変数交点 = 技術（Opus 4.7 + Agent SDK）× ユーザー（マーケ部門の AI 内製ニーズ）× 市場構造（Agentforce 国内浸透前の空白、INFERENCE）。アセット帰属診断 = ConsultingOS 知財はユーザー個人帰属、Anthropic 依存はモデル層のみ
- 小野寺: CPC/CPA 単一指標脱却 → マーケ 8 agent は LTV / NRR / 受注貢献額の 60/40（直接成果 60% / ストック資産 40%）
- Huang: 倒産 30 日前マインド = Agentforce 日本上陸 18 ヶ月以内（SPECULATION）が disruption 期限。1000 万は 18 ヶ月の RTO（Race to Occupy）資金として正当化
- 孫正義: 登りたい山 = マーケ × AI Agent 国内カテゴリトップ（5 年 ARR 10 億円規模、SPECULATION）。動くための計画 = Phase 0 即着手
- マスク式 4 原則: インセンティブ（水野氏 = 個人投資家、ConsultingOS 成功で評判 + リターン両取り）/ 評判資本主義（後述 §4）/ Unkind Truth（投資助言業フレームは誤り、即破棄）/ アルゴリズム（27 agent は削除可能か常時問う）

## 4. 評判資本主義 = 水野氏出資の本質

マスク式原則 2「現金より評判」の典型例。

FACT

- 水野氏 = 業界先輩 / よく飲む関係 / 個人を信じての 1000 万
- 出資判断軸 = ユーザー個人の評判資本（業界での信用 / 実行力）

INFERENCE

- ジーニー業界ネットワーク（アドテク / マーケ SaaS 国内主要プレイヤー）経由のマーケ系 OEM 案件紹介可能性、退任後個人投資家としてのリード生成期待

## 5. Phase 0-2 ロードマップ v4

- Phase 0（2026-05 〜 07、3 ヶ月）: N&Y Craft 関根さん OEM 第 1 案件着手（5/9 提案、FACT）+ ConsultingOS 27 agent / 19 skill 構造化完了 + 水野氏出資契約（普通株 or J-KISS、退任後 INFERENCE）
- Phase 1（2026-08 〜 2027-04、9 ヶ月）: マーケ系 OEM 案件 2-3 件展開（水野氏ネットワーク経由 INFERENCE、SPECULATION 1 件 ARR 800-1500 万）+ Sierra 比較ベンチ更新
- Phase 2（2027-05 〜 2028-04、12 ヶ月）: マーケ × AI Agent 国内カテゴリトップ集約（ARR 3-5 億 SPECULATION、Agentforce 国内本格上陸前の独占完了）

---

## 反証チェック結果

- Step 1 自己反証: Secret Thesis「3 変数交点を持つ独立系のみ独占可能」は楽観バイアス疑い → ジーニー / サイバーエージェント等大手が同型 OS を内製する反証可能性残存（INFERENCE）
- Step 2 構造反証: マーケ × AI Agent 市場黎明期判定は Sierra / Agentforce GA タイミングからの推論、国内浸透速度は SPECULATION
- Step 3 実用反証: ハンドオフ §2 FACT 7 項目 + §4 旧 → 新フレーム表に整合、旧軸 A 削除は構造的に正解
- Step 4 リスク即潰し: 残存リスク = ① 水野氏退任時期の遅延（出資 timing 不確定）/ ② Agentforce 日本上陸 18 ヶ月想定の SPECULATION 性 / ③ ジーニーネットワーク経由案件紹介の INFERENCE 性（口約束なし）/ ④ ConsultingOS 27 agent 内に大手内製を阻む構造的堀の脆弱性（Proprietary Tech ではなく Branding + Network Effects 寄り）

---

## 関連ファイル

- `/home/user/consulting-os/docs/handoff-mizuno-funding-v4.md`（前セッション orchestrator 引き継ぎ）
- `/home/user/consulting-os/.claude/skills/consulting-playbook.md`（4 思想 + マスク式 4 原則）
- `/home/user/consulting-os/.claude/skills/references/consulting-playbook-musk-incentive.md`（思考 2 原則）
- `/home/user/consulting-os/.claude/skills/references/consulting-playbook-musk-execution.md`（実行 2 原則）

---

## セッション状況

- 5 agent 並列起動のうち strategy-lead のみ完了（本ファイル内容）
- proposal-writer / kpi-analytics / competitive-analyst / legal-compliance-checker は API レート制限（"You've hit your limit · resets 4:20pm UTC"）で 16:25 UTC 時点で再起動
- 残 4 agent 結果到着後に strategy-lead 統合 → 00-business-plan-master-v4.md 作成 → case-a-v4.html 派生

> 出典: assistant + strategy-lead 並列起動 2026-05-08 16:00-16:30 UTC、handoff-mizuno-funding-v4.md（PR #128 BN）+ oem-packaging-mizuno.md 訂正版（PR #128 BM）+ ユーザー口頭確認（前セッション + 本セッション）を一次根拠とする。
