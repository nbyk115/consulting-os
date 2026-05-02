---
name: ads-creative-fatigue
description: Use this skill to detect creative fatigue across paid ad campaigns — frequency, CTR decay, CPA inflation by creative age. Outputs a creative refresh schedule and identifies which creatives to retire vs refresh vs hero-promote.
---

# ads-creative-fatigue

クリエイティブ疲労の検知と更新計画スキル。

## 原則

> **CTR の低下は媒体ではなくクリエイティブの寿命のせい、というケースが大半。**

媒体側のアルゴリズム変化に責任転嫁する前に、**クリエイティブ単位の年齢別パフォーマンス**を見る。

## 前提
- `client-context-load` 済み
- クリエイティブ単位の日次データ（imp / clicks / spend / conv）2ヶ月以上

## 実行手順

1. 全クリエイティブを **配信開始からの経過日数** でグルーピング
2. グループ別の以下メトリクスを集計
   - 平均 frequency（同一ユーザー接触回数）
   - CTR（時系列で減衰しているか）
   - CPA（時系列で上昇しているか）
3. **疲労判定基準**
   - frequency 7+ かつ CTR が初週比 -30% 以下 → 疲労
   - CPA が初週比 +50% 以上 → 疲労
   - frequency 3 以下で CTR 維持 → 健全
4. 各クリエイティブを 4 区分に分類

```
            CTR 維持
              │
   [HERO 増額] │ [REFRESH 構図変更]
   ───────────┼───────────
   [PROMOTE   │ [RETIRE 停止]
    バリエーション]│
              │
            CTR 低下
       低 frequency  →  高 frequency
```

## 出力フォーマット

```markdown
## クリエイティブ別疲労診断
| クリエイティブID | 配信日数 | Frequency | CTR推移 | CPA推移 | 区分 |
|---|---|---|---|---|---|

## アクション
- HERO（増額）: ...
- REFRESH（同訴求で構図変更）: ...
- PROMOTE（バリエーション展開）: ...
- RETIRE（即時停止）: ...

## 次月のクリエイティブ更新スケジュール
| Week | 制作本数 | 訴求軸 |
|---|---|---|
```

## アンチパターン

- 全クリエイティブを一律ローテ → HERO まで下げてしまう
- frequency を見ない → 同じ人に20回配信して「効かない」と判断する
