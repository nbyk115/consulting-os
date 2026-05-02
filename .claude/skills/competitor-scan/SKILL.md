---
name: competitor-scan
description: Use this skill to systematically scan competitors for a client and produce a comparison matrix. Applies to any industry — pulls competitor URLs and dimensions from client-context.md, then fans out research via parallel sub-agents.
---

# competitor-scan

競合スキャンの汎用スキル。SEO・営業・採用・プロダクトのいずれの軸でも使える。

## 前提
- `client-context-load` 済みであること（クライアントの競合3社が定義されている）

## 実行手順

1. `client-context.md` から競合3社と「自社が負けている理由」を取得
2. 比較軸を決定（依頼内容から推定 — 例: 価格／提供範囲／レビュー速度／採用条件）
3. `general-purpose` サブエージェントを **3並列**で起動し、各社1社ずつ担当
   - 各サブエージェントは同じ比較軸で情報を収集
   - 収集源は公開情報のみ（Webサイト、SNS、レビュー、求人票など）
4. メインエージェントが3つの結果を統合し、比較マトリクスを生成
5. 「自社にあって競合にない強み」「3社全てが持ち自社にない要素」「1社だけが持つ要素」を分類

## 出力フォーマット

```markdown
## 比較マトリクス
| 軸 | 自社 | 競合A | 競合B | 競合C |
|---|---|---|---|---|

## 優先対応リスト
- [HIGH] 3社全てが持ち自社にない要素: ...
- [MED]  2社が持ち自社にない要素: ...
- [LOW]  1社のみが持つ要素: ...

## 判断は人間
推奨はせず、優先度のシグナルだけ提示する。
最終的に「どこに投資するか」はクライアント判断。
```

## アンチパターン

- 比較軸を決めずに情報収集を始める → 統合不能になる
- AIに「どこに投資すべきか」を結論させる → 判断の越権
