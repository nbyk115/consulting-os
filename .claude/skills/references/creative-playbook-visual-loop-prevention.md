# Visual Reactive Correction Loop 防止規律（2026-05-09 統合）

> evolution-log.md 2026-05-09 「visual reactive correction loop 14 ラウンド事象」の構造的解決策を物理化。同型ミスの再発防止のため、`creative-director` / `sales-deck-designer` / `frontend-dev` / `brand-guardian` 全員が visual 着手時に必ず参照する。

## 1. 事象の核（学習）

ユーザー指示「ConsultingOS 全体像 visual」で v1 → v9 + 改修ラウンド計 14 回の reactive correction loop が発生。原因:

- 初動 ICP / 完成基準確認なし
- 実プレビュー視認なし（assistant ブラウザレンダリング不可、Read ベース判定のみ）
- agent 監修が「Read ベース」で「ユーザー視点の見え方」を捕捉できない
- レイアウト高さ計算 / 改行 / 注釈ルールが skill 化されていない（同型ミス再発）

## 2. 着手前必須チェックリスト（5 項目）

YOU MUST: visual 制作着手前に以下 5 項目を user に確認。確認なしで実装開始した場合、reactive correction loop 高確率で発生する。

1. 用途: 提案資料 / GitHub README / 営業 / SNS シェア / 全部使い回しのどれか
2. 想定読者: 経営層 / 事業責任者 / エンジニア / クライアント / 投資家のどれか
3. 完成基準: 「30 秒で本質理解」「網羅性」「美しさ」「コンバージョン重視」のどれを最優先するか
4. 参考リファレンス: IR デッキ / Pitch deck / 業界事例の URL or 名前
5. 配色 / トーン: ConsultingOS 標準 (DESIGN.md) / クライアントブランド / ニュートラル

## 3. 同型ミス防止規律 5 件

### 規律 1: 改行 (br) を勝手に追加禁止

word-break: auto-phrase + line-break: strict + overflow-wrap: break-word が有効なら、`<br>` 明示改行は不要。`<br>` 追加 → ユーザー指摘で削除 → 次ラウンドで別箇所追加 → 削除のループは v6-v9 で 4 回繰り返した。

YOU MUST: テキスト内に `<br>` を新規追加する場合は、word-break が機能しない明確な理由を コメント で記述。理由なき br は禁止。

### 規律 2: 抽象タグラインの禁止

「気づき / 体験 / 共感」「再現可能な工程」等の抽象表現は B2B 提案で「わけわからん」と評価される（佐藤裕介モード sales-deck-review §1）。

YOU MUST: タグラインは「X を Y に変える」二項動詞型 + 数字具体化。抽象語使用は sales-deck-review §1 で機械検出。

### 規律 3: 競合実名列挙の禁止（ハルシネーション回避）

Genspark / ChatGPT / NotebookLM 等の固有名詞列挙 + 機能比較は、各ツール最新機能の検証コストが過大で INFERENCE 化必須。「汎用 AI ツール」抽象表記 + 設計時点 (2026-XX) 限定明示が安全。

YOU MUST: 競合実名で機能比較する場合は、出典 URL + 取得日付 + INFERENCE ラベル必須。実名列挙だけは禁止。

### 規律 4: クライアント名指しの禁止（公開 visual）

リファレンス記述「N.Y.CRAFT 関根さん案件が第 1 リファレンス」等は機密管理リスク。OEM カスタム編成のみ訴求し、特定クライアント名は出さない。

YOU MUST: visual に「N.Y.CRAFT」「水野さん」等のクライアント名 / 個人名を含めない。Public 公開リスクを物理化。

### 規律 5: レイアウト高さ計算 + 余白管理

main 1fr 領域の高さは「slide height - padding 上下 - header - hero - footer - gap × N」で計算。各ブロック高さ合計が main 1fr を超えると footer 重複発生（v9 で 2 回再発）。

YOU MUST: visual 実装後に高さ計算を Bash で実機実行し、安全マージン > 30px を確認。

```bash
# 例: slide 720px - padding 40+32 - header 60 - hero 130 - footer 70 - gap 20*3 = ?
echo "main 1fr 領域 = $((720 - 40 - 32 - 60 - 130 - 70 - 60)) px"
```

## 4. ラベル区別性規律

複数の compare-block / dept-card / collab-card が並ぶ時、ラベルだけでは視覚区別が弱い。

YOU MUST: 同レベル要素のラベルには以下のいずれかで視覚区別:
- border-bottom 2px solid（推奨、本 PR で採用）
- background 色付き pill
- accent カラー差別
- 番号 prefix（01 / 02 / 03）

## 5. 注釈フォント / 文字量規律

下部注釈 (footnotes) は main 領域と被りやすい。フォント 12px 規律遵守 + 文字量削減 + line-height 1.4-1.5 で密度確保。

YOU MUST: footer footnotes 高さは main 1fr 領域の安全マージン計算に含める。文字量過剰 → 短縮（一次出典 URL 削除 / 試算詳細削減）。

## 6. agent 監修フローの再設計

旧フロー: creative-director → ux-designer → frontend-dev → brand-guardian → sales-deck-designer 各 PASS で「OK」判定

新フロー（追加）: 上記 5 agent PASS 後、user に「実プレビュー視認」依頼を必須化:

```
agent 5 名 PASS → user に「実機 (PC + モバイル) で開いて確認してください」依頼 → user OK で「真の 100」到達
```

assistant 単独 PASS = 形式達成度（INFERENCE）、user 視認 OK = 真の 100。

## 7. 関連参照

- evolution-log.md 2026-05-09「visual reactive correction loop 14 ラウンド事象」
- creative-playbook.md（本ファイル親）
- sales-deck-review skill §1-§4 違反検出
- brand-guardian agent 監修
- CLAUDE.md ハードルール 1 真の 100 原則 + 17 §2.6 Autonomous Mode

## 出典

- 学習元: ConsultingOS visual v1-v9 改修 14 ラウンドの実体験（FACT、commit log）
- 反省項目: 上記事象でユーザーから受けた指摘 6 種以上を分類整理
