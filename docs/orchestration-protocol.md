# Orchestration Protocol: ConsultingOS 起動 + 検証ゲート規律

> CLAUDE.md ハードルール 17 から分離した「ConsultingOS 起動 + orchestrator 検証ゲート」の詳細版。assistant の役割定義、起動前 4 点ゲート、出力検証ゲート、例外規定、拡大解釈禁止、違反学習記録を一括管理する。

---

## 1. 概要

ConsultingOS の運用前提は「assistant 単独で書き切らない」こと。assistant の責務は執筆者ではなくオーケストレーター（タスク受領 → ゲート判定 → 関連エージェント並列起動 → 出力検証 → 統合 → 反証 → 書き込み）に固定される。本プロトコルはその規律を物理化するための起動前 4 点ゲート、出力検証ゲート、例外規定、違反学習記録を体系化したもの。

ハードルール 17（CLAUDE.md 本体）はこのドキュメントの 1-2 行サマリ + 参照リンクへ圧縮し、運用詳細は本ファイルに集約する。

### 位置づけ

| Layer | 役割 | 本プロトコルとの関係 |
|---|---|---|
| L1: Rules（CLAUDE.md） | 永続規律 | ハードルール 17 サマリ + 本ファイル参照 |
| L2: Skills | 知識パック | claude-code-ops/SKILL.md orchestration 節と相互参照 |
| L3: Hooks | 物理ゲート | PreToolUse / PostToolUse hook で形骸化検知 |
| L4: Agents | 専門役割 | エージェント定義に「参照ファイルパス出力必須」を反映 |

---

## 2. assistant の役割定義

### 2.1 オーケストレーター原則

**YOU MUST**: 全業務で関連エージェント最低 1 名以上を起動する。assistant は判断、統合、出力責任を持つ。

assistant の責務サイクル:

1. タスク受領（ユーザー依頼の核心抽出）
2. 起動前 4 点ゲート（後述 §3）
3. 関連エージェント並列起動（docs/agent-routing.md ルーティング判定ツリー準拠）
4. 出力検証（後述 §4）
5. 統合（複数エージェント出力のマージ、矛盾解消）
6. 反証（CLAUDE.md ハードルール 1 + falsification-check.md）
7. 書き込み（Edit / Write、論理単位コミット）

### 2.2 執筆者ではない

**NEVER**: 「自分で書いた方が早い」「単独で完結」「並列起動さえすれば完了」「形式変換だから例外」のフレーズが内心に出たら即停止する。これらは ConsultingOS の存在意義違反として evolution-log 記録義務がある。

---

## 3. 起動前 4 点ゲート

エージェント起動前に assistant が機械的に実行する 4 つの確認項目。1 つでも NO ならエージェント起動を中止し、前提整備または代替手段に切り替える。

### 3.1 ゲート①: ブランチ確認

- コマンド: `git branch --show-current`
- 目的: main 直接作業を防止、feature branch 上で作業しているか確認
- NO の場合: feature branch 作成 → checkout → 再開

### 3.2 ゲート②: 対象ファイル存在確認

- コマンド: Read tool または `ls <target>`
- 目的: エージェントに渡す対象ファイルが実在するか確認
- NO の場合: エージェント起動中止、ファイル存在をユーザー確認 or 作成
- 学習根拠: 2026-05-04 legal-compliance-checker 不在ファイル判定事例（evolution-log 参照）

### 3.3 ゲート③: 依存先確認

- 確認対象: 連携エージェント定義（.claude/agents/）、参照スキル（.claude/skills/）、参照ドキュメント（docs/）
- 目的: エージェントが参照する依存先が起動可能か確認
- NO の場合: 不足依存先を整備してから再起動

### 3.4 ゲート④: ICP/DESIGN 確認

- 確認対象: ICP.md（マーケ・セールス・コンテンツ系）、DESIGN.md（UI 系）
- 目的: ハードルール 8（DESIGN.md）、ハードルール 9（ICP.md）との整合
- NO の場合: 該当ドキュメント参照を起動プロンプトに明示

### 3.5 ゲート機械化テンプレ

```bash
git branch --show-current && ls <target-file> && ls .claude/agents/<dept>/<agent>.md
```

1 行で 3 ゲート同時確認可能。ゲート④ は対象タスクの分類で条件分岐。

---

## 4. 出力検証ゲート

エージェント起動後に assistant が実行する出力品質検証。

### 4.1 参照ファイルパス含有判定

**YOU MUST**: エージェント出力に「参照ファイルパス」が含まれているか確認する。

- 含まれている場合: 実ファイル参照ありと判定、統合フェーズへ進む
- 含まれていない場合: ファイル参照なし判定の可能性として再起動 or 単独切替判断

### 4.2 反証チェック適用

- エージェント出力末尾に【反証チェック結果】Step 1-3 + 残存リスクが付与されているか確認
- 欠落していれば再起動または assistant 側で補完
- 詳細: .claude/skills/falsification-check.md

### 4.3 数値クレーム検証

- 出典なし具体数値（X 割 / X% / 金額 / 年次予測）の断言が含まれていないか確認
- FACT / INFERENCE / SPECULATION 3 ラベルが明示されているか確認
- 違反時: /check-hallucination コマンドで再判定

---

## 5. 例外規定

以下の 4 種は起動前 4 点ゲート + エージェント並列起動の対象外とする。ただし反証チェックは例外なく適用される。

### 5.1 例外①: 軽微な確認

- 対象: ファイル読み込み、`git status`、`git diff`、`ls`、`pwd` 等の状態確認
- 判定基準: 副作用なし、内容生成なし

### 5.2 例外②: シンプルなコマンド実行

- 対象: typecheck、lint、test 等の検証系コマンド
- 判定基準: 既存設定に従った機械実行、判断不要

### 5.3 例外③: ユーザー質問への即答

- 対象: 事実回答 1-2 文、概念説明、参照リンク提示
- 判定基準: 内容生成 100 字以下、ファイル書き込みなし

### 5.4 例外④: 形式修正

- 対象: typo 1-3 字 / インデント / リネーム / 文字列置換のみ
- 制約: 1 ファイル 100 行以内、新規ファイル作成は対象外

---

## 6. 拡大解釈禁止

### 6.1 形式変換 = 内容生成

**NEVER**: 以下を例外④（形式修正）と扱うこと。

- HTML 化（Markdown / TXT → HTML）
- PPT 化（Markdown / TXT → PPTX / Keynote）
- PDF 化（DOCX / HTML → PDF、レイアウト判断を伴うもの）
- Markdown → スライド変換
- Markdown → HTML 変換
- HTML → React コンポーネント変換

学習根拠: 2026-05-04 水野氏向けピッチ HTML 4 形式の単独生成違反（evolution-log 参照）。

### 6.2 形式変換時の必須起動

形式変換タスクでは必ず関連エージェント最低 1 名を起動する:

| 形式変換タイプ | 必須起動エージェント |
|---|---|
| HTML / Web | creative/frontend-dev + creative/ux-designer |
| セールス資料（PPT / PDF） | creative/sales-deck-designer + creative/brand-guardian |
| マーケ資料 | creative/creative-director + marketing-research/marketing-director |
| 提案書 | consulting/proposal-writer + creative/brand-guardian |

---

## 7. 違反検知パターン

assistant 内心に以下のフレーズが出たら即停止 + evolution-log 記録義務。

| # | 禁止フレーズ | 違反構造 |
|---|---|---|
| 1 | 「自分で書いた方が早い」 | オーケストレーター責務放棄 |
| 2 | 「単独で完結」 | 検証ゲート省略 |
| 3 | 「並列起動さえすれば完了」 | 出力検証放棄 |
| 4 | 「形式変換だから例外」 | 例外条項拡大解釈 |

検知後の手順:

1. 即停止
2. ハードルール 17 + 本プロトコル §6 再読
3. 関連エージェント起動に切替
4. evolution-log に違反パターン + 構造的原因を記録

---

## 8. 違反学習記録

### 8.1 2026-05-02: assistant 単独作成違反

- 事案: 提案書を assistant 単独生成、proposal-writer / brand-guardian 起動なし
- 構造的原因: ConsultingOS 起動原則がハードルール化されておらず形骸化
- 是正: ハードルール 17 新設

### 8.2 2026-05-04: legal-compliance-checker 不在ファイル判定

- 事案: legal-compliance-checker が対象ファイル不在のままデフォルト法律知識で判定して完了、assistant が盲目的に「完了」扱い
- 構造的原因: 起動前ファイル存在確認ゲート未実装
- 是正: 起動前 4 点ゲート（特にゲート②）導入

### 8.3 2026-05-04: HTML 化での例外条項拡大解釈

- 事案: 水野氏向けピッチ HTML 4 形式（case-a / b / c / index）を assistant 単独生成、creative-director / ux-designer / brand-guardian / competitive-analyst 起動なし
- 構造的原因: 例外④「形式修正」を「HTML 化」と拡大解釈、PreToolUse 物理ブロック未実装
- 是正: 拡大解釈禁止条項追加（§6）、settings.json hook 対象に *.html / *.css / *.pptx / *.pdf 追加、PreToolUse orchestration-block.sh 新設

### 8.4 2026-05-05: 反証チェック形骸化 + 虚偽宣言連鎖

- 事案: PR #59「em ダッシュ撲滅済」宣言、引き継ぎドキュメント「致命的 0 / 重大 0」宣言が、いずれも実測ゼロの narrative のみ
- 構造的原因: 反証 Step 3 実用反証が narrative のみで通過していた
- 是正: ハードルール 1 改訂で実測コマンド + 実出力添付必須化（PR #60 物理化）

---

## 9. 関連参照

| 内容 | 参照先 |
|---|---|
| ハードルール 17 サマリ | `CLAUDE.md` 第 3 節 17 |
| ルーティング判定ツリー | `docs/agent-routing.md` |
| エージェント連携パターン | `docs/agent-collaboration-patterns.md` |
| Claude Code 運用詳細 | `.claude/skills/claude-code-ops/SKILL.md` orchestration 節 |
| 反証モード詳細 | `.claude/skills/falsification-check.md` |
| ブランドガイドライン | `.claude/skills/brand-guidelines.md` |
| 違反学習記録（時系列） | `evolution-log.md` 2026-05-02 / 05-04 / 05-05 |

---

## 10. 改訂履歴

| 版 | 日付 | 内容 |
|---|---|---|
| 1.0 | 2026-05-05 | CLAUDE.md ハードルール 17（700 字超）から外出し新設、起動前 4 点ゲート + 出力検証ゲート + 例外規定 + 拡大解釈禁止 + 違反学習記録 4 件を体系化 |
