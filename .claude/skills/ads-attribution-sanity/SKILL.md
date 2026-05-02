---
name: ads-attribution-sanity
description: Use this skill to sanity-check a client's attribution model — detects double-counting, last-click bias, view-through inflation, and post-iOS14/cookie-deprecation gaps. Outputs which channels are likely over- and under-credited.
---

# ads-attribution-sanity

アトリビューション健全性チェックスキル。

## 原則

> **「ROAS が良いチャネル」は、本当にそのチャネルが売上を生んでいるとは限らない。**

二重計上・ラストクリック偏重・ビュースルー過大評価・iOS14/Cookie失効の影響で、
レポート上の数字と実態が乖離していることが多い。判断の前に「数字が信頼できるか」を見る。

## 前提
- `client-context-load` 済み
- 各広告媒体の管理画面アクセス＋GA4/MMP（Adjust等）データ

## 実行手順

### Step 1: 二重計上チェック
1. 媒体別CV合計 vs GA4のCV vs 実売上 を突合
2. 媒体合計 > 実売上 の場合、二重計上発生中
3. どの媒体間で重複しているかをデータレイヤーで確認

### Step 2: ラストクリック偏重チェック
4. アシストCVの大きさを媒体別に確認
5. ラストクリック ROAS 高い ＆ アシストCV少ない = 純粋刈り取り（ブランドKW疑い）
6. ラストクリック ROAS 低い ＆ アシストCV多い = 上流貢献者（過小評価）

### Step 3: ビュースルー過大評価チェック
7. ビュースルーCVの比率（特に Display/動画）
8. View-through window（1日 / 7日 / 28日）の妥当性
9. 7日超のVTCVは原則信用しない方針を提案

### Step 4: 識別ロス影響チェック
10. iOS14以降の Meta SKAdNetwork 経由CV比率
11. Cookie失効後の cross-device 計測カバレッジ
12. ファーストパーティCAPI／GA4 measurement protocol 連携の有無

## 出力フォーマット

```markdown
## アトリビューション健全性スコアカード
| チェック項目 | 状態 | 影響度 |
|---|---|---|
| 媒体合計CV vs 実売上の整合 | ±X% | |
| ラストクリック偏重 | あり/なし | |
| VTCV過大評価 | あり/なし | |
| ID識別ロス対応 | 対応済/未対応 | |

## 過大評価されている可能性が高いチャネル
- [チャネル] : 理由 ...

## 過小評価されている可能性が高いチャネル
- [チャネル] : 理由 ...

## 修正推奨
- [ ] CAPI / GA4 MP 実装
- [ ] VTCV window を1日に短縮
- [ ] 媒体間重複をデータクリーンルームで突合
```

## 重要

数字が信頼できない状態で `ads-channel-mix-audit` を回すと、**間違った前提で再配分する** ことになる。
このスキルは多くの広告診断の **前段** で実行すべき。
