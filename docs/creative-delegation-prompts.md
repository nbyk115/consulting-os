# Creative 部門 委任プロンプトテンプレート集 (2026-05-15 PR #236)

> クリエイティブチームの各 agent が Canva MCP / デザイン参照 / 作業フローをきちんと使うための完成形委任プロンプト。orchestrator はデザインタスクで agent を起動する時、本テンプレートをコピーして使う。雑な委任 (skill / ツール未明示) が「クリエイティブチームがツールを使わない」根本原因のため、本テンプレートで委任を標準化する。

## 共通ルール (全テンプレート適用済)

各テンプレートには以下が組み込み済:
- skill 明示参照 (PR #219/#230、skill-reference-check.sh が未明示を warn)
- Canva MCP 第一選択 (PR #235、デザイン成果物生成)
- §5 デザイン作業フロー (参照取得 → 競合比較 → プロダクト反映 → 識別性ゲート → 2 段階検証)
- 反証チェック Step 1-4

## 1. creative-director (クリエイティブ統括)

```
creative-director として [案件名] の [成果物] のデザイン方針を策定。
着手前に必ず Read:
- ~/.claude/skills/creative-playbook.md (§2.5 ビジュアル品質ルーブリック / §2.6 外部カタログ / visual 生成フロー)
- ~/.claude/skills/references/creative-playbook-distinctiveness.md (識別性ゲート)
手順:
1. デザイン参照を取得 (Lazyweb For Humans / Mobbin / WebSearch / Canva テンプレート、3-5 件)
2. competitive-analyst に競合比較を依頼、「業界標準の型」と「断つべき平均値」を明文化
3. デザイン成果物の生成は Canva MCP generate-design を第一選択 (PR #235)。design_type を指定し query に参照・競合比較・ブランド要件をフル記述
4. 識別性ゲート: 「合理的推奨をどこで断ったか」を 1 行明示
5. ux-designer / frontend-dev / sales-deck-designer に実装を委任、brand-guardian で検証
結論 + 反証チェック Step 1-4。
```

## 2. ux-designer (UX 設計)

```
ux-designer として [案件名] の [画面/フロー] を設計。
着手前に必ず Read:
- ~/.claude/skills/creative-playbook.md
- ux-designer の AI 接続点マッピング (AI 出力領域明示 / ユーザー上書き権 / 不確実性可視化、PR #203)
手順:
1. JTBD (ユーザーが何を成し遂げたいか) から開始
2. デザイン参照 3-5 件を踏まえ、情報設計とワイヤーフレーム
3. AI 機能がある画面は AI 接続点マッピング 3 項目を必須適用
4. 3 クリック以内 / 認知負荷最小 / WCAG 2.1 AA
結論 + 反証チェック Step 1-4。
```

## 3. frontend-dev (HTML 実装)

```
frontend-dev として [案件名] の [画面] を HTML 実装。
着手前に必ず Read:
- ~/.claude/skills/creative-playbook.md (§2.5 ビジュアル品質ルーブリック)
- ~/.claude/skills/claude-code-ops/references/html-output-patterns.md (HTML-First)
手順:
1. デザイン参照・競合比較の結論を反映 (creative-director から受領)
2. 既存デザインシステムがあれば Figma MCP get_design_context で参照
3. HTML/CSS 実装: lang="ja" / viewport / OGP / Twitter Card / @media レスポンシブ必須 (template-injection-check.sh が検証)
4. 視線の流れ設計 (Z 字 / F 字)、1 画面 1 メッセージ
結論 + 反証チェック Step 1-4。
```

## 4. sales-deck-designer (B2B 提案資料)

```
sales-deck-designer として [案件名] の提案資料を作成。
着手前に必ず Read:
- ~/.claude/skills/document-creation-6-steps.md (6 ステップ + HTML/Markdown フォーマット判断軸)
- sales-deck-designer の視線の流れ設計 (PR #227)
手順:
1. 6 ステップ (論点 → メッセージ → 論拠 → ストーリー → 仮説検証 → 最終化) で構成
2. デザイン成果物は Canva MCP generate-design (design_type: presentation / doc) を第一選択 (PR #235)
3. 視線の流れ (Z 字)、1 スライド 1 メッセージ
4. 生成後 brand-guardian で日本語字形を pdffonts / unzip+grep 機械検証 (Hard Rule 10)
結論 + 反証チェック Step 1-4。
```

## 5. brand-guardian (品質ゲート)

```
brand-guardian として [成果物] を機械検証。
着手前に必ず Read:
- ~/.claude/skills/brand-guidelines.md (§6 品質ゲート + 識別性ゲート + 日本語字形)
- ~/.claude/skills/references/creative-playbook-distinctiveness.md
手順:
1. 日本語字形検証: HTML は lang="ja" grep、PPT/PDF は pdffonts / unzip+grep で中国字形フォールバック検出
2. em-dash / 太字 ** / 出典なし数値断言の検出
3. 床ゲート (ビジュアル品質ルーブリック 12 点未満 REJECT) + 天井ゲート (識別性: 合理的推奨をどこで断ったか 1 行明示、未記載 REVISE)
4. PASS / REVISE / REJECT を機械的に判定
結論 + 反証チェック Step 1-4。
```

## 6. content-strategist (コンテンツ・コピー)

```
content-strategist として [案件名] の [コンテンツ/コピー] を設計。
着手前に必ず Read:
- ~/.claude/skills/brand-guidelines.md (トーン / 禁止表現 / AI 文章バレ対策)
- ~/.claude/skills/aeo-playbook.md (AI 検索対応、該当時)
手順:
1. ICP.md でターゲット・利用文脈を確認
2. AI 文章バレ対策チェックリスト適用 (接続詞・語尾の単調回避、ハルシネーション排除)
3. 識別性: 「誰にでも刺さる平均値の言葉」を避け、断る判断を 1 行明示
結論 + 反証チェック Step 1-4。
```

## 運用ルール

YOU MUST: orchestrator は creative 部門の agent を起動する時、本テンプレートの該当 agent 版をコピーし [案件名] [成果物] 等を埋めて委任する。テンプレートを使わない雑な委任 (skill / Canva MCP / フロー未明示) は禁止。skill-reference-check.sh hook が skill 未明示を warn する。

## 反証チェック (Step 1-4 圧縮)

- Step 1: creative 部門 6 agent FACT (.claude/agents/creative/) / 各 agent の skill 対応 FACT (creative-playbook / distinctiveness / document-creation-6-steps 等) / Canva MCP 第一選択 FACT (PR #235)
- Step 2: PR #219/#230 (skill 明示) + PR #235 (Canva 第一選択) + PR #227 (視線フロー) + PR #226 (識別性ゲート) + PR #213 (2 段階検証) を各テンプレートに統合、規律でなく実用委任テンプレート (Hard Rule 13 非該当)
- Step 3 実用反証: 「クリエイティブチームがツールを使わない」根本原因 = 委任が雑で skill/ツール未明示、を完成形テンプレートで構造解決
- Step 4 リスク即潰し: 雑な委任 → 本テンプレートをコピーで使う運用 + skill-reference-check.sh / テンプレート形骸化 → creative-director.md から本ファイル参照、各案件で実使用 / Canva MCP 未使用 → 全テンプレートに「Canva MCP 第一選択」明記
