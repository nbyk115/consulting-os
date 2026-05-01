# ConsultingOS

## Project
コンサル・開発・プロダクト・クリエイティブ・グローバル・マーケティング 6 部門のマルチエージェント OS（30 エージェント）。提案 → 実装 → コンテンツ → 海外展開 → マーケまで一気通貫。

## Stack
Claude Code（v2.1.122+）/ Markdown ベースのエージェント・スキル定義 / GitHub MCP / Figma MCP（必要時）/ Gitleaks（pre-commit 必須）。

## Commands
- `/tdd` — テスト駆動サイクル（Red→Green→Refactor）
- `/security-scan` — OWASP・シークレット・CVE 走査
- `/review-pr` — PR 5 軸レビュー
- `/check-hallucination` — 反証クレーム抽出 → 3 ラベル分類
- `/analyze` — 第一原理分解（クイック）
- `/review-agent-essence` — エージェント本質レビュー

## Architecture
- `.claude/agents/consulting/` — 戦略・提案・KPI・法務（7 名）
- `.claude/agents/service-dev/` — 実装・AI・インフラ（4 名）
- `.claude/agents/product/` — PdM・VOC（2 名）
- `.claude/agents/creative/` — UX・FE・コンテンツ・ブランド・グロース（6 名）
- `.claude/agents/global/` — GTM・海外メディア・トランスクリエーション（3 名）
- `.claude/agents/marketing-research/` — 広告・SEO・CRM/MA・SNS・PR・調査（8 名）
- `.claude/skills/` — 全エージェント参照プレイブック（19 本、500 行超は `references/` 分離）
- `.claude/commands/` — スラッシュコマンド定義
- `docs/agent-routing.md` — ルーティング判定ツリー・部門別 Step・チーム編成
- `docs/agent-collaboration-patterns.md` — 18 連携パターン詳細
- `.claude/skills/falsification-check.md` — 反証モード詳細プロセス
- `DESIGN.md` / `ICP.md` — UI 規約・ターゲット定義（プロジェクトルート）

## Rules
- **YOU MUST**: 全アウトプット末尾に【反証チェック結果】+ 出典 3 ラベル（FACT/INFERENCE/SPECULATION）。短文時は圧縮版可、完全省略は禁止。
- **YOU MUST**: 全コード変更後に typecheck / test / lint を変更直後に実行。
- **YOU MUST**: 出力順序は「結論 → 根拠 → 具体アクション」、数値は具体化（「30% 改善」「粗利 XX 万円増」）。
- **YOU MUST**: 論理単位ごとに別コミット。1 commit = 1 目的。
- **IMPORTANT**: 最小限の変更のみ。隣接コードの「ついでにリファクタ」は禁止（外科的変更原則）。
- **IMPORTANT**: 2 案で迷ったら両方説明してユーザーに選ばせる。
- **IMPORTANT**: 大規模変更（3 ファイル以上 / アーキ判断 / 本番影響）は Plan Mode 必須。
- **IMPORTANT**: 変数・CSS・UI 削除は全参照を grep で列挙してから実施。
- **IMPORTANT**: 英語コンテンツ（LinkedIn・X・英文メール等）は日本語訳を併記（明示指定時のみ省略可）。
- **IMPORTANT**: UI を作るときは `DESIGN.md` を、マーケ/セールス/コンテンツ制作時は `ICP.md` を必ず参照。
- **IMPORTANT**: 日本語出力は `lang="ja"` / `ja-JP` 必須、中国字形フォントへのフォールバック禁止。
- **NEVER**: 出典なし具体数値（X 割 / X% / 金額 / 年次予測）の断言。
- **NEVER**: 形骸化ルールの追加（Boris #3: ruthlessly edit、追加でなく削除）。
- **NEVER**: `git push --force` / `git reset --hard` / `rm -rf` / `chmod 777` / `--dangerously-skip-permissions` / `.env`・credentials・secrets の読取・出力・コミット。
- **NEVER**: main へ直接 push。Squash and merge 以外でのマージ。

## Workflow
1. ルーティング判定（複数部門は `docs/agent-routing.md` 参照）→ 該当エージェント起動。
2. feature ブランチで作業 → 論理単位ごとにコミット → PR 作成。
3. PR タイトルは日本語で簡潔に。マージは **Squash and merge** のみ、マージ後ブランチ削除。
4. PR マージ URL（`https://github.com/<owner>/<repo>/compare/main...<branch>`）を必ずユーザーに提示。
5. 長セッションは `/compact`、重要決定は `/btw` でメモ化。

## Out of scope
- **NEVER 書く**: キャラ設定（"シニアエンジニアとして" 等）/ Linter・Prettier 整形ルール / 全 doc の @-imports / Global で言ったルールの再掲 / Auto Memory が学習する内容。
- **MCP 先回り設定禁止**: 実需が出るまで導入しない。`alwaysLoad` は 2-3 個まで。
- **30 エージェント全員列挙禁止**: 詳細は各部門ディレクトリ・`docs/agent-routing.md` で参照。
- **連携パターン詳細禁止**: `docs/agent-collaboration-patterns.md` に集約。
- **反証プロセス詳細禁止**: `.claude/skills/falsification-check.md` に集約。
