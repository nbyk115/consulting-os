# 提案書テンプレート — ConsultingOS 標準

> ConsultingOS で代理店・エンタープライズ向け B2B 提案書を作る時の汎用テンプレート。`proposal-writer` + `sales-deck-designer` + `competitive-analyst` の知見を統合した最小構成。

---

## 使い方

1. このディレクトリを `examples/<your-deck-name>/` にコピー
2. `structure.md` のページ構成を起点にカスタマイズ
3. 制作前に `checklist.md` を確認
4. 制作中・完成後に `sales-deck-review` スキルでレビュー
5. レンダリング・配布パイプラインは `examples/hotice-sales-deck/` を参照（Puppeteer + python-pptx）

---

## このテンプレが押さえているもの

### 佐藤裕介オーナー思想の組み込み
- **PL 試算ページを必須**（粗利インパクトを数字で示す）
- **市場構造分析を起点**（誰が勝つ構造か）
- **ハルシネーション禁止**（数値には必ず出典 URL + 発行日）
- **アセット優先**（消耗施策ではなく積み上がる価値訴求）
- **敵地で戦わない**（自社が負ける軸は載せない）

### 小野寺信行オーナー思想の組み込み
- **指標を疑う**（クライアントの主張する KPI を本当の課題に翻訳）
- **フロー × ストック統合**（単発 + 蓄積を必ずセットで提案）
- **文脈設計**（ターゲットを「今どんな状況にある人か」で定義）
- **1stParty データ中心**（外部データ依存はリスクとして明示）

### 実装ガイドライン
- 日本語字形禁則準拠（`lang="ja"` / Yu Gothic 系 / 中国字形フォールバック禁止）
- DESIGN.md / ICP.md を必ず参照
- セールスデッキの18P 構成（hotice deck 由来）と整合

---

## ファイル一覧

| ファイル | 用途 |
|---|---|
| `structure.md` | 18ページ構成の標準（カバー → 会社紹介 → 課題提起 → 解決策 → 実績 → クロージング） |
| `checklist.md` | 提出前の必須チェック項目（佐藤裕介モード反証） |
| `pl-template.md` | PL試算ページの記述テンプレ（粗利・ブレイクイーブン・前提条件） |
| `competitive-comparison.md` | 競合比較表の設計ルール（敵地で戦わない） |

---

## 関連リソース

- 参考実装: `examples/hotice-sales-deck/`（18P + Puppeteer + PPTX パイプライン）
- ルール完全版: `docs/sales-deck-rules.md`（存在しない場合は作成可）
- レビュー用: `.claude/skills/sales-deck-review/SKILL.md`
- ハンドオフ: `.claude/skills/claude-design-handoff/SKILL.md`
