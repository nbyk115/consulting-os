---
name: seo-service-area-pages
description: Use this skill to identify missing "service x area" landing pages and generate the full page content (title, meta, H1, body, FAQ, CTA) for each missing combination. Google ranks per-page, not per-site — without a dedicated page, you don't appear in that search.
---

# seo-service-area-pages

「サービス × 地域」専用ページの不足を洗い出し、コンテンツまで生成するスキル。

## 原則

> **Google はページ単位で順位を決める。専用ページがなければその検索で表示されない。**

「エアコン修理 渋谷区」で表示されたいなら、「エアコン修理 渋谷区」の専用ページが必要。
サイトトップで網羅しようとするのは構造的に負ける。

## 前提
- `client-context-load` 済み（主要サービスとエリアが定義）

## 実行手順

1. 主要サービス × 提供エリア の全組合せを生成（例: 5サービス × 8エリア = 40ページ）
2. 既存ページの有無をクロール／sitemap.xml で確認
3. 不足組合せをリストアップ
4. 各不足ページについて以下を一括生成
   - SEO タイトル（60字以内）
   - メタディスクリプション（120字前後）
   - H1
   - 本文骨子（H2 × 3〜5）
   - FAQ（5問）
   - CTA（電話／フォーム／LINE等）

## 出力フォーマット

```markdown
## 不足ページ一覧（優先順）
| サービス | エリア | 推定検索ボリューム | 競合保有数 | 優先度 |
|---|---|---|---|---|

## ページ別コンテンツ（確定原稿）
### [サービス] × [エリア]
- Title: ...
- Meta: ...
- H1: ...
- 本文骨子:
  - H2-1: ...
  - H2-2: ...
- FAQ:
  - Q1. ... / A1. ...
- CTA: ...
```

## アンチパターン

- テンプレ流用で全ページ同じ本文 → 重複コンテンツ判定でむしろ順位下落
- エリア固有情報（駅・ランドマーク・対応事例）を入れない → ローカル感が出ず競合に負ける
