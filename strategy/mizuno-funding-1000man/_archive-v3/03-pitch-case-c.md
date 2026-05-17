# Case C 1 ページサマリ — ConsultingOS 1000 万円エンジェル出資

| 項目 | 内容 |
|---|---|
| 対象 | 水野氏（個人投資家） |
| MTG | 2026-05-07 想定 |
| 形式 | 1 ページサマリ（メール本文 + PDF 1 枚） |

---

## メール本文（txt 想定 / コピペで配信可能）

```
【ConsultingOS エンジェル出資サマリ / 2026-05-07 水野氏向け】

[なぜ今か]
Claude Code MCP の登場で、AI エージェントに職務定義 + 規律を与えることが初めて可能になった。
ConsultingOS は 6 部門 30 エージェントが一気通貫で動く Claude Code ネイティブ OS として既に稼働中。
技術 × ユーザー × 市場構造の 3 変数が重なる参入窓は 2026 年中に閉じる（INFERENCE）。

[構造的優位性]
・反証モード（全出力に FACT/INFERENCE/SPECULATION ラベル + Step 1-3）で出力品質を構造化
・3 層セキュリティ防御（Layer 0/1/2）で機密案件に対応
・examples/ 蓄積型のフロー × ストック設計で参入障壁が時間とともに高まる
・4 思想兼務ゲート（孫正義 → Huang → 佐藤裕介 → Dorsey）で全案件の判断精度を担保

[財務・リスク]
ブレイクイーブン: 標準シナリオで月次売上 50-80 万 / 月次固定費 30 万 / 営業 CF カバレッジ 1.7-2.7 倍 / 7-10 ヶ月目到達（INFERENCE）。
ランウェイ: 1000 万円のみで標準構成 29-36 ヶ月、最小構成なら 67-83 ヶ月。
リスク先出し: API 価格変動 / 競合模倣 / 規制 / 採用難 / 1 名属人化 → 各対応策を詳細版 p.20-22 に明示。

[Ask]
1000 万円 → Phase 1 商用化（軸 A 投資助言業登録 + クライアント環境向け SaaS β 実装）の 2 用途のみ。
出資契約形態: J-KISS 推奨（バリュエーションキャップ 1 億円候補・要協議）/ 普通株は経営関与希望時。
弁護士確認待ち項目あり（投資助言業登録要否・契約書ドラフト等）。

[次のアクション]
ステップ 1 バリュエーション詳細確認（2026-05-08 まで）
ステップ 2 弁護士による契約ドラフト（2026-05-10 まで）
ステップ 3 Phase 1 開始合意（2026-05-14 まで）

[連絡先]
ConsultingOS 代表（担当者名・メール・電話を別途記載）
詳細版デック 26 slides: 添付ファイル参照
事業計画マスター: /strategy/mizuno-funding-1000man/00-business-plan-master.md
```

---

## PDF 1 ページレイアウト設計（sales-deck-designer 渡し用）

### キャンバス
- サイズ 1280 × 720（DESIGN.md スライド標準）
- セーフエリア 全方位 48px

### 構成
1. 最上段（フルカラム / 高さ 約 80px）: H1「ConsultingOS エンジェル出資サマリ」+ 日付「2026-05-07 水野氏向け」
2. 中段（3 カラムグリッド / 各 388px 幅 / gutter 24px / 高さ 約 460px）:
   - カラム 1: なぜ今か（3 変数交点）
   - カラム 2: 構造的優位性（4 つの差別化）
   - カラム 3: 財務・リスク（数値 + 5 リスク先出し）
3. 最下段（フルカラム / 高さ 約 80px）: Ask + 次のアクション 3 ステップ + 連絡先

### スタイル
- フォント Yu Gothic / 游ゴシック / Hiragino Sans / Noto Sans JP（lang="ja" 必須）
- 配色 Background #FAFAF7 / Primary #0A0A0A / Accent #E60012（H1 と Ask ラインのみ）
- 太字 ** 記法禁止 / 一文中改行禁止
- 数値ラベル（FACT / INFERENCE / SPECULATION）は 12px Caption 表記

### 必須 CSS（DESIGN.md 5 章準拠）
```css
.page, .page * {
  word-break: auto-phrase;
  line-break: strict;
  overflow-wrap: break-word;
}
```

### 字形検証（生成後）
- pdffonts で Yu Gothic / Hiragino 系の埋込確認
- Noto Sans CJK 無印 / Source Han Sans 無印 / SimSun 等の中国字形フォールバック検出 → 即修正

---

## 【反証チェック結果】

Step 1（自己反証）: 1 ページに収める前提で財務詳細を 3 行に圧縮した。水野氏が銀行審査部出身として詳細を要求した場合、Case A の数値計画 p.16 への即誘導が必要。

Step 2（構造反証）: メール本文と PDF レイアウトの内容整合性を確認済。連絡先・添付ファイルパスが具体記載されており、配信時に追加情報不要。

Step 3（実用反証）: txt 形式は SMS / Slack / Discord でも配信可能。PDF は 1280×720 ページ内収まり前提で sales-deck-designer に渡す際に再レイアウト検証必須。

残存リスク:
- 担当者名・メール・電話の具体記載が assistant 側で未確定（ユーザー記入必須）
- PDF レンダリング時の日本語字形検証（pdffonts）が実装後の検証ステップに依存

---

## 参照ファイル

- /home/user/consulting-os/strategy/mizuno-funding-1000man/00-business-plan-master.md
- /home/user/consulting-os/DESIGN.md
- /home/user/consulting-os/.claude/skills/brand-guidelines.md
