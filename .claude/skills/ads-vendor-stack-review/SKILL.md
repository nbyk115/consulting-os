---
name: ads-vendor-stack-review
description: Use this skill to review a client's AdTech vendor stack — DSP, SSP, MMP, CDP, attribution tools, brand safety. Identifies redundancy, hidden margins, and integration gaps. Inspired by Ari Paparo's "verify the plumbing, not the vendor reports" doctrine.
---

# ads-vendor-stack-review

AdTech ベンダースタック監査スキル。Ari Paparo 流の「配管を見る」アプローチ。

## 原則

> **「ベンダーが説明する自社の機能」と「実際に動いている配管」は別物。**

DSP/SSP/MMP/CDP/Brand-Safety ツールは、機能が重複していたり、隠れマージンが乗っていたり、
連携がプレゼン資料上だけで実体がないことが多い。**動いている配管を直接確認する**スキル。

## 前提
- `client-context-load` 済み
- 各ベンダーの契約書／MSA・管理画面アクセス・直近6ヶ月の請求明細

## 実行手順

### Step 1: スタック棚卸し
1. 現在契約中の全ベンダーをリスト化
   - レイヤー別（DSP / SSP / MMP / CDP / Verification / Brand-Safety / DCO / その他）
   - 契約形態（直契約 / 代理店経由 / 媒体側バンドル）
2. 月額・成果報酬・最低保証の構造を明示

### Step 2: 機能重複チェック
3. 同一機能を提供するベンダーが複数いないか
   - ビューアビリティ計測: IAS / DV / Moat の重複
   - フラウド検知: MMP内蔵 vs 専用ツール
   - DCO: DSP標準機能 vs 専用ツール
4. 重複している場合、**実際にどちらの数字を意思決定に使っているか**を確認

### Step 3: 隠れマージン／中間レイヤー検証
5. **DSP→SSP 間の sup-path optimization 状況**
   - ads.txt / sellers.json 経由で取引パスを可視化
   - 同一インプレッションを複数SSP経由で買っていないか
6. 代理店マージン構造の透明性
7. メディアバイイングの **net vs gross 表記**確認

### Step 4: 連携実態チェック
8. 「連携済み」と説明されているデータフローを実データで確認
   - CDP → DSP のオーディエンスシンク：実際にmatch rate は何%か
   - MMP → DSP のCV信号：lookback window と send 頻度
   - 「APIで繋がってます」と「実用に耐える match rate で繋がってます」は別物
9. **連携の SLA／障害時の影響範囲**を確認

### Step 5: 契約条件の罠チェック
10. 自動更新条項
11. データ所有権（離脱時にデータが返ってくるか）
12. 最低出稿額・違約金
13. SLA に対する補償範囲

## 出力フォーマット

```markdown
## ベンダースタック現状図
（レイヤー別の構造図 / 月次コスト含む）

## 機能重複サマリー
| 機能 | ベンダーA | ベンダーB | 意思決定に使用中 | 重複コスト/月 |
|---|---|---|---|---|

## 隠れコスト／不透明領域
- 同一インプレッション複数経路買い: 推定 X% / 月 Y円損失
- 代理店マージン非開示部分: ...
- 自動更新で見直し機会喪失: ...

## 連携実態 vs 説明資料
| 連携 | ベンダー説明 | 実測 | ギャップ |
|---|---|---|---|

## 推奨アクション（クライアント判断）
- [ ] 統合候補: [A] と [B] を [A] に寄せる → 月Z円削減
- [ ] 再交渉候補: [C] の契約条件見直し
- [ ] 撤退候補: [D] は使われていない
- [ ] 追加候補: [機能] のカバレッジ不足
```

## アンチパターン

- ベンダー資料の機能比較表をそのまま信じる → Paparo が一番嫌うやつ
- 「最新ツールに乗り換え」を結論にする → 大抵は既存スタックの未活用が真因
- 重複を一律「悪」と判断 → 一部の重複（計測の三者照合など）は健全

## 連携スキル
- `ads-attribution-sanity`: 計測ベンダーの実態を見る
- `ads-channel-mix-audit`: スタック整理後に再配分判断
