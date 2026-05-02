# Claude Code Ops — 運用・自動化・パフォーマンス最適化

## いつこのスキルを使うか
Claude Code の性能を最大化したいとき。Hooks・MCP管理・並列ワークフロー・コンテキスト管理・Advisor Strategy・Boris 9規律の判断軸を参照する。
全34エージェント共通の運用基盤。

---

## 4層アーキテクチャ（メタフレーム）

> **出典**: Claude Code Workflow Cheatsheet 2026 Edition

| Layer | 役割 | 実装箇所 |
|---|---|---|
| **L1: Rules** | 永続的なルールと方針（司令塔） | `CLAUDE.md` |
| **L2: Skills** | 自動起動される知識パック | `.claude/skills/*.md` |
| **L3: Hooks** | 安全ゲートと機械的自動化 | `settings.json` の hooks |
| **L4: Agents** | 独自コンテキストを持つサブエージェント | `.claude/agents/**/*.md` |

**判断の原則**: 「全体の方針」→ L1 / 「特定ドメインの知識」→ L2 / 「機械的な強制」→ L3 / 「専門役割の切り出し」→ L4

---

## 4自動化軸の使い分け

| 軸 | トリガー | 用途 | 例 |
|---|---|---|---|
| **Cowork** | タスク開始 | 長時間タスクの自律実行 | 大規模リファクタ |
| **Monitor** | イベント発生 | ログ・CI・障害監視（イベント駆動） | エラーログ即検知 |
| **Hooks** | 特定操作 | PostToolUse / PreToolUse / Stop | 編集後 prettier |
| **Routines** | 時間スケジュール | 毎朝の競合巡回・定期取得 | 業界ニュース |

→ **先回りで設定しない**。実需が出てから。詳細は `references/hooks-monitor-routines.md` 参照。

---

## MCP デフォルト無効原則

**コンテキストウィンドウは命**。MCP を入れすぎると 200k のコンテキストが実質 70k まで縮小する。

- **全MCPデフォルト無効**、有効化は最大 5〜6 個（ツール総数 80 以下）
- **`alwaysLoad` は 2-3 個まで**（GitHub・Figma 等 daily-use のみ）
- **CLI で代替できるなら MCP 不要**（`gh` / `curl` で十分なら導入しない）
- **タスク単位で ON/OFF**、使い終わったら即オフ
→ 詳細・Optional MCP リスト・導入判断フローは `references/context-management.md` 参照（**セッション管理 5 つの術 / context rot / /rewind / /compact vs /clear / サブエージェント判断基準も同ファイル**）

---

## Boris Cherny 流 9 規律（全エージェント徹底）

1. **Plan Mode** を大規模変更（3ファイル以上 / アーキテクチャ判断 / 本番影響）で必須
2. **自己検証**: 実装後に typecheck/test/lint を変更直後に実行（反証モード Step 1-3 と統合）
3. **CLAUDE.md "ruthlessly edit"**: 形骸化ルールは追加でなく削除。月1レビュー
4. **権限 allow/deny/ask 明示**（settings.json）— 承認疲れ減 × 危険操作物理ブロック
5. **サブエージェント context separation**（メイン汚染防止）
6. **`/compact` + `/btw`** でコンテキスト攻撃的管理
7. **Demand Elegance**: 非自明変更で「もっとエレガントな方法は？」自問
8. **Verification Before Done**: 証明なしで complete マークしない（反証 Step 3 と統合）
9. **Autonomous Bug Fixing**: バグ報告 = 修正開始、ログ→根本原因→修正を一気通貫

→ 詳細・実例は `references/boris-cherny-9-rules.md` 参照。

---

## Advisor Strategy（コスト最適化の核心）

> **Opus をアドバイザー、Sonnet/Haiku を実行役にペアリングし、Opus 同等の知能を低コストで実現。**

- **Executor（Sonnet 4.6）**: 毎ターン呼び出し。ファイル操作・コード生成・定型タスク
- **Advisor（Opus）**: オンデマンド呼び出し。戦略判断・設計レビュー・品質ゲート
- 設定: エージェントファイルの `model:` フロントマターで指定
- 公式機能 `/advisor opus` でセカンドオピニオンを常時 ON 推奨

→ 部門別ペアリング・運用詳細は `references/advisor-strategy.md` 参照。

---

## SDK 化・自動化（「AIを使う」から「AIで出荷する」への分岐）

Claude Code SDK + GitHub Actions で、対話的運用から本番自動化（Stage 1 → Stage 2-3）への移行が可能。

### Anthropic 公式 3 層アーキテクチャ
| Layer | 役割 | 用途 |
|---|---|---|
| L1: SDK | 生のプログラマブルアクセス | フルカスタム実装 |
| L2: Base Action | SDK をクリーンな API に包んだ層 | カスタム workflow |
| L3: PR Action（claude-code-action） | コメント・整形・GitHub UX 全部込み | 即本番投入 |

### 60 秒本番投入フロー
1. ターミナルで `/install-github-app` → GitHub App + Secrets 自動セットアップ
2. `.github/workflows/*.yml` に `anthropics/claude-code-action@v1` 記述
3. ANTHROPIC_API_KEY を GitHub Secrets に登録
4. PR 作成 → 自動レビュー実行

→ 専用サーバー / デプロイパイプライン / 監視基盤 / 認証 / コスト管理は不要、既存 GitHub Actions Runner で完結。

→ 詳細（claude -p / パイプ / --output-format JSON / 権限管理 / セッション永続化 / ペルソナ差し替え / Issue → PR 自動化 / 商業機会）は `references/sdk-automation.md` 参照。

---

## ショートカット早見表

| キー | 機能 |
|---|---|
| `Ctrl+U` | 1行丸ごと削除 |
| `!` | bashコマンドをクイック実行 |
| `@` | ファイルをインクリメンタル検索 |
| `/` | スラッシュコマンド起動 |
| `Shift+Enter` | 複数行入力 |
| `Tab` | 思考表示の切り替え |
| `Shift+Tab` → `Tab` | Auto Accept モード |
| `Shift+Tab` → `Shift+Tab` | **Plan Mode**（計画のみ、実行しない） |
| `Esc Esc` | Claude中断 & コード復元 |
| `/init` | 初期化・スターターメモリ生成 |
| `/doctor` | インストール・設定診断 |
| `/compact` | コンテキスト手動圧縮 |

---

## Anthropic 公式マルチエージェントパターン × ConsultingOS 対応表

> **出典**: Anthropic "Building Effective Agents" (2024)

| # | 公式パターン | ConsultingOS 実装箇所 |
|---|---|---|
| 1 | Prompt Chaining | `CLAUDE.md` エージェント連携パターン1-18 |
| 2 | Routing | `CLAUDE.md` スマートルーティング判定ツリー |
| 3 | Parallelization | `/fork` / `git worktree` / Agent Teams / 反証モード Step 2 |
| 4 | Orchestrator-Workers | `strategy-lead` / `marketing-director` 起点の連携、Agent Teams 3-5名 |
| 5 | Evaluator-Optimizer | 反証モード3段階 + `agent-evaluation.md` + `/advisor opus` |

### ConsultingOS 独自拡張
| # | パターン | 実装箇所 |
|---|---|---|
| 6 | Governance Overlay | `CLAUDE.md` 干渉原則（佐藤×小野寺） |
| 7 | Thought Leader Embedding | 全34エージェントの「思想的基盤」 |
| 8 | Self-Evolution Loop | `/evolve` + `evolution-log.jsonl` |

### ギャップ診断
- ⚠️ **Voting**（同一タスク複数実行の合議）は形式化されていない → 将来追加候補
- ⚠️ **Prompt Chaining の自動 gate check** 未実装 → 将来追加候補

---

## Iterative Refinement Prompt（汎用改善一言）

```
これを本番運用レベルに引き上げて。
より具体的に、より断定的に、トレードオフを明示して。
```

**使用シーン**: 初回出力が抽象的・総花的 / 「無難な正解」で止まっている / 反証モード Step 3 で物足りない時。

---

## 適用エージェント
全34エージェント共通（運用基盤）

> 反証モード（トリプルチェック）の共通ルールは `CLAUDE.md` を参照。

---

## 9. Anthropic Applied AI チーム公式知見（Hannah & Jeremy）

ConsultingOS 既存規律と相補的な 5 項目のみ取り込み（残り 9 項目は既存内包・コンセンサス追従回避）。

### 9.1 エージェント使うべき 4 条件（ルーティング前段ゲート）

agent-routing.md の判定前に必ず確認。1 つでも NO ならエージェント不要・別手段で解決。

| 条件 | 判定 |
|---|---|
| タスクが複雑（人間が手順を順番に書き出せないレベル） | YES → 進む / NO → 単発スクリプト・コマンドで十分 |
| 価値が高い（粗利インパクト・時間節約） | YES → 進む / NO → 形骸化リスク、エージェント不要 |
| 必要なツールを AI に渡せる | YES → 進む / NO → ツール整備が先 |
| エラーが検知・修正可能（取り返しがつく） | YES → 進む / NO → 物理ブロック層必須 |

### 9.2 thinking block で計画を先に立てさせる（反証モード Step 1 強化）

extended thinking の最初のブロックで以下を明示させる。

- いくつツールを使うか先に決める
- どんなソースを当たるか先に書く
- 成功条件を先に定義する
- 「答えが見つかったら検索を止めていい」「シンプルな質問は 5 ツール以下、複雑なら 10〜15 まで」を明文化

これで暴走停止 + 反証 Step 1 の自己反証が深化。

### 9.3 Interleaved Thinking 活用（ハルシネーション検出強化）

Claude 4 のツール呼び出し間思考機能。`/check-hallucination` の補完として常用。

- ツール実行直後の thinking で「結果が信頼できるか」を毎回問う
- 出典 3 ラベル（FACT / INFERENCE / SPECULATION）の判別を thinking 内で先行実施
- ウェブ検索結果の盲信を防止（特に WebFetch / WebSearch 後）

### 9.4 コンパクション運用詳細（19 万トークン自動圧縮）

`/compact` の運用ナレッジ補強。

- 自動発火: 約 19 万トークン到達時に自動コンパクション
- 動作: 全コンテキストを「濃いけど正確な要約」に圧縮、新 Claude に継承
- 副作用: 圧縮で失われやすい情報 → 重要決定は `/btw` でメモ化、外部ファイル（evolution-log / docs/）に書き出す
- 24 時間運用の鍵: コンパクション + 外部ファイル + サブエージェント委譲の 3 点セット

### 9.5 eval の段階的開始（過剰自動化回避）

`/tdd` `/review-pr` `agent-evaluation.md` の評価軸補強。

- Phase 1: 手動テスト数件（最初から数百件の自動テストを作るな）
- Phase 2: LLM as Judge + rubric（採点基準表）で半自動化
- Phase 3: 最終状態チェック（TauBench 流）「DB が正しく更新されたか」だけ見る
- 競プロ問題で実コーディング能力を測ろうとしない（現実的タスクで測る）

### 既存内包で取り込み不要の 9 項目

Hannah & Jeremy の 14 項目のうち以下は既に ConsultingOS に内包済（重複追加禁止）。

| 項目 | 内包先 |
|---|---|
| エージェント定義 = ループ | CLAUDE.md / 30 エージェント前提 |
| エージェントの気持ちで考えろ | brand-guidelines / 同僚エンジニアテスト |
| 新卒インターン指示 | agent definition の作法に内包 |
| ツール選択の指示が 9 割 | docs/agent-routing.md |
| 副作用注意 | 反証モード Step 2 |
| 外部ファイル + サブエージェント | references/context-management.md / Task tool |
| Claude を Claude にさせろ | 冗長性禁止規律 / 最小プロンプト原則 |
| 良いツールの条件 | brand-guardian REJECT 基準 |
| まとめ（要約） | 取り込み不要 |

---

## 10. Boris Cherny 公式 Claude Code 機能（実需ベース取捨選択）

ConsultingOS の現状（単一リポ / Hotice 1 件受注 / SDK Phase 1 PoC 段階）と照合し、実需顕在化済の 3 項目のみ取り込み。残り 5 項目は先回り設定リスクで保留。

### 10.1 取り込み 3 項目（実需顕在化済）

#### git worktree 並列開発（claude -w）

- 用途: examples/ 配下の複数案件を同時並行で進める / 反証モードの「2 案検討」を別 worktree で並列実行
- 実需: Hotice 案件成果物 examples/hotice-sales-deck/ と次案件を並行する場合に必須
- 推奨運用: 3〜5 worktree 同時実行（Boris 推奨値）/ 各 worktree は独立ブランチ（`feature/<案件名>`）
- リスク: Git 規律違反（main 直接 push）が worktree でも発生しうるため PreToolUse hook 物理ブロック層を全 worktree で適用

#### /batch（大規模変更 worktree 分散）

- 用途: 30 エージェント全員の definition 一括更新 / 19 スキル全体への横断変更
- 実需: CLAUDE.md スリム化第 2 弾（369 → 358）のような全体改修で活用可能
- 推奨運用: ruthlessly edit と組み合わせ「追加は削除と 1 セット」を全 worktree で徹底

#### --bare（SDK 起動 10 倍高速化）

- 用途: SDK Phase 1 PoC（claude-code-action@v1）の起動時間短縮
- 実需: GitHub Actions 内での Claude Code 起動コスト削減、ユニット時間短縮
- 推奨運用: .github/workflows/ の Claude Code 起動時に `--bare` 標準化

### 10.2 保留 5 項目（先回り設定リスク・実需顕在化次第）

| 機能 | 保留理由 |
|---|---|
| /loop, /schedule（24 時間運用） | Hotice 1 件受注のみ、24 時間運用の実需未顕在化。複数案件並行 + 月次定期業務が顕在化してから導入 |
| claude --teleport（デバイス間転送） | 単一 PC 環境前提、複数デバイス運用の実需なし |
| /branch（セッションフォーク） | 反証モード Step 1（自己反証）で代替可能、過剰機能 |
| /voice（音声入力） | 個人環境依存、ConsultingOS の規律徹底にメリット薄 |
| --add-dir（複数リポアクセス） | 単一リポ運用、現状不要 |

### 10.3 取捨選択の判断軸（佐藤裕介流）

- 「Boris 公式紹介」「Anthropic 公式」だからといって全部取り込まない（コンセンサス疑念）
- 実需顕在化済 = ストック資産化に直結するもののみ採用
- 保留項目は evolution-log の再評価カレンダー対象、実需出現時に再判定
- 「使えそう」「便利そう」は形骸化トリガー、即却下


| Ver | 日付 | 変更内容 |
|---|---|---|
| 1.0.0 | 2026-03-25 | 初版 |
| 1.1.0 | 2026-04-12 | Anthropic公式5パターン対応表・反復改善プロンプト追加 |
| 1.2.0 | 2026-04-12 | 4層アーキテクチャ・Hook exit code仕様・Plan Mode追加 |
| 1.3.0 | 2026-04-12 | OpenDataLoader PDF追加 |
| 2.0.0 | 2026-04-30 | SKILL.md 200行化 + references/ 4分割（advisor / hooks-monitor-routines / context-management / boris-cherny-9-rules） |
| 2.1.0 | 2026-05-02 | Anthropic Applied AI チーム公式知見 5 項目追加（4 条件ゲート / thinking block 計画 / Interleaved Thinking / コンパクション運用 / eval 段階開始）。残り 9 項目は既存内包で重複追加禁止 |
| 2.2.0 | 2026-05-02 | Boris Cherny 公式 Claude Code 機能 3 項目取り込み（worktree -w / /batch / --bare）。5 項目は実需顕在化次第保留（/loop /schedule / teleport / /branch / /voice / --add-dir）|
