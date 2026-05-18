# DESIGN.md: ConsultingOS デザイン基盤

> **このファイルは ConsultingOS 本体のデザイン基盤兼テンプレート**。新規プロジェクトはこれを起点にカスタマイズする。`creative-director` / `frontend-dev` / `sales-deck-designer` は必ずこのファイルを読み込んでから作業する。

---

## 1. 役割と運用

- **必須参照**: UI / LP / セールス資料 / クライアント納品物の制作時
- **更新責任者**: `creative-director`（プロジェクト開始時にドラフト → 各フェーズで更新）
- **整合チェッカー**: `brand-guardian`（DESIGN.md ↔ `brand-guidelines.md` の整合）
- **新規プロジェクト**: このテンプレートを `<project>/DESIGN.md` にコピー → 上書きカスタマイズ
- **外部参照（案件単位）**: [refero.design](https://styles.refero.design/): 2,000+ プロダクトの構造化された色・タイポ・スペーシング・レイアウト。類似プロダクトを照合してデザイン判断の根拠化に活用（全部取り込み禁止、必要部分のみ引用）
- **標準準拠**: Google [DESIGN.md オープン標準](https://github.com/google-labs-code/design.md) と互換可能な構造で運用（カラートークンに自然言語記述付与・WCAG 検証セクション・ポータビリティ）。AI エージェントによる読み取り精度向上 + プロジェクト間移行容易性

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
- 日本語フォント: **Yu Gothic / 游ゴシック / Hiragino Sans / Noto Sans JP** を使用
- 欧文・数値フォント: **Inter** を使用可（数値・ラテン文字表示専用、日本語テキストへの適用禁止）
- ❌ 禁止: `Noto Sans CJK`（無印） / `Source Han Sans`（無印） / `SimSun` / `Microsoft YaHei`

### 推奨フォントスタック
```css
/* 日本語本文・見出し */
--font-ja: "Yu Gothic", "游ゴシック", "Hiragino Sans", "ヒラギノ角ゴ ProN",
  "Noto Sans JP", "Meiryo", "メイリオ", sans-serif;
/* 欧文・数値表示専用（日本語テキストへの適用禁止、brand-guardian が grep 検証） */
--font-latin: "Inter", sans-serif;
```

> Inter 使用条件: 数値ダッシュボード・英字ラベル・コードのみ。日本語が混在するテキストブロックには `--font-ja` を使用。検証: `grep 'font-family' output.html` で Inter が日本語テキスト要素に当たっていないか brand-guardian が機械確認。

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

## 7. アクセシビリティ検証（WCAG 2.1 準拠ベース）

> 出典: Google DESIGN.md オープン標準の WCAG 検証思想を ConsultingOS に適用（2026-05-02）。大企業案件 / 公共系案件で必須。

### 必須チェック項目（AA レベル）
- 文字色 vs 背景色のコントラスト比 4.5:1 以上（通常テキスト）/ 3:1 以上（大文字 18pt 以上）
- インタラクティブ要素（ボタン・リンク）は 24x24px 以上のタッチ領域
- フォーカス表示が明確（outline / box-shadow で視認可能）
- 画像には代替テキスト（alt 属性）必須、装飾画像は alt=""
- 色のみで情報を伝えない（色覚多様性配慮、形状 / テキスト併用）
- 動画 / 音声には字幕 or 文字起こし

### 検証ツール
- `axe DevTools`（Chrome 拡張）
- `Lighthouse` Accessibility 監査
- WAVE Web Accessibility Evaluation Tool
- VoiceOver / NVDA でスクリーンリーダー確認

### ConsultingOS 内蔵の参考実装
Hotice デッキは AA 相当でレビュー済（Accent #E60012 vs Background #FAFAF7 = コントラスト 5.8:1）。

### エージェント運用
- `creative-director` がプロジェクト開始時に WCAG 適用レベル（A / AA / AAA）を決定
- `frontend-dev` が実装時に検証ツールで機械チェック
- `brand-guardian` が納品前に最終 REJECT 判定

---

## 8. やってはいけないこと

> hotice deck 実装で発生した事故から確定したアンチパターン

- ❌ `transform: scale()` で特定要素を拡大（行揃えが崩れる）
- ❌ 数字を `bottom: -px` で突き抜けさせる（clip される）
- ❌ グローバル class 名（`.brand` 等）を別用途で使う
- ❌ 中国字形フォント（`Noto Sans CJK`無印 等）への暗黙フォールバック
- ❌ Unsplash 等の外部画像 URL（Puppeteer で読み込まれない可能性）
- ❌ React コンポーネントを Hyperframes で使う（HTML 専用）
- ❌ 4K / 60fps を最初から指定（書き出し時間爆増）

---

## 9. デザイントークンのエクスポート（推奨）

将来的には `design-tokens.json` で一元管理し、HTML / DOCX / PPTX 全てが参照する設計に発展させる。現状は本ファイルが正本。

---

## 10. ConsultingOS 内蔵の参照実装

| 実装 | パス | 用途 |
|---|---|---|
| hotice sales deck | `examples/hotice-sales-deck/` | 18P + Puppeteer + PPTX パイプライン |
| trade-desk-interview | `examples/trade-desk-interview/` | インタビュー資料テンプレ |

新規プロジェクトはまず `examples/hotice-sales-deck/` をコピーし、本 DESIGN.md でカラー / フォントを上書きする。

---

## 11. AI エージェント対応設計原則

> 出典: Google web.dev「AI エージェント対応サイトの作り方」https://web.dev/articles/ai-agent-site-ux?hl=ja（2026-05-05 ConsultingOS 統合）
> 担当エージェント: `ux-designer` / `frontend-dev` / `brand-guardian`
> AIO / LLMO 文脈: `seo-specialist` が GEO 設計と連携して参照
> ICP 接続: Persona C（クリエイティブディレクター）が LP / セールス資料を発注する際に `frontend-dev` への必須チェックリストとして活用

---

### 11.1 設計思想--「人間にわかりやすい = AI にわかりやすい」

FACT: AI エージェントは Web サイトを 3 つの読み取り方法で認識する。
- スクリーンショット（視覚的構造）
- HTML ソース（セマンティクス）
- アクセシビリティツリー（aria / role / label 等）

この 3 層すべてで「何がクリック可能か」「次に何をすべきか」が明確なサイトが、AI エージェントによる自動操作の精度を最大化する。裏を返せば、ホバー依存の UI・`<div>` ボタン・ラベルのない入力欄は、人間にも AI にも等しく不親切な設計ミスである。

ConsultingOS の佐藤裕介流「構造で売る」原則と完全に一致する。構造が明示されていない UI は、AI エージェントにとっても「読めない提案書」と同義。セマンティック HTML = 自己説明する構造設計。

---

### 11.2 CTA 配置ルール

| ルール | 実装指針 | 違反例 |
|---|---|---|
| 初期表示で見える位置に配置 | ページ読み込み直後に CTA がビューポート内に存在すること。スクロール後にしか現れない設計は AI に無視される可能性がある | ヒーローセクションの CTA が画像下に隠れている |
| ホバー依存禁止 | `hover` 状態でのみ表示される CTA ・ナビゲーションは AI に認識されない | `.cta { display: none; } .parent:hover .cta { display: block; }` |
| スクロール依存禁止 | JavaScript で `scroll` イベント後に出現する floating CTA はデフォルト表示にする | スクロール 500px 後に表示されるチャットウィジェット |
| 固定配置は aria-label 必須 | `position: sticky / fixed` の CTA は aria-label で目的を明示 | sticky ヘッダーの「お問い合わせ」ボタンに aria-label なし |

---

### 11.3 インタラクティブ要素のセマンティクス

#### ボタン・リンクの実装規律

FACT（web.dev 原文より）: AI エージェントはアクセシビリティツリーを走査してクリック可能要素を特定する。`<button>` と `<a>` は明確に認識される。`<div>` はデフォルトで認識されない。

- 使用: `<button>`: フォーム送信・モーダル開閉・JavaScript アクション
- 使用: `<a href="...">`: ページ遷移・外部リンク
- 禁止: `<div onclick="...">`: クリックハンドラーのみの div ボタン
- やむを得ない場合: `role="button" tabindex="0" cursor: pointer` を全属性セットで付与（INFERENCE: これで AI 認識率が改善する可能性があるが、`<button>` への書き換えが本命）

```html
<!-- 禁止 -->
<div onclick="submitForm()">送信</div>

<!-- 推奨 -->
<button type="submit">送信</button>

<!-- やむを得ない場合（既存コードベース移行途中） -->
<div role="button" tabindex="0" style="cursor: pointer;" onclick="submitForm()">送信</div>
```

---

### 11.4 フォーム設計規律

すべての入力フィールドに `<label for="...">` を紐付ける。`placeholder` は label の代替にならない（スクリーンリーダーでも AI でも、placeholder はフォーカス後に消えるため認識精度が低下する）。

```html
<!-- 禁止 -->
<input type="email" placeholder="メールアドレスを入力">

<!-- 推奨 -->
<label for="email">メールアドレス</label>
<input type="email" id="email" name="email" placeholder="example@domain.com">
```

フォームラベル設計チェックリスト（`frontend-dev` 実装時・`brand-guardian` 検証時に使用）:
- [ ] 全 input / select / textarea に `<label for="...">` が存在するか
- [ ] `id` と `for` が一致しているか
- [ ] aria-label / aria-labelledby の代替を使う場合は理由を明示しているか
- [ ] エラーメッセージは `aria-describedby` で入力欄と紐付いているか

---

### 11.5 モーダル・オーバーレイの実装規律

透明・半透明のオーバーレイが DOM に残存したまま非表示になっている実装（`opacity: 0; pointer-events: none` 等）は、AI エージェントがクリック可能領域を誤認識する原因になる。

禁止パターン:
- `display: block; opacity: 0` でオーバーレイを残存させる（DOM に存在するため AI が操作不能と誤認）
- z-index 競合により本来のインタラクティブ要素の上に透明レイヤーが乗る

推奨パターン:
```css
/* 非表示時は display: none で DOM から見えなくする */
.modal-overlay { display: none; }
.modal-overlay.is-active { display: flex; }
```

```javascript
// pointer-events: none だけでは不十分
// aria-hidden="true" と display: none を組み合わせる
overlay.style.display = 'none';
overlay.setAttribute('aria-hidden', 'true');
```

---

### 11.6 タッチ / クリック領域のサイズ規律

FACT（web.dev 原文より）: CTA 要素は 8×8px 以上が必須。ただし ConsultingOS では WCAG 2.1 AA 基準（セクション 7 準拠）の 24×24px を最低ラインとし、モバイル向けには 44×44px（Apple HIG 準拠）を推奨する。

| デバイス | 最低タッチ領域 | 推奨タッチ領域 | 根拠 |
|---|---|---|---|
| デスクトップ | 24×24px | 36×36px | WCAG 2.1 AA |
| モバイル | 44×44px | 48×48px | Apple HIG / Material Design |
| AI エージェント認識下限（web.dev） | 8×8px |: | FACT（原文仕様）|

実装例:
```css
/* 視覚的に小さいアイコンボタンでもタッチ領域を確保 */
.icon-button {
  min-width: 44px;
  min-height: 44px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
}
```

---

### 11.7 セマンティック HTML チェックリスト（納品前必須）

`frontend-dev` が実装時に自己チェック、`brand-guardian` が納品前に最終確認する。

#### AI エージェント認識チェック
- [ ] ページ読み込み直後（JS 実行前）に主要 CTA が DOM に存在するか
- [ ] すべてのインタラクティブ要素が `<button>` / `<a>` / 適切な role 属性で実装されているか
- [ ] 透明オーバーレイ・残存モーダルが存在しないか（DevTools Accessibility タブで確認）
- [ ] フォームの全フィールドに label が紐付いているか
- [ ] CTA の最小サイズが 24×24px 以上か（モバイルは 44×44px 以上か）

#### アクセシビリティツリー検証手順
1. Chrome DevTools → Elements → Accessibility タブを開く
2. 主要 CTA 要素を選択 → Role / Name / Description が表示されることを確認
3. Role が "generic" のままなら `<button>` または role 属性で修正が必要

---

### 11.8 AIO / LLMO 連携（seo-specialist との接続）

AI エージェント対応 UI の設計は、検索エンジンの AI Overview（AIO）および LLM によるサイト参照（LLMO: LLM Optimization）の精度とも直接連動する（INFERENCE: AI エージェントと検索クローラーは同様の HTML 解析手法を使う部分があるが、完全同一ではない。2026-05-05 時点での個人評価）。

`seo-specialist` と連携すべき設計判断:
- ページの主要コンテンツが `<main>` タグ内に収まっているか（クローラー / AI ともに認識精度向上）
- ナビゲーションが `<nav>` / `<header>` / `<footer>` の適切なランドマークで構造化されているか
- FAQ は `<details>` / `<summary>` もしくは Schema.org `FAQPage` 構造化データを使用しているか
- 構造化データ（JSON-LD）が AI エージェントの意図解釈を補助しているか

ConsultingOS の `seo-specialist` が GEO（Generative Engine Optimization）設計を行う際は、本セクションを実装標準として参照する。

---

### 11.9 エージェント別責任分担

| エージェント | 責務 |
|---|---|
| `ux-designer` | CTA 配置・フォーム構造・モーダル設計の時点でセクション 11.2〜11.5 を適用。ワイヤーフレーム段階で「AI に見える設計か」を確認する |
| `frontend-dev` | セクション 11.3〜11.7 のチェックリストを実装完了時に自己実行。DevTools Accessibility タブで検証 |
| `brand-guardian` | 納品前レビューで 11.7 チェックリスト全項目を確認。REJECT 権限あり |
| `seo-specialist` | GEO 設計フェーズで 11.8 の構造化データ要件と連携 |
| `creative-director` | プロジェクト開始時に「AI エージェント対応レベル」を A（完全対応）/ B（部分対応）/ C（非対応）で定義し、制作チームに伝達 |

---

## 12. ビジュアル参照ライブラリ（2026-05-14 追加、デザインインフラ不全構造修正）

### 12.1 背景: デザインインフラ 4 層不全（2026-05-14 ユーザー指摘）

ConsultingOS のデザイン層は以下の構造的問題で機能不全だった:
1. 参照ライブラリ不在（DESIGN.md は色 / フォント定義のみ、「良いデザイン実例」reference 不足）
2. 生成インフラ不安定（Claude Design API 400 エラー反復、単一依存リスク）
3. 品質基準曖昧（「ダサい / ダサくない」判定が agent に渡せない）
4. agent orchestration 失敗（creative-director 5 名いるのに visual v9 = 30+ ラウンドループ）

= 「PPT 結構ださい」「クロードデザインもエージェントちゃんと使えてない」(ユーザー口頭 2026-05-14)。

### 12.2 デザイン参照ライブラリ運用ルール

YOU MUST: `creative-director` / `ux-designer` / `frontend-dev` / `sales-deck-designer` は visual / deck / LP 制作の **着手前** に必ず以下を実行:

1. **参照ギャラリー query**（最優先）: 制作対象のカテゴリ（IR デッキ / セールスデッキ / LP / ダッシュボード / アプリ UI）で関連 UI スクリーン or 業界事例を最低 3-5 件参照
2. **DESIGN.md セクション 12.3-12.4 確認**: 推奨パターン + アンチパターン
3. **`refero.design` 補完参照**: 既存推奨参照、2,000+ プロダクトの構造化情報
4. **判断根拠の明示**: 「なぜこのレイアウト / トーン / 配色か」を制作開始時に 1-2 行で言語化

### 12.3 デザイン参照ギャラリー（2026-05-17 更新: Lazyweb MCP 不採用確定）

Lazyweb MCP（aboul3ata/lazyweb-skill）は 2026-05-14 に統合（PR #141）したが、ConsultingOS 全環境で稼働不可と実測確定したため不採用とする。

不採用の構造的理由:
- Lazyweb はローカルプラグイン型 MCP（`claude plugin install` + `~/.lazyweb/` のローカル token ファイルに依存）
- ConsultingOS の実行基盤は使い捨てコンテナ（Claude Code on the web）。プラグインも token もコンテナ破棄ごとに消える
- token は `.gitignore` で commit 禁止のため、git 成果物としての永続化も不可能
- yorunokotoba セッションで再起動後も MCP 接続失敗を実測確認（2026-05-16）

= マネージド型 MCP（環境がサーバ側で接続: GitHub / Figma / Canva）と異なり、ローカルプラグイン型は本実行基盤と原理的に非互換。git に commit できる成果物だけでは永続化できないため、handoff / SessionStart フックへの組込みでも解決しない。

代替（デザイン参照の標準手段）:

| 手段 | 用途 |
|---|---|
| WebSearch | 競合 / 業界事例の参照 URL 検索（コンテナから実行可能、標準手段）|
| Lazyweb For Humans（lazyweb.com 手動閲覧）| 257k UI スクリーンの目視参照、人間がブラウザ閲覧して構造を共有 |
| `refero.design` | 2,000+ プロダクトの構造化参照、§12.4 業界別パターン。人間がブラウザ閲覧 |

> Canva MCP について（2026-05-18 実測）: generate-design は呼べるが、生成画像 URL（design.canva.ai）が本実行環境のネットワーク許可リストで HTTP 403 ブロックされ、ConsultingOS の実行コンテナに画像を取り込めない。よって Canva MCP は ConsultingOS が納品する成果物の生成・参照取り込み手段としては使えない。Canva はユーザーが Canva 上で完結利用する場合のみ可（成果物はユーザーの Canva アカウント内、ConsultingOS は触れない）。PR #235 の「Canva MCP 第一選択・必須」は本環境で不成立のため撤回（PR で creative-director.md を訂正）。

YOU MUST: visual / deck / LP 制作着手前に上記いずれかで関連参考を最低 3-5 件取得、参照根拠を制作開始時に 1-2 行で言語化（§12.2）。MCP 経由でコンテナに画像を取り込む経路は本環境で塞がれているため、URL と構造情報を言語化して参照根拠とする。

### 12.4 推奨ビジュアル参照パターン（業界別）

| 制作対象 | 推奨参照 | 補足 |
|---|---|---|
| IR / 決算デッキ | Stripe / Shopify / Snowflake IR / Figma S-1 / Atlassian Investor | 数値プレゼンの黄金パターン |
| セールスデッキ | Pitch / Notion / Linear / Vercel | B2B SaaS の標準 |
| 1 枚絵 / overview | a16z / Sequoia / 16z 1-pager / The Information explainer | 戦略 1 枚絵の構造 |
| LP | refero.design 1,000+ | コンポーネント別参照可能 |
| ダッシュボード UI | Vercel / Linear / Notion / Figma | プロダクト UI 標準 |

### 12.5 visual 生成フロー改訂（Claude Design 単一依存撤廃）

YOU MUST: visual / 画像生成は以下優先順位で agent が能動的選択:

1. **HTML + Playwright スクリーンショット**: 1200×630 / 1080×1080 等の固定サイズ画像、CSS 完全制御、API 障害ゼロ（推奨デフォルト）
2. **Figma MCP**: 既存デザインシステム流用、デザイントークン抽出、Code Connect 利用時
3. **html2pdf.js**: PDF 出力（既存 visual v9 で実装済）
4. **Claude Design API**: 利用継続だが代替経路を常に確保（400 エラー時の即時切替）

「Claude Design 失敗 → セッション停止」は構造的怠慢として禁止。

### 12.5.1 HTML 出力の必須テンプレ要件（2026-05-14 追加、HTML-First 採用に伴う規律強化）

HTML 生成時に以下 4 項目を必ず満たす（brand-guardian 機械検証対象）:

1. `<html lang="ja">` 必須付与（ハードルール 10）。検証: `grep 'lang="ja"' output.html`
2. `<meta charset="UTF-8">` 必須付与（brand-guidelines.md §必須対応）
3. `font-family` に日本語フォントスタック明示（`Noto Sans JP` / `Yu Gothic` / `Hiragino Sans` 最低 1 つ）。検証: `grep 'font-family' output.html | grep -v 'Noto Sans JP\|Yu Gothic\|Hiragino'` ヒット時 REJECT
4. em ダッシュ HTML entity（`&mdash;` / `&#8212;` / `&#x2014;`）禁止、raw `**` 残留禁止（ハードルール 16）。検証: `grep '&mdash;\|&#8212;\|&#x2014;' output.html` ヒット時 REJECT + `grep '\*\*' output.html` ヒット時 REJECT

詳細は `.claude/skills/claude-code-ops/references/html-output-patterns.md`。

### 12.6 agent orchestration ルール（creative 部門 5 名の正しい起動）

`creative-director` は visual / deck 制作で以下 4 agent を必ず順次起動:

1. **`ux-designer`**: ワイヤーフレーム + 情報設計（参照ギャラリー query 含む）
2. **`frontend-dev`** or **`sales-deck-designer`**: HTML / Figma / PPT 実装
3. **`brand-guardian`**: 日本語字形 + DESIGN.md 整合検証
4. **`creative-director` 自身**: 最終品質レビュー + 参照パターンとの照合

「creative-director 起動した」と主語詐称せず、上記 4 agent の起動有無を明示（ハードルール 17 主語詐称禁止と整合）。

---

## 13. 更新履歴

| 日付 | 変更 |
|---|---|
| 2026-04-29 | 初版作成（hotice deck の実装知見を統合） |
| 2026-05-05 | セクション 11 追加 - AI エージェント対応設計原則（出典: Google web.dev、ICP Persona C 接続、AIO/LLMO 連携） |
| 2026-05-14 | セクション 12 追加 - ビジュアル参照ライブラリ + Claude Design 単一依存撤廃 + creative 部門 5 名 orchestration ルール（デザインインフラ 4 層不全構造修正） |
