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
- 詳細・Optional MCP リスト・導入判断フローは `references/context-management.md` 参照

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
| 5 | Evaluator-Optimizer | 反証モード3段階 + `agent-evaluation.md` + `skill-evolution.md` + `/advisor opus` |

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

## バージョン履歴

| Ver | 日付 | 変更内容 |
|---|---|---|
| 1.0.0 | 2026-03-25 | 初版 |
| 1.1.0 | 2026-04-12 | Anthropic公式5パターン対応表・反復改善プロンプト追加 |
| 1.2.0 | 2026-04-12 | 4層アーキテクチャ・Hook exit code仕様・Plan Mode追加 |
| 1.3.0 | 2026-04-12 | OpenDataLoader PDF追加 |
| 2.0.0 | 2026-04-30 | SKILL.md 200行化 + references/ 4分割（advisor / hooks-monitor-routines / context-management / boris-cherny-9-rules） |
