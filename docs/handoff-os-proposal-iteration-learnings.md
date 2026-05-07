# 引き継ぎ: N.Y.CRAFT 案件 v1-v19 イテレーションから OS に組み込むべき改修

起票: 2026-05-07
対象: ConsultingOS 改修ブランチ (推奨ブランチ名: `claude/os-proposal-iteration-learnings`)
起票元: `claude/oem-sales-strategy-gVMWp` で実施した N.Y.CRAFT 提案資料 v1 -> v19 の 19 イテレーション
判断基盤: 佐藤裕介流「構造で売る = 仕組みが結果を担保する」+ Boris #3 ruthlessly edit
緊急度: 中 (即不具合ではないが、次の OEM 案件で同じ手戻りを繰り返す構造リスク)
関連: `docs/handoff-os-bootstrap-guard.md` (先行起票、SessionStart bootstrap guard 改修)

---

## 全 19 イテレーション 1 行サマリー

| Ver | 主題 | 学習 |
|---|---|---|
| v1 | 副業 OEM 戦略 generic フレーム | base 戦略文書化 |
| v2 | N.Y.CRAFT 案件パッケージ Marp 化 | スライド構造起点 |
| v3 | 価格レンジ修正 (70 万) | 4 軸根拠化 |
| v4 | OS 進化反映 (30/19) | 数値同期忘れ→ chronic |
| v5 | 字形違反修復 (WenQuanYi) | OS rule 10 起点 |
| v6 | リテラシー対応・Claude Code 比較 | jargon annotation 必要性 |
| v7 | リファレンス位置付け再構成 | vendor invisible model |
| v8 | 27 / 33 更新 + 市場ストーリー追加 | 再び数値同期 |
| v9 | TEAM CRAFT 世界観反映 | ICP 確認の重要性 |
| v10 | 必須 CSS 適用・brand-guardian gate | sales-deck-designer 起動 |
| v11 | 24 ページ全数視覚監査 | render verify必要 |
| v12 | OS template 物理化 (header/footer 空) | template injection |
| v13 | Sans 統一・FACT badge 削除・slide 21/22 redesign | 出典名直書き |
| v14 | sales-deck-designer subagent + Critical 5 件 | デザインチーム連携の遅れ |
| v15 | slide 3, 4 narrative 再構成 | AI 素人 framing |
| v16 | stat 意味付けタグ + ハイパーリンク化 | semantic labeling |
| v17 | 「大手アプリ」→「業務向けソフトウェア (Salesforce 等)」 | 具体例必須 |
| v18 | slide 11 ベース vs カスタム明示 | 関連スライド relationship |
| v19 | AI エージェント (ConsultingOS) 表記 + slide 3 整理 | block density limit |

---

## A. すでに OS に物理化済み (verified, 9 件)

main の現状確認結果。これらは案件中の指摘で既に組込み済 = 次案件で正しく稼働するはず。

| # | 規律 | 実装ファイル | 起点 |
|---|---|---|---|
| A1 | 中国字形フォールバック禁止 + pdffonts 検証 | `CLAUDE.md` Hard Rule 10 + `.claude/skills/brand-guidelines.md` | v5 |
| A2 | Markdown  太字禁止 | `CLAUDE.md` Hard Rule 16-① | v8 |
| A3 | 一文中改行禁止 | `CLAUDE.md` Hard Rule 16-② | v8 |
| A4 | 表は中央揃え必須 | `CLAUDE.md` Hard Rule 16-③ | v8 |
| A5 | PPT/PDF ページ収まり必須 | `CLAUDE.md` Hard Rule 16-④ | v11 |
| A6 | 出力直前 W チェック | `CLAUDE.md` Hard Rule 16-⑤ | v11 |
| A7 | em/en ダッシュ禁止 | `CLAUDE.md` Hard Rule 16-⑥ + `.claude/hooks/emdash-detector.sh` | v8 |
| A8 | sales-deck-designer 必須 CSS (word-break/grid 等) | `.claude/agents/creative/sales-deck-designer.md` §3 + `.claude/templates/sales-deck-designer/marp-required.css` | v10/v12 |
| A9 | template injection 検証 hook | `.claude/hooks/template-injection-check.sh` | v12 |

---

## B. これから OS に追加すべき改修 (10 件)

v1-v19 で繰り返し発生した未物理化項目。各項目に 修正対象ファイル + 修正コード片 + 検証コマンド を記載。

### B1. クライアントリテラシー対応 (jargon annotation 必須化)

起点: v6, v14, v15 (PMF / Multi-Agent / CAGR / RAG / LP / KPI 等)
問題: AI 素人クライアント向け資料で専門用語が初出注釈なしで連発 → クライアントが詰まる
対象: `.claude/agents/creative/sales-deck-designer.md` §2 コピーの書き方

追加コード片:

```markdown
### 2.1 業界略語・専門用語の初出注釈必須

クライアントの業界・リテラシーに合わせて以下を必ず実行:

1. クライアント業界外の略語は初出のみカッコ展開:
   - PMF -> プロダクトマーケットフィット (商品が市場に受け入れられた状態)
   - CAGR -> 年平均成長率
   - Multi-Agent -> 複数 AI 連携
   - LP -> 営業用ランディングページ
   - KPI -> 成果指標
   - RAG -> 文書から関連情報を検索して引用するタイプの AI ツール

2. 同義の日本語が一般的なら略語を使わない:
   - ICP.md / DESIGN.md (社内開発名) -> 顧客像定義書 / ブランド基盤書

3. AI 関連用語は特に注意 (B2B クライアントは AI 素人想定):
   - ChatGPT / Claude / NotebookLM -> 既知前提で OK
   - Multi-Agent System / RAG / fine-tuning / LLM -> 初出注釈

判定: 関根さん (元キーエンス営業 / Fastask 初期営業) リテラシーで違和感を
感じる用語を発見したら、即座にカッコ展開 or 日本語意訳。
```

検証: `.claude/skills/sales-deck-review/SKILL.md` §1 コピー具体度に追加項目

```markdown
- 業界略語の初出注釈確認: PMF / CAGR / Multi-Agent / RAG / LP / KPI / ICP / DESIGN 等
  -> 該当ページで `grep -nE "PMF|CAGR|Multi-Agent|RAG|LP|KPI"` し、初出に括弧展開がない箇所を REJECT
```

### B2. 数値の semantic ラベリング必須

起点: v16 「赤字数字がいいのか悪いのか分からない」
問題: 統計カードで数字だけ並ぶと意味判別不能
対象: `.claude/agents/creative/sales-deck-designer.md` §4 レイアウト禁則

追加コード片:

```markdown
### 4.1 統計カード semantic 必須

数値を強調表示する場合は以下のいずれかで意味を明示:

1. 意味付けタグバッジ (推奨):
   - 「課題のサイズ」「市場の機会」「空白の余地」「成長率」等
   - 課題系 = オレンジ系 (#B45309 / #FEF3C7)
   - 機会系 = 緑系 (#15803D / #DCFCE7)

2. 方向アイコン:
   - ↑ = 良い増加 / ↓ = 改善余地

3. 絶対禁止:
   - 数字単体 + 1 行説明だけのカード (関根さん指摘「いいのか悪いのか分からない」)

CSS テンプレ (.claude/templates/sales-deck-designer/marp-required.css に追加):
```css
.stat-tag {
  display: inline-block; font-size: 11px; font-weight: 700;
  padding: 2px 8px; border-radius: 10px; letter-spacing: 0.04em;
}
.stat-tag.issue { background: #FEF3C7; color: #92400E; }
.stat-tag.chance { background: #DCFCE7; color: #166534; }
.data-card.issue .stat { color: #B45309; }
.data-card.chance .stat { color: #15803D; }
```
```

### B3. 出典 URL はハイパーリンク必須

起点: v16 「リンクはハイパーリンクでテキストからリンクするように」
問題: 出典 URL をテキストで直書き表示 = 視覚 noise + 切れて読みにくい
対象: `.claude/agents/creative/sales-deck-designer.md` §3 必須 CSS

追加コード片:

```markdown
### 3.1 出典・URL 表記必須ルール

出典名 + URL を表示する場合:

- 必須: `<a href="https://...">出典名 (発行年)</a>` のハイパーリンク化
- 禁止: URL のテキスト直書き (例: `cbinsights.com/research/report/...`)
- 理由: PDF にも anchor link が embed され、クリックで URL 開く

CSS:
```css
.src a {
  color: #888; text-decoration: underline; text-decoration-thickness: 0.5px;
}
.src a:hover { color: #E60012; }
```

### B4. 並列スライド (Story 等) の同型構造強制

起点: v14 「Story 3 のみ下部 blockquote ありで Story 1/2 と不統一」
問題: 連番スライド (ストーリー 1/2/3 等) で構造が揃わないと視覚的違和感
対象: `.claude/skills/sales-deck-review/SKILL.md` §4 レイアウト違和感

追加コード片:

```markdown
### 4.1 並列スライド同型構造チェック (NEW)

連番スライド (例: ストーリー 1/2/3, ケース A/B/C, Phase 1/2/3) では:

- [ ] 同一テンプレート構造を強制 (.card.before / .card.after 等)
- [ ] card 末尾の footnote パターン (.small accent 等) は全スライドで揃える
- [ ] blockquote / 黒ボックス等の追加要素は全スライドに揃えるか全削除
- [ ] grid layout 数 (.grid-2 / .grid-3) を統一

検証: `grep -A3 "ストーリー [0-9]" 02-proposal-to-sekine.slides.md`
で並列スライドの末尾構造が揃っているか目視
```

### B5. ブロック密度制限 (1 列 3 ブロック以上スタック警告)

起点: v19 「3 ページ目ガチャガチャしててデザインダサい」
問題: 1 列に blockquote / 黒ボックス / accent 等を 3 つ以上スタックすると視覚的混雑
対象: `.claude/agents/creative/sales-deck-designer.md` §4 レイアウト禁則

追加コード片:

```markdown
### 4.2 ブロック密度制限

1 列内に視覚的に独立した装飾ブロック (blockquote / 黒ボックス / accent box / card 等) を:

- 推奨: 1 列に 1-2 ブロック (max 2)
- 警告: 3 ブロック以上 (ガチャガチャ要因)
- 禁止: 4 ブロック以上

統合方法:
- 「結論」と「補足」は同一ブロック内で階層化 (caption + main + sub)
- 「課題」と「対策」は左右 2 列に分離 (.grid-2)
```

### B6. クライアント業界の具体例必須

起点: v17 「大手アプリってなに」
問題: "enterprise apps" を「大手アプリ」と曖昧訳 = 意味不明
対象: `.claude/agents/creative/sales-deck-designer.md` §2 コピーの書き方

追加コード片:

```markdown
### 2.2 抽象語には必ず具体例 (関根さん指摘・2026-05 学習)

「大手アプリ」「業界トレンド」「先進企業」等の抽象語を使う場合は、
クライアントが想起できる具体例を必ず併記:

- 大手アプリ -> 業務向けソフトウェア (Salesforce 等)
- 主要 SaaS -> Salesforce / HubSpot / Notion 等
- 先進企業 -> ソフトバンク・サイバーエージェント等 (クライアント業界に応じて選定)

判定: 関根さん (元キーエンス営業) が一発で「ああアレね」と分かる
固有名詞があれば具体度合格、なければ追加。
```

### B7. ICP/世界観確認後のスライド作成 (Pre-Draft Discovery)

起点: v9 「中堅・中小企業」と誤認 -> サイト見て「スタートアップ・PMF」へ修正
問題: クライアント実態を確認せず憶測で書くと target を外す
対象: `.claude/agents/creative/sales-deck-designer.md` §1 起動時の必須確認

追加コード片:

```markdown
### 1.1 ICP / 世界観 Pre-Draft Discovery (NEW・関根さん案件 v9 学習)

スライド作成前に必ず以下を実行 (User 指示で URL や資料が提供されている場合):

1. クライアント Web サイト読み取り:
   - WebFetch でホームページ + サービス紹介ページを取得
   - 失敗時 (403 等) は user に screenshot 依頼 / WebSearch で代替

2. 代表者経歴調査:
   - LinkedIn / 公式プロフィールから職歴・思想を確認
   - 過去発言 / 著書 / インタビューから vocabulary を抽出

3. ターゲット顧客像 (ICP) の特定:
   - クライアントの「お客様」がどんな企業/個人かを Web 記載で確認
   - 業種 / 規模 / フェーズ (PMF 期 / スケール期等) を明示

4. クライアント独自 vocabulary の抽出:
   - ブランド名 (TEAM CRAFT 等) / モデル名 (監督・メンバー等) /
     キーフレーズ (マーケティングを手作りする等)
   - これらを提案資料に反映 = 「うちのことを理解してる」感を出す

判定: 上記 4 項目を確認せずにスライド作成開始した場合、
高確率で v9 のような「target 外し」が発生する。
```

### B8. Visual change の permission ルール

起点: v9-v13 「Serif フォント実験 (Crimson Pro / Hiragino Mincho)」を user 指示なく導入し v14 で revert
問題: 美的判断の visual change を勝手にやると user の design intent と齟齬
対象: `.claude/agents/creative/sales-deck-designer.md` 禁止事項

追加コード片:

```markdown
### 禁止事項 (追加)

- User 指示なしの visual identity 変更:
  - フォントファミリ変更 (Sans -> Serif 等)
  - カラースキーム変更 (Primary/Accent 色変更)
  - レイアウト原則の変更 (グリッド数 / カード形状)
  - 装飾要素追加 (アニメーション / 影 / グラデーション)
  -> User 明示指示 or DESIGN.md 記載がある場合のみ許可
  -> 美的判断で勝手に試行禁止 (関根さん案件 v9-v13 でフォント
     Serif 実験を勝手にやり v14 で revert した違反学習)
```

### B9. 関連スライドの relationship 注釈

起点: v18 「11 はベースであり関根さんカスタム可」
問題: 連続スライドの関係性 (ベース vs カスタム / 戦略 vs 実装等) が説明不足
対象: `.claude/skills/sales-deck-review/SKILL.md` §5 情報設計

追加コード片:

```markdown
### 5.1 連続スライドの relationship 明示 (NEW)

ベース vs カスタム、戦略 vs 実装等の対応関係があるスライドペアでは、
冒頭/末尾に必ず relationship を明示:

- ベース説明スライド: 「これは標準装備、次のページで [カスタム箇所] を説明」
- カスタムスライド: 「(前のページの) ベースに対して以下を上書き・追加」
- 戦略 -> 実装: 「戦略 (P5) を実装に落とすと P10-15 の構造になる」

判定: ページ単独で読むと意味が伝わらない・前後を見ないと不明な
スライドが連続する場合、relationship 注釈を必ず追加。
```

### B10. Iteration version footer 必須

起点: v1-v19 を通して履歴 traceability が footer の v1, v2... 表記でしか追えなかった
問題: バージョン情報がスライド内に記録されないと「どの版を見せたか」が打合せ後に分からない
対象: `.claude/templates/sales-deck-designer/marp-frontmatter.md`

追加コード片:

```markdown
### Marp frontmatter 必須項目 (追加)

footer に必ず以下のいずれかでバージョン情報を埋め込む:

- 案 A (footer): `footer: "YYYY.MM | <client> | v<N>"` (常時表示型)
- 案 B (タイトル page のみ): `<p class="neutral">YYYY.MM / v<N></p>`
  + その他ページは footer 空 (関根さん案件 v12 で採用、global header overlap 回避)

推奨: B (タイトル page version + 他ページ footer 空)
理由: ページ毎の footer 表示は visual noise、タイトル 1 箇所で十分
```

---

## C. 新規 skill 提案

### C1. proposal-iteration-playbook

目的: B2B 提案資料を v1 -> v(N) で iterate する際の標準パターンを skill 化

新規ファイル: `.claude/skills/proposal-iteration-playbook.md`

内容案:

```markdown
# Proposal Iteration Playbook

B2B 提案資料を 5-20 イテレーション通して関根さんレベルまで磨く際の
標準パターン (関根さん案件 v1-v19 学習)。

## イテレーション分類

| Phase | 焦点 | 典型 Ver |
|---|---|---|
| Discovery | ICP/世界観確認 | v0 (起票前) |
| Draft | 構造・コア訴求 | v1-v3 |
| Refinement | jargon / target 整合 | v4-v9 |
| Polish | デザイン・横揃え | v10-v15 |
| Final | 出典・hyperlink・semantic label | v16-v19 |

## 各 Phase の chk list

### Discovery
- クライアント Web サイト読み (sales-deck-designer §1.1)
- 代表者 LinkedIn / 経歴
- ターゲット ICP 特定
- クライアント vocabulary 抽出

### Draft
- structure first (sections / story flow)
- 価値訴求 -> 構造 -> 価格 の順 (Sato 流)
- 1 ページ 1 メッセージ

### Refinement
- audience literacy check (jargon annotation)
- target 用語整合
- 思想的基盤 vs カスタム の関係性

### Polish
- sales-deck-designer 必須 CSS 全項目
- 並列スライド同型構造
- ブロック密度 max 2/列
- 横揃え grid

### Final
- 出典名 + URL ハイパーリンク
- 数値 semantic ラベル (課題/機会)
- W check 完了
- pdffonts 検証
- em-dash 0 件
```

---

## D. evolution-log.md 追加エントリ案

```markdown
## 2026-05-07 N.Y.CRAFT 案件 v1-v19 提案資料 iteration 学習

### 事象
関根さん (N.Y.CRAFT 株式会社) 向け OEM 提案資料を v1 から v19 まで
19 イテレーション。各バージョンで User 指摘を受けて修正、最終的に
打合せ可能な品質に到達。本セッション中の学習を OS に組込み、
次案件で同じ手戻りを回避する。

### 主要違反パターン (組込み済 vs 未組込み)

組込み済 (A1-A9): 字形 / 出力フォーマット / em-dash / 必須 CSS / template injection
未組込み (B1-B10): jargon annotation / 数値 semantic / hyperlink / 並列同型 /
  ブロック密度 / 具体例 / ICP discovery / visual permission / relationship 注釈 /
  version footer

### 対策
docs/handoff-os-proposal-iteration-learnings.md として引き継ぎドキュメントを
起票、改修ブランチ (claude/os-proposal-iteration-learnings 推奨) で B1-B10
の物理化を実装する。

### 学習
1. 提案資料は「v1 で完成」しない (Sato 流 ruthlessly edit を 19 回繰り返す前提)
2. クライアントリテラシーは技術者の想定よりも基礎側に
3. デザイン違和感は user 指摘を待つのではなく sales-deck-designer subagent を
   Draft 段階で起動して機械検証
4. 「ConsultingOS が起動している」前提を毎セッション物理確認
   (handoff-os-bootstrap-guard で別途対応中)
```

---

## E. CLAUDE.md ハードルール追加候補 (要検討)

以下は B1-B10 の中で CLAUDE.md ハードルール昇格を検討:

| 候補 | 賛否 | 理由 |
|---|---|---|
| クライアントリテラシー対応 | 検討 | sales-deck-designer skill レベルで十分か |
| visual permission ルール | 賛 | 全エージェント横断で適用、ハードルール価値あり |
| その他 (B2-B10) | skill レベル維持推奨 | 過剰追加は形骸化リスク (Boris #3) |

---

## 実行手順 (改修ブランチ向け)

```bash
git checkout main
git pull origin main
git checkout -b claude/os-proposal-iteration-learnings

# 各ファイルに B1-B10 を順次適用
vi .claude/agents/creative/sales-deck-designer.md  # B1, B2, B3, B5, B6, B7, B8
vi .claude/skills/sales-deck-review/SKILL.md  # B1, B4, B9
vi .claude/templates/sales-deck-designer/marp-required.css  # B2 CSS
vi .claude/templates/sales-deck-designer/marp-frontmatter.md  # B10
vi evolution-log.md  # D entry 追加

# 新規 skill 追加 (C1)
touch .claude/skills/proposal-iteration-playbook.md

# CLAUDE.md ハードルール追加 (E 検討後)
vi CLAUDE.md  # visual permission rule のみ追加候補

# CI 確認 + commit + push + PR
git add -A
git commit -m "feat(os): N.Y.CRAFT v1-v19 学習を組込み (B1-B10 + proposal-iteration-playbook)"
git push origin claude/os-proposal-iteration-learnings
gh pr create --title "OS: N.Y.CRAFT 案件 v1-v19 学習組込み" --body-file docs/handoff-os-proposal-iteration-learnings.md
```

---

## 検証手順

改修後、以下を新規案件 (例: 別 OEM 引き合い) でシミュレーション検証:

1. B1 jargon annotation: 専門用語入りスライドを生成 → grep で初出注釈チェック
2. B2 数値 semantic: 統計カード生成 → stat-tag class が含まれるか grep
3. B3 hyperlink: 出典付きスライド → `<a href` 必須 grep
4. B4 並列同型: ストーリー 3 連スライド生成 → 末尾構造の grep diff
5. B5 ブロック密度: 単一カラムに 3 blockquote 配置 → warn 出るか
6. B6 具体例: 抽象語使用 → user 指摘前に具体例追記提案
7. B7 ICP discovery: クライアント情報なしで生成 → WebFetch / WebSearch を sales-deck-designer が自発実行するか
8. B8 visual permission: フォント/色変更を勝手に試行 → 警告
9. B9 relationship: 連続スライド生成 → relationship 注釈追加
10. B10 version footer: marp-frontmatter テンプレ展開 → version 行 default 含む

---

## 関連ドキュメント

- `docs/handoff-os-bootstrap-guard.md`: SessionStart bootstrap guard 改修 (先行)
- `strategy/n-y-craft-oem-case/`: 全 v1-v19 成果物
- `examples/n-y-craft-consulting-os-oem/README.md`: ポートフォリオ事例化
- `evolution-log.md`: 違反学習履歴
