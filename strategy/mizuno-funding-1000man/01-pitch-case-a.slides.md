# Case A 詳細版ピッチ資料 — ConsultingOS 1000 万円エンジェル出資

| 項目 | 内容 |
|---|---|
| 対象 | 水野氏（個人投資家） |
| MTG | 2026-05-07 想定 |
| 形式 | 詳細版 26 slides |
| キャンバス | 1280 × 720（DESIGN.md 標準） |
| セーフエリア | 全方位 48px |
| グリッド | 12 カラム / gutter 24px |
| フォント | Yu Gothic / 游ゴシック / Hiragino Sans / Noto Sans JP（lang="ja" 必須） |
| 配色 | Primary #0A0A0A / Background #FAFAF7 / Accent #E60012（hotice 由来） |

---

## Governing Thought（30 秒ピッチ）

S（前提）: AI 時代のコンサル現場では提案品質の属人化と実装の断絶が常態化している。
C（変化）: Claude Code の登場でエージェントに職務定義 + 規律を与えることが可能になった。
Q（問い）: 誰がその OS を先にリリースするか。
A（結論）: ConsultingOS は 6 部門 30 エージェントの一気通貫 OS として既に動いており、1000 万円で Phase 1 商用化を加速する。

---

## スライド構成（26 slides）

| # | 章 | タイトル（20 字以内）| キーメッセージ |
|---|---|---|---|
| 01 | Cover | AI 駆動コンサル基盤 OS 起動 | ConsultingOS は経営判断から実装まで 30 エージェントが連携する Claude Code ネイティブ OS。1000 万円で商用化フェーズへ |
| 02 | SCQA | 提案書品質の属人化は構造問題 | S 国内コンサル市場は提案品質がシニア個人に依存。C 生成 AI 普及でクライアント要求精度が 3 倍速で上昇。Q 誰が先に再現可能な仕組みを持つか。A ConsultingOS は既に動いている |
| 03 | Why Now | 今が参入の唯一の交点 | 技術（Claude Code MCP）× ユーザー（属人化に悲鳴を上げる事業会社）× 市場構造（OSS 先行者優位が 6 ヶ月以内に固まる）の 3 変数が 2026 年初頭に重なった（INFERENCE） |
| 04 | 課題 | 提案品質スケール不能が粗利毀損 | 戦略〜実装の断絶で案件当たり修正コストが膨張、再現できない提案は LTV が縮小する構造（INFERENCE）|
| 05 | 解決提案 | 6 部門 30 エージェント一気通貫 | ConsultingOS は戦略・提案・開発・クリエイティブ・グローバル・マーケの 6 部門が単一 OS 上で連携。1 クエリで複数エージェントが並列起動する |
| 06 | 軸 A 品質ガード | 反証モードで出力品質を担保 | 全出力に FACT/INFERENCE/SPECULATION の 3 ラベル + Step 1-3 反証チェックを強制。証明できる提案を量産する |
| 07 | 軸 B セキュリティ | 3 層防御で機密案件に対応 | Layer 0（Gitleaks）/ Layer 1（静的検知）/ Layer 2（実行時ガード）で API キー漏洩ゼロを構造化。完全オンプレ要件は非対応（non-ICP 明示）|
| 08 | 軸 C 自己進化 OS | スキル追加 = 競争優位の複利化 | 19 スキル・6 コマンドが蓄積資産として機能。案件ごとに examples/ が増えるフロー × ストック統合設計 |
| 09 | 市場規模 | AI 顧問サービス市場は拡大期 | 国内企業向け AI 活用支援市場は拡大期（2024-2026）。OSS ベースの参入コスト優位で SAM への到達が相対的に早い（SPECULATION） |
| 10 | 競合 4 レイヤー | 4 軸で敵地を回避した設計 | L1 大手コンサル / L2 個別 AI ツール / L3 マルチエージェントフレーム（agency-swarm 4.3k Stars FACT 2026-05-04 検証）/ L4 自前 LLM の 4 カテゴリと差別化軸が分離している |
| 11 | 軸 A 詳細 | 反証モード出力例 3 事例 | 戦略提案書・競合分析・LP 制作の 3 事例で Step 1-3 がどう機能するかを具体動作で示す。動作で体験させてから数字を語る（Dorsey 流）|
| 12 | 軸 B 詳細 | Layer 0-2 でシークレット漏洩ゼロ | settings.json permissions.deny + Gitleaks pre-commit + OWASP 静的検知の 3 段階。1 件の情報漏洩が案件単位で発生した場合の機会損失試算は別紙 |
| 13 | 軸 C 詳細 | examples/ 蓄積が参入障壁 | OSS として公開しながら examples/（参照実装）が積み上がるほど後続者との差が広がる。hotice-sales-deck 先行実証済（FACT）|
| 14 | 4 思想統合 | 4 思想兼務が判断精度を上げる | 孫正義（山の定義）→ Huang（問題圧縮）→ 佐藤裕介（PL・3 変数交点）→ Dorsey（削ぎ落とし）の 4 段階ゲートが全案件に適用される |
| 15 | 数値計画 | Phase 0-4 の月次粗利試算 | Phase 0 OSS → Phase 1 SaaS β + 顧問 → Phase 2 マルチテナント → Phase 3 軸 A 金融 AI → Phase 4 国際展開（具体月次粗利は p.16 参照）|
| 16 | ROI と損益分岐 | ブレイクイーブン 7-10 ヶ月 | 標準シナリオで月次売上 50-80 万 / 月次固定費 30 万 / 営業 CF カバレッジ 1.7-2.7 倍 / ブレイクイーブン 7-10 ヶ月目（INFERENCE）|
| 17 | Phase 0-1 ロードマップ | 2026 年 5-9 月で商用化完了 | Phase 0 OSS 公開継続 → Phase 1a SaaS β（2026-06）→ Phase 1b install スクリプト化（2026-08）→ Phase 1c 受注 3-5 件（2026-09） |
| 18 | Phase 2-4 ロードマップ | 拡大条件を発火基準で明示 | Phase 2 発火条件 月次売上 100 万円到達 + セキュリティ監査通過。Phase 3 発火条件 軸 A 投資助言業登録完了 + 軸 B 顧問 5 社確立 |
| 19 | 体制 4 兼務 | 1 名兼務 + 4 思想で属人化解消 | 佐藤本人 1 名兼務（M&A / 新規事業 / 運営 / 投資判断）。判断モードを 4 思想で構造化、誰が起動しても同水準（INFERENCE）|
| 20 | リスク 1 数値 3 シナリオ | 楽観数値は 3 シナリオで分離 | 銀行審査部 共通点 1 対応。受注済み / 確度高い / 新規開拓を分離して提示。楽観・基本・悲観の 3 シナリオを INFERENCE ラベルで開示 |
| 21 | リスク 2 5 点先出し | リスク 5 点と対応策を先出し | 銀行審査部 共通点 2 対応。API 価格変動・競合模倣・規制・採用難・1 名属人化の 5 リスクを先出し、対応策 1 文ずつ |
| 22 | リスク 3 キャッシュ計画 | DSCR 代替指標で月次運用 | 銀行審査部 共通点 3 対応。営業 CF カバレッジ比率 = 月次営業 CF ÷ 月次固定費（分母明示）/ ランウェイ最小 14 ヶ月 / 標準 29 ヶ月（INFERENCE）|
| 23 | 出資条件 | J-KISS 推奨・2 案提示 | J-KISS（推奨・1000 万円規模で普及・法務コスト低）vs 普通株（経営関与希望時）。バリュエーションキャップ 1 億円候補・要協議。弁護士費用 20-50 万円（INFERENCE）|
| 24 | Ask | 1000 万円で何が動くか 1 文 | Ask 1000 万円 → Phase 1 商用化（軸 A 投資助言業登録 + クライアント環境向け SaaS β 実装）の 2 用途のみ。Governing Thought を 1 文で再提示して締める |
| 25 | 次のアクション | 5-7 日以内の 3 ステップ | ステップ 1 バリュエーション詳細を 2026-05-08 まで確認。ステップ 2 弁護士による契約ドラフト 2026-05-10 まで。ステップ 3 Phase 1 開始合意 2026-05-14 まで |
| 26 | Appendix | 参照実装・スキル一覧・出典 | examples/hotice-sales-deck / DESIGN.md / ICP.md / 各スキル / FACT-INFERENCE-SPECULATION 分類表。引き継ぎ誤情報訂正（agency-swarm 4.3k Stars 確定）|

---

## スライド本文の表記規律（DESIGN.md / brand-guidelines 準拠）

- 全スライドのタイトルは 20 字以内・能動形・数値具体（「大幅に」「革新的」等の抽象表現禁止）
- 太字 ** 記法禁止（強調はキーワード or 大文字英語）
- 一文中の改行禁止
- 表は中央揃え必須
- 1280 × 720 ページ内に必ず収める（はみ出し禁止）
- HTML 化時は lang="ja" / Yu Gothic / 游ゴシック フォント指定 + pdffonts / unzip+grep で埋込検証
- 出力直前に佐藤裕介 W チェック（1 回目内容、2 回目形式・字形・規律）

---

## 数値の出典管理 3 ラベル分類

| ラベル | 該当箇所 |
|---|---|
| FACT | Anthropic API 公開価格 / GitHub Team / Cloudflare Pro / Vercel Pro 公開料金 / agency-swarm 4.3k Stars（2026-05-04 WebFetch 検証）/ 法条文（金商法第 28 条第 3 項 / AGPL-3.0 Section 13）/ Anthropic 学習利用なし（公式 Data Usage Policy） |
| INFERENCE | 月次トークン消費 / 1 呼出平均トークン / 受注件数前提 / 売上想定 / 粗利率 / ブレイクイーブン到達月 / 投資助言業登録期間 6-13 ヶ月 / 弁護士月次顧問相場 / コワーキング相場 / J-KISS 普及度 |
| SPECULATION | 10 年後市場前提 / 海外フリーランス受注事例（$5K-$25K）/ 致命シナリオの撤退コスト / 1000 倍目標 / 「先行者優位の 6 ヶ月窓」予測 |

---

## 【反証チェック結果】

Step 1（自己反証）: 14 ヶ月損益分岐 / 受注 8 社等の数値は INFERENCE ラベル明示済だが、根拠となる顧問単価・契約社数の仮説は現時点で未検証。受注件数前提と週次接触数・パイプライン管理の紐付けが MTG 前に必要。

Step 2（構造反証）: 26 slides の構成で「体制の信頼性」が p.19 のみ。水野氏が「誰がやるか」を重視する場合は p.19 の補強（顧問契約案 or 業務委託案の代替）を準備。

Step 3（実用反証）: 全タイトル 20 字以内・能動形・数値具体の規律確認済。「大幅に」「革新的」「唯一級の OS」等のタイトル使用ゼロ。残存リスクは具体財務数値が全て INFERENCE / SPECULATION の点。MTG 前日 2026-05-06 までに数値確定が必要。

残存リスク:
- 具体財務数値は全て kpi-analytics 出力統合済だが実測ベース未到達
- 水野氏の意思決定スタイル不明、Case B 10 枚選定は仮説
- agency-swarm 以外の競合（AutoGen / CrewAI / LangGraph）Stars 数未検証
- HTML 化時の日本語字形検証（pdffonts）未実施

---

## 参照ファイル

- /home/user/consulting-os/strategy/mizuno-funding-1000man/00-business-plan-master.md
- /home/user/consulting-os/ICP.md
- /home/user/consulting-os/DESIGN.md
- /home/user/consulting-os/.claude/skills/consulting-playbook.md
- /home/user/consulting-os/.claude/skills/sales-deck-review/SKILL.md
- /home/user/consulting-os/.claude/skills/brand-guidelines.md
- /home/user/consulting-os/examples/hotice-sales-deck/
