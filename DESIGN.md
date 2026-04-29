# DESIGN.md — ConsultingOS デザイン基盤

> **このファイルは ConsultingOS 本体のデザイン基盤兼テンプレート**。新規プロジェクトはこれを起点にカスタマイズする。`creative-director` / `frontend-dev` / `sales-deck-designer` は必ずこのファイルを読み込んでから作業する。

---

## 1. 役割と運用

- **必須参照**: UI / LP / セールス資料 / クライアント納品物の制作時
- **更新責任者**: `creative-director`（プロジェクト開始時にドラフト → 各フェーズで更新）
- **整合チェッカー**: `brand-guardian`（DESIGN.md ↔ `brand-guidelines.md` の整合）
- **新規プロジェクト**: このテンプレートを `<project>/DESIGN.md` にコピー → 上書きカスタマイズ

---

## 2. カラーシステム

### ConsultingOS 本体（参考デフォルト）
| 用途 | 値 | 備考 |
|---|---|---|
| Primary | `#0A0A0A` | テキスト・主要 UI |
| Background | `#FAFAF7` | ベース背景 |
| Accent | `#E60012` | CTA / 強調（hotice deck 由来） |
| Neutral 100 | `#F2F2EE` | カード背景 |
| Neutral 500 | `#666666` | サブテキスト |
| Neutral 900 | `#1A1A1A` | 見出し |
| Success | `#0EA5A4` | 成功 |
| Warning | `#F59E0B` | 警告 |
| Error | `#DC2626` | エラー |

### プロジェクト別オーバーライド
新規プロジェクトでは `Primary / Accent` を必ず再定義すること。クライアントブランドガイドラインを最上位に置く。

---

## 3. タイポグラフィ

### 日本語字形必須事項（最重要）
> 出典: `.claude/skills/brand-guidelines.md` 「日本語字形禁則」

- HTML: `<html lang="ja">` 必須、`<meta charset="UTF-8">` 併記
- DOCX/PPTX: ドキュメント言語を `ja-JP` に設定
- フォント: **Yu Gothic / 游ゴシック / Hiragino Sans / Noto Sans JP** を使用
- ❌ 禁止: `Noto Sans CJK`（無印） / `Source Han Sans`（無印） / `SimSun` / `Microsoft YaHei`

### 推奨フォントスタック
```css
font-family:
  "Yu Gothic", "游ゴシック", "Hiragino Sans", "ヒラギノ角ゴ ProN",
  "Noto Sans JP", "Meiryo", "メイリオ",
  sans-serif;
```

### サイズスケール（base 16px）
| 用途 | サイズ | 行間 |
|---|---|---|
| H1 | 48px / 3rem | 1.2 |
| H2 | 32px / 2rem | 1.3 |
| H3 | 24px / 1.5rem | 1.4 |
| Body | 16px / 1rem | 1.7 |
| Caption | 14px / 0.875rem | 1.6 |
| Min | 12px / 0.75rem | 1.5 |

### ウェイト
- Heading: 700 (Bold) / 600 (Semibold)
- Body: 400 (Regular)
- Caption: 400

---

## 4. スペーシング

- 基準単位: **4px**
- スケール: `4 / 8 / 12 / 16 / 24 / 32 / 48 / 64 / 96`
- セクション間: `48px〜96px`
- 要素間: `8px〜24px`

---

## 5. レイアウト原則

### スライド（hotice 標準）
- キャンバス: **1280 × 720**
- セーフエリア: 全方位 48px
- グリッド: 12 カラム / gutter 24px

### Web / LP
- 最大幅: 1200px
- ブレークポイント: 480 / 768 / 1024 / 1440
- モバイルファースト必須

### 必須 CSS（日本語スライド・LP）
```css
.slide, .slide *, .lp-section * {
  word-break: auto-phrase;
  line-break: strict;
  overflow-wrap: break-word;
}
```

---

## 6. コンポーネント原則

### ボタン
- Primary: 背景 Accent、白文字、半径 8px、padding 12/24
- Secondary: 透明背景、Primary ボーダー
- Hover: 透明度 0.85 or 影 `0 4px 12px rgba(0,0,0,0.1)`

### カード
- 背景: Neutral 100
- 半径: 12px
- 影: `0 2px 8px rgba(0,0,0,0.06)`
- 内余白: 24px

### 横並びカード（最重要）
> hotice deck で実証済み。全カードで body 可変・proof/CTA 固定位置にするため grid 必須。

```css
.card { display: grid; grid-template-rows: auto 1fr auto auto; }
```

### 下段要素の pin
```css
.srcLine, .caseNote, .footnote { margin-top: auto; }
```

---

## 7. やってはいけないこと

> hotice deck 実装で発生した事故から確定したアンチパターン

- ❌ `transform: scale()` で特定要素を拡大（行揃えが崩れる）
- ❌ 数字を `bottom: -px` で突き抜けさせる（clip される）
- ❌ グローバル class 名（`.brand` 等）を別用途で使う
- ❌ 中国字形フォント（`Noto Sans CJK`無印 等）への暗黙フォールバック
- ❌ Unsplash 等の外部画像 URL（Puppeteer で読み込まれない可能性）
- ❌ React コンポーネントを Hyperframes で使う（HTML 専用）
- ❌ 4K / 60fps を最初から指定（書き出し時間爆増）

---

## 8. デザイントークンのエクスポート（推奨）

将来的には `design-tokens.json` で一元管理し、HTML / DOCX / PPTX 全てが参照する設計に発展させる。現状は本ファイルが正本。

---

## 9. ConsultingOS 内蔵の参照実装

| 実装 | パス | 用途 |
|---|---|---|
| hotice sales deck | `examples/hotice-sales-deck/` | 18P + Puppeteer + PPTX パイプライン |
| trade-desk-interview | `examples/trade-desk-interview/` | インタビュー資料テンプレ |

新規プロジェクトはまず `examples/hotice-sales-deck/` をコピーし、本 DESIGN.md でカラー / フォントを上書きする。

---

## 10. 更新履歴

| 日付 | 変更 |
|---|---|
| 2026-04-29 | 初版作成（hotice deck の実装知見を統合） |
