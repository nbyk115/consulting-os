# N.Y.Craft-OS ベースキット

ConsultingOS（`nbyk115/consulting-os`）からエクスポートした N.Y.Craft 専用 OEM 初期セット。これを `nbyk115/n-y-craft-os-beta` リポジトリに直接アップロードすれば Phase 1 開始可能。

## 取り込み手順（ユーザー側、3 分）

```bash
# 1. ConsultingOS clone
git clone https://github.com/nbyk115/consulting-os ~/tmp-consulting-os

# 2. n-y-craft-os-beta clone
cd ~/
git clone https://github.com/nbyk115/n-y-craft-os-beta
cd n-y-craft-os-beta

# 3. ベースキット内容を全部コピー
cp -r ~/tmp-consulting-os/oem-base-kits/n-y-craft-os/.claude .
cp ~/tmp-consulting-os/oem-base-kits/n-y-craft-os/CLAUDE.md .
cp ~/tmp-consulting-os/oem-base-kits/n-y-craft-os/ICP.md .
cp ~/tmp-consulting-os/oem-base-kits/n-y-craft-os/DESIGN.md .
cp -r ~/tmp-consulting-os/oem-base-kits/n-y-craft-os/docs .

# 4. 初期 commit + push
git add -A
git commit -m "feat: initial - ConsultingOS base for N&Y Craft OEM (Phase 1)"
git push -u origin main

# 5. 一時ディレクトリ削除
rm -rf ~/tmp-consulting-os
```

## 含む内容（既に取り込み済）

| ファイル / ディレクトリ | 内容 |
|---|---|
| `.claude/agents/` | 27 agent 全部 |
| `.claude/skills/` | 26 直下 + 7 サブディレクトリ（mizuno + musk 思想は除外済）|
| `.claude/commands/` | 6 コマンド |
| `.claude/settings.json` | 設定 |
| `.claude/hooks/` | 規律 hook 全部 |
| `CLAUDE.md` | ConsultingOS 規律本体（関根版書き換え必要）|
| `ICP.md` | ConsultingOS ICP（関根版書き換え必要）|
| `DESIGN.md` | デザイン基盤（関根版書き換え必要）|
| `docs/agent-routing.md` | ルーティング判定ツリー |
| `docs/agent-collaboration-patterns.md` | 18 連携パターン |

## 除外済（OEM 別管理 / 機密 / 本体専用）

- `evolution-log.md`（本体規律違反履歴、OEM 新規開始）
- `strategy/`（本体専用案件資料）
- `examples/`（本体例、OEM 不要）
- `.claude/skills/oem-packaging-mizuno.md`（水野氏向け）
- `.claude/skills/references/consulting-playbook-musk-*`（本体専用思想）

## 取り込み後の必須カスタマイズ（Week 1）

### 1. CLAUDE.md 書き換え

冒頭の自己紹介を ConsultingOS → N.Y.Craft-OS に:

```markdown
# N.Y.Craft-OS: 関根版司令塔

ConsultingOS をベースに、N.Y.Craft（代表: 関根 優氏）の判断パターン /
業界文脈 / 顧客像をカスタム編成した OEM 版。
```

### 2. ICP.md 書き換え

ConsultingOS の ICP（B2B コンサル / 代理店向け）→ N.Y.Craft クライアント像に。
業務委託で蓄積した壁打ち履歴ベースで顧客像を再構築。

### 3. DESIGN.md 書き換え

ConsultingOS カラー → N.Y.Craft ブランドカラーに。

## Phase 1 構築フロー（v3 提案書記載、3 ヶ月）

| Week | 内容 |
|---|---|
| 1 | 関根版 CLAUDE.md / ICP.md / DESIGN.md 書き換え |
| 2 | marketing-research-playbook 関根版（小野寺メソッド適応）|
| 3 | 業界プレイブック絞り込み（関根さん業界に合う 1-2 業界）|
| 4 | 不要 agent / skill 削減（OEM 規模適正化）|
| 5-8 | 関根さん判断ログ統合（業務委託蓄積データ取り込み）|
| 9-12 | Phase 1 検証 / 引き渡し |

## 運用規律

- ConsultingOS 本体への逆流禁止（OEM 機密管理）
- 半年に 1 回、本体改善を cherry-pick で取り込み（一方向）
- 関根さん固有データ（判断ログ / ICP / カスタム agent）は本体に混入させない

## 関連参照

- ベース: https://github.com/nbyk115/consulting-os
- 詳細手順書: ConsultingOS 本体 `docs/handoff-n-y-craft-os-beta-setup.md`
- 価格構造: ConsultingOS 本体 `strategy/n-y-craft-oem-case/README.md` v3
