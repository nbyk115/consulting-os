# Handoff: 水野氏 1000 万円エンジェル出資案件 v4 書き直し（2026-05-08 セッション → 次セッション）

> ConsultingOS 引き継ぎドキュメント。本セッション 2026-05-08 で発覚した「水野氏属性ハルシネーション」を起点に、既存事業計画 7 ファイル + HTML pitch 4 形式の全面書き直しを次セッションで実施するための引き継ぎ。

---

## 1. セッション概要

| 項目 | 内容 |
|---|---|
| 日付 | 2026-05-08 |
| 主要発見 | 水野氏属性ハルシネーション + 既存事業計画の前提誤り疑い |
| 担当 | assistant orchestrator（agent 起動 4 件 + strategy-lead 統合 + 直接 Edit）|
| 関連 PR | PR #122-128 マージ済 / PR BM 訂正実装済（コミット `e6c7ae4`）|
| 次セッション着手 | 水野さん案件 branch（`claude/mizuno-funding-pitch-KheGN` ベース）で全面書き直し |

---

## 2. 水野さんの正しい属性（FACT 確認済 2026-05-08）

| 項目 | 内容 | ラベル |
|---|---|---|
| 現職 | 株式会社ジーニー（Geniee）役員 | FACT（ユーザー口頭確認）|
| 退任予定 | 退任後個人投資家として活動予定 | FACT（ユーザー口頭確認）|
| 事業領域 | アドテク / マーケ自動化 / CRM / SFA / SaaS（ジーニー在籍中）| FACT（公開情報、東証プライム上場）|
| 1000 万出資意向 | ユーザー個人を信じての個人エンジェル投資 | FACT（ユーザー口頭確認）|
| 出資タイミング | 退任後 | FACT（ユーザー口頭確認）|
| ユーザーとの関係 | 業界一緒、よく飲む、ご馳走になる先輩関係 | FACT（ユーザー口頭確認）|
| ConsultingOS 親和性 | マーケ部門 7 agent と直接ドメイン重複 | INFERENCE（事業計画書き直し時に詳細評価）|

---

## 3. 既存資産（前提誤り疑い、書き直し対象）

### 場所

`claude/mizuno-funding-pitch-KheGN` branch（commit `a6c1887`、最新）の `strategy/mizuno-funding-1000man/` 配下:

| ファイル | 内容 | 前提（誤り疑い）|
|---|---|---|
| 00-business-plan-master.md | 398 行マスター文書 | 銀行審査部 3 共通点 / 軸 A 投資助言業（金商法 28 条）/ 中堅企業 M&A |
| 01-pitch-case-a.slides.md | Case A pitch slide | 同上 |
| 02-pitch-case-b.slides.md | Case B pitch slide | 同上 |
| 03-pitch-case-c.md | Case C | 同上 |
| 04-mtg-playbook.md | 60 分 MTG プレイブック | Q5「投資助言業登録の不認可リスク」等 |
| 05-corrections-and-fact-check.md | 事実検証ログ | 同上 |
| case-a.html / b / c | HTML pitch 4 形式 | 同上 |
| demo-consultingos-financial.html | デモ画面 | 金融エージェント特化 |

### 前提誤りの根拠

`oem-packaging-mizuno.md` 初版（2026-05-06）で水野氏を「Pivot Markets / 三菱 UFJ 系（INFERENCE）」と記載 → これがハルシネーション → 既存事業計画もこの誤前提の延長で「銀行審査部出身 / 投資助言業」フレームに誘導された可能性大。

---

## 4. 書き直し方針: A 全面書き直し推奨

### 旧フレーム → 新フレーム

| 旧（誤前提）| 新（FACT ベース）|
|---|---|
| 銀行審査部 3 共通点（野村幸司氏知見）| SaaS / マーケ業界の投資判断軸（PMF / ARR / NRR / CAC payback）|
| 軸 A 投資助言業（金商法 28 条）| マーケ / AI エージェント領域の事業計画 |
| 中堅企業 M&A 案件 | アドテク / マーケ SaaS / AI Agent 統合 |
| 投資助言業の不認可リスク | Anthropic 依存リスク + Sierra / Salesforce Agentforce 侵食リスク |
| 関根さん OEM + 投資助言業 | 関根さん N&Y Craft（マーケ系 OEM）+ 業界ネットワーク経由マーケ案件 |

### 残す要素（FACT として有効）

- ConsultingOS 27 agent / 36 skill / 21 hook の構造
- マスク式 4 原則統合（PR #125 + #127）
- 関根さん N&Y Craft 案件（OEM 第 1 リファレンス、明日 2026-05-09 提案）
- 4 思想統合（孫正義 / Huang / 佐藤裕介 / Dorsey / マスク 4 原則）
- 反証チェック Step 1-4 物理化
- Sierra 比較分析（PR #125-127 統合）

### 必須記載（事業計画 v4 で追加）

- ジーニー → 退任後個人投資家への移行を踏まえた水野さん文脈
- マーケ部門 7 agent の中核位置づけ（performance-marketer / seo-specialist / marketing-analyst / social-media-strategist / market-researcher / pr-communications / marketing-director）
- N&Y Craft 関根さん案件と業界ネットワークの接続性
- 水野さんが「個人を信じる 1000 万」を投じる事業計画ロジック（マスク式評判資本主義の体現）

---

## 5. Agent 起動戦略（次セッション）

5 並列起動推奨:

| Agent | 役割 |
|---|---|
| proposal-writer | 00-business-plan-master-v4.md 構造設計 + 全体統合 |
| strategy-lead | 軸 A → 新軸への転換、4 思想統合更新、Secret Thesis 再定義 |
| kpi-analytics | 数値計画 v4（マーケ業界基準の ARR / NRR / CAC payback）|
| competitive-analyst | 競合分析 v4（Sierra / Agentforce / NotebookLM / Notion AI 等のマーケ視点更新）|
| legal-compliance-checker | 出資契約形態（投資助言業から外れる場合の条項見直し）|

統合: strategy-lead で全 agent 出力を統合 → 00-business-plan-master-v4.md → case-a-v4.html 等を派生

### Agent プロンプト草案（proposal-writer 起点）

```
水野氏 1000 万円エンジェル出資 事業計画 v4 書き直し。前提変更:
- 旧前提（誤り）: 銀行審査部出身 / 投資助言業 / 中堅 M&A
- 新前提（FACT）: ジーニー（Geniee）役員 → 退任後個人投資家、マーケ / アドテク業界、ユーザー個人を信じての出資

既存資産（書き直し対象）:
- strategy/mizuno-funding-1000man/00-business-plan-master.md（398 行）
- 同 04-mtg-playbook.md（想定 Q&A 10 問）
- 同 case-a.html / b.html / c.html（HTML pitch 4 形式）

求める出力:
- 00-business-plan-master-v4.md（マーケ業界フレーム）
- 軸 A 投資助言業を削除、マーケ / AI Agent 統合軸を新設
- 想定 Q&A 10 問を SaaS / マーケ視点で更新
- 関根さん N&Y Craft 案件との整合（マーケ系 OEM）
- マスク式 4 原則統合（PR #125 + #127、references/consulting-playbook-musk-incentive.md + musk-execution.md 参照）

出力 800 字以内 + 反証チェック Step 1-4 圧縮版
```

---

## 6. 残作業 TODO

### 即時（次セッション開始時）

- [ ] `claude/mizuno-funding-pitch-KheGN` branch を fetch + checkout（現状 main からの差分大）
- [ ] 5 agent 並列起動 → strategy-lead 統合
- [ ] 00-business-plan-master-v4.md 作成
- [ ] case-a-v4.html 派生
- [ ] 04-mtg-playbook-v4.md 想定 Q&A 更新

### 中期（v4 完成後）

- [ ] HTML pitch 4 形式（case-a-v4 / b-v4 / c-v4 / index-v4）派生
- [ ] PDF / PNG export
- [ ] 水野さんへの再提案準備（既存 v3 archive → v4 提示）

### 関連ハルシネーション残存確認

- [ ] `claude/mizuno-funding-pitch-KheGN` branch 内の全ファイルで「Pivot Markets」「三菱 UFJ」「銀行審査部」grep + 確認
- [ ] 同 branch 内の HTML pitch 4 形式で同型ハルシネーション残存有無確認 + 一括訂正
- [ ] `evolution-log.md` 2026-05-08 ハルシネーション学習エントリは更新済（PR BM）、追加事例があれば追記

---

## 7. 関根さん明日提案との関係

| 項目 | 状態 |
|---|---|
| 明日 2026-05-09 | N.Y.CRAFT 関根さん OEM 第 1 リファレンス案件 提案 |
| 既存資産 | strategy/n-y-craft-oem-case/ 配下 5 ドキュメント完成済 |
| 補強資料 | strategy/n-y-craft-oem-case/05-meeting-supplement.md（PR #128）|
| 水野さん案件との統合論点 | N&Y Craft 受注 → ARR 実証 1 件目 → 水野さん事業計画の根拠強化 |

優先順序
1. 明日（5/9）: 関根さん提案 → 受注 / 持ち帰り判断
2. 5/10 以降: 水野さん事業計画 v4 着手
3. 関根さん受注成功時: 水野さん事業計画に「実証 1 件目 ARR XX 万円」として組み込む

---

## 8. ハルシネーション学習（同型リスク回避）

### 本セッションで発覚したパターン

1. INFERENCE ラベル付与でも誤情報そのものは残存する（ラベルは検証ゲートでない）
2. 人物 / 組織属性は FACT 化前に記載すべきでない
3. 反証チェック Step 1 自己反証で「人物属性の妥当性」を問うていなかった

### 次セッションで遵守すべき規律

- 水野さん属性は本ハンドオフ §2 の FACT 列挙のみ参照
- 推測（INFERENCE / SPECULATION）は記載前にユーザー口頭確認必須
- 事業計画書き直し時、各セクション末尾に「使用した属性 FACT」の出典を明示
- ジーニー在籍中の経歴 / 退任後の活動詳細はユーザー追加確認後のみ記載

### 関連 evolution-log エントリ

- `evolution-log.md` 「2026-05-08: 水野氏属性ハルシネーション事象」（PR BM 物理化済）

---

## 9. 次セッション開始時のチェックリスト

```bash
# 1. branch 切り替え
git fetch origin claude/mizuno-funding-pitch-KheGN
git checkout claude/mizuno-funding-pitch-KheGN
git rebase origin/main

# 2. 既存資産の状態確認
ls strategy/mizuno-funding-1000man/

# 3. ハルシネーション残存確認
grep -rn "Pivot Markets\|三菱 UFJ\|銀行審査部" strategy/mizuno-funding-1000man/

# 4. ハンドオフ参照
cat docs/handoff-mizuno-funding-v4.md  # 本ファイル

# 5. 5 agent 並列起動（assistant orchestrator）
# proposal-writer / strategy-lead / kpi-analytics / competitive-analyst / legal-compliance-checker

# 6. 統合 → 00-business-plan-master-v4.md 作成

# 7. 反証チェック Step 1-4 + brand-guardian 検証

# 8. PR 起票（feat(mizuno): 事業計画 v4 書き直し）
```

---

## 10. 反証チェック（Step 1-4 圧縮）

- Step 1 自己反証: ハンドオフは assistant 単独作成、agent 起動なし。次セッションでの実装は agent 主導必須（規律違反防止）
- Step 2 構造反証: 既存資産の前提誤りは「Pivot Markets / 三菱 UFJ ハルシネーション」と整合する FACT、書き直しは構造的に正解
- Step 3 実用реальное: 既存 7 ファイル + HTML 4 形式は git show で実機確認 + 出力本文添付済（前ターン Bash 出力）
- Step 4 リスク即潰し: 本セッション内で書き直しは時間的に不可能（明日関根さん提案優先）+ ハルシネーション残存確認は次セッション着手、構造的に本セッション完結不可能（例外規定該当）

---

## 11. v4 投資テーゼ補強: Anthropic 垂直 OS 戦略 + 金融 vertical AI-OS（2026-05-14 追加）

### 11.1 投資テーゼ核心

「Anthropic は Legal (2026-05-12) → Small Business (2026-05-13) と vertical AI-OS を順次制圧中。次は金融 / 医療 / 製薬予測。この trend に乗る vertical AI-OS 早期参入者が次世代の defensible business」

ConsultingOS = 「日本 B2B コンサル vertical AI-OS」= Anthropic 公式 vertical （Legal / Small Business）と非競合の機会窓。

### 11.2 水野さんに刺さる 3 ポイント

1. ジーニー卒業生視点: ad-tech SaaS = 「AI に選ばれない SaaS」リスクの内側を知る個人投資家として希少。SaaS 死テーゼ（Anthropic Claude for Small Business が QuickBooks / Stripe / HubSpot を MCP 統合）を内側から理解
2. 1000 万投資 justification: コンサル事業投資でなく「AI-OS verticalization trend への early bet」= ConsultingOS が日本 B2B コンサル vertical AI-OS の早期参入者
3. 横展開機会: 金融 vertical AI-OS（地銀 / 信金 / 個人投資家向け Bloomberg + 銀行 API 連携）への投資パイプライン構築、水野さん個人投資家ネットワーク活用

### 11.3 v4 事業計画への組み込みポイント

- 「投資テーゼ」セクションに Anthropic vertical 制圧プレイブック + Finatext 4 層構造（エージェント / コンテキスト / ビジネスロジック / データ）を反映
- 「競合分析」セクションに「SaaS 死テーゼ」+「AI に選ばれない SaaS」リスク追加
- 「中期戦略」に「金融 vertical AI-OS 横展開」候補追加（水野さん個人投資家ネットワーク活用）
- 「ConsultingOS 戦略位置」セクション新設: エージェント入口（Sierra 型）から開始、コンテキスト + ビジネスロジック層を整備中、Anthropic 公式 vertical と非競合

### 11.4 Finatext 4 層 ConsultingOS マッピング

| 層 | ConsultingOS 該当 | v4 提示価値 |
|---|---|---|
| エージェント | 27 agent + assistant orchestrator | 「1 人で 10 人分」の物理化、水野さん 1000 万投資の ROI 担保 |
| コンテキスト | evolution-log + ICP + 規律 hook 21 種 | 競争優位の中核、模倣困難な moat |
| ビジネスロジック | 36 skill 体系 | OEM 展開で業界別 customization 可能 |
| データ | 顧客文脈 + 案件記録 | 関根さん / 水野さん案件で蓄積開始 |

### 11.5 詳細参照

`.claude/skills/references/consulting-playbook-anthropic-vertical-os.md`（PR 統合済）に Anthropic 垂直制圧プレイブック / SaaS 死テーゼ / Finatext 4 層 / Sierra vs Finatext 戦略分岐の詳細を物理化済。

### 11.6 Hidden Markov Model (HMM) quant 投資フレーム (watch list、2026-05-15 追加)

Stanford 大学公開 HMM 完全フレームワーク (web.stanford.edu/~jurafsky/slp3、INFERENCE: ユーザー提示テキスト経由) + Roan @RohOnChain 実装記事 (INFERENCE) = ヘッジファンド (Jane Street / Two Sigma) で使用される regime switching 投資フレームの公開実装。

水野さん向け適用候補 (watch list、本人実需確認後段階導入):
- 個人投資家として「Bull / Bear / Sideways」regime detection
- Transition Matrix で投資先 / portfolio の n-step ahead 確率予測
- Stationary distribution で long-run baseline 把握
- HMM (Baum-Welch + Viterbi) で観察不能な regime を return sequence から推論

ConsultingOS 整合:
- Anthropic CFO 指数関数思考 (PR #144): 多層指数関数 = HMM 複数 hidden state と同型構造
- Sierra ハーネスエンジニアリング (PR #145): 本番稼働技術蓄積 = HMM emission variable 選定 (returns + volatility + credit spreads + VIX 等) のドメイン知識
- PoC 地獄脱出 (PR #161) 戦略 4 自社 SaaS: HMM 自体を SaaS 化する候補

実装ハードル:
- Python + hmmlearn ライブラリ
- ヘッジファンド級データ取得 + 計算リソース (歴史データ 10 年以上推奨)
- Baum-Welch local minimum 問題 (multiple random initialization 必須)
- 水野さん本人の quant trading 実需確認必須 (Boris #3、個人投資家として regime detection 実需未確定)

統合判定: 本セッションでは watch list 登録のみ、水野さん v4 書き直し時に「投資テーゼ補強候補」として再評価。次セッションで:
1. 水野さん本人に「regime detection / quant モデル」興味確認
2. 興味あれば handoff 専用セクション化、新規 references skill 物理化
3. 興味なしなら本 §11.6 のまま保持 (情報資産として)

---

## §11.7 YC Top 8 AI Sectors 2025-2026 FACT 引用源 (2026-05-15 統合 PR #200)

> 出典: @aiedge_ チートシート + YC batch data + Communication Square 2025 (FACT、ユーザー画像)。水野さん v4 投資テーゼ補強の anchor、Anthropic 垂直 OS (PR #133) + Dario 3 段階 (PR #190) + Anthropic Economic Index (PR #188) と並列。

### 8 セクター + ConsultingOS 接続 (実測 FACT)

| # | AI セクター | 数値 FACT | ConsultingOS 接続 |
|---|---|---|---|
| 1 | Agents & Automation | Spring '25 batch の 50%+、70+ companies 18 sub-categories | 27 agent + 60+ skill 体系で直接整合 |
| 2 | Healthcare | LunaBill $764K ARR since July | 該当 vertical 未着手 |
| 3 | Software Dev | Emergent $50M ARR in 7 mo、5M+ users 190 countries | service-dev 4 agent、競合領域 |
| 4 | Fintech | 100 deals YTD '25、+65% YoY | Personal CFO PR #191 + 水野 v4 投資テーゼ直接整合 |
| 5 | Legal | LegalOS / Blueshoe leading | legal-compliance-checker + legal-playbook 整合 |
| 6 | Defence & Security | NATO partnerships early-stage | 規制リスク高、不適合 |
| 7 | Agent Infrastructure | $7.6B → $183B by 2033 (24x growth) | Hard Rule 17 + 21 hook + dream pass 整合 |
| 8 | Robotics | Smaller batch %、big $ checks | 関根さん N&Y Craft (中小製造) 隣接 |

### 投資判断 3 anchor (水野さん v4 ピッチデッキ FACT 引用)

1. **「Vertical-specific agents > horizontal tools」** = ConsultingOS 核心戦略を YC 公式裏付け
2. **「Pair with a regulated industry (legal/health/finance)」** = legal-compliance-checker + 水野さん投資テーゼ pair 戦略裏付け
3. **「Agent infra: 24x growth by 2033」** = 1000 万投資 ROI 算出の anchor 数値

### Building / Investing ガイド (FACT)

If you're building: Vertical-specific > horizontal / regulated industry pair / Infra layer biggest TAM
If you're investing: AI Fintech +65% YoY / Agent infra 24x by 2033 / Defence is new uncrowded bet

---

> 出典: 本ファイルは `evolution-log.md` 2026-05-08 + `oem-packaging-mizuno.md` 訂正後（PR BM）+ ユーザー口頭確認 2026-05-08 を一次根拠とする。§11 は Anthropic 公式発表（2026-05-12 / 05-13）+ Finatext IR + note.com/110_110_110 (Sierra vs Finatext 比較、INFERENCE) を追加根拠とする。書き直しは次セッションで agent 主導 + ConsultingOS 全体判断で実施。
