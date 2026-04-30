# コンテキスト管理 詳細 — MCP・ツール・メモリ

> **コンテキストウィンドウは命。MCP を入れすぎると 200k のコンテキストが実質 70k まで縮小する。**

---

## MCP・Plugin 管理

### 鉄則: コンテキストウィンドウは命

### 管理ルール

| ルール | 内容 |
|---|---|
| **全 MCP デフォルト無効が原則** | MCP は追加しても `disabledMcpServers` に即登録。必要時のみ有効化 |
| **有効化は最大 5〜6 個まで** | ツール総数 80 以下を目安。超過でコンテキスト壊滅 |
| **タスク単位で ON/OFF** | タスク開始時に有効化 → 完了時に無効化 |
| **使っていないものは即オフ** | 定期的に `/mcp` で状態確認 |
| **API や CLI で足りるなら MCP 不要** | `gh` CLI、`curl` 等で代替可能なら MCP は追加しない |
| **無料運用が前提** | 有料 API を必要とする MCP は導入前にコスト確認必須 |

### MCP 導入判断フロー
```
1. 本当に MCP が必要か？ → CLI/API で代替できるなら不要
2. 無料で使えるか？ → 有料なら導入しない（明示的な許可がない限り）
3. 追加 → 即 disabledMcpServers に登録
4. 使うとき → 有効化 → タスク完了 → 無効化
```

### 現在の MCP 構成
> **このプロジェクトでは MCP を使用していません。**
> GitHub 操作は `gh` CLI、API 呼び出しは `curl`/Bash で代替。

### Optional MCPs（案件発生時に有効化する候補リスト）

> **原則**: 今は入れない。該当案件が発生した瞬間に settings.json に追加する。投機的抽象化を避けるため事前設定しない。

| MCP | 有効化する案件条件 | 対応エージェント |
|---|---|---|
| **Shopify AI Toolkit** | D2C/EC コンサル案件・商品管理/在庫/SEO 自動化 | performance-marketer / fullstack-dev / seo-specialist |
| **Stripe MCP** | 決済統合実装・サブスク設計 | fullstack-dev / ai-engineer |
| **Notion MCP** | クライアント案件のドキュメント同期・ナレッジ管理 | proposal-writer / product-manager |
| **Slack MCP** | チームコミュニケーション統合（長期プロジェクト） | client-success / strategy-lead |
| **Linear/Jira MCP** | プロダクトバックログ連携 | product-manager / tech-lead |

→ 有効化する場合は「5-6 個上限」のルールを守り、使用完了後は無効化。

---

## Tool Search（MCP 多すぎ対策）

```json
{
  "env": { "ENABLE_TOOL_SEARCH": "auto:5" }
}
```
- MCP ツール定義がコンテキストの 5% を超えたら自動有効化
- ツールは名前だけコンテキストに入り、使用時にスキーマを動的取得

---

## rtk（コマンド出力圧縮）★Service Dev / Creative 部門で推奨

> **git status, ls, find 等のコマンド出力を事前圧縮し、トークン消費を最大 90% 削減。**
> **ただし効果があるのは Bash コマンドを多用する用途のみ。**

```bash
cargo install rtk
```

- **仕組み**: Bash コマンドの出力がコンテキストに流れる前に、rtk が自動で圧縮・フィルタ
- **効果**: git status, ls, find, npm, docker, kubectl 等の冗長な出力を最小限に
- **claude-mem との使い分け**: rtk は「今のセッション内」のトークン節約、claude-mem は「セッション間」のメモリ

#### 効果があるエージェント（Service Dev / Creative）
| エージェント | rtk が効くコマンド |
|---|---|
| fullstack-dev | npm, git, ls, find, grep |
| frontend-dev | ビルド出力, lint, テスト結果 |
| tech-lead | grep, find, code review 系 |
| infra-devops | docker, kubectl, ログ確認 |
| ai-engineer | pip, ビルド, 評価実行 |

#### 効果が薄いエージェント
Consulting / Marketing / Global / Product 系は Bash コマンドをほぼ使わないため、削減率は 3% 以下。**これらの部門では導入不要。**

---

## claude-mem（永続メモリ圧縮）★推奨

> **セッション間の記憶を自動保存・自動注入。トークン消費を削減し、使用料到達を遅らせる。**

```bash
npx claude-mem install
```

- **自動保存**: セッション終了時に会話内容を圧縮して保存
- **自動注入**: 次のセッション開始時に必要な部分だけ読み込む
- **claude-subconscious との関係**: claude-mem が自動メモリ、claude-subconscious が構造化メモリ。補完関係

---

## /compact: 手動コンテキスト圧縮
長いセッションで応答が遅くなったら `/compact` 実行。重要な情報は CLAUDE.md やスキルファイルに残っているため、圧縮しても失われない。

---

## claude --resume: 中断セッションの再開

```bash
claude --resume
```

- **claude-mem との関係**: claude-mem はセッション終了時に自動保存・次回注入。`--resume` は同一セッションの直接継続。両方併用で二重に守られる
- **使い分け**:
  - 同じ作業を続ける → `--resume`
  - 前のセッションの知見を踏まえて別の作業 → 新セッション（claude-mem が自動注入）

---

## /rewind & /checkpoints: 巻き戻し
- `/rewind`: 会話を以前の状態に巻き戻し
- `/checkpoints`: ファイル単位の Undo 管理

---

## コードマップの活用
`/codemap` コマンドで `.claude/codemap.md` を生成しておくと、巨大コードベースでもコンテキストを消費せずに Claude がナビゲートできる。

### code-review-graph（Tree-sitter AST 解析・精度重視）★Service Dev 向け上位版

> **/codemap は手動 Markdown、code-review-graph は AST 自動解析。トークン削減 6.8 倍の実測値あり。**

```bash
pip install code-review-graph
```

- **仕組み**: Tree-sitter で AST 解析 → ファイル依存関係を構造的にマッピング → 差分追跡で増分更新
- **効果**: Claude がクエリする時だけ関連ファイルを返す。全コードベース読み込みを回避
- **実測**: 13,205 トークン → 1,928 トークン（6.8 倍削減）、レビュー品質 7.2 → 8.8

### 使い分け
```
小規模プロジェクト → /codemap で十分
中〜大規模（100 ファイル超）→ code-review-graph
コードレビュー特化 → code-review-graph
汎用構造検索 → claude-mem:smart-explore
```

### 対応エージェント
- `tech-lead` — コードレビュー・技術負債分析
- `fullstack-dev` — 大規模リファクタリング時の影響範囲特定
- `frontend-dev` — コンポーネント依存関係の把握
- `infra-devops` — Infrastructure as Code の依存関係分析

---

## backlog/ フォルダ習慣（大量の指摘・TODO 管理）

> **システム分析や長文レビューで出てきた大量の指摘・タスクを、まず md に吐かせてから 1 つずつ処理する。**

AI に分析させると 5-10 個の重要な指摘が一気に出ることが多い。そのまま順番に処理するとコンテキストが詰まる。代わりに `backlog/` フォルダに全タスクを md として吐かせてから処理する。

```
project/
├── backlog/
│   ├── 001-security-audit-findings.md
│   ├── 002-performance-bottleneck.md
│   ├── 003-ux-issues.md
│   └── done/
│       └── 000-initial-setup.md
```

**活用方法**:
1. AI に「分析結果を `backlog/` に md で吐いて」と指示
2. 1 つの md を開いて新しいスレッドで処理開始
3. 完了したら `backlog/done/` に移動 or 削除
4. フォローアップ項目があれば既存 md に追記
5. 別モデル（Opus/Sonnet/外部 AI）にレビュー依頼する際も md を渡すだけで文脈が伝わる

**ConsultingOS 適合**: `/evolve` 結果、`/review-agent-essence` 結果、`agent-evaluation` の C 判定タスクを `backlog/` に吐き出せば段階的に処理できる。

**鉄則**: 何でも md に吐かせまくる。これが最強のコンテキスト管理。

---

## notebooklm-py（外部リサーチ委譲）

> **大量の資料分析を NotebookLM に丸投げし、ConsultingOS 側はコンテキストを消費せずに要点だけ受け取る。**

### 何ができるか
- URL/PDF/YouTube 動画を一括取り込み
- NotebookLM が自動でソース間を横断分析
- 音声・動画・スライド・クイズをプログラムで生成

### 導入
```bash
pip install notebooklm-py
```

### ConsultingOS 活用

| エージェント | 用途 |
|---|---|
| global-journalist | 海外ニュース 100 記事を一括投入 → 要約取得 |
| market-researcher | 業界レポート 10 本を一括分析 |
| competitive-analyst | 競合 IR/プレスリリースを一括処理 |
| content-strategist | 長文執筆時の参考資料を蓄積 |
| strategy-lead | M&A 対象企業の全公開資料を一括分析 |

---

## OpenDataLoader PDF（ローカル PDF 高精度抽出）

> **Claude Code 標準の Read では扱いきれない長文・表・OCR 対象 PDF を Markdown/JSON/HTML に変換。**
> **出典**: github.com/adlnet/OpenDataLoader-PDF（Apache 2.0・GPU 不要・無料）

### 何ができるか
- **100 ページ/秒** の高速パース
- **テーブル抽出 92.8% 精度**（#1 benchmark）
- **OCR 対応**（80+ 言語、300 DPI scan 対応）
- **LaTeX 数式・画像・チャート** 抽出
- **RAG 向け構造化 Markdown** 出力

### 導入
```bash
pip install opendataloader-pdf
opendataloader-pdf input.pdf --format markdown > output.md
```

### Claude Code 標準 Read との使い分け

| PDF サイズ/複雑度 | 推奨 |
|---|---|
| 1-20 ページ・単純レイアウト | Claude Code 標準 Read |
| 20 ページ超 または 表重視 | OpenDataLoader → Markdown 化 → Read |
| OCR 必要（scan PDF） | OpenDataLoader のみ |
| RAG 構築・bounding box 必要 | OpenDataLoader の JSON 出力 |

### ConsultingOS 活用

| エージェント | 活用場面 |
|---|---|
| competitive-analyst | 競合の annual report / IR 資料 |
| global-journalist | WEF / McKinsey / Edelman 等の長文レポート |
| market-researcher | 市場調査 PDF の表データ抽出 |
| legal-compliance-checker | 契約書・利用規約 PDF の構造化 |
| proposal-writer | 過去提案書からの要素再利用 |
| ai-consultant | 技術ホワイトペーパーの精読 |

---

## settings.json 推奨設定

> **settings.json は 4 層ある。User（全プロジェクト共通）→ Project（チーム共有）→ Local（個人 gitignore）→ Managed（組織ポリシー）の順で上書き。**

### セッション管理
```json
{ "cleanupPeriodDays": 365 }
```
- デフォルト 30 日 → 365 日に延長。過去セッション検索が可能に

### 危険操作の deny リスト
```json
{
  "permissions": {
    "deny": [
      "Bash(rm -rf /*)",
      "Bash(chmod 777 *)",
      "Bash(git push --force *)",
      "Bash(git reset --hard *)"
    ]
  }
}
```
