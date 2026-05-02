# Consulting OS

コンサルティング業務を Claude Code 上で運用するための基盤定義。
本ファイルは全エージェント／全スキルの **Step 0（事業文脈ロード）** として最初に読まれる。

---

## 思想

> **「Claude が集める／作る。人間が判断する。」**

AI の出力が一般論で終わるのは性能の問題ではなく、**任せ方の設計**の問題である。
本リポジトリは以下の三層で「任せ方」を構造化する。

| 層 | 役割 | 実体 |
|---|---|---|
| **Context（文脈）** | 案件・クライアントの前提を一度だけ渡す | `CLAUDE.md` ＋ `templates/intake/` |
| **Skills（手順）** | 再利用可能な業務パターンを定義する | `.claude/skills/` |
| **Deliverables（成果物）** | 出力フォーマットを揃える | `templates/deliverables/` ＋ `examples/` |

判断（どの示唆に投資するか／どのリスクを許容するか）は人間に残す。

---

## 運用ルール

### 1. 案件開始時は必ず Intake を埋める
新規案件は `templates/intake/client-context.md` をコピーし、6カテゴリ（事業基本／市場／目標／現状数値／競合／作業方針）を埋めてから着手する。
埋めずに始めた成果物は「初対面のコンサルタントに何も説明せず提案させた」のと同じ品質になる。

### 2. 成果物は `examples/<案件名>/` に集約する
- 一次成果物（翻訳・分析・提案書）
- ワークフロー記録（どのエージェント／スキルをどう使ったか）
- 学び（次回テンプレ化のための気づき）

トレード可能なナレッジ資産として残すことが、案件単発で終わらせない条件。

### 3. Skills は「業界横断の構造」で書く
SEO・営業・採用・バックオフィスのどれにも適用できる抽象度で記述する。
業界固有の語彙は `templates/intake/` 側で渡す。

### 4. サブエージェントの使い分け
- `Explore`：コード／ファイルの所在特定（3クエリ以上は必須）
- `general-purpose`：並列リサーチ・並列翻訳・並列分析
- `Plan`：大型案件の最初のタスク分割設計

短いタスクでもサブエージェント構成を組む価値がある（並列化＋品質保証層）。

---

## 標準ワークフロー

```
1. Intake     : client-context.md を記入
2. Plan       : Plan エージェントでタスク分割
3. Execute    : Skills を呼び出して並列実行
4. Synthesize : メインエージェントが統合・用語統一
5. Deliver    : templates/deliverables/ のフォーマットで出力
6. Archive    : examples/<案件名>/ にワークフロー記録ごと保存
```

---

## ディレクトリ

```
consulting-os/
├── CLAUDE.md                       # 本ファイル（OS本体）
├── .claude/skills/                 # 再利用可能な業務スキル
│   ├── client-context-load/        # Step 0: 文脈ロード
│   ├── competitor-scan/            # 競合スキャン（汎用）
│   ├── gap-analysis/               # ギャップ分析（汎用）
│   ├── intent-mapping/             # 4段階購買意図分類
│   └── monthly-impact-report/      # 月次成果レポート
├── templates/
│   ├── intake/                     # 案件開始時の前提シート
│   └── deliverables/               # 成果物フォーマット
├── examples/                       # 過去案件アーカイブ
└── docs/                           # 運用思想・参考資料
```

---

## 参考：このOSの設計起源

Sarvesh Shrivastava 氏（Favikon SEO世界1位）の「20 SEO Design Patterns」記事で示された
**「Step 0 = 文脈ロード／20パターン = Skills／作業はAI・判断は人間」** というメタ構造を
コンサルティング業務全般に汎化したのが本リポジトリ。
SEO特化のプロンプトは取り込んでいないが、**構造**は全面採用している。
