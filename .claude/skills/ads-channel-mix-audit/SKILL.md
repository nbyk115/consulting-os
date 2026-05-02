---
name: ads-channel-mix-audit
description: Use this skill to audit a client's paid media channel mix — identifies over/under-investment by channel based on contribution to revenue (not impressions). Distinguishes incremental vs cannibalizing channels. Outputs reallocation recommendations.
---

# ads-channel-mix-audit

有料広告チャネルミックス監査。**売上貢献ベース**で再配分を提案する。

## 原則

> **「インプレッション」「CTR」は配分判断に使わない。配分は売上貢献で決める。**

多くのクライアントは「Google広告は安定／TikTokは新しい」のような印象でチャネル配分している。
本スキルは **incrementality（純増）／cannibalization（カニバリ）** の観点で実態を見える化する。

## 前提
- `client-context-load` 済み
- 直近6ヶ月のチャネル別 spend / 受注 / LTV データ

## 実行手順

1. チャネル別に以下を集計
   - Spend / 件数 / CPA / ROAS / LTV考慮ROAS
2. **incrementality 推定**
   - ブランドキーワード比率（高ければ自社流入の置き換え＝カニバリ疑い）
   - 既存顧客のリターゲ比率
   - 純粋新規（First-touch）比率
3. **時系列での寄与パターン**
   - チャネルを止めた週／予算を倍にした週があれば変化を確認
   - なければ「今後A/B予算停止テストを実施」と推奨
4. 配分の3分類
   - **GROW**: ROAS高 ＆ 純粋新規比率高 → 増額
   - **MAINTAIN**: ROAS中 ＆ 既存維持機能 → 現状維持
   - **CUT**: ROAS低 or カニバリ高 → 削減 or 停止テスト

## 出力フォーマット

```markdown
## チャネル別パフォーマンス
| チャネル | Spend | 件数 | CPA | ROAS | ブランドKW比率 | 純粋新規比率 | 区分 |
|---|---|---|---|---|---|---|---|

## 再配分推奨
- GROW: [チャネル] +X円/月 / 期待効果: ...
- MAINTAIN: [チャネル] 現状維持
- CUT: [チャネル] -X円/月 / 想定リスク: ...

## incrementality 検証テスト
- [ ] [チャネルA] を2週間停止 → 全体売上の変化観測
- [ ] [チャネルB] のブランドKW入札を停止 → SEO流入で代替されるか確認
```

## アンチパターン

- ROAS だけで判断 → ブランドKWが ROAS を押し上げているだけのカニバリを見逃す
- 「全チャネル増額」を提案 → 配分の意味がなくなる
