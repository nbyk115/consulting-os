---
name: gap-analysis
description: Use this skill to identify gaps between current state and desired state for a client — applicable to keyword gaps, content gaps, capability gaps, market coverage gaps, etc. Prioritizes "low-effort, high-impact" items first.
---

# gap-analysis

ギャップ分析の汎用スキル。「あるべき姿 − 現状 = ギャップ」を構造化する。

## 前提
- `client-context-load` 済み（目標と現状数値が定義されている）

## 実行手順

1. 分析対象を1つに絞る（例: コンテンツ／キーワード／顧客セグメント／組織能力）
2. 「あるべき姿」のソースを決める
   - 競合が達成している水準
   - 業界ベンチマーク
   - クライアント自身の目標
3. 現状を測定可能な単位に分解
4. ギャップ項目を以下の4象限で分類

```
                  即効性 高
                     │
     [QUICK WIN]     │     [STRATEGIC BET]
   低工数・高インパクト │   高工数・高インパクト
   ─────────────────┼─────────────────
   低工数・低インパクト │   高工数・低インパクト
     [FILLER]        │      [AVOID]
                     │
                  即効性 低
```

5. QUICK WIN を最優先、STRATEGIC BET は12週間ロードマップに組み込む

## 出力フォーマット

```markdown
## ギャップ一覧
| 項目 | 現状 | あるべき姿 | 工数 | インパクト | 区分 |
|---|---|---|---|---|---|

## 推奨優先度（30/60/90日）
- 30日: QUICK WIN x N件
- 60日: STRATEGIC BET 着手
- 90日: 効果測定・再分析
```

## アンチパターン

- すべてのギャップを並列で扱う → リソースが分散して何も終わらない
- インパクト評価を定性で済ませる → 優先度判断が属人化する
