---
name: client-context-load
description: Use this skill at the START of any consulting engagement to load client context from templates/intake/client-context.md. Run before any analysis, recommendation, or deliverable generation. If the intake file is missing or incomplete, halt and request the user to fill it.
---

# client-context-load

コンサル業務における **Step 0**。すべての分析・提案・成果物生成の前段で必ず実行する。

## 実行手順

1. `templates/intake/client-context.md` または `examples/<案件名>/client-context.md` を Read する
2. 6カテゴリ（事業基本／サービスと市場／目標／現状数値／競合／作業方針）の充足を確認
3. 「不明」または空欄が3項目以上ある場合は **作業を中断**し、ユーザーに記入を依頼
4. 充足していれば、以降の作業中はこの文脈を前提とし、再度問い合わせない

## 出力フォーマット

```
[Context Loaded] <クライアント名> / <業種> / 主要KPI: <KPI>
未充足項目: <あれば列挙、なければ「なし」>
本セッションでは以降、本文脈を前提に出力します。
```

## アンチパターン

- 文脈未ロードのまま提案を出す → 一般論しか出ない
- 不明項目を推測で埋める → 誤った前提で全成果物が汚染される
- セッション中に何度も6カテゴリを質問する → 一度ロードしたら参照のみ
