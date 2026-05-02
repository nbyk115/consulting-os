---
name: seo-gbp-audit
description: Use this skill to audit a client's Google Business Profile (GBP) — categories, attributes, photos, descriptions, services. Identifies category gaps vs top-3 competitors and outputs a prioritized addition list. Requires client-context-load completed.
---

# seo-gbp-audit

Google ビジネスプロフィール（GBP）監査スキル。ローカルSEO案件の最優先施策。

## 前提
- `client-context-load` 済み（クライアントの主要キーワード3つ・競合3社が定義）

## 実行手順

1. クライアント主要キーワード3つを取得
2. 各キーワードで Google マップ検索 → 上位3件の GBP を開く
3. 各競合の以下を抽出
   - メインカテゴリ（1つ）
   - サブカテゴリ（全て）
   - 属性（女性経営／無料見積／24時間など）
   - 直近50レビューの月別件数（レビュー速度）
   - 写真投稿頻度
4. クライアント GBP の同項目を取得
5. 比較マトリクスを生成（キーワード×ビジネス×項目）
6. 追加候補カテゴリを **3社全保有 → 2社保有 → 1社のみ** の優先順で並べる

## 出力フォーマット

```markdown
## GBP 比較マトリクス（キーワード: [KW]）
| ビジネス | メインカテゴリ | サブカテゴリ | 星 | レビュー数 | 月次新規 | 順位 |
|---|---|---|---|---|---|---|

## 追加すべきカテゴリ（優先順）
1. [3社全保有] ...
2. [2社保有] ...
3. [1社のみ] ...

## 想定インパクト
- カテゴリ追加1個あたり、新規キーワードセットで表示される可能性（数日〜2週間で検出可能）

## 判断点（クライアント決裁）
- [ ] サブカテゴリ追加: ...
- [ ] 属性追加: ...
- [ ] 不要カテゴリの削除: ...
```

## 注意

- カテゴリ削除は順位に影響するため、追加→2週間観測→削除の順で行う
- 「やっているサービスがGBPに載っていない＝その検索では存在しない」原則を踏まえる
