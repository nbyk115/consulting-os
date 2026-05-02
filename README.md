# Consulting OS

> **Claude Code をコンサルティング業務のオペレーティングシステムとして運用するための基盤。**

「AIに任せる」ではなく、「AIへの**任せ方を設計**する」ためのリポジトリ。

---

## 思想（30秒で読める）

| 層 | 役割 | 実体 |
|---|---|---|
| **Context** | 案件・クライアントの前提を一度だけ渡す | [`CLAUDE.md`](./CLAUDE.md) ＋ [`templates/intake/`](./templates/intake/) |
| **Skills** | 再利用可能な業務手順を定義する | [`.claude/skills/`](./.claude/skills/) |
| **Deliverables** | 出力フォーマットを揃える | [`templates/deliverables/`](./templates/deliverables/) ＋ [`examples/`](./examples/) |

> **Claude が集める／作る。人間が判断する。**

---

## クイックスタート

### 1. 案件開始時

```
1. templates/intake/client-context.md をコピーし examples/<案件名>/ に置く
2. 6カテゴリ（事業基本／市場／目標／現状数値／競合／作業方針）を埋める
3. Claude Code 起動
4. "client-context-load スキルでこの案件の前提をロード" と指示
```

### 2. スキル呼び出し

```
"このクライアントで gap-analysis を回して"
"seo-page2-goldmine スキルで GSC データ分析して"
"ads-attribution-sanity でアトリビューション健全性チェックして"
```

### 3. 成果物保存

```
1. templates/deliverables/ のフォーマットで出力
2. examples/<案件名>/workflow-record.md にエージェント構成を記録
```

---

## 利用可能なスキル

### Core（業界横断）

| スキル | 用途 |
|---|---|
| [`client-context-load`](./.claude/skills/client-context-load/) | Step 0：全業務の前段で必ず実行 |
| [`competitor-scan`](./.claude/skills/competitor-scan/) | 競合スキャン（並列サブエージェント活用） |
| [`gap-analysis`](./.claude/skills/gap-analysis/) | 4象限ギャップ分析（QUICK WIN優先） |
| [`intent-mapping`](./.claude/skills/intent-mapping/) | 4段階購買意図分類 |
| [`monthly-impact-report`](./.claude/skills/monthly-impact-report/) | 売上直結指標のみで月次1ページ |

### SEO パック

| スキル | 用途 |
|---|---|
| [`seo-gbp-audit`](./.claude/skills/seo-gbp-audit/) | Google ビジネスプロフィール監査 |
| [`seo-page2-goldmine`](./.claude/skills/seo-page2-goldmine/) | 検索11–20位の救出（30日スプリント） |
| [`seo-service-area-pages`](./.claude/skills/seo-service-area-pages/) | サービス×エリア専用ページ生成 |
| [`seo-entity-optimization`](./.claude/skills/seo-entity-optimization/) | ナレッジグラフ／AI Overview 対策 |

### Ads パック

| スキル | 用途 |
|---|---|
| [`ads-channel-mix-audit`](./.claude/skills/ads-channel-mix-audit/) | チャネル配分を売上貢献ベースで再評価 |
| [`ads-creative-fatigue`](./.claude/skills/ads-creative-fatigue/) | クリエイティブ疲労検知＋更新計画 |
| [`ads-attribution-sanity`](./.claude/skills/ads-attribution-sanity/) | 計測の健全性チェック（数字を信じる前に） |
| [`ads-spend-pacing`](./.claude/skills/ads-spend-pacing/) | 月次予算消化ペース監視 |
| [`ads-vendor-stack-review`](./.claude/skills/ads-vendor-stack-review/) | AdTech ベンダースタック監査 |

---

## 過去案件

- [`examples/trade-desk-interview/`](./examples/trade-desk-interview/) — 業界記事翻訳＋ナレッジシェア要約（マルチエージェント並列翻訳）

---

## 設計起源

[`docs/origin.md`](./docs/origin.md) — Sarvesh Shrivastava 氏の「20 SEO Design Patterns」のメタ構造を、Ari Paparo 流の運用解像度と佐藤裕介流の引き算思考でコンサル業務全般に汎化。

---

## 設計判断のレンズ（多視点で判断する）

スキル設計／追加判断は以下三者のレンズで点検する：

- **佐藤裕介**：レバレッジの本質を見る／引き算の勇気／「動くサンプルを最優先」
- **Jeff Green**：オープン・コンポーザブル・透明性／長期エコシステム視点
- **Ari Paparo**：「ベンダー資料ではなく配管を見ろ」／運用現場の解像度

新スキル追加時は三者全員が「Yes」と言う場合のみ採用する。

---

## ライセンス

設計思想・テンプレート・スキル定義は社内ナレッジとして管理。実案件の Intake／成果物には機密情報が含まれるため別途管理ポリシーに従うこと。
