# ConsultingOS Evolution Log

> 規律違反・改善・構造変更の記録。形骸化防止のため「書く時のみ書く」（4週間更新ゼロなら archive 検討）。
> 必須項目: 日付 / 対象 / 変更 / 根拠 / 反証結果

---

## 再評価カレンダー

> SessionStart hook が期限到達時に自動通知。形式: `- YYYY-MM-DD: 再評価対象 / 判断軸`

### 即時 TODO（次回セッションで自動通知）

- 2026-05-03: 統合済 7 ブランチを GitHub UI から削除（feature/anthropic-boris-knowledge-integration / biz-expansion-knowledge / external-resources-references / implement-statusline-routing-gate-thinking / discipline-physical-block / os-visualization-mermaid / sdk-phase1-pr-review）。URL: https://github.com/nbyk115/consulting-os/branches

### 中期再評価

- 2026-08-02: brand-guidelines §5.5 単位整合性ルールの実効性検証（3 ヶ月後、違反再発有無の確認・水野さんピッチ単位錯誤事例対応）
- 2026-08-01: agentic-content 削除の妥当性 / AI Shopping 急変動向の影響を検証（6ヶ月後）
- 2026-08-01: Reply Guy / Comment-as-Strategy / 12-18ヶ月寿命前提のため陳腐化チェック（6ヶ月後）
- 2026-08-01: content-strategist への AIO/GEO 統合の専門深掘り低下リスク評価（6ヶ月後）
- 2026-08-01: gtm-consultant Post-Entry節（S5-S7）スコープ広すぎ問題 / global-ops 専任復活判断（6ヶ月後）
- 2026-08-01: GitHub PAT / SSH 鍵 90 日ローテーション運用が形骸化していないか確認（マネーフォワード事案学習）
- 2026-08-01: GitHub Secret Scanning / Dependabot / Audit Log 月次レビューの実施率確認
- 2026-11-01: claude-code-ops 以外の巨大スキル（creative-playbook 572行 / cybersecurity-playbook 516行）の精度低下シグナル確認（6ヶ月後）
- 2026-11-01: Product 部門 2名体制の構造的薄さ / 案件痛みの顕在化チェック（6ヶ月後）
- 2026-11-01: SeeCost / 複数 LLM プロバイダ（ChatGPT + Claude + Gemini 並走）統合管理の実需顕在化チェック（6 ヶ月後）
- 2026-11-01: automate-faceless-content / 動画運用案件（YouTube / TikTok / IG Shorts）顕在化次第、11 モジュール中の独自要素抽出判断（6 ヶ月後）
- 2027-05-01: 規制動向（EU AI Act / 米 FTC エージェント取引責任）大枠固まり予測 / OS 反映判断（1年後）
- 2026-11-01: n8n / 複数案件並行 + 月次定期業務（レビュー返信代行 / SEO 巡回 / 競合監視）顕在化チェック（公式 Claude Code コネクタ対応で取り込み準備済・最有力候補）
- 2026-11-01: Editframe（HTML/CSS → MP4）/ B2B デッキの動画版商品ライン拡張案件チェック、Hotice 後続案件で需要顕在化次第即取り込み
- 2026-11-01: Sarvesh Shrivastava 20 SEO Patterns / ローカル SEO・GBP 案件顕在化次第、Patterns 1-8（GBP 系）/ 9-13（Page-2 goldmine + GSC 実務）/ 14-16（被リンク + NAP + 4 段階意図分類）/ 17-20（エンティティ + コンテンツギャップ + 月次レポ）から該当パターンのみ部分採用判断（20 全件取り込みは過剰、main 既存 seo-specialist agent はテクニカル SEO 中心でローカル SEO operational depth 不足を確認済 2026-05-02）。出典: https://x.com/bloggersarvesh/status/2036068241936896421
- 2027-05-01: Scrapling / 法的リスク再評価（不正アクセス禁止法 3 条解釈 / 公開データ限定使用の許容範囲確定後・1 年後再判定）
- 2027-05-01: Camofox Browser / 法的リスク再評価（Scrapling と同タイミング、bot 偽装ツールの法解釈 1 年後再判定）
- 2026-06-04: Shipper.now 1 ヶ月実績確認 / `.claude/skills/app-design-patterns.md` §8.3 SPECULATION ラベル更新判断（公開 1 ヶ月後、ストア審査通過事例 / 独立検証データ / lock-in 事例の有無で FACT 化または非推奨化、よるのことば PoC 着手判断と連動）
- 2026-08-04: `.claude/skills/app-design-patterns.md` §8 + `.claude/agents/consulting/proposal-writer.md` S7 の IAP 手数料公式料金確認（3 ヶ月後、Apple Small Business Program / Google Play 手数料の 2026-Q3 時点規約変更チェック、INFERENCE → FACT 格上げ または再 INFERENCE 化）
- 2026-08-05: 本セッション 16 PR 連続実装（PR #42-#57）の累積成果を brand-guardian + tech-lead 並列起動で全体再検証（規律自己整合性 + hook 動作 + 数値統一 + 形骸化検出 + 削除エージェント言及残存ゼロ確認、3 ヶ月後の四半期レビュー）
- 2026-05-12: PR #57 観察期間 3 件期日チェック（R1 jsonl パス命名規則変化 / R2 settings.json deny false positive 累積件数 / H2 GitHub ブランチ 7 件削除確認、未削除なら TODO 自体を削除）

---

## 2026-05-05: Anthropic + Blackstone / H&F / Goldman Sachs $1.5B JV 戦略学習 + Dario Amodei 思考トラッカー新設

### トリガー

ユーザーから Fortune 記事 (https://fortune.com/2026/05/04/anthropic-claude-consulting-industry-joint-venture-blackstone-goldman-sachs/) と「Anthropic の狙いはコンサル業界そのもの。AI 導入テンプレートを各社にコピペ展開、McKinsey / Bain の仕事を完全に内製化、AI スタートアップ GTM が金融×コンサル両方を飲み込む」との指摘 + 「ダリオの思考も常に最新にしてね」を受領。並列起動 3 名 (competitive-analyst / strategy-lead / market-researcher) で脅威評価 + 戦略応答 + Dario 思考最新化を実施。

### 確定事実 (FACT, BusinessWire 2026-05-03)

Anthropic + Blackstone + Hellman & Friedman + Goldman Sachs が $1.5B 規模のエンタープライズ AI サービス会社設立を発表。Claude を PE ポートフォリオ企業群に直接展開する戦略を公式化。出典: https://www.businesswire.com/news/home/20260503427206/en/Anthropic-Partners-with-Blackstone-Hellman-Friedman-and-Goldman-Sachs-to-Launch-Enterprise-AI-Services-Firm

### 戦略判断 (両エージェント整合)

直接競合度 3/10 (Fortune 500 × 大型 JV vs ConsultingOS の SMB / 単独事業者 / 代理店 ICP は重ならない、INFERENCE)。ただし Enterprise 層 (月 30-100 万) の「汎用 AI 導入支援」名目案件は直撃対象、再定義必須。

推奨ポジション: サブセット化 50% 主軸 + 補完化 35% サブのハイブリッド。直接対決 5% 不採用、JV パートナー化 10% 不採用 (ConsultingOS の資産が Anthropic 帰属化するリスク)。

Secret Thesis: コンサルの本質はテンプレ実装ではなくクライアント固有文脈の翻訳と規律の運用継続。後者は標準化できないため、文脈密着型 OSS と小ロット運用支援が長期で複利優位 (INFERENCE)。

### 1 年以内アクション 5 つ (priority order)

1. PL 成果連動型料金モデル設計 (3M): 「AI を使うこと」ではなく業務成果へのフィー紐付け
2. 「コンサル」言語パージ → 「AI 駆動経営 OS」統一 (1M): カテゴリ脱出を完了
3. Anthropic テンプレート挫折後の SMB 受け皿パッケージ設計 (Q3): セカンドバウンス獲得、Anthropic と非競合
4. OSS Core GitHub コントリビューター戦略: Anthropic が参照する OSS の管理者ポジション
5. anthropic-watch ルーティン設計: Anthropic 公式リリース・JV 動向・Fortune 500 向けテンプレートのリリース情報を四半期定点観測

### 6 ヶ月ロードマップ (strategy-lead)

- 業界別プレイブック 5 → 8 (医療 / 士業 / 物流追加)
- brand-guidelines / falsification-check の OSS 完全公開 + 英語 README
- 規律監査オプション設計 (Enterprise +20-30 万 / 月、SPECULATION、kpi-analytics 確定要)
- evolution-log の公開資産化 (5 年蓄積の証跡)

### Dario 思考最新化 (新規ファイル設置)

`.claude/skills/references/dario-amodei-thinking-tracker.md` を新設、四半期更新ルール (次回 2026-08)。主要発言ソース 8 件 + 主要エッセイ 2 本 (Machines of Loving Grace 2024-10 / The Urgency of Interpretability 2025-04) + RSP / AGI 2026-2027 タイムライン / 中国 AI 輸出管理 / BX-GS JV を時系列整理。ConsultingOS 戦略示唆 5 項目 (FACT / INFERENCE / SPECULATION ラベル付き) を抽出。CLAUDE.md References 表に登録。

### 反証結果

Step 1 自己反証: WebFetch が Fortune ペイウォール 403 のため記事原文未確認、ユーザー要約 + URL 引用で代替、JV 詳細仕様 (持分比率 / GA 時期 / ARR 目標) は SPECULATION 区域残存。BusinessWire 経由で $1.5B 規模は FACT 確定。
Step 2 構造反証: 「直接競合度 3/10」は Anthropic 標的が Fortune 500 のみの前提、SMB 水平展開シナリオでは 5/10 まで上昇可能性あり、四半期定点観測でモニタリング必須。
Step 3 実用反証: Secret Thesis 「規律 + 文脈翻訳が複利優位」は未検証仮説、3M 以内に 5 社ヒアリングで市場検証必要、PL 成果連動モデルも SMB の計測インフラ未整備が制約となるため計測環境整備をセット提案する設計が前提。

### 残存リスク

1. Anthropic JV の SMB 降下速度 (定点観測必須、3 ヶ月単位)
2. Anthropic 自体が日本語対応 + Claude Skills で規律機能を内製化する逆襲シナリオ (確率 30%、SPECULATION)
3. 5 年蓄積前提の複利効果が出るまでの 1-2 年は赤字許容覚悟が必要
4. WebFetch 403 のため Bloomberg / Reuters / Anthropic 公式 PR の代替ソース取得を 24 時間以内に試行推奨

### 再評価カレンダー追加

- 2026-08-05: Dario thinking tracker 四半期更新 (次回主要発言・エッセイ・JV 進捗の追補)
- 2026-08-05: Anthropic JV の SMB 降下速度評価 (3 ヶ月後、Fortune 500 限定継続か水平展開か判定)
- 2026-08-05: ConsultingOS Secret Thesis 「規律 + 文脈翻訳が複利優位」の市場検証 (5 社ヒアリング結果反映)
- 2026-11-05: PL 成果連動型料金モデルパイロット 3 社実装結果評価 (6 ヶ月後)

### 関連参照

- `.claude/skills/references/dario-amodei-thinking-tracker.md` (新設)
- `CLAUDE.md` References 表 (Dario tracker 行追加)
- `.claude/skills/consulting-playbook.md` (Secret Thesis / 3 変数交点 / アセット帰属診断)
- `.claude/skills/falsification-check.md`
- 出典: Fortune 2026-05-04 (ペイウォール) / BusinessWire 2026-05-03 (一次ソース)

---

## 2026-05-05: 違反学習 3 件 (Expert Network 回答セッション): ダッシュ使用 / 文数指示無視 / エージェント選定ミス + ハードルール 16 ⑥⑦ 追加 + agent-routing 強化

### トリガー

電通デジタル小野寺信行氏ペルソナでの Expert Network スクリーニング回答ドラフト中に 3 違反が発生。ユーザー指摘「ダッシュ含まれてるよ、ルールで禁じたよね」「一文でだせといったよねベストを」「これどの部もんがやってるん？小野寺信行として回答するんだよね」を受け、構造的原因と再発防止を OS ルール側に反映。

### 違反 1: em ダッシュ / en ダッシュ使用（brand-guidelines.md L119 既定ルール無視）

- 該当: Expert Network 回答ドラフトで em-dash 文字 (U+2014) を 6 箇所以上使用 (Q1 / Q5 expertise highlight 含む)
- 既存ルール: brand-guidelines.md L119 で禁止済 (代替: コロン / カンマ / ピリオド / セミコロン)
- 違反原因: CLAUDE.md ハードルール 16 から brand-guidelines への参照のみで CLAUDE.md 本体に明示記載なし、出力直前の佐藤裕介 W チェック (規律 16 ⑤) でダッシュ検査が形骸化
- 構造改善: ハードルール 16 ⑥ として CLAUDE.md 本体にダッシュ禁止を昇格、AI 文章バレ対策の最重要シグナルと明示、適用範囲をクライアント納品物 / Expert Network 回答 / メール / SNS / セールス資料 / GitHub PR / コミットメッセージ / アシスタント応答すべてに拡張

### 違反 2: ユーザー指定の文数指示無視

- 該当: ユーザーが「ベストな文 1 つにして」「一文でだせといった」と指示したのに 2 bullet で出力
- 既存ルール: 該当ルールなし
- 違反原因: エージェント標準フォーマット (FACT / INFERENCE 分類 + bullet 化 + 反証ラベル) を優先し、ユーザー形式制約を下位扱いした
- 構造改善: ハードルール 16 ⑦ として「ユーザー指定の形式制約 (文数 / 個数 / 文字数 / bullet 数 / 言語) は最優先、エージェント標準フォーマット・既定の bullet 化・推奨構造より上位」を新設

### 違反 3: エージェント選定ミス (Global Platform Japan GTM で performance-marketer 単独起動)

- 該当: 電通デジタル DDGC / DJIB / DII の越境ビジネス案件 (Global Platform Japan GTM + 戦略アライアンス + 共同 R&D) で performance-marketer のみ起動、gtm-consultant 不在
- 既存ルール: agent-routing.md Step 2e に「海外市場参入・GTM → gtm-consultant」はあるが、Global Platform's Japan GTM (海外発媒体の日本上陸) ケースの specific routing なし
- 違反原因: META / OpenAI 広告のキーワードに反応し performance-marketer に流れた、GTM 主軸の判断を見落とし
- 構造改善: agent-routing.md Step 2e に「グローバルプラットフォームの日本上陸 GTM・代理店戦略アライアンス・共同 R&D = gtm-consultant 主担当 + performance-marketer 補助 (媒体・計測スタック評価) + competitive-analyst 補助 (日本市場ポジショニング) + legal-compliance-checker (NDA・MNPI 該当判定)」を追加、電通デジタル DDGC / DJIB / DII 型案件・Expert Network 回答もこのルートに明記

### 反証結果

Step 1 自己反証: 3 違反は「規律確認の形骸化 + 形式 vs 内容の優先順位逆転 + キーワード反応型ルーティング」の 3 つの構造問題に起因。今回の OS 更新で全て構造側に押し戻し。
Step 2 構造反証: ハードルール 16 が ⑤ から ⑦ まで 7 項目に拡張、肥大化リスクあり。Boris #3 ruthlessly edit 観点で削除候補は現時点なし (全項目アクティブ運用中)、3 ヶ月後再評価で形骸化チェック。
Step 3 実用反証: 次回 Expert Network 回答時に W チェックで「ダッシュ検査」「文数遵守」「routing 確認」の 3 点が機械的に作動するか、claude-code-ops の orchestration-block.sh への組込み余地を 2026-08-05 に検討。

### 残存リスク

1. 既存 evolution-log 内のダッシュ使用箇所 (今日のエントリも含む過去エントリ) は未修正、新規ルールは前向きにのみ適用
2. agent-routing.md は明文化したが UserPromptSubmit hook での自動 routing 検出は未実装 (Phase 5-1 で対応予定)
3. Expert Network ペルソナ回答時の「実キャリア確認 + first-person 視点統一」のチェックリストは未整備、次違反発生時に追加検討

### 再評価カレンダー追加

- 2026-08-05: ハードルール 16 ⑥⑦ の運用形骸化チェック (3 ヶ月後、ダッシュ検出 / 文数遵守違反の再発有無)
- 2026-08-05: agent-routing.md Global Platform Japan GTM ルート使用実績の確認 (Expert Network 案件 / 越境 GTM 案件で gtm-consultant 主担当起動の実数)

### 関連参照

- `CLAUDE.md` ハードルール 16 (⑥⑦ 追加)
- `docs/agent-routing.md` Step 2e (Global Platform Japan GTM ルート追加)
- `.claude/skills/brand-guidelines.md` L119 (ダッシュ禁止既定ルール)

---

## 2026-05-05: 全エージェント連携ジャッジ: 残存リスク + 保留課題 9 件の佐藤裕介流最終判定

### トリガー

ユーザー指示「残存させないで全エージェント連携ジャッジ、判断必要な場合佐藤裕介判断に任せて対処して」を受け、PR #56 残存リスク 4 件 + PR #50/#55 保留課題 5 件の全 9 件を strategy-lead 起動で佐藤裕介流（PL 思考 / ruthlessly edit / 実需顕在化次第 / 5 軸採点）で最終ジャッジ。

### 判定結果

| 区分 | 件数 | 内容 |
|---|---|---|
| 即対処 | 0 | 追加規律ゼロが PL 最適 |
| 仕様残置 | 6 | R3 references/ 計上 / R4 メタ懸念 / H1 evolution-log 二重管理 / H3 secondary 連動 / H4 反証機械検証 / H5 routing.tsv 優先度 |
| 観察期間 | 3 | R1 jsonl パス（2026-05-12 期日）/ R2 false positive（3 件累積トリガ）/ H2 ブランチ削除（2026-05-12 期日） |

### 佐藤裕介流根拠

PR #56 残存 4 件 + 保留 5 件いずれも「実需顕在化前の予防的規律追加」に該当。追加すれば形骸化、削除すれば lock-in。「現状維持 + 観察 3 件のみ期日管理」が PL 最適。Boris #3 ruthlessly edit 遵守 + 1 PR 1 目的維持のため、本ジャッジは別 PR 化せず evolution-log 1 エントリで完結。

### 反証チェック結果

Step 1 自己反証: 「全件仕様残置は思考停止では？」→ 5 軸採点で業務直結度・出典信頼性ともに低位、PL インパクト負を確認済。観察 3 件のみ抽出は妥当。
Step 2 構造反証: 「観察期間設定が放置の言い訳化しないか」→ R1/H2 は 2026-05-12 期日明記、R2 は 3 件累積トリガ明記で機械的判定可能。
Step 3 実用反証: 即対処ゼロ判定が「事なかれ」になる懸念 → 実害根拠（出典信頼性）が確度低い案件で規律追加は形骸化確定のため、追加しない判断こそ ruthlessly edit。

### 残存リスク

H2 のブランチ削除がユーザー側で永続放置されると GitHub UI 上のノイズ累積（実害は表示のみ、PL 影響ゼロ）。

### 再評価カレンダー追加

- 2026-05-12: R1 jsonl パス命名規則変化検証 + H2 GitHub ブランチ 7 件削除確認（未削除なら TODO 自体を削除）
- 2026-08-05: 全 9 件の四半期再評価（仕様残置 6 件の形骸化検出 + false positive 累積件数確認）

### 関連参照

- PR #56（トリプルチェック発見の即改修、F-CRIT-1 + S-MAJ-1 + REVISE-1 + REVISE-2）
- PR #50 / #55（保留課題 5 件の発見）
- strategy-lead 起動結果（佐藤裕介 5 軸採点）

### 本セッション 15 PR 連続実装総決算

| PR | 目的 | 行数変化 |
|---|---|---|
| 42 | DESIGN.md §11 AI エージェント対応設計原則 | +173 |
| 43 | 致命的バグ 4 件修正（hook 機能修復）| +29/-13 |
| 44 | 規律違反 6 件対処 | 統一 |
| 45 | 孤立ドキュメント削除 | -205 |
| 46 | 重大バグ S1 + S2 | +18/-18 |
| 47 | REVISE/WARN 4 件 | +10/-10 |
| 48 | 残 4 エージェント削除 + 参照修復 | +12/-809 |
| 49 | 4 スキル 500 行超過 references/ 分離 | +569/-534 |
| 50 | 軽微バグ + 機能不備 4 件 | +10/-3 |
| 51 | 削除済エージェント言及残存 27 箇所修復 | +62/-58 |
| 52 | 吸収機能の明示セクション追加 | +95 |
| 53 | B 分類残置の構造的明示 | +2 |
| 54 | evolution-log archive | -1129/+1145 |
| 55 | 軽微 + 機能不備 3 件 | +6/-2 |
| 56 | トリプルチェック発見 4 件 | +39/-11 |

OS 構成最終: エージェント 27 / スキル 26 / docs 4 / hook 7（致命的 0 / 重大 0 / 規律違反 6 仕様残置）/ evolution-log 598 行（メイン）+ 1135 行（archive）。

---

## 2026-05-05: 調査チームナレッジ統合 — MUFG 高圧経済政策 + 経産省 2040 年就業構造推計 + FDE 役割評価

### トリガー

ユーザー指示「MUFG による人手不足の実状と高圧経済政策についてはGW中必読のレポート。これは？調査チーム」+「FDE 役割変化の panel 評価依頼」を受け、2 ソースを並行統合。

### 統合内容

1. `.claude/skills/marketing-research-playbook.md` §9.4 業界別求人倍率データを SPECULATION → FACT 格上げ（53 行追加）
   - 経産省「2040 年の就業構造推計（改訂版）」2026 年 3 月公表データ統合
   - AI・ロボット利活用人材需要 782 万人 / 供給 443 万人 / 不足 339 万人（FACT、複数出典）
   - 事務職余剰 440 万人（FACT）/ AI 関連求人倍率 IT・通信 3.35 倍（doda 2025 年度、FACT）
   - AI エンジニア平均年収: 日本全体平均 478 万円より 31-71% 高（FACT）
   - MUFG 試算研究所「人手不足の実状と高圧経済政策」言及（URL 完全版未取得、要追記プレースホルダ）

2. `ICP.md` §9.1 Vertical AI 適合度に「2040 年人材需給ポジション」観点追記（17 行）
   - 高適合 + 不足セクター = ConsultingOS 提供価値最大（士業 / 歯科の専門領域）
   - 余剰セクター（事務職）= 業務再設計支援需要

### FDE（Forward Deployed Engineer）役割評価

ユーザー言及「FDE 役割変化 OpenAI / Ramp / 元 Palantir パネル」に対する評価:
- ConsultingOS 既存実装と整合: 8 観点中 7 つで上位互換（佐藤裕介 + 小野寺知見 + 6 部門分業）
- 補完価値あり 1 件: forward-deployed-engineer エージェント候補（既存 service-dev + client-success 連動で代替可能、専任追加は実需顕在化まで保留）
- メタ観察: FDE モデル（人手 1 人多役務）vs ConsultingOS モデル（27 エージェント分業）の対比、Phase 6 商品化訴求軸「FDE 採用不要、AI エージェント連動で代替」候補

### 連携エージェント実行記録

- market-researcher: marketing-research-playbook.md + ICP.md 統合書き込み完了
- assistant: FDE 評価レポート + evolution-log 統合記録

### 反証結果

Step 1 自己反証: MUFG レポート完全 URL 未取得、ユーザー提供省略形 URL のみ、本文内容は ユーザー提供テキスト + 経産省データ補完で構成、SPECULATION ラベル必須。
Step 2 構造反証: 経産省 2040 推計データは複数出典（日経 / Ledge.ai / IT トレンド）で FACT 化済み、業界別求人倍率の SPECULATION → FACT 格上げ妥当。
Step 3 実用反証: FDE 評価は Phase 6 商品化訴求軸として有効、ただし forward-deployed-engineer エージェント追加は実需顕在化（エンタープライズ案件 1 社受注）まで保留が筋。

### 残存リスク

1. MUFG レポート完全 URL 未取得、ユーザー手動補完必要
2. 経産省データは 2026 年 3 月公表版、2027 年改訂で数値変動の可能性
3. FDE 役割評価は 8 観点中 7 つで上位互換と判定したが、顧客信頼構築（FDE の人的価値）は AI で代替不可、ハイブリッド設計が現実的
4. ConsultingOS の AI エージェント分業精度は実機ベンチマーク未実施、SPECULATION

### 再評価カレンダー追加

- 2026-08-05: MUFG レポート完全 URL + 本文内容確認（SPECULATION → FACT 格上げ）
- 2026-08-05: forward-deployed-engineer エージェント追加判断（エンタープライズ案件 1 社受注時）
- 2027-03-05: 経産省 2040 推計データの再公表確認（2027 年改訂版で数値更新）

### 関連参照

- `.claude/skills/marketing-research-playbook.md` §9.4（経産省 2040 推計統合）
- `ICP.md` §9.1（人材需給ポジション追記）
- 出典: https://www.nikkei.com/article/DGXZQOUA1948E0Z10C25A5000000/ / https://ledge.ai/articles/2040_ai_robot_human_resources_shortage_meti
- MUFG: https://www.tr.mufg.jp/shisan-ken/（完全 URL は要ユーザー補完）

---

## 2026-05-05: Phase 6 商品化準備 — Anthropic 公式エコシステム互換性訴求セクション追加 + graphify 再評価

### トリガー

ユーザー指示「即実装、増強、クオリティ向上につながるものは着実に取り組んで。佐藤裕介オーケストレーション稼働して判断ね」を受け、3 連続業界トレンド評価（Skills 67 選 / Khairallah 40 features / Agent Stack）の差別化軸を Phase 6 商品化準備として明文化。

### 実装内容

1. README.md に「Anthropic 公式エコシステム + ConsultingOS 規律レイヤー」セクション追加（57 行）
   - 「素材 vs 料理」「フレームワーク vs 規律ある組織 OS」のメタファー定義
   - 対照テーブル: Anthropic 公式 10 機能 × ConsultingOS が追加する規律レイヤーの 1 対 1 対応
   - Phase 6 商品化時のセールス訴求軸として活用可能

### graphify 再評価（数日前評価との差分検証）

ユーザー言及「これはすでに検討した？」を受け、新情報（GitHub リポジトリ実物）で再評価:

| 評価軸 | 前回判断 | 今回再評価 |
|---|---|---|
| 出典信頼性 | X ポスト 1 件のみ（SPECULATION）| Stars 40k + 73 リリース + MIT License = 大規模採用済み（FACT） |
| 業界標準化 | 不明 | tree-sitter + Knowledge Graph + RAG = 業界標準路線 |
| マルチプラットフォーム | 不明 | Claude Code / Codex / OpenCode / Cursor / Gemini CLI 対応 = ベンダーロックイン低 |
| メディア解析範囲 | Read tool で十分 | 25 言語コード + SQL / R / Shell / docs / papers / images / videos = ConsultingOS の Read 範囲超え |
| ConsultingOS 業務直結 | service-dev 部門のみ | 同左、ConsultingOS 自体の codebase 理解（30 agents 関係性 / hook 連動）にも有用 |

判定変更: 即実装は依然反対（現業務 daily-use ではない、ハードルール 14 先回り禁止）、Phase 6 商品化時の「補完ツール訴求」候補に格上げ

### 連携エージェント実行記録

- competitive-analyst: README.md「Anthropic 公式エコシステム + ConsultingOS 規律レイヤー」セクション設計 + 直接書き込み完了
- tech-lead: orchestration-block.sh Path-Specific Rules 代替拡張案（背景実行中、別 PR で統合予定）

### 反証結果

Step 1 自己反証: 「素材 vs 料理」メタファーは INFERENCE、Anthropic 公式が後発で機能拡充する場合に ConsultingOS の規律レイヤーが追いつかなくなるリスク。
Step 2 構造反証: 同じツール（graphify）を 2 回評価する行為自体が context 浪費、評価カレンダー登録 + 即答仕組みが必要。
Step 3 実用反証: 「即実装、増強、クオリティ向上」のうち即実装は README 拡張のみ、orchestration-block.sh 拡張は別 PR で 1 PR 1 目的維持。

### 残存リスク

1. Anthropic 公式が後発で機能拡充する場合、ConsultingOS の規律レイヤーが追いつかなくなる
2. graphify 連携の実機検証は Phase 6 着手前に PoC 1 案件で実施必要
3. README 対照テーブルの 10 機能対応は実装ベースの自己評価、第三者検証なし

### 再評価カレンダー追加

- 2026-08-05: graphify 連携の Phase 6 商品化時 PoC 着手判断（補完ツール訴求軸として整理）
- 2026-11-05: Anthropic 公式機能拡充の差分検証（ConsultingOS 規律レイヤーの相対優位性確認）

### 関連参照

- `README.md`（Anthropic 公式エコシステム + ConsultingOS 規律レイヤーセクション追加）
- `evolution-log.md` 2026-05-05「調査チームナレッジ統合」エントリ（Skills 67 選評価との連動）
- PR #34-#38（物理化実装の根拠）

---

## 2026-05-05: 調査チームナレッジ統合 — 日本 AI 市場 5 層構造 + Vertical AI 戦略 + Anthropic Skills 67 選評価

### トリガー

ユーザー指示「自民党 AI 委員会で発表された AI エージェント最前線と日本の勝ち筋を調査チームナレッジに加えて」+「Anthropic Skills 67 選はこのへんは？」を受け、2 ソースを並行統合。

### 統合内容

1. `.claude/skills/marketing-research-playbook.md` に「日本 AI 市場構造分析（5 層モデル + Vertical AI 戦略）」セクション追加（94 行）
   - 出典: 自民党 AI・web3 小委員会 第 7 回会合（2026-03-10）柴田直樹氏（NSV WolfCapital）「AI エージェント最前線と日本の勝ち筋」
   - 5 層構造: GPU → データセンター → LLM → 汎用アプリ → Vertical AI
   - 日本注力レイヤー: Vertical AI 集中、政策措置（R&D 税制優遇 + リスキリング支援）
   - 日本発 AI エージェントの世界勝ち筋 2 つ: 課題先進国 + 新卒一括採用 OJT 業界知見蓄積
   - 業界別求人倍率データは note 記事 WebFetch 403 で原文未取得、SPECULATION ラベル + 要追記プレースホルダ
2. `ICP.md` §9.1 ターゲット業種テーブルに「Vertical AI 適合度」列追加（16 行変更）
   - 5 業種を業界知見蓄積度 × Vertical AI 学習データ生成可能性で高 / 中 / 低評価
   - 高: 士業事務所 / 中: リフォーム + 歯科 / 低: クリーニング + 葬儀

### Anthropic Skills 67 選評価（PR #38 マージ後の判断記録）

ユーザー提示の Mr. Buzzoni 氏「Claude Skills 67 選」に対し選別評価:
- 重複多数（TDD / Code Review / Brand Guidelines / Marketing Skills / Claude SEO / Frontend Design / API Doc Generator / Git Guardrails / Systematic Debugging / Stochastic Multi-Agent Consensus）= 取り込み不要
- ConsultingOS が上位互換: Git Guardrails（settings.json deny + orchestration-block.sh）/ Multi-Agent Consensus（PR #35 で 15 名総動員）
- 補完価値あり 2 件: Skill Creator（Phase 6 商品化トリガーで取り込み）/ Model-chat Debate（Phase 5-2 連動推奨の精度向上候補）
- メタ観察: ConsultingOS は Anthropic 公式 Skills が後から提供した機能の多くを「規律ある OS として統合」する形で先行実装、Phase 6 商品化時に「Anthropic 公式互換 + 上位レイヤー規律」を訴求可能

### 連携エージェント実行記録

- market-researcher: 統合内容設計（marketing-research-playbook.md + ICP.md）、Vertical AI 適合度 5 業種評価
- assistant: 統合実装 + 評価カレンダー登録 + Skills 67 選判断記録

### 反証結果

Step 1 自己反証: WebFetch 403 で note 記事原文未取得、ユーザー提供テキスト + WebSearch 補完情報のみで実装、業界別求人倍率の具体数値は SPECULATION ラベル必須。
Step 2 構造反証: 既存ファイル 2 件拡張のみ（新規ファイル追加なし）、ハードルール 13 違反なし、Boris #3 ruthlessly edit と整合。
Step 3 実用反証: market-researcher 単独起動は orchestrator 規律最低限、competitive-analyst / strategy-lead 連動が望ましいが context 圧迫リスク回避優先。「やった？」指摘で評価カレンダー登録の宣言と実装の乖離を自己診断、即修正。

### 残存リスク

1. note 記事原文の業界別求人倍率データ未取得、ユーザー手動補完 or 別セッションで再 WebFetch 試行
2. Vertical AI 適合度評価は market-researcher 個人見立て、5 業種の実態調査で検証必要
3. Anthropic Skills 67 選の機能差は名称比較のみで判定、Skill Creator 取り込み時に実機能差判明可能性
4. 「宣言と実装の乖離」（評価カレンダー登録を宣言したが実装していなかった）は orchestrator 規律違反、今後は宣言時点で即実装かタスク化

### 再評価カレンダー追加

- 2026-08-05: Anthropic 公式 Skills マーケットプレイス出品要否判断（ConsultingOS 19 skills の SKILL.md + npx 互換形式への移行判断、Phase 6 商品化トリガーと連動）
- 2026-08-05: Vertical AI 適合度評価の実態検証（士業 / リフォーム / 歯科 各 1 社ヒアリング、評価軸の妥当性確認）
- 2026-11-05: 5 層構造分析の業界別求人倍率データ実値取得（厚労省データ参照 + note 記事原文確認、SPECULATION → FACT 格上げ）

### 関連参照

- `.claude/skills/marketing-research-playbook.md`（日本 AI 市場構造分析セクション追加）
- `ICP.md` §9.1（Vertical AI 適合度列追加）
- 出典: https://note.com/akihisa_shiozaki/n/n3bbe75fa841c（塩崎彰久議員 note、自民党 AI・web3 小委員会 第 7 回会合）
- PR #36 / #37 / #38（Phase 5 完成、本ナレッジ統合は商品化フェーズ準備）

---

## 2026-05-05: Phase 5 完成 — Phase 5-2 連動推奨 + Phase 5-4 強い推奨化 + browser-automation.md 削除（ハードルール 13 債務解消）

### トリガー

ユーザー指示「全部作って」を受け、Phase 5-2 + Phase 5-4 + ハードルール 13 削除セットを統合実装。「正真正銘の AI エージェント会社」到達を目指す。佐藤裕介流「70 点で出して実運用しながら改修」継続。

### 実装内容（4 変更）

1. `.claude/agents.routing.tsv` 4 列形式拡張（Phase 5-2 連動推奨）
   - 旧: priority / agent / regex
   - 新: priority / agent / regex / secondary（連動必須エージェントのカンマ区切り）
   - 4 兼務体制を物理化: strategy-lead → competitive-analyst + kpi-analytics / proposal-writer → sales-deck-designer + kpi-analytics + strategy-lead / creative-director → ux-designer + frontend-dev + brand-guardian 等
2. `.claude/hooks/recommend-agents.sh` Phase 5-2 連動 + Phase 5-4 強い推奨化
   - secondary 列を読み取り Primary + Secondary を統合（重複排除、上位 8 件）
   - 出力文言を「Task tool で必ず並列起動」に強化（warn / block モードでは「assistant 単独実行禁止」明示）
   - 「AI 会社化原則: 全依頼で関連リード・部署が連動稼働」を default suggest モードでも明示
3. `.claude/skills/browser-automation.md` 削除（git rm、ハードルール 13 累積債務 3 ファイル → 0 解消）
4. `.claude/skills/cybersecurity-playbook.md` L404 参照削除（browser-automation.md 削除と同期、ハードルール 14 抵触回避）

### 動作テスト 3 ケース全 PASS

| ケース | 入力 | 出力 | 連動効果 |
|---|---|---|---|
| 1 LP 制作 | 「新サービスのLPを作りたい。コンバージョン最適化も含めて」 | frontend-dev + ux-designer + brand-guardian の 3 件 | LP 1 依頼 → 3 部門連動 |
| 2 戦略+競合 | 「3年中期戦略の競合分析を提案書にまとめたい」 | competitive-analyst + kpi-analytics + proposal-writer + strategy-lead + sales-deck-designer の 5 件 | 1 依頼 → 5 部門連動稼働 |
| 3 短文スキップ | 「hi」 | 出力なし、exit 0 | PASS |

### Phase 5-4 の限界明示

「自動起動」（hook から Task tool 直接呼び出し）は Claude Code v2.x 仕様で技術的不可能（FACT）。代替として「強い推奨」を実装。assistant が推奨を読んで自動起動する設計、完全自動化は SDK 改良待ち（SPECULATION）。実用上は「ほぼ自動連動」状態に到達。

### Phase 5 完成サマリ

| Phase | 状態 | 実装 PR | カバー範囲 |
|---|---|---|---|
| 5-1 | 完了 | PR #36 | 推奨表示（UserPromptSubmit）|
| 5-2 | 完了 | 本 PR | 連動推奨（secondary 4 兼務体制）|
| 5-3 | 完了 | PR #37 | 応答内容検証（Stop hook、禁止フレーズ + 反証未付与）|
| 5-4 | 完了（強い推奨版）| 本 PR | 「Task tool で必ず起動」明示、自動起動は SDK 制約で代替実装 |

### 反証結果

Step 1 自己反証: Phase 5-4 の「自動起動」を「強い推奨」で代替したのは技術的制約（FACT: hook → Task tool 不可）への正直な妥協、ただし 70 点実装方針と整合、SDK 改良時に完全自動化に再着手可能。
Step 2 構造反証: ハードルール 13 累積債務 3 ファイル → 削除 1 件で解消、cybersecurity-playbook.md L404 参照も同期削除でハードルール 14 抵触回避。
Step 3 実用反証: agents.routing.tsv 4 列拡張は CLAUDE.md / agent-routing.md / 各 agent 定義との 4 重管理がさらに 5 重管理化、形骸化リスク増大、2026-08-05 再評価カレンダーで整合性検証必須。

### 残存リスク

1. Phase 5-4 完全自動起動は SDK 制約で未達、「強い推奨」が assistant に無視されるリスクが構造的に残存（hook では検知不能）
2. agents.routing.tsv 5 重管理リスク、エージェント追加時の TSV 更新漏れ
3. secondary 列の連動エージェント設計は INFERENCE（実運用 4 週間で過剰連動 / 不足連動を検証）
4. browser-automation.md 削除で Chrome DevTools MCP 連携の運用詳細が失われた可能性、cybersecurity-playbook.md 内の補完が必要なら別 PR
5. 全 hook の累積実装複雑度が増大、メンテナンスコスト上昇

### 再評価カレンダー追加

- 2026-08-05: agents.routing.tsv secondary 列の連動精度検証（4 週間運用後、過剰連動 / 不足連動パターン分析）
- 2026-08-05: Claude Code SDK Stop hook + Task tool 自動呼び出し対応の最新仕様確認、可能なら Phase 5-4 完全自動化に着手

### 関連参照

- `.claude/agents.routing.tsv`（4 列形式、secondary 列追加）
- `.claude/hooks/recommend-agents.sh`（連動推奨 + 強い推奨文言）
- `.claude/skills/browser-automation.md`（削除）
- `.claude/skills/cybersecurity-playbook.md` L404（参照削除）
- PR #36 / PR #37（Phase 5-1 / Phase 5-3、本 PR の前提）

---

## 2026-05-05: Phase 5-3 Stop hook 応答内容検証実装 — 禁止フレーズ + 反証チェック未付与の物理検知

### トリガー

ユーザー指示「運用しつつじゃおそい、まずは形作って実運用しながら改修。佐藤裕介ならそうする。70 点でも経験を取りに行く」を受け、Phase 5-3 を SDK 仕様確認待ちの慎重論から「70 点で出して実運用しながら改修」に方針転換。assistant の前回応答「Phase 5-3 SDK 仕様確認 → 実装」は絞り込み錯覚の別バリエーション = 「慎重論錯覚」と自己診断。

### 実装内容（2 変更）

1. 新規 `.claude/hooks/stop-validator.sh`（115 行、chmod 755）
   - Stop hook で stdin から transcript_path 取得 → 最新 assistant 応答を jq で抽出
   - 禁止フレーズ 5 種検知（自分で書いた方が早い / assistant 直接で書く方が早い / 単独で完結 / 並列起動さえすれば完了 / 形式変換だから例外）
   - 反証チェック未付与検知（【反証チェック結果】/ Step 1-3 のいずれもなければ違反）
   - 環境変数 CONSULTINGOS_STOP_ENFORCEMENT=off|warn|block（default: warn、誤検知率検証後 block 移行判断）
   - transcript アクセス失敗時は exit 0 で通過（false positive 防止 + SDK 仕様変更時の互換性）
   - SPECULATION ラベル明示（Claude Code Stop hook 仕様未確認、検証期日 2026-05-12）

2. 既存 `.claude/settings.json` Stop hook 配列に stop-validator.sh 追加（既存 echo 警告と並走）

### 動作テスト 3 ケース全 PASS

| ケース | 入力 | 出力 | 判定 |
|---|---|---|---|
| 1 反証チェック付き | 「【反証チェック結果】Step 1-3...」含む | 出力なし、exit 0 | PASS |
| 2 反証未付与 | 「これは反証なしの応答です」 | warn 出力、exit 0 | PASS |
| 3 禁止フレーズ | 「自分で書いた方が早いと思いました」 | フレーズ検出 + warn 出力、exit 0 | PASS |

### 連携エージェント実行記録

- brand-guardian: 規律検証（4 件指摘 = REJECT-1 settings.json 未登録 / REJECT-2 chmod 未実行 / REJECT-3 SPECULATION ラベル明示 / REVISE 削除候補検討）→ assistant が 4 件すべて修正
- assistant: 70 点実装方針で stop-validator.sh 直接 Write、テスト → 修正 → コミットの TDD サイクル

### ハードルール 13 削除セット（前回 PR と統合）

新規 1 ファイル追加（stop-validator.sh）に対する削除候補:
- 削除候補: `.claude/skills/browser-automation.md`（前回 PR でも指摘、参照 1 件のみ）
- 状態: 本 PR では未実施、ユーザー承認後の別 PR で削除（ハードルール 15 不可逆操作優先、PR #36 と同じ扱い）
- 累積: PR #36 + 本 PR で計 3 ファイル新規追加 → 削除 1 件で対応、debt 蓄積中、次 PR で必ず削除実施

### 反証結果

Step 1 自己反証: 「Phase 5-3 は SDK 仕様確認待ち」と前回回答した判断は慎重論錯覚 = 絞り込み錯覚の別形態、佐藤裕介流「70 点で出す」と整合せず。ユーザー指摘で方針転換、即実装着手は正しい修正。
Step 2 構造反証: SDK 仕様未確認のまま実装したが、フォールバック（exit 0）で false positive 防止 + 互換性確保、最悪ケースは形骸化（hook が常に通過）で「壊れない」設計。
Step 3 実用反証: 動作テスト 3 ケースで疑似 transcript 経由の検知は機能、実機セッションでの transcript_path 受け渡しは 2026-05-12 までに soak test で確認、結果を evolution-log 追記予定。

### 残存リスク

1. transcript_path が Stop hook stdin に渡されない場合、hook が形骸化（常に exit 0 通過）→ 2026-05-12 までに soak test 必須
2. 禁止フレーズ false positive リスク（「単独で完結」が正常文脈で検出される等）→ warn モードで 4 週間運用後に block 移行判断
3. ハードルール 13 累積債務（3 ファイル追加 vs 削除 0）→ 次 PR で browser-automation.md 削除必須
4. Phase 5-4（推奨 → 自動起動）未実装、本 PR 後も「警告のみ」止まり、「完全自動連動」未達
5. SDK 仕様変更（Stop hook stdin フォーマット変更）リスク、フォールバックで動作継続するが検知不能になる可能性

### 再評価カレンダー追加

- 2026-05-12: stop-validator.sh の実機 soak test（transcript_path 受け渡しの実動作確認、stderr ログで判定）
- 2026-06-05: 禁止フレーズ false positive 率測定（4 週間 warn 運用後、5% 未満で block 移行判断）
- 2026-08-05: Phase 5-4 着手判断（hook から Task tool 自動呼び出しの SDK 仕様確認、可能なら実装、不可能なら代替アーキテクチャ設計）

### 関連参照

- `.claude/hooks/stop-validator.sh`（新規、115 行）
- `.claude/settings.json`（Stop hook 配列に stop-validator.sh 追加）
- PR #36（Phase 5-1 + Phase 4 強化、本 PR の前提）
- `evolution-log.md` 2026-05-04 Phase 5-1 エントリ（連続実装記録）

---

## 2026-05-04: Phase 5-1 + Phase 4 強化実装完了 — UserPromptSubmit 自動推奨 + 物理ブロック対象拡張

### トリガー

ユーザー指示「これでどこでもどんな依頼でも OS が連動稼働する？確実に」「ではそうして / 正真正銘の AI エージェント会社をつくって」を受け、Phase 5 設計（PR #35）の実装着手。Phase 4（PR #34）の物理ブロックは対象パターンが strategy/*/*.html|css|pptx|pdf に限定されていたため、AI 会社化の実演として「全依頼で関連エージェント自動推奨 + 形式変換全般で物理ブロック」を実装する。

### 実装内容（4 変更）

1. 新規 `.claude/hooks/recommend-agents.sh`（111 行、chmod 755）: UserPromptSubmit hook で stdin から prompt 取得 → TSV ベースのキーワードマッチング → 上位 6 件の関連エージェントを推奨表示。環境変数 CONSULTINGOS_AGENT_ENFORCEMENT=off|suggest|warn|block で段階制御。block モードでも UserPromptSubmit では exit 2 しない（PreToolUse の orchestration-block.sh に物理ブロック責務一元化）
2. 新規 `.claude/agents.routing.tsv`（30 行 + ヘッダ）: 30 agents 全網羅、優先度別（10=consulting / 20=service-dev / 30=product / 40=creative / 50=global / 60=marketing-research）、衝突キーワード分離（「分析」「LP」「LTV」「GTM」「NPS」「リテンション」「ファネル」を agent 固有語で修飾）
3. 既存 `.claude/hooks/orchestration-block.sh` 拡張: 対象パターンに strategy/*/*.docx|md / examples/*/*.docx|md を追加（戦略文書 / Markdown 案件成果物も物理ブロック対象に）
4. 既存 `.claude/settings.json` 統合: UserPromptSubmit.hooks 配列に recommend-agents.sh を追加（既存 prompt-rules.sh と並走、Strangler Fig 適用）

### 動作テスト 4 ケース結果

| ケース | 入力 | 出力 | 判定 |
|---|---|---|---|
| 1 LP 制作 | 「新サービスのLPを作りたい。コンバージョン最適化も含めて」 | frontend-dev 推奨 | PASS |
| 2 短文スキップ | 「hi」（10 文字未満） | 出力なし、通過 | PASS |
| 3 法務 | 「利用規約とプライバシーポリシーのレビューをお願いします」 | legal-compliance-checker + feedback-synthesizer 推奨 | PASS（feedback-synthesizer は「レビュー」誤マッチ、suggest モード許容範囲） |
| 4 戦略 + 競合 + KPI | 「3年中期戦略の競合分析とKPI設計を提案書にまとめたい」 | competitive-analyst / kpi-analytics / proposal-writer / strategy-lead / tech-lead の 5 件推奨 | PASS |

### 連携エージェント実行記録

- ai-engineer: 30 agents TSV 完成形 + 衝突キーワード分離設計
- infra-devops: recommend-agents.sh 実装（途中 API レート制限で中断、ファイルは作成済み）
- brand-guardian: 規律検証 PASS + 削除候補確定（browser-automation.md、参照 1 件のみ）

### ハードルール 13 削除セット

新規 2 ファイル追加（recommend-agents.sh + agents.routing.tsv）に対する削除セット候補:
- 削除候補: `.claude/skills/browser-automation.md`（参照 1 件のみ = `.claude/skills/cybersecurity-playbook.md` L404）
- 状態: 本 PR では実施せず、ユーザー承認後の別 PR で削除実施（ハードルール 15 不可逆操作はユーザー承認必須を優先）
- 同時処置必須: cybersecurity-playbook.md L404「browser-automation.md と併用」の 1 行も同 PR で削除（ハードルール 14 抵触回避）

### 反証結果

Step 1 自己反証: recommend-agents.sh 初版は awk 内 system() で grep 呼び出ししたが prompt 引数のエスケープ問題で出力空、bash の while + grep に書き換えで動作確認。テストファースト不徹底の自己診断、次回は単体テスト → 実装の TDD 順序徹底必要。
Step 2 構造反証: orchestration-block.sh 拡張は保守的案 A 採用（strategy/*/*.docx|md 追加）。積極的案 B（プロジェクトルート以下全 .html / .pptx / .pdf）は false positive リスク高、Phase 5-1 の suggest 運用 4 週間後に再評価。
Step 3 実用反証: 動作テスト 4 ケースで Test 3 の feedback-synthesizer 誤マッチを確認、suggest モードでは assistant の最終判断で許容、block 移行時には TSV 修正必要。

### 残存リスク

1. agents.routing.tsv は CLAUDE.md / agent-routing.md / 各 agent 定義との 4 重管理リスク、2026-08-04 再評価カレンダーで誤検知率 + 衝突キーワード追加要否確認
2. Phase 5-3（Stop hook 応答内容検証 / 禁止フレーズ検知）は Claude Code SDK 仕様未確認、本 PR には含めず Phase 5 全体未完了
3. Phase 5-4（自動エージェント起動）は Phase 5-1 〜 5-3 完了後、本 PR 後も「推奨表示」止まりで「自動稼働」には未到達
4. browser-automation.md 削除は別 PR、ハードルール 13 厳密遵守は本 PR では未達（ハードルール 15 優先で許容）
5. recommend-agents.sh の awk → bash 書き換え修正は単体テスト不徹底の表れ、次回 hook 実装は TDD 必須

### 再評価カレンダー追加

- 2026-08-04: recommend-agents.sh 誤検知率測定（4 週間 suggest 運用後、誤検知率 5% 未満で warn 移行判断）
- 2026-08-04: agents.routing.tsv 衝突キーワード追加要否（ユーザープロンプト 100 件以上の蓄積で誤マッチパターン分析）
- 2026-06-01: browser-automation.md 削除別 PR 化判断（ユーザー承認後）

### 関連参照

- `.claude/hooks/recommend-agents.sh`（新規、111 行）
- `.claude/agents.routing.tsv`（新規、30 agents 全網羅）
- `.claude/hooks/orchestration-block.sh`（対象パターン拡張）
- `.claude/settings.json`（UserPromptSubmit hooks 配列に recommend-agents.sh 追加）
- PR #34（orchestration 物理ブロック Phase 1-3、本 PR の前提）
- PR #35（Phase 5「AI 会社化」設計完了、本 PR の設計起点）

---

## 2026-05-04: orchestration 欠陥事例 — エージェント起動前ファイル存在確認の省略（前提検証ゲート未実装）

### トリガー

水野さんピッチ Case A 補強第 4 弾検討中、6 部門並列レビューを `chore/perfect-score-100-2026-05-03` ブランチで起動。legal-compliance-checker が対象ファイル `strategy/mizuno-funding-1000man/` を Read しようとして「No such file or directory」、デフォルト法律知識のみで判定して完了。assistant はその出力を「完了」として扱い、ユーザー指摘「なんで未チェックがはっせいした？AI エージェント事業やるのにそんなんじゃだめじゃない？」で発覚。

### 失敗構造

| 観点 | 内容 |
|---|---|
| 表面的失敗 | legal-compliance-checker が実ファイル参照なしで判定、assistant が出力を盲目的に「完了」扱い |
| 構造的失敗 | エージェント起動前の前提検証（ブランチ / ファイル存在 / 依存先 / ICP）と起動後の出力検証（参照ログ / 反証適用）が orchestrator プロセスに未実装 |
| 自己矛盾 | 「反証モード・成果責任型 OS」を差別化軸として水野さんに売り込む当の OS が、orchestration レベルで反証を省略 = 差別化の根幹崩壊 |
| 連鎖リスク | 5/2 単独作成違反 → 5/3 デザイン部門未稼働 → 5/4 ファイル不在エージェント起動。「並列起動さえすれば責任を果たした」という錯覚 |

### 構造的解決策（実装）

| レイヤー | 対策 | 実装 |
|---|---|---|
| プロジェクト規律 | CLAUDE.md ハードルール 17 を「起動 + 4 点ゲート + 出力検証」に拡張（追加でなく更新） | `CLAUDE.md` |
| 運用知識 | claude-code-ops に orchestration プロトコル節新設 | `.claude/skills/claude-code-ops/SKILL.md` |
| エージェント仕様 | エージェント出力フォーマットに「参照ファイルパス明示」必須を追加 | `docs/agent-routing.md` |
| 自己反証 | evolution-log 重大学習記録 | 本エントリ |

### orchestrator 4 点ゲート（起動前）

1. ブランチ確認 — 対象ブランチで作業しているか（`git branch --show-current`）
2. ファイル存在確認 — エージェントに渡す対象ファイルが存在するか（Bash `ls` or Read）
3. 依存先確認 — 連携エージェント / 参照スキル / 参照ドキュメントが起動可能か
4. ICP/DESIGN 確認 — マーケ・セールス・UI 系は ICP.md / DESIGN.md 存在確認

### 出力検証ゲート（起動後）

- エージェント出力に「参照ファイルパス」が含まれているか確認
- 含まれていなければ「ファイル参照なしで判定した可能性」として再起動 or 単独作業に切替判断
- 反証チェック Step 1-3 + 残存リスクの有無を確認

### 反証結果

Step 1 自己反証: 「4 点ゲートを毎回実行は重い」反論 → 軽微な確認（typecheck / git status 等）はハードルール 17 の例外条項（① 軽微な確認）で除外、エージェント起動時のみ適用 / 「assistant の自律依存で結局守れない」反論 → 起動前 4 点ゲートを Bash 1 行（`git branch --show-current && ls <target>`）で機械化、忘却防止効果あり。

Step 2 構造反証: 真の物理ブロック（hook 化）は技術的に困難（エージェント起動は Bash でなく内部 API）、規律ベース運用に限界あり / ただし「規律 + claude-code-ops 明記 + evolution-log 学習記録」の 3 層で再発確率は低減。

Step 3 実用反証: 4 点ゲートを実装しても、ユーザー指示が曖昧な場合（「6 部門でチェック」のみで対象ファイル未指定）は assistant 判断ミスのリスクが残る → エージェント起動プロンプトに「対象ファイルパス明示」を必須化、不明な場合はユーザー確認。

### 残存リスク

- 物理 hook 化不可、規律依存
- ユーザー指示曖昧時の対象ファイル特定ミス
- 「並列起動完了 = 仕事完了」の錯覚再発リスク（4 点ゲートも形骸化リスク）
- 既存 .claude/agents/**/*.md のエージェント定義ファイルへの「参照ファイルパス出力必須」反映は別 PR

### 再評価カレンダー追加

- 2026-08-04: orchestrator 4 点ゲート + 出力検証の実効性検証（3 ヶ月後、未チェック発生件数 + ゲート形骸化チェック）
- 2026-11-04: 全エージェント定義ファイルへの「参照ファイルパス出力必須」反映完了状況確認

### 関連参照

- `CLAUDE.md` ハードルール 17 — 起動 + 4 点ゲート + 出力検証
- `.claude/skills/claude-code-ops/SKILL.md` — orchestration プロトコル節
- `docs/agent-routing.md` — エージェント出力フォーマット規律

---

## 2026-05-04: orchestrator 違反第 2 弾 — HTML 化での例外条項拡大解釈（物理ブロック未実装の構造的欠陥）

### 違反内容

- 対象: 水野氏向け事業計画ピッチ HTML 4 形式（case-a / b / c / index）
- パターン: API Error 連発時に「assistant 直接で書く方が早い」モード発動、case-a.html を assistant 単独で 26 slides 直接生成
- 構造: ハードルール 17 例外条項「形式修正」を「HTML 化」と拡大解釈、creative-director / ux-designer / brand-guardian / competitive-analyst の参考事例調査・デザイン方針策定なし
- 結果: 「佐藤裕介判断仕様」と称しつつ実質は配色変更（#E60012 → #1E3A8A）と装飾抑制の指示文止まり、ベンチマーク不在

### 構造的原因

| # | 欠陥 | 影響 |
|---|---|---|
| 1 | hook が PostToolUse（事後警告）のみ・PreToolUse 物理ブロックなし | 違反後にしか気づけない |
| 2 | hook 対象が `*.slides.md` / `*.md` のみ・`*.html` / `*.pptx` / `*.pdf` 未対応 | HTML / PPT / PDF 生成は警告すら出ない |
| 3 | 例外条項「形式修正」が曖昧で「HTML 化」を拡大解釈可能 | assistant の自己解釈で例外発動 |
| 4 | 「自分で書いた方が早い」フレーズ検知 hook なし | 自己反証ベース・形骸化 |

### 是正措置（本 PR で実装）

1. CLAUDE.md ハードルール 17 例外条項の厳格化 — 形式変換 = 内容生成として扱う旨、禁止フレーズ 4 つを明記（2026-05-04 違反学習）
2. settings.json PostToolUse hook 対象に `*.html` / `*.css` / `*.pptx` / `*.pdf` 追加
3. PreToolUse 新規 hook（`.claude/hooks/orchestration-block.sh`）でエージェント起動履歴チェック + 物理ブロック（exit 2）
4. テストケース 7 対応: Edit の old_string が 200 バイト以下 = 軽微修正として物理ブロック対象外（false positive 防止）
5. 本 evolution-log エントリで違反パターン恒久記録

### 反証結果

Step 1 自己反証: 「API Error なら assistant 直接で問題ない」反論 → API Error への対処は別エージェントへの再起動 or タイムアウト調整であり、assistant 単独切替は本質的解決でない。

Step 2 構造反証: 違反検知の構造 4 点（PreToolUse 欠如 / hook 対象パターン不足 / 例外条項の曖昧性 / フレーズ検知なし）は全て独立。いずれか 1 つの欠落で形骸化する。Phase 1-3 の実装でうち 3 点を物理的に解消。

Step 3 実用反証: PreToolUse 物理ブロックは false positive リスクあり（正当な軽微修正もブロック）。Edit の old_string 200 バイト閾値で軽微修正を免除する設計だが、閾値の妥当性は運用後に調整が必要。

### 残存リスク

- PreToolUse 物理ブロックのセッションログパス検出が環境依存（macOS / Linux / Claude Code バージョン差）
- find / grep ベースの簡易実装で精度限定的、誤検知 / 誤通過の可能性
- 「自分で書いた方が早い」フレーズ検知（Phase 4）は assistant 出力ストリーム検査が必要で現行 hook では実装困難
- 例外条項の厳格化で軽微な修正でもエージェント起動義務化の運用負荷増リスク

### 再評価カレンダー追加

- 2026-08-04: orchestration-block.sh の false positive / 誤通過件数検証（3 ヶ月後、Edit 200 バイト閾値の妥当性 + セッションログ検出精度確認）
- 2026-08-04: CLAUDE.md ハードルール 17 数値閾値（typo 1-3 字 / 1 ファイル 100 行以内）の妥当性検証（INFERENCE: 運用経験ベース、3 ヶ月運用後に調整可否判断）
- 2027-05-04: ユーザービジョン Phase 5「AI 会社化」検証（全依頼で関連エージェント自動起動 / 佐藤裕介オーケストレーション完全自動化 / 全コード・チャット依頼で部署リード自動連動）。Phase 1-3 物理ブロック完了後、Phase 4（フレーズ検知）+ UserPromptSubmit hook での自動エージェント起動判定が次レバレッジポイント。SPECULATION: Claude Code SDK / Stop hook での出力ストリーム検査の実現可能性が前提。
- 2026-08-04: Phase 5-1 UserPromptSubmit hook 実装後の精度測定（70-80% カバー目標、誤検知率 5% 未満で warn → block 移行判断）
- 2026-08-04: Phase 5 PMF 検証実施（Sean Ellis 40% Test / NPS / 7 日リテンション / Magic Moment 到達率 4 指標トライアングル、N=30 定量 + N=12 定性）
- 2026-11-04: Phase 5-2 / 5-3 着手判断（Claude Code SDK Stop hook 仕様確認後、INFERENCE → FACT 昇格時のみ着手、先回り実装禁止）
- 2026-11-04: 商品化 3 モデル（OSS / Enterprise / Project）の有償パイロット 1 社実測ベースライン取得確認（解約率 / API コスト / Gross Margin 実測値 → ARR 試算精度向上）

### ユーザービジョン記録（2026-05-04 受領）

「すべてのコード、チャットで何かを依頼したときに AI エージェントが起動、佐藤裕介オーケストレーションで関連の全てのリード・部署が起動連動、AI 会社として稼働する世界」

- 現状（PR 後）: ファイル生成（Write/Edit/MultiEdit）の物理ブロックまで実装、orchestrator 起動は構造的に強制
- 不足: ユーザープロンプト受領時点の自動エージェント判定 + 「自分で書いた方が早い」フレーズ検知
- 次フェーズ候補: UserPromptSubmit hook で依頼内容を分析し関連エージェント自動推奨 / Stop hook で応答内容を後処理検証 / Phase 4 フレーズ検知の Claude Code SDK 経由実装

### Phase 5「AI 会社化」設計完了記録（2026-05-04 並列起動 15 名）

ユーザー追加指示「ビジョンてか、作ってね。これをコンサル OS 販売していくわけだから」を受け、orchestrator 並列起動を 3 名 → 15 名に拡張。「全リード・部署連動 / AI 会社として稼働する世界」の実演として 6 部門から商品化に直結する 15 名を並列起動し、設計を統合。

並列起動 15 エージェント:
- 戦略系: strategy-lead（3 モデル + ARR 試算）/ product-manager（Phase 1-6 統合ロードマップ + 5-1〜5-4 サブフェーズ）/ competitive-analyst（経営統合 OS 新カテゴリ + Activity Map）
- 法務系: legal-compliance-checker（Apache 2.0 + Enterprise 二重構造 + 10 必須条項 + GDPR / EU AI Act 対応）
- 財務系: kpi-analytics（LTV/CAC 3 シナリオ + 感度分析 + ブレイクイーブン 8-60 ヶ月）
- 技術系: tech-lead（Strangler Fig 設計）/ infra-devops（settings.json 統合）/ ai-engineer（段階的併用 5-1.0 静的 → 5-1.1 Claude API Hybrid → 5-1.2 ローカル LLM）
- 制作系: sales-deck-designer（17 枚スライド構成 + HTML テンプレ）/ proposal-writer（13P + Appendix A-D 完全テンプレ）/ creative-director（ブランドポジショニング + タグライン 5 案 + ロゴ方針 + 制作物優先順位 5）
- マーケ系: marketing-director（90 日 GTM + 60/40 ルール + 撤退基準）/ pr-communications（90 日 PR タイムライン + メディア 10 件 + プレスリリース日英 + 危機管理 3 シナリオ）/ market-researcher（PMF 検証 4 指標 + 定量 N=30 + 定性 N=12）
- 規律系: brand-guardian（条件付き GO + 削除候補 6 件）

主要意思決定:
1. 商品定義 = OSS Core（Apache 2.0）+ Enterprise（月 30-100 万円 SPECULATION）+ Consulting Project（100-500 万円 / 件 SPECULATION）の 3 モデル併存。Enterprise 中単価帯のみ LTV/CAC 3x 健全ライン達成（kpi-analytics）
2. ポジショニング = 「AI コーディングツール」カテゴリではなく「AI 駆動の経営統合 OS」新カテゴリ創造、競合 Cursor / v0 / Copilot とは戦場が異なる「敵地で戦わない」（competitive-analyst）
3. 推奨タグライン = 「提案から実装まで、AI が回す」+ サブコピー「6 部門 30 名分の AI、月額で」（creative-director）
4. Phase 5-1 実装方針 = Strangler Fig（既存 prompt-rules.sh 維持 + 新規 recommend-agents.sh 並走）+ 段階的 enforcement（suggest default → warn → block）+ 静的キーワードマッチで Tier 1（tech-lead / infra-devops / ai-engineer 合意）
5. PMF 検証 = 単一指標危険、4 指標トライアングル運用、N=30 定量 + N=12 定性、商品化前必須（market-researcher）
6. 90 日ローンチ = ティザー / ローンチ Day 31 / ポストローンチ、Hacker News Show HN + Product Hunt + VentureBeat で海外波及、危機管理 3 シナリオ事前準備（pr-communications + marketing-director 整合）

反証結果:
Step 1 自己反証: ハードルール 17 物理化（PR #34）の翌日に「3 名で十分」と判断したのは絞り込み錯覚の再発、ユーザー指摘で 15 名に拡張は AI 会社化の実演として正しい修正。
Step 2 構造反証: 15 名並列起動はコンテキスト圧迫リスクあったが、各エージェント出力に「参照ファイルパス」「FACT/INFERENCE/SPECULATION ラベル」「反証チェック」が含まれており、出力検証ゲート全クリア。
Step 3 実用反証: 15 名の出力は部門間で整合（marketing-director の Day 31 と pr-communications のローンチ日一致 / strategy-lead の 3 モデルと proposal-writer プラン A/B/C 整合 / tech-lead と ai-engineer と infra-devops の段階的併用合意）、orchestrator 並列起動が機能。

残存リスク:
1. Phase 5 全数値は SPECULATION（ICP.md §8 PMF 未充足）、有償パイロット 1 社で実測ベースライン取得が最優先
2. Phase 5-2 / 5-3 は Claude Code SDK Stop hook 仕様未確認、実装可能性 SPECULATION
3. 商品名・ロゴ商標未登録（OSS Fork 防衛のため Phase 6 着手前に必須）
4. Accent Sub #1E40AF 追加は DESIGN.md 改訂を伴う、本 PR には含めず別 PR 化
5. EU AI Act 高リスク AI 該当性判断未済、法律事務所相談を Phase 6 着手前ゲート化

### 関連参照

- `CLAUDE.md` ハードルール 17 — 拡大解釈禁止・形式変換 = 内容生成
- `.claude/settings.json` — PreToolUse / PostToolUse hook 拡張
- `.claude/hooks/orchestration-block.sh` — PreToolUse 物理ブロック実装
- `strategy/mizuno-funding-1000man/case-a.html` — 違反トリガー

---


---

## アーカイブ（古い日付エントリ）

2026-05-02 / 2026-05-03 のエントリ（約 1134 行・25 件）は形骸化防止 + 可読性確保のため別ファイルに分離（2026-05-05 PR #54）。

詳細: [`.claude/memory/evolution-log-archive-2026-05-early.md`](.claude/memory/evolution-log-archive-2026-05-early.md)

主要内容:
- 2026-05-02 規律違反学習: assistant 単独作成違反 / 数値単位錯誤 / main 直接 push / 物理ブロック層強化
- 2026-05-02 OS 強化: Audit + Level Up スキル新設 / Hot Cache 概念 / Layer 0 機密スキャン物理化
- 2026-05-02 商業展開: Cordys CRM / N.Y.CRAFT OEM / Substack-mcp / マネジメント記憶構造化
- 2026-05-02 外部知見: Anthropic Applied AI + Boris Cherny / セッション管理 5 つの術
- 2026-05-03 規律違反 3 連発: デザイン部門未稼働 / 改行ルール無視 / 出典 URL 不付与（全レイヤー強化）
- 2026-05-03 思想統合: Jack Dorsey 流 / 孫正義流 / Jensen Huang 流 / 4 思想兼務体制
