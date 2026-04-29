# 納品物テンプレ集

> ConsultingOS で日常的に使うクライアント納品物テンプレ。コンサル業務の8-9割をカバー。

## 含まれるテンプレート

| ファイル | 用途 | 担当エージェント |
|---|---|---|
| `kickoff.md` | プロジェクトキックオフ資料 | strategy-lead / proposal-writer |
| `meeting-notes.md` | MTG 議事録テンプレ | 全エージェント |
| `weekly-report.md` | 週次進捗レポート | strategy-lead / client-success |
| `sow.md` | SOW（Statement of Work / 業務委託契約） | legal-compliance-checker / proposal-writer |
| `closing.md` | プロジェクトクロージング資料 | strategy-lead / client-success |

## 使い方

```bash
CLIENT="acme-corp"
DATE=$(date +%Y%m%d)

# キックオフ
cp examples/deliverable-templates/kickoff.md \
   clients/$CLIENT/deliverables/kickoff-$DATE.md

# 議事録
cp examples/deliverable-templates/meeting-notes.md \
   clients/$CLIENT/meetings/$DATE-<topic>.md

# 週次レポ
cp examples/deliverable-templates/weekly-report.md \
   clients/$CLIENT/deliverables/reports/weekly-$DATE.md
```

## 共通原則

全テンプレートに以下を組み込み済み:
- **佐藤裕介流 PL 思考**（数字で語る）
- **小野寺式 指標分岐**（目的別 KPI）
- **MEDDPICC 資格化**（B2B エンタープライズ案件）
- **反証モード**（出力末尾に必須）
- **クライアント機密配慮**（NDA / 一次ソース）
