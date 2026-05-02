---
name: seo-entity-optimization
description: Use this skill for advanced entity SEO — get the client recognized as a Knowledge Graph entity. Affects both rankings AND AI Overview inclusion. Stabilizes positions against algorithm updates. Most SEO practitioners don't operate at this layer.
---

# seo-entity-optimization

エンティティSEO最適化スキル。**ほとんどのSEO実務者が触らない領域**。

## 原則

> **Google はサイトではなく "エンティティ"（実在事業体）を評価している。**

ナレッジグラフへの登録有無は、検索順位だけでなく **AI Overview 表示**にも影響する。
エンティティのシグナルが強いビジネスは、アルゴリズム更新でも順位が安定しやすい。

## 前提
- `client-context-load` 済み
- GBP の基礎最適化（`seo-gbp-audit` 適用後）が完了している

## 実行手順

### Phase 1: エンティティ存在確認
1. Google で `"会社名"` 完全一致検索 → ナレッジパネル表示有無
2. Wikipedia / Wikidata 登録の有無
3. schema.org Organization 構造化データの実装有無

### Phase 2: シグナル強化
4. NAP（Name/Address/Phone）の完全一致を全媒体で確認
   - 公式サイト、GBP、SNS、業界ディレクトリ、Wikipedia
   - 1文字でも不一致があるとシグナル分散
5. **sameAs プロパティ**の整備
   - schema.org の sameAs に SNS / 業界登録 / Wikipedia URL を全列挙
6. 言及（unlinked mention）の獲得計画
   - リンクなしでも会社名言及があるとエンティティシグナルになる
   - 業界メディア寄稿・インタビュー・登壇

### Phase 3: AI Overview 対策
7. 主要キーワードで AI Overview に表示されるソースを確認
8. クライアントが**同じソース集合**に入るためのコンテンツギャップを特定
9. Q&A 形式・定義文・統計の3要素を強化

## 出力フォーマット

```markdown
## エンティティ診断
- ナレッジパネル: 有 / 無
- Wikidata: 有 / 無
- schema.org Organization: 実装済 / 未実装
- NAP一貫性: X/Y 媒体で一致
- sameAs プロパティ: X件登録

## 強化アクション（90日）
- [ ] schema.org Organization 実装（テンプレ確定文付き）
- [ ] NAP 不一致 X件の修正リスト
- [ ] sameAs に追加すべき URL リスト
- [ ] 業界メディア言及獲得 候補N社

## AI Overview ギャップ
- 表示中ソース共通要素: ...
- クライアント側で不足する要素: ...
```

## なぜこれをやるか

- 短期: 検索順位・CTR の底上げ
- 中期: AI Overview への露出獲得
- 長期: アルゴリズム更新耐性
