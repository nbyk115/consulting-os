# 事実検証・訂正ログ — 水野氏 1000 万円エンジェル出資案件

| 項目 | 内容 |
|---|---|
| 起案日 | 2026-05-04 |
| 検証担当 | assistant（オーケストレーター）+ competitive-analyst（指摘）|
| 目的 | 引き継ぎ文書の前提・各エージェント出力の数値検証ログを残し、MTG 前の最終 W チェックに使用 |

---

## 1. 引き継ぎ文書記載の重大な誤情報訂正

| # | 誤記載 | 正しい情報 | 検証日 | 検証方法 |
|---|---|---|---|---|
| 1 | agency-agents 91.6k Stars | agency-swarm（VRSEN/agency-swarm）4.3k Stars | 2026-05-04 | WebFetch /VRSEN/agency-swarm |
| 2 | リポジトリ名「agency-agents」 | 正しくは「agency-swarm」 | 2026-05-04 | GitHub VRSEN/agency-swarm 直接確認 |

訂正の重要性: 水野氏が銀行審査部出身として「数値根拠」を最重要視するため、誤情報の提示は信頼毀損につながる。MTG 前の Case A / Case B / マスター文書すべてで FACT 4.3k Stars に統一済。

---

## 2. 各エージェント出力の FACT / INFERENCE / SPECULATION 分類サマリー

### FACT（出典明示済・断言可能）

- Anthropic API 公開価格: Opus 4.7 Input $15 / Output $75 / Cache Read $1.50（百万トークン）/ Sonnet 4.6 Input $3 / Output $15 / Haiku 4.5 Input $0.80 / Output $4（出典: Anthropic 公式 pricing ページ・2026-04 時点）
- Cache Read = Input の 1/10、Cache Write = Input の 1.25 倍（出典: Anthropic 公式仕様）
- Anthropic 学習利用なし（出典: 公式 Data Usage Policy）
- 過去の Opus 価格改定実績: Opus 3 → 4 で価格変更あり（出典: Anthropic アナウンス）
- 12 ヶ月 deprecation 通知ポリシー（出典: Anthropic 公式モデルライフサイクル）
- 金融商品取引法第 28 条第 3 項（投資助言・代理業）の登録要件（出典: 法条文）
- AGPL-3.0 Section 13 SaaS 提供時のソース開示義務（出典: AGPL-3.0 ライセンス本文）
- agency-swarm GitHub Stars: 4.3k（2026-05-04 WebFetch 検証）
- ConsultingOS 30 エージェント・19 スキル・6 コマンド OSS 公開済（出典: 当リポジトリ）
- SDK Phase 1（claude-code-action@v1）PoC 完了（出典: evolution-log.md / sdk-automation.md）
- GitHub Team / Cloudflare Pro / Vercel Pro 公開料金（出典: 各公式 pricing）
- hotice-sales-deck 先行実証済（出典: examples/hotice-sales-deck/）

### INFERENCE（推測・出典あり・幅明示）

- 月次 API コスト 3 万 / 8 万 / 15 万円（出典: Anthropic 公式価格 + 1 呼出平均トークン 8K/2K の逆算 + キャッシュ率 50-70% / 実測前）
- 月次固定費 12-15 万 / 28-35 万 / 55-70 万（出典: 各業種公開料金体系の積算）
- 投資助言業登録期間 6-13 ヶ月（出典: 金融庁公式資料 + 個別案件別バリエーション）
- 投資助言業登録費用 100-300 万円（出典: 司法書士・弁護士報酬の市場相場）
- 弁護士月次顧問 5-20 万円（出典: 業界相場・幅あり）
- 東京コワーキング相場 月 1.5-3 万円（出典: 業界相場）
- AGPL-3.0 確認: Twenty CRM / EspoCRM Community / SuiteCRM（出典: GitHub LICENSE 2024 確認情報）
- J-KISS 普及度: 500-3000 万円エンジェルラウンドで最普及（出典: スタートアップコミュニティ情報）
- 受注件数前提（標準シナリオ 8 社）（出典: ICP.md 9.2 + 仮説）
- ブレイクイーブン 7-10 ヶ月目（標準シナリオ）（出典: 上記積算）
- agency-swarm 等の汎用フレームワークと ConsultingOS の差別化軸（出典: 各リポジトリの目的記述比較）

### SPECULATION（推測・出典限定的・幅大）

- 1000 倍目標の 10 年後達成可能性（孫正義流目標設定）
- 「先行者優位の窓は 6 ヶ月以内に固まる」予測（類似 OSS 事例からの類推）
- 海外フリーランス受注事例: 月 $5K / $10K / $25K（出典: 個人ブログ・X 投稿ベース・サンプル数少・日本市場での同単価未検証）
- 致命シナリオ（軸 A 不可）でのブレイクイーブン到達困難判定
- Q8「3 年後の出口戦略」(c) 独立上場の蓋然性
- Phase 4 国際展開時の各国 AI 規制（EU AI Act / 米 SR 11-7）への準拠コスト
- ジュニア人件費 月 0-20 万円（採用前の想定）

---

## 3. MTG 前 W チェック（佐藤裕介流）

### 1 回目チェック: 内容

- [ ] 山 A の言語化が 1 文で水野氏に届くか
- [ ] Huang テスト 3 点が共同探索形式で設計されているか
- [ ] 3 変数交点（技術 / ユーザー / 市場構造）の根拠が明示されているか
- [ ] 数値が全て FACT / INFERENCE / SPECULATION でラベル付与されているか
- [ ] リスク 5 点が先出しされ対応策と紐付いているか
- [ ] Ask が 1-2 用途に絞られているか（Dorsey 削ぎ落とし）
- [ ] J-KISS / 普通株の 2 案が水野氏視点で提示されているか
- [ ] Q&A 10 問への回答が能動形・FACT/INFERENCE/SPECULATION 付きか
- [ ] Fess Up Early 規律が MTG 後の 3 パターンに反映されているか

### 2 回目チェック: 形式・字形・規律

- [ ] 太字 ** 記法ゼロ
- [ ] 一文中の改行ゼロ
- [ ] 表が中央揃え対応
- [ ] スライド 1280×720 ページ内収まり（HTML 化時）
- [ ] HTML 化時 lang="ja" / Yu Gothic / 游ゴシック フォント指定
- [ ] PDF 化時 pdffonts で埋込フォント検証（Noto Sans CJK 無印 / SimSun 等の中国字形検出ゼロ）
- [ ] DOCX/PPTX 化時 unzip+grep で w:lang / lang 確認
- [ ] 反証チェック Step 1-3 + 残存リスクが全文書末尾に存在
- [ ] 引用元ファイルパスが各文書末尾に列挙

---

## 4. 弁護士確認待ち項目（優先順）

| # | 項目 | 担当 | 期限 |
|---|---|---|---|
| 1 | 投資助言業登録の要否（具体サービス設計ベース）| legal-compliance-checker + 弁護士 | MTG 前 |
| 2 | AGPL-3.0 SaaS 提供時のソース開示義務範囲確定 | legal-compliance-checker + 弁護士 | MTG 前 |
| 3 | J-KISS / 種類株の選択と契約書ドラフト | legal-compliance-checker + 弁護士 | MTG 直後 |
| 4 | 下請法の親事業者義務適用可否 | legal-compliance-checker + 弁護士 | MTG 直後 |
| 5 | Cordys CRM の正確なライセンス特定 | legal-compliance-checker | MTG 前 |
| 6 | 紹介手数料覚書ドラフト確定 | legal-compliance-checker + 弁護士 | MTG 後 |

---

## 5. MTG 当日の持参物チェックリスト

- [ ] Case A 詳細版 26 slides（HTML / PPTX / PDF いずれか）
- [ ] Case B 圧縮版 10 slides（即出可能形式）
- [ ] Case C 1 ページサマリ（メール送付用 + PDF 印刷用）
- [ ] 事業計画マスター文書（紙 or 電子）
- [ ] Q&A 想定問答集（10 問）
- [ ] J-KISS テンプレート（500 Startups Japan 版）参考資料
- [ ] ConsultingOS デモ環境（Claude Code 実演用）
- [ ] 参考資料: ICP.md / DESIGN.md / consulting-playbook.md（参照可能な状態）

---

## 【反証チェック結果】

Step 1（自己反証）: 訂正ログを誠実に残すことで信頼性を確保したが、agency-swarm 4.3k Stars 以外の競合（AutoGen / CrewAI / LangGraph / OpenAI Swarm）の Stars 数を未検証のまま FACT/INFERENCE 区別している。MTG 前に WebFetch で全件検証推奨。

Step 2（構造反証）: 「FACT / INFERENCE / SPECULATION」分類は出典の質に依存するが、INFERENCE の幅が広い項目（受注件数前提・ブレイクイーブン到達月）が「数字を出すこと自体が SPECULATION」に近い性質を持つ。MTG での開示時に「実測前」「前提変更で大幅変動」を口頭でも補強必須。

Step 3（実用反証）: W チェックリストは MTG 前日の最終確認として有効。ただし、HTML / PDF / PPTX 化が未完了の現状では字形検証が机上のチェックに留まる。sales-deck-designer 起動 → ファイル生成 → pdffonts 検証の実装が必須。

残存リスク:
- AutoGen / CrewAI / LangGraph / OpenAI Swarm の Stars 数未検証（MTG 前に追加検証推奨）
- 弁護士確認待ち 6 項目のうち 3 項目（投資助言業要否 / AGPL 範囲 / Cordys CRM ライセンス）は MTG 前必須
- HTML / PDF / PPTX 化が未完了で字形検証が机上止まり
- 担当者連絡先（メール・電話）が未確定で Case C メール本文に空欄あり

---

## 参照ファイル

- /home/user/consulting-os/strategy/mizuno-funding-1000man/00-business-plan-master.md
- /home/user/consulting-os/strategy/mizuno-funding-1000man/01-pitch-case-a.slides.md
- /home/user/consulting-os/strategy/mizuno-funding-1000man/02-pitch-case-b.slides.md
- /home/user/consulting-os/strategy/mizuno-funding-1000man/03-pitch-case-c.md
- /home/user/consulting-os/strategy/mizuno-funding-1000man/04-mtg-playbook.md
- /home/user/consulting-os/.claude/skills/brand-guidelines.md
- /home/user/consulting-os/.claude/skills/falsification-check.md
- /home/user/consulting-os/CLAUDE.md
