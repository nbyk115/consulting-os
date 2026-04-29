# clients/ — クライアント案件管理

> 全クライアント案件のディレクトリ。**機密性の高い情報を含むため、Layer 0/1/2 セキュリティ規律を厳守**。

---

## ディレクトリ構造（標準）

```
clients/
└── <client-slug>/                    # クライアント別（小文字ハイフン区切り、例: hotice / dentsu-digital）
    ├── README.md                     # クライアント概要・連絡先・契約状態
    ├── DESIGN.md                     # クライアント固有のデザイン基盤（DESIGN.md テンプレ起点）
    ├── ICP.md                        # クライアント固有のターゲット定義（ICP.md テンプレ起点）
    ├── contracts/                    # 契約書・SOW・NDA（gitignore推奨）
    │   ├── nda-YYYYMMDD.pdf
    │   ├── sow-YYYYMMDD.pdf
    │   └── msa-YYYYMMDD.pdf
    ├── deliverables/                 # 納品物
    │   ├── proposal-YYYYMMDD/        # 提案書（examples/proposal-template/ 起点）
    │   ├── deck-YYYYMMDD/            # セールスデッキ（examples/hotice-sales-deck/ 起点）
    │   └── reports/                  # 週次・月次レポート
    ├── meetings/                     # MTG 議事録
    │   └── YYYYMMDD-<topic>.md
    ├── data/                         # クライアント提供データ（gitignore推奨）
    │   └── .gitkeep
    └── memory/                       # クライアント固有の蓄積知見
        ├── stakeholders.md           # 関係者プロファイル（PR/CS連携で活用）
        ├── decisions.md              # 重要意思決定履歴
        └── learnings.md              # 学んだこと（次案件に活かす知見）
```

**並列で `.claude/memory/clients/<client-slug>/` も作成**:
- 各エージェントが参照するメモリ（`competitor-watch.md` / `market-data.md` / `evolution-log.md`）
- gitignore 対象。ローカルのみ

---

## 機密管理ルール（Layer 0/1/2 連動）

### gitignore 必須（クライアント案件特有）
`.gitignore` に以下を追加:
```
# Client confidential
clients/*/contracts/
clients/*/data/
clients/*/memory/
clients/*/deliverables/*/raw/
.claude/memory/clients/
```

### Gitleaks 強化（Layer 0）
- クライアント案件リポジトリでは **必ず gitleaks pre-commit hook 導入**
- `.gitleaksignore` でクライアント名・固有表現を除外（誤検知防止）

### CLAUDE.md にクライアント名を直接書かない（Layer 1）
- CLAUDE.md は version-controlled で公開リスクあり
- クライアント名・案件詳細は `clients/<client-slug>/README.md` に記載
- 案件中の作業時のみ「現在は `<client-slug>` 案件」と参照

### settings.json（Layer 2）強化
- `permissions.deny` に `Read(clients/**/contracts/**)` を必要に応じて追加
- クライアント機密データへの誤読み出しを物理ブロック

---

## 案件開始フロー

新規クライアント案件開始時:

```bash
# 1. ディレクトリ作成
CLIENT="<client-slug>"  # 例: acme-corp
mkdir -p clients/$CLIENT/{contracts,deliverables,meetings,data,memory}
mkdir -p .claude/memory/clients/$CLIENT

# 2. テンプレートコピー
cp DESIGN.md clients/$CLIENT/DESIGN.md
cp ICP.md clients/$CLIENT/ICP.md
cp -r examples/proposal-template clients/$CLIENT/deliverables/proposal-$(date +%Y%m%d)

# 3. README 作成（次セクション参照）

# 4. gitignore 確認
echo "clients/$CLIENT/contracts/" >> .gitignore
echo "clients/$CLIENT/data/" >> .gitignore
echo "clients/$CLIENT/memory/" >> .gitignore

# 5. 初期 commit
git add clients/$CLIENT/README.md clients/$CLIENT/DESIGN.md clients/$CLIENT/ICP.md
git commit -m "feat(clients): start <client-name> engagement"
```

---

## クライアント README テンプレ（`clients/<slug>/README.md`）

```markdown
# <クライアント名> 案件

## 基本情報
- **正式名称**: 株式会社○○
- **業界**: SaaS / D2C / 広告代理店 / etc.
- **規模**: 売上 ○○億 / 従業員 ○○名
- **連絡担当**: ○○様（部署 / 役職）
- **契約形態**: 月額顧問 / プロジェクト単発 / 成果報酬 / etc.
- **契約期間**: YYYY-MM-DD 〜 YYYY-MM-DD

## 案件スコープ
- **目的**: <1-2行>
- **成果物**: <提案書 / LP / セールスデッキ / etc.>
- **KPI**: <定量指標>
- **予算**: <非公開推奨、口頭共有のみ>

## 関係者（→ stakeholders.md で詳細）
- Economic Buyer: ○○氏（CEO / CMO / CTO）
- Champion: ○○氏（推進担当）
- 窓口: ○○氏

## ICP / DESIGN
- ICP: clients/<slug>/ICP.md
- DESIGN: clients/<slug>/DESIGN.md

## 案件履歴
| 日付 | フェーズ | 内容 |
|---|---|---|
| YYYY-MM-DD | キックオフ | 初回 MTG |
| YYYY-MM-DD | ヒアリング | MEDDPICC 確定 |
| YYYY-MM-DD | 提案書納品 | proposal-YYYYMMDD/ |

## 関連エージェント
本案件で主に起動するエージェント:
- 起点: <strategy-lead / proposal-writer / etc.>
- 連携: <competitive-analyst / kpi-analytics / etc.>
```

---

## .gitignore 推奨設定（プロジェクトルート）

```gitignore
# Client confidential
clients/*/contracts/
clients/*/data/
clients/*/memory/
clients/*/deliverables/*/raw/
clients/*/meetings/*-confidential.md

# Claude memory（クライアント別）
.claude/memory/clients/

# 一般機密
.env*
*.key
*credentials*
*secret*
```

---

## 命名規則

- **クライアント slug**: 小文字ハイフン区切り、英数字のみ（例: `hotice`, `dentsu-digital`, `acme-corp`）
- **日付**: ファイル名の日付は `YYYYMMDD` 形式
- **議事録**: `meetings/YYYYMMDD-<topic>.md`（例: `meetings/20260420-kickoff.md`）
- **納品物バージョン**: ディレクトリ名に日付（例: `proposal-20260420/`、`deck-20260425/`）

---

## クライアント固有メモリの活用

`clients/<slug>/memory/` の各ファイルを各エージェントが参照:

| ファイル | 主に使うエージェント | 用途 |
|---|---|---|
| stakeholders.md | pr-communications / lead-qualifier / client-success | 関係者プロファイル + Champion 行動評価 |
| decisions.md | strategy-lead / proposal-writer | 過去の意思決定履歴 + 根拠 |
| learnings.md | feedback-synthesizer / 全エージェント | 案件から学んだこと（次案件に活かす） |

`.claude/memory/clients/<slug>/` の各ファイル（gitignore 対象）:

| ファイル | 用途 |
|---|---|
| competitor-watch.md | クライアント業界の競合動向（Routines で毎日更新可能） |
| market-data.md | クライアント業界の最新市場データ |
| evolution-log.md | 案件中の判断パターン定着ログ |

---

## 案件終了時のアーカイブ手順

```bash
CLIENT="<client-slug>"

# 1. learnings.md を最終化（次案件に活かす知見を整理）
# 2. clients/$CLIENT/CLOSING.md 作成（案件総括）
# 3. クライアントへの引き継ぎ資料を deliverables/handover-YYYYMMDD/ に整理
# 4. アーカイブ
mv clients/$CLIENT clients/_archived/$CLIENT-$(date +%Y%m%d)

# 5. 機密ファイル削除確認（gitignore 対象だが念のため）
ls clients/_archived/$CLIENT-*/contracts/  # ローカルのみ存在を確認
```

---

## 関連ファイル

- `DESIGN.md`（ルート）: 全クライアント共通のデザインベース
- `ICP.md`（ルート）: 全クライアント共通の ICP テンプレ
- `examples/proposal-template/`: 提案書テンプレ
- `examples/hotice-sales-deck/`: セールスデッキ参照実装
- `.claude/skills/cybersecurity-playbook.md`: セキュリティ詳細
