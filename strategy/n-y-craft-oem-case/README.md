# N.Y.CRAFT 関根さん案件：OEM第1号 戦略＆提案パッケージ（v2）

コンサルOS の OEM販売における第1リファレンス案件として、
N.Y.CRAFT（代表：関根 優氏）への提案・契約・運用設計をまとめたドキュメント群。

> v2 更新（2026-04）：コンサルOS本体が 30エージェント × 19スキル × 6部門 + 反証モード + 業界プレイブック + 思想的基盤組込み に進化したため、提案・価格・スライドを練り直し。

判断モード：佐藤裕介フレーム（キャッシュフロー直視・幻想排除・撤退基準先決め）＋ コンサルOS 反証モード（トリプルチェック）
事業ポジション：副業路線（本業を阻害しない範囲で、少数・高単価・低工数）

---

## 案件サマリー（一枚で読む用）

| 項目 | 内容 |
|---|---|
| 相手 | N.Y.CRAFT（n-y-craft.com / 代表：関根 優氏） |
| 既存関係 | 業務委託（月5万円）として壁打ちコンサル + 一部アドテク領域コンサル |
| 案件発生経緯 | 関根さんから「自分のクローン化」要望 → こちらから「コンサルOS の関根さんver で提供」と返答 → 「打合せしたい」 |
| 案件性格 | OEM第1リファレンス案件（事例化権を確保する代わりに価格を抑える） |
| 提供形態 | プロジェクト（構築）＋ ランニング（運用）＋ 成果報酬（再販・新規受注連動） |
| 既存業務委託との関係 | 別契約として完全分離。業務委託は据え置き |

## 価格構造（4層 / v3 関根さん戦略関係反映版）

| 層 | 金額 | 性格 |
|---|---:|---|
| ①既存業務委託 | 月5万（据え置き） | 関根さん本人への壁打ち対価 |
| ②プロジェクトフィー | 50万円（着手前一括） | 関根さんver OS の構築（Phase 1、進化版OS） |
| ③ランニング | 月15万円（工数上限 月8h） | OS の品質維持・継続進化（反証モード／学習ログのメンテ） |
| ④成果報酬（通常受注） | 売上の5%（24ヶ月） | 契約後新規受注分 |
| ④成果報酬（OS再販） | 売上の15%（24ヶ月） | OS自体の再販時 |

Light プラン（更に絞りたい場合）：プロジェクト 30万 / ランニング 月12万。

初年度の N.Y.CRAFT 負担見込み（標準プラン）：約 340万円（プロジェクト50万 + ランニング180万 + 業務委託60万 + 成果報酬50万）
初年度の自分の受取見込み：約 340万円 / 工数 約 169時間 / 時給換算 約 1.66 万円 → 副業として成立（年間トータルでフロア超え）

## 戦略のキーポイント（佐藤裕介フレーム + コンサルOS 規律）

1. 第1リファレンス案件の価値を明確化：プロジェクトフィー値引き（標準165万→100万）の対価として事例化権・他社営業時の利用権を取得
2. 収益を4層に分解：対価の対象を分けることで後で揉めない、関根さんも説明しやすい
3. 業務委託フィーの分離：既存月5万に吸収されないよう、OEM契約は別枠で締結
4. 成果報酬は控えめ＋再販時のみ厚く：通常受注5% / 再販15% の2段階で関根さんの心理的抵抗を回避
5. 知財所有権は譲らない：OS本体・30エージェント・19スキル等の関根さんver化部分も全て自分側帰属、N.Y.CRAFT はライセンス利用のみ
6. 撤退基準を先に決める：工数超過3ヶ月連続で値上げ交渉、本業阻害なら解約
7. OSのハードルール継承：N.Y.CRAFT 案件にも PL試算必須・出典なし数値断言禁止・反証モード必須を適用

## ドキュメント構成

| ファイル | 内容 | 用途 |
|---|---|---|
| [`01-strategy.md`](./01-strategy.md) | 自分の戦略フレーム＋判断ログ | 自分用（迷ったとき立ち戻る） |
| [`02-proposal-to-sekine.md`](./02-proposal-to-sekine.md) | 関根さん向け具体提案（テキスト版） | 打合せで提示／契約添付 |
| [`02-proposal-to-sekine.slides.md`](./02-proposal-to-sekine.slides.md) | 提案資料 Marpスライドソース | スライド出力の元 |
| `02-proposal-to-sekine.pptx` | 提案資料 PowerPoint版 | 打合せで投影 |
| `02-proposal-to-sekine.pdf` | 提案資料 PDF版 | 事前送付・印刷配布 |
| `02-proposal-to-sekine.html` | 提案資料 HTML版 | ブラウザ即プレゼン |
| [`03-pricing-rationale.md`](./03-pricing-rationale.md) | 価格根拠＋値引き交渉時の防御線 | 自分用（交渉時の手札） |
| [`04-meeting-playbook.md`](./04-meeting-playbook.md) | 打合せ運営の段取り＋想定問答 | 自分用（打合せ前確認） |

### スライド出力コマンド（Marp）

提案資料の Markdown ソース（`02-proposal-to-sekine.slides.md`）を編集後、以下で再出力：

```bash
# HTML（ブラウザで即プレゼン可能）
npx --yes @marp-team/marp-cli@latest 02-proposal-to-sekine.slides.md -o 02-proposal-to-sekine.html --html

# PPTX（PowerPoint・Keynote 等で開ける）
CHROME_PATH=/opt/pw-browsers/chromium-1194/chrome-linux/chrome \
  npx --yes @marp-team/marp-cli@latest 02-proposal-to-sekine.slides.md \
  -o 02-proposal-to-sekine.pptx --html --no-sandbox

# PDF（事前送付・印刷向け）
CHROME_PATH=/opt/pw-browsers/chromium-1194/chrome-linux/chrome \
  npx --yes @marp-team/marp-cli@latest 02-proposal-to-sekine.slides.md \
  -o 02-proposal-to-sekine.pdf --html --no-sandbox
```

ローカル環境では `CHROME_PATH` を自分の Chrome/Chromium パスに置き換える（macOS なら通常不要）。

## 関連ドキュメント

汎用 OEM 戦略の枠組み（このケースの上位概念）：
- [`../oem-side-business/`](../oem-side-business/) : 副業OEM販売の標準戦略

---

## 進め方（このパッケージの使い方）

1. 打合せ前：`04-meeting-playbook.md` を読んで段取り確認
2. 打合せ中：`02-proposal-to-sekine.md` の流れで価値→構造→金額の順に提示
3. 価格交渉時：`03-pricing-rationale.md` の防御線で押し返す
4. 迷ったら：`01-strategy.md` の判断ログで原点確認
