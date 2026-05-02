---
name: ads-spend-pacing
description: Use this skill to monitor monthly ad spend pacing across channels — flags under-pacing (will leave budget unspent) and over-pacing (will blow budget early). Outputs daily corrective actions for the remaining days of the month.
---

# ads-spend-pacing

月次広告予算消化ペース監視スキル。

## 原則

> **「月末に予算が余る」も「月中で枯渇」も、どちらも CPA を悪化させる。**

予算未消化 = 機会損失。予算枯渇 = 月末の高CV時間帯を逃す。
週次・できれば日次でペーシングを見るのが運用の基本。

## 前提
- `client-context-load` 済み
- 月初設定の媒体別予算
- 当月の日次spend データ

## 実行手順

1. 当月の経過日数 / 月日数 = 経過率
2. 媒体別 当月spend / 月予算 = 消化率
3. 差分判定
   - 消化率 < 経過率 -10pt → **UNDER PACING**
   - 経過率 -10pt ≦ 消化率 ≦ 経過率 +10pt → **ON TRACK**
   - 消化率 > 経過率 +10pt → **OVER PACING**
4. 残日数で必要な日次spend を逆算
5. 各媒体の日予算上限／入札戦略を調整する具体指示を生成

## 出力フォーマット

```markdown
## ペーシング ステータス（YYYY-MM-DD 時点）
- 月経過率: X%
- 媒体別:
| 媒体 | 月予算 | 当月spend | 消化率 | 状態 | 残日要消化/日 |
|---|---|---|---|---|---|

## 即時アクション
### UNDER PACING の媒体
- [媒体] 日予算上限を X 円 → Y 円 に引き上げ
- 入札戦略: コンバージョン最大化 → 目標CPA緩和

### OVER PACING の媒体
- [媒体] 日予算上限を X 円 → Y 円 に引き下げ
- 配信時間帯を絞る（コンバージョン高時間帯のみ）

### ON TRACK の媒体
- 維持。月末1週間前に再点検。
```

## 補足

- ペーシングが乱れる典型原因
  - クリエイティブ疲労による配信機会減 → `ads-creative-fatigue` 併用
  - オークション競争激化 → 同月内で改善困難。翌月予算組み直し
  - 計測タグ不具合 → spend は出ているがCV取れず最適化が止まる

## 連携スキル
- `ads-creative-fatigue`: under-pacing の原因がクリエイティブ疲労の場合
- `ads-attribution-sanity`: 数字が信頼できるか確認してから判断
