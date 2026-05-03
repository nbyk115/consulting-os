# DESIGN.md — 水野さん向け 1000 万円エンジェル出資ピッチデッキ

> 4 エージェント並列レビュー（creative-director / sales-deck-designer / ux-designer / brand-guardian）の出力を統合した本案件のデザイン仕様。

## 1. 参照スタイル

| 参照 | 採用要素 |
|---|---|
| ユニクロ（ファーストリテイリング）IR 資料 | 大胆な数字 / ミニマル図表 / ブランド一貫性 |
| ソフトバンク決算プレゼン | 1 スライド 1 メッセージ / 巨大数字インパクト |
| Abema TV 事業計画 | 成長曲線グラフ / 競合ポジショニング / ロードマップ図解 |
| Y Combinator pitch deck | 10 枚で結論直撃 / 余白優先 |

## 2. ビジュアル原則 5 つ

1. 1 スライド 1 メッセージ
2. 数字主役（巨大フォント + 色アクセント）
3. テキスト最小化（箇条書き 3-5 項目以内）
4. 図解・グラフ・タイムライン優先
5. 余白 40% 確保（情報密度を下げる）

## 3. カラーシステム

| 用途 | カラー | 比率 |
|---|---|---|
| 背景 | #0A0A0A（ダーク）| 80% |
| メインテキスト | #FAFAF7（白）| 15% |
| アクセント 1（数字 / PL）| #E60012 → #FF3B30（朱赤）| 3% |
| アクセント 2（成長曲線 / 未来）| #00D4FF（シアン）| 1.5% |
| サブグレー（補足 / 出典）| #8E8E93 | 0.5% |

注記: 印刷想定の Case C は白背景反転バージョン（背景 #FAFAF7 / テキスト #0A0A0A）を維持。

## 4. タイポグラフィ階層

| 階層 | サイズ | 用途 |
|---|---|---|
| H0（数字主役）| 80-96pt | KPI 単独表示「1,000 万円」「2.35-4.0 倍」等 |
| H1（メッセージ）| 48pt | スライド主題 |
| H2（補助）| 28pt | サブメッセージ |
| 本文 | 20pt | 説明テキスト（最小） |
| 出典 | 12pt | フッター |

フォント: 見出し `Noto Sans JP Black` (900) / 本文 `Noto Sans JP Regular` (400) / 数字 `Inter` または `Helvetica Neue Bold`（欧文化で視覚インパクト強化）。

字形禁則: `Noto Sans CJK JP` 維持（CLAUDE.md ハードルール 10 OK 字形）、`Noto Sans CJK`（無印）/ `Source Han Sans`（無印）/ `SimSun` は禁止。

## 5. レイアウトパターン 5 つ

1. 数字主役: 中央 H0 数字 1 個 + 下に H2 説明 1 行
2. 比較: 左右 2 分割、Before/After or 競合/自社、中央に矢印
3. タイムライン: 横軸 Phase 1-5、累積数字曲線
4. 図解: 中央 3-5 ノードの関係図（バリューチェーン / 三角形 / フロー）
5. 1 メッセージ + 余白: 中央上部メッセージ 1 行のみ、下部 60% 余白

## 6. CSS クラス定義

```css
.hero-xl { font-size: 80px; font-weight: 900; line-height: 1.1; color: #FF3B30; letter-spacing: -0.02em; }
.hero-l  { font-size: 56px; font-weight: 700; line-height: 1.15; }
.hero-m  { font-size: 40px; font-weight: 700; line-height: 1.3; }
.unit    { font-size: 28px; font-weight: 400; color: #8E8E93; vertical-align: super; margin-left: 4px; }
.kpi-block { display: flex; flex-direction: column; align-items: center; background: #1A1A1A; color: #FAFAF7; border-radius: 8px; padding: 24px 32px; min-width: 200px; }
.kpi-label { font-size: 14px; color: #8E8E93; margin-bottom: 8px; text-transform: uppercase; letter-spacing: 0.08em; }
.roadmap { display: flex; gap: 0; margin-top: 24px; }
.rm-step { flex: 1; padding: 8px 12px; font-size: 13px; color: #8E8E93; border-bottom: 3px solid #333333; }
.rm-step.active { color: #FAFAF7; border-bottom: 3px solid #FF3B30; font-weight: 700; }
.governing-thought { background: #FF3B30; color: #FAFAF7; padding: 8px 16px; font-size: 12px; font-weight: 700; border-radius: 4px; max-width: 320px; }
```

## 7. トーン規律（sales-deck-designer 統合）

### 全体トーン

「ラフ」= カジュアル・形式張らない（敬語の硬さを抜く）。「控えめ」≠「ラフ」。「先生」関係は「凄い弟子」を見たい関係。アンダープロミスは「真面目な部下」戦略であり、「凄い弟子」戦略ではない。

主軸: 自信 + 透明性 + 共同事業者スタンス。透明性は「リスクの正直開示」に限定、「ROI 自虐」は全削除。

### 言い換えルール

| 旧（控えめ） | 新（自信） |
|---|---|
| お願い | 機会の提示 |
| 控えめ ROI | コンサバ前提の IRR |
| 微妙 | 数字の幅と前提を明示 |
| 上回る可能性 | 3 軸レバレッジへの転換 |
| 預金に毛が生えた程度 | （削除） |
| 断られても関係性は続く | （削除） |
| 凄み | 4 重交点の再現困難性 |

### 削除する自虐 / 過剰保守表現

- 「自分の金融トレード年利を上回らないかも」
- 「他運用の方が利回り良い」
- 「壮大すぎ」と映るリスク
- 「断られても関係性は続く」
- 「ピッチで強調しすぎリスク」等の自己反論

### 強化する自信表現

- 軸 A 水野さん本人案件 350 万を「最初から確定する売上の床」
- N.Y.CRAFT 関根さん紹介を「既に動いているチャネル」
- Hotice 受注を「PMF 検証済」
- 「お願い → 機会提示」「先生として導く代わりに、OS の構造的アクセス権を提供」（等価交換）

## 8. 出典 URL ハイパーリンク必須化（brand-guardian 統合）

WebSearch ツールルール準拠。出典名のみではなく markdown ハイパーリンク必須。

### 主要出典 URL

| 出典 | URL |
|---|---|
| Dario Amodei「Machines of Loving Grace」| https://www.darioamodei.com/essay/machines-of-loving-grace |
| Sam Altman「The Gentle Singularity」| https://blog.samaltman.com/the-gentle-singularity |
| Anthropic ASL-3 | https://www.anthropic.com/news/activating-asl3-protections |
| Anthropic Sonnet 4.6 | https://www.anthropic.com/news/claude-sonnet-4-6 |
| Gartner 2026 末 40% | https://www.gartner.com/en/newsroom/press-releases/2025-08-26-gartner-predicts-40-percent-of-enterprise-apps-will-feature-task-specific-ai-agents-by-2026-up-from-less-than-5-percent-in-2025 |
| Gartner 40% キャンセル | https://www.gartner.com/en/newsroom/press-releases/2025-06-25-gartner-predicts-over-40-percent-of-agentic-ai-projects-will-be-canceled-by-end-of-2027 |
| McKinsey State of AI 2025 | https://www.mckinsey.com/capabilities/quantumblack/our-insights/the-state-of-ai |
| BCG AI at Work 2025 | https://codezine.jp/news/detail/21866 |
| 総務省情報通信白書 2025 | https://www.soumu.go.jp/johotsusintokei/whitepaper/ja/r07/html/nd112220.html |
| MarketsandMarkets | https://www.marketsandmarkets.com/PressReleases/ai-agents.asp |
| Grand View Research | https://www.prnewswire.com/news-releases/ai-agents-market-size-to-hit-50-31-billion-by-2030-at-cagr-45-8---grand-view-research-inc-302447060.html |
| BCC Research | https://www.bccresearch.com/pressroom/ait/ai-agents-market-to-grow-433-annually |
| 80,000 Hours AGI 予測 | https://80000hours.org/2025/03/when-do-experts-expect-agi-to-arrive/ |
| TechCrunch LangChain $1.25B | https://techcrunch.com/2025/10/21/open-source-agentic-startup-langchain-hits-1-25b-valuation/ |
| Prosus エージェント VC | https://www.business-standard.com/companies/start-ups/agentic-ai-startups-attract-2-8-billion-vc-funding-2025-prosus-125080501059_1.html |

## 9. 改行規律（brand-guidelines §16② 準拠）

`<br>` タグ許容範囲:

| 場所 | 許容 |
|---|---|
| カバースライド `.sub` 内 | OK（装飾）|
| section-divider `.sub` 内 | OK（装飾）|
| 本文スライドのコンテンツ | NG（句読点後改行 NG）|
| blockquote 内 | NG |

句読点（、。）直後の改行は本文では禁止。Marp では空行で段落分割を使用。

## 10. ケース別運用方針

| ケース | 用途 | 主軸 |
|---|---|---|
| Case A（21+ スライド詳細版）| 深掘り質問対応・宿題回答用 appendix | ダーク背景 + 巨大数字 + 章ロードマップ |
| Case B（10 スライド圧縮版）| MTG 冒頭 15-20 分投影用（推奨主軸）| 1 スライド 1 メッセージ徹底 + Act ラベル |
| Case C（1 ページサマリ）| MTG 前メール添付・配布用（A4 印刷想定）| 白背景維持 + Governing Thought 右上固定 |

3 種を一度に渡さない。MTG 主体は Case B、Case A は appendix 待機、Case C は事前 + 事後参照資料。

## 11. 反証チェック結果

Step 1: ダーク背景は印刷時トナー消費過多 + 紙資料可読性低下リスク → Case C のみ白背景維持で対応 / 巨大数字は KPI 裏付けある箇所限定で適用、無いと「中身のなさ」を露呈 / Y Combinator 流シンプル + 数字 + 余白を主軸、孫流ダーク背景は要所のみハイブリッド採用。

Step 2: 4 エージェント方針統合は概ね整合（ダーク背景 + 巨大数字 + 自信トーン + 出典 URL）/ Marp + Noto Sans JP で 96pt 数字 + SVG 大量埋込は PDF 化時にレイアウト崩れリスク → 1 枚ずつ pdffonts で字形検証 / オフライン環境（MTG 当日 Wi-Fi なし）で Google Fonts 未適用リスク → ローカルフォント事前確認。

Step 3: 4 エージェント並列起動 + 統合は ConsultingOS ハードルール 17（起動全業務標準）遵守 / DESIGN.md 作成は他案件（Hotice / N.Y.CRAFT）にも展開可能なテンプレート化価値あり。

残存リスク: 水野さん個人の好み（明るい / 暗い・写真 / 図解）未確認、第一稿提出後にトーン調整必要 / Marp 表現限界に達した場合 Keynote / Figma 移行検討 / 1280×720 投影と A4 印刷の両方最適化はトレードオフ、ケース別バージョン分割で対応。
