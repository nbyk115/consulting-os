# N.Y.Craft-OS OEM ベース取り込みガイド（2026-05-09）

> ConsultingOS 本体（`nbyk115/consulting-os`）から N.Y.Craft 専用 OEM リポジトリ（`nbyk115/n-y-craft-os-beta`）への初期セットアップ手順。GitHub MCP 権限が n-y-craft-os-beta のみのため、別セッション直読み不可、ユーザーローカル操作で解決。

## 1. 前提

| 項目 | 内容 |
|---|---|
| ベース商品 | `nbyk115/consulting-os` (public、OEM 前自社商品、残置)|
| OEM リポ | `nbyk115/n-y-craft-os-beta` (private、関根さん専用)|
| 関係 | OEM = ConsultingOS のサブセット + 関根さんカスタム、改修は逆流させない |

## 2. ローカル取り込み手順（ユーザー実行）

```bash
# 1. ConsultingOS を一時 clone
git clone https://github.com/nbyk115/consulting-os ~/tmp-consulting-os

# 2. n-y-craft-os-beta を clone
cd ~/
git clone https://github.com/nbyk115/n-y-craft-os-beta
cd n-y-craft-os-beta

# 3. 必要ファイルをコピー（OEM ベース）
cp -r ~/tmp-consulting-os/.claude .
cp ~/tmp-consulting-os/CLAUDE.md .
cp ~/tmp-consulting-os/ICP.md .
cp ~/tmp-consulting-os/DESIGN.md .

# docs / 一部スキル参考のみコピー（不要なものは後で削除）
mkdir -p docs
cp ~/tmp-consulting-os/docs/agent-routing.md docs/
cp ~/tmp-consulting-os/docs/agent-collaboration-patterns.md docs/

# 4. ConsultingOS 本体専用ファイルを除外（既にコピーしていなければスキップ）
# 以下は n-y-craft-os-beta に持ち込まない:
# - evolution-log.md (本体の規律違反履歴)
# - strategy/ (関根さん案件の v1-v3 提案資料、別 branch で管理済)
# - examples/ (本体例、OEM には不要)
# - .claude/skills/oem-packaging-mizuno.md (水野氏向け、関根さん向けは別作成)
# - .claude/skills/references/consulting-playbook-musk-* (思想は本体専用、引用のみ)

rm -f .claude/skills/oem-packaging-mizuno.md
rm -rf .claude/skills/references/consulting-playbook-musk-* 2>/dev/null
# 必要に応じて他の不要ファイルも削除

# 5. 関根さん向けカスタマイズ準備（空の skill / agent ファイル作成）
mkdir -p .claude/skills/n-y-craft-customizations

# 6. 初期 commit
git add -A
git commit -m "feat: initial - ConsultingOS base for N&Y Craft OEM (Phase 1 構築開始)"
git push -u origin main

# 7. 一時ディレクトリ削除
rm -rf ~/tmp-consulting-os
```

## 3. 含めるファイル一覧

### 必須（コア）
- `.claude/agents/` (27 agent 全部、関根版で個別カスタマイズ)
- `.claude/skills/` (26 直下 + 7 サブディレクトリ)
- `.claude/commands/` (6 コマンド)
- `.claude/settings.json`
- `.claude/hooks/` (規律 hook 全部、関根版で必要に応じて拡張)
- `CLAUDE.md` (関根版に書き換え必須、ConsultingOS 文脈 → N&Y Craft 文脈に)
- `ICP.md` (関根版 ICP に書き換え必須、N&Y Craft の顧客像 / 業界文脈)
- `DESIGN.md` (関根版ブランドガイドラインに書き換え必須)

### 参考（任意）
- `docs/agent-routing.md` (ルーティング判定ツリー)
- `docs/agent-collaboration-patterns.md` (18 連携パターン)

### 含めない（除外）
- `evolution-log.md` (本体の規律違反履歴、OEM では新規で開始)
- `strategy/` (本体専用案件資料)
- `examples/` (本体例、OEM 不要)
- `.claude/skills/oem-packaging-mizuno.md` (水野氏向け、別人案件)
- `.claude/skills/references/consulting-playbook-musk-*` (本体専用思想)
- `evolution-log.md` (履歴 reset)

## 4. 関根さん向け初期カスタマイズ（コピー後）

### 4.1 CLAUDE.md 書き換え

ファイル冒頭の説明を ConsultingOS → N.Y.Craft-OS に書き換え:

```markdown
# N.Y.Craft-OS: 関根版 司令塔

ConsultingOS をベースに、N.Y.Craft（代表: 関根 優氏）の判断パターン /
業界文脈 / 顧客像をカスタム編成した OEM 版。
```

### 4.2 ICP.md 書き換え

旧（本体）: ConsultingOS の ICP（ユーザー個人 + クライアント企業層）
新（関根版）: N.Y.Craft のクライアント像 = 関根さんが業務委託で蓄積した壁打ち履歴ベースの顧客像

### 4.3 marketing-research-playbook.md 関根版（重要）

ユーザー指示「OS をベースに、小野寺信行を関根版にしたい」に対応:

旧: ConsultingOS 本体の小野寺信行メソッド (60/40 ルール / CPC/CPA 脱却 等)
新: 関根さんの業界文脈（Web 制作 / マーケ自動化 / N.Y.Craft 顧客層）に適応

実装ステップ:
1. `.claude/skills/marketing-research-playbook.md` をコピー後、関根さんver に書き換え
2. 60/40 ルールを N.Y.Craft クライアント案件規模に再校正
3. 関根さんの過去判断（業務委託で蓄積）を ICP / 判断ログに統合

### 4.4 不要 agent / skill の削除（または無効化）

OEM 規模に合わない agent は削除（候補）:
- `gtm-consultant` (海外展開、関根さん案件で不要なら削除)
- `pr-communications` (PR、関根さん案件で不要なら削除)
- 業界プレイブック（SaaS / D2C / 製造 / 金融）から関根さん業界外を削除

判断はクライアント案件の業界次第（次セッションで関根さんと協議）。

## 5. Phase 1 構築フロー（v3 提案書記載、3 ヶ月）

| フェーズ | 内容 | 期間 |
|---|---|---|
| 1-1 ベース取り込み | 上記手順 1-3 完了 | Day 1 |
| 1-2 関根版 CLAUDE.md / ICP.md | 文脈書き換え | Week 1 |
| 1-3 marketing-research-playbook 関根版 | 小野寺メソッドの関根適応 | Week 2 |
| 1-4 業界プレイブック絞り込み | 関根さん業界に合う 1-2 業界 | Week 3 |
| 1-5 不要 agent / skill 削減 | OEM 規模適正化 | Week 4 |
| 1-6 関根さん判断ログ統合 | 業務委託蓄積データ取り込み | Week 5-8 |
| 1-7 Phase 1 検証 / 引き渡し | 動作確認 / 教育 | Week 9-12 |

## 6. ConsultingOS 本体への逆流禁止（運用規律）

YOU MUST: N.Y.Craft-OS 側で開発した関根さん固有のカスタマイズは ConsultingOS 本体に逆流させない。

理由:
- 本体は OEM 前商品として knowledge clean 維持
- 関根さん固有の判断ログ / ICP / カスタム agent が本体に混入すると機密管理破綻
- 半年に 1 回、本体の改善（agent / skill 機能追加等）のみ N.Y.Craft-OS に cherry-pick で取り込む（一方向）

### 取り込み運用（半年に 1 回想定）

```bash
# 半年後、ConsultingOS 本体の改善を N.Y.Craft-OS に取り込む例
cd ~/n-y-craft-os-beta
git remote add base https://github.com/nbyk115/consulting-os
git fetch base main
git cherry-pick <本体の改善 commit hash>
# 関根さん固有ファイルは本体改善で上書きしないよう注意
```

## 7. 関連参照

- 親セッション提案: 別リポジトリ新規作成（A 案）+ ConsultingOS 残置
- 価格構造: `strategy/n-y-craft-oem-case/README.md` v3（ConsultingOS 本体 branch、参照用）
- visual: `examples/consulting-os-overview-visual/v9-sato-mode.html`（OEM ピッチで活用可、ただし「N.Y.CRAFT」表記は visual に含めない規律遵守済）
- evolution-log 学習: 2026-05-09「visual reactive correction loop 30+ ラウンド事象」（n-y-craft-os-beta では新規 evolution-log を開始）

## 8. 反証チェック（Step 1-3 圧縮）

- Step 1: 手順 2-3 の cp / rm はユーザーローカル前提、assistant では実行不可（GitHub MCP 権限制約 FACT）
- Step 2: 含めない / 除外ファイルは ConsultingOS 機密管理 + OEM 別管理規律 (前親セッション strategy-lead 統合判断) に整合
- Step 3: 実機 cp / rm 検証はユーザー実行待ち、本ガイドは手順書として機能（実機検証は次セッション課題）
