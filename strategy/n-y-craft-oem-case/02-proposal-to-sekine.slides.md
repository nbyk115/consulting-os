---
marp: true
theme: default
size: 16:9
paginate: true
header: "N.Y.CRAFT × ConsultingOS パートナーシップ提案"
footer: "2026.04 | Confidential | v3"
lang: ja
style: |
  @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500;700&display=swap');
  section {
    font-family: "Noto Sans JP", "Noto Sans CJK JP", "Yu Gothic", "游ゴシック", "Hiragino Sans", "ヒラギノ角ゴ ProN", "IPAGothic", "Meiryo", sans-serif;
    background-color: #FAFAF7;
    color: #0A0A0A;
    padding: 48px 64px;
    font-size: 22px;
    line-height: 1.55;
  }
  h1 {
    color: #0A0A0A;
    border-bottom: 3px solid #E60012;
    padding-bottom: 8px;
    font-size: 32px;
    margin-top: 0;
    margin-bottom: 24px;
  }
  h2 {
    color: #1A1A1A;
    font-size: 24px;
    margin-top: 16px;
    margin-bottom: 8px;
  }
  h3 {
    color: #1A1A1A;
    font-size: 20px;
    margin-top: 12px;
    margin-bottom: 6px;
  }
  p, li, td, th {
    font-size: 18px;
  }
  table {
    margin: 12px auto;
    border-collapse: collapse;
    text-align: center;
  }
  th {
    background-color: #0A0A0A;
    color: #FAFAF7;
    padding: 8px 12px;
    text-align: center;
  }
  td {
    border: 1px solid #E5E5E5;
    padding: 6px 12px;
    text-align: center;
    vertical-align: middle;
  }
  td:first-child {
    text-align: left;
  }
  ul, ol {
    margin: 8px 0;
    padding-left: 24px;
  }
  li {
    margin-bottom: 4px;
  }
  blockquote {
    border-left: 4px solid #E60012;
    padding: 4px 16px;
    color: #1A1A1A;
    background-color: #F2F2EE;
    margin: 12px 0;
  }
  .accent { color: #E60012; font-weight: 700; }
  .neutral { color: #666666; }
  .small { font-size: 16px; }
  .grid-2 {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 24px;
    align-items: start;
  }
  .card {
    background-color: #FFFFFF;
    border: 1px solid #E5E5E5;
    border-radius: 6px;
    padding: 16px 20px;
  }
  .card.before { border-left: 4px solid #999999; }
  .card.after { border-left: 4px solid #E60012; }
  .label {
    display: inline-block;
    font-size: 14px;
    font-weight: 700;
    padding: 2px 10px;
    border-radius: 3px;
    margin-bottom: 8px;
  }
  .label.before { background: #E5E5E5; color: #444; }
  .label.after { background: #E60012; color: #FFF; }
  .center { text-align: center; }
  section.title {
    background: #0A0A0A;
    color: #FAFAF7;
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
  section.title h1 {
    color: #FAFAF7;
    border: none;
    border-bottom: 3px solid #E60012;
    display: inline-block;
    margin: 0 auto 16px;
    padding-bottom: 12px;
    font-size: 38px;
  }
  section.title p {
    font-size: 20px;
    opacity: 0.9;
    color: #F2F2EE;
  }
  .role-flow {
    display: grid;
    grid-template-columns: 1fr 60px 1fr 60px 1fr;
    gap: 0;
    align-items: center;
    margin: 24px 0;
  }
  .role-box {
    background: #FFFFFF;
    border: 2px solid #0A0A0A;
    border-radius: 6px;
    padding: 16px;
    text-align: center;
    min-height: 110px;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
  .role-box.center-os {
    background: #0A0A0A;
    color: #FAFAF7;
    border-color: #E60012;
  }
  .role-arrow {
    font-size: 28px;
    text-align: center;
    color: #E60012;
  }
---

<!-- _class: title -->

# N.Y.CRAFT × ConsultingOS<br>パートナーシップ ご提案

属人化された経営知見を、<br>**「規律ある専門家チーム」**として再現する

<p class="neutral">2026.04 / v3</p>

---

# 本日のアジェンダ

<div class="grid-2">
<div>

## 1. 現状の整理
- 関根さんからのご要望
- NotebookLM で届かなかった理由

## 2. ConsultingOS で何が変わるか
- OS の中身（一枚で）
- 具体ストーリー 3本
- 関根さんver化のマッピング

</div>
<div>

## 3. パートナーシップ設計
- 役割分担
- 4 つの収益層
- プロジェクト・ランニング

## 4. 価格と進め方
- 価格サマリー
- 期待される成果
- 次のアクション

</div>
</div>

---

# ご相談の整理

<div class="grid-2">
<div>

## 関根さんから頂いたご要望

1. ご自身の**コンサル手法・営業研修トーク**を<br>高精度に再現したい
2. その再現を**スペシャリストに使わせて**<br>LP・トーク・営業資料・マネジメント方針を量産したい
3. 関根さん本人を介さずに動かせる状態にし、<br>より多くの中小企業の課題解決へ展開したい

</div>
<div>

## 過去の試み

NotebookLM で実装を試みたが<br><span class="accent">「単なる辞書代わり」</span>に留まり、<br>求める水準には到達しなかった

<blockquote>
判断・思考の再現は、<br>RAG 型の知識検索ツールでは<br>原理的に届かない領域
</blockquote>

</div>
</div>

---

# なぜ NotebookLM では届かなかったのか

| 観点 | NotebookLM | 関根さんが本当に求めるもの |
|---|---|---|
| 出力の性格 | 文書からの**検索・引用** | 関根さんの**判断・規律**の再現 |
| 質問への返答 | 「何が書いてあるか」 | 「関根さんならどう判断するか」 |
| 構造 | 静的な知識ベース | 動的な意思決定 ＋ 品質保証 |
| 担い手 | 単一エージェント | <span class="accent">役割別の専門家チーム</span> |

<div class="center" style="margin-top:24px;">
NotebookLM は<span style="background:#FFF3CD; padding:2px 8px;">「辞書」</span>。<br>
求められているのは<span class="accent">「判断装置 × 専門家チーム × 品質ガード」</span>。
</div>

---

# ConsultingOS とは何か（一枚で）

<div class="grid-2">
<div>

## 6 部門・30 エージェント

| 部門 | 人数 | 役割 |
|---|:---:|---|
| コンサル | 7 | 戦略・提案・KPI・法務 |
| サービス開発 | 4 | 実装・AI・インフラ |
| プロダクト | 2 | PM・VOC |
| クリエイティブ | 6 | デザイン・コンテンツ |
| グローバル | 3 | GTM・現地・翻訳 |
| マーケ調査 | 8 | 広告・SEO・分析・PR |

</div>
<div>

## 19 スキル + ハードルール + 継続改善

**プレイブック・テンプレ群**
コンサル / クリエイティブ / エンジニア各分野<br>業界プレイブック 5 業界 / プロンプトテンプレ 30 本

**反証モード（品質ガード）**
出力前に Step 1〜3 のトリプルチェック必須

**ハードルール（CLAUDE.md）**
PL試算なし提案を禁止 / 出典なし数値断言禁止<br>属人営業推奨を禁止

**継続改善基盤**
evolution-log で規律違反を学習記録<br>GitHub Actions 品質ゲート

</div>
</div>

---

# ストーリー 1：営業資料を作るとき

<div class="grid-2">
<div class="card before">
<span class="label before">Before — NotebookLM 時代</span>

スペシャリストが資料作成に着手
↓
NotebookLM で過去資料を検索
↓
**断片は出るが組み立て方が分からない**
↓
関根さんに毎回相談・添削依頼
↓
**関根さんの時間が消費される**

<div class="small neutral">完成までに 3〜5 営業日</div>

</div>
<div class="card after">
<span class="label after">After — 関根さんver OS</span>

スペシャリストが「業界・課題・予算」を入力
↓
ICP.md / DESIGN.md を自動参照
↓
strategy-lead が論点フレーム提示<br>
proposal-writer がドラフト生成（PL試算込み）<br>
brand-guardian + 反証モードが品質ゲート
↓
**関根さん基準のアウトプット**が出る

<div class="small accent">完成までに 1 営業日 / 関根さんはレビューのみ</div>

</div>
</div>

---

# ストーリー 2：新人スペシャリストが立ち上がるとき

<div class="grid-2">
<div class="card before">
<span class="label before">Before</span>

新人が入社・案件アサイン
↓
関根さんに毎週 OJT 相談
↓
**関根さんの暗黙知に依存**
↓
1 案件こなすのに 1 ヶ月

<div class="small neutral">育成は完全に属人化</div>
</div>
<div class="card after">
<span class="label after">After</span>

OS の手順・テンプレ・反証チェックを参照
↓
失敗パターンは evolution-log に学習済み
↓
**OS が育成コーチ役を兼ねる**
↓
1 案件 1 週間で N.Y.CRAFT 基準に到達

<div class="small accent">関根さんは品質レビューに集中</div>
</div>
</div>

<blockquote class="small">
新人が早く立ち上がる ＝ 受注可能案件数が構造的に増える。<br>
属人化解消は事業継続性そのもの。
</blockquote>

---

# ストーリー 3：月末の振り返りが「資産」になる

<div class="grid-2">
<div class="card before">
<span class="label before">Before</span>

案件終了 → 個別に振り返り
↓
失敗の学びは個人のメモに留まる
↓
**同じ失敗が別案件で再発**
↓
関根さんが何度も同じ指摘をする

</div>
<div class="card after">
<span class="label after">After</span>

案件中の判断ミス・修正が evolution-log に記録
↓
反証チェックリストに自動反映
↓
**翌月以降のアウトプットで自動防御**
↓
関根さんメソッドが**永続資産**として蓄積

</div>
</div>

<blockquote class="small">
時間が経つほど OS が賢くなる。N.Y.CRAFT の事業価値が積み上がる構造。
</blockquote>

---

# 関根さんver 化で組み込むもの

| OS の構成要素 | 関根さんver 化の中身 |
|---|---|
| 30 エージェント | 関根さんの判断ロジック・成功/失敗パターンを各エージェントに組込み |
| 19 スキル（プレイブック） | 営業／組織／マネジメントの関根さんメソッドを独自スキルとして体系化 |
| 業界プレイブック | <span class="accent">SMB／レガシービジネス向け業界プレイブックを新設</span>（既存5業界に追加） |
| ICP.md / DESIGN.md | N.Y.CRAFT の顧客像・ブランド基盤を全エージェント共通参照に |
| 反証モード | 関根さん流の「絶対外しちゃダメ」をチェックリストに組込み |
| evolution-log | 関根さんが「これは違う」と言ったケースを永続学習化 |

<div class="center accent" style="margin-top:16px;">
関根さんメソッドが、永続的な事業資産として蓄積される
</div>

---

# 役割分担：フロントとバックエンドの分離

<div class="role-flow">
<div class="role-box">
<strong>N.Y.CRAFT / 関根さん</strong><br>
<span class="small">フロント</span><br><br>
<span class="small">顧客接点・営業<br>最終判断</span>
</div>
<div class="role-arrow">→</div>
<div class="role-box center-os">
<strong>関根さんver<br>ConsultingOS</strong><br>
<span class="small">中核</span><br><br>
<span class="small">30 エージェント ×<br>19 スキル ×<br>反証モード</span>
</div>
<div class="role-arrow">←</div>
<div class="role-box">
<strong>提供者（私）</strong><br>
<span class="small">バックエンド</span><br><br>
<span class="small">品質保証・継続進化<br>evolution-log メンテ</span>
</div>
</div>

<div class="center" style="margin-top:24px;">
関根さんは <strong>関係性</strong> に集中／こちらは OS の <strong>規律と品質</strong> に集中
</div>

---

# 提供する 4 つの層

| 層 | 内容 | 性格 | 対価の対象 |
|---|---|---|---|
| ① 既存業務委託 | 関根さんへの壁打ち＋アドテク領域コンサル | 現状継続 | 関根さん本人へのアドバイス |
| ② プロジェクト | 関根さんver OS の構築 | 一回もの | 資産（OS）の構築 |
| ③ ランニング | 品質維持・運用サポート・進化反映 | 月額 | 資産の継続改善 |
| ④ 成果報酬 | 事業上のアップサイドへの連動 | 売上連動 | 共に成果を作る |

<blockquote class="small" style="margin-top:16px;">
対価の対象が違うものを別契約に分離。後で揉めない／関根さんも社内説明しやすい構造。
</blockquote>

---

# プロジェクト Phase 1（約 3 ヶ月）

<div class="grid-2">
<div>

## 構築ステップ

1. 関根さん深度インタビュー（5h × 5回）
2. 既存資料の構造化・スキル素材化
3. ICP.md / DESIGN.md 構築
4. コアエージェント中核 15 名を関根さんver 化
5. 関根さんメソッド・スキル化
6. SMB 業界プレイブック新設
7. 反証モード関根さん流カスタム
8. 試運転・evolution-log セットアップ
9. キックオフ研修（90 分 × 2 回）

</div>
<div>

## 完了定義

スペシャリストが**反証モードを通過した品質**のアウトプットを単独で出せる状態

関根さんが「自分の判断軸・規律と一致」と感じる精度

N.Y.CRAFT 全案件で **PL 試算ハードルール**が機能している状態

## Phase 1 で含まないもの

- グローバル部門のカスタマイズ
- サービス開発部門の本格対応
- 顧客向け OS 再販（成果報酬 15% で別契約）

</div>
</div>

---

# ランニング & 成果報酬

<div class="grid-2">
<div>

## ランニング（月 15 万 / 上限 8h）

| メニュー | 頻度 |
|---|---|
| 月次レビュー会 | 90分×月1回 |
| evolution-log メンテ | 随時 |
| エージェント本質レビュー | 月次 |
| スキル更新 | 四半期1回 |
| 質問対応 | 営業日 48h |

<span class="small">超過時：時間単価 2 万で追加 or 翌月相殺</span>

</div>
<div>

## 成果報酬（24ヶ月適用）

| 対象 | 料率 |
|---|:---:|
| 契約後の新規受注（OS活用） | <span class="accent">5%</span> |
| OS 自体の再販・OEM 提供 | <span class="accent">15%</span> |
| 既存顧客への継続受注 | 対象外 |
| 関根さん個人の登壇・著作等 | 対象外 |

<blockquote class="small">
N.Y.CRAFT が伸びれば共に伸びる。リスクは関根さん側に偏らない設計。
</blockquote>

</div>
</div>

---

# 価格サマリー

| 項目 | 金額 | 備考 |
|---|---:|---|
| ① 既存業務委託 | 月 5 万円 | 据え置き |
| ② プロジェクト | <span class="accent">100 万円</span> | 着手前一括／Phase 1 |
| ③ ランニング | <span class="accent">月 15 万円</span> | 工数上限 月 8h |
| ④ 成果報酬（通常 / 再販） | 5% / 15% | 24 ヶ月 |

<div class="grid-2" style="margin-top:16px;">
<div>

## 初年度ベース支払い見通し

```
プロジェクト         100 万
ランニング 15万×12   180 万
業務委託 5万×12       60 万
─────────────────
ベース合計         340 万円
+ 成果報酬（売上連動）
```

</div>
<div>

## Light プラン（月商感覚が小さい場合）

- プロジェクト **75 万** + ランニング **月 12 万**
- Phase 1 スコープ縮小<br>
（業界プレイブック新設・SMB 特化を Phase 2 送り）

</div>
</div>

---

# リファレンス案件としてのお願い

このプロジェクトを <span class="accent">ConsultingOS の OEM 展開における第 1 事例</span> として位置付けさせてください

| こちらが提供する圧縮 | 関根さん側にお願いする協力 |
|---|---|
| プロジェクトフィー <strong>65 万円分の圧縮</strong>（標準 165 万 → 100 万） | N.Y.CRAFT 名出しでの事例公開 |
|  | 構築プロセス・成果のケーススタディ化 |
|  | 他社 OEM 営業時のリファレンスコール協力（年 2 回まで） |
|  | evolution-log の匿名学習データを他案件に活用する権利 |

<blockquote class="small" style="margin-top:16px;">
関根さんにとっても「規律ある事業 OS」第 1 事例の発信機会となります
</blockquote>

---

# 期待される成果

<div class="grid-2">
<div>

## 短期（〜6 ヶ月）

- 関根さん本人の作業時間削減<br>**月 10〜30 時間相当**
- スペシャリストが**反証モード品質ガード**を通過したアウトプットを単独で出せる
- 関根さんの判断・規律が**永続的な資産**として蓄積開始

## 中期（〜1 年）

- 関根さんの時間が「個別作業」から**「戦略・新規開拓・関係構築」**へシフト
- **PL 試算ハードルール**で提案打率が構造的に上昇
- 新人スペシャリスト育成期間が短縮

</div>
<div>

## 長期（1 年〜）

事業継続性の根本改善<br>
（関根さん依存度の低下）

OS 自体を商品化して再販する選択肢の獲得<br>
（成果報酬 15% 対象）

業界内での <strong>「N.Y.CRAFT メソッド × 規律ある事業 OS」</strong> ブランド確立

evolution-log の蓄積が、N.Y.CRAFT 独自の<br><strong>業界知識ベース資産</strong> に進化

</div>
</div>

---

# 次のアクション

| ステップ | アクション | タイミング |
|---|---|---|
| 1 | 本提案の大筋合意 | 本日 |
| 2 | 詳細見積書・契約書ドラフト作成 | 2 週間以内 |
| 3 | 2 回目打合せ（条件確認・契約締結） | 3〜4 週間後 |
| 4 | プロジェクトフィー入金 | 契約締結時 |
| 5 | Phase 1 構築開始 | 入金確認後 |
| 6 | Phase 1 完了・効果評価 | 約 3 ヶ月後 |
| 7 | Phase 2 / 再販契約等の追加検討 | 効果評価後 |

---

<!-- _class: title -->

# ご質問・ご懸念点<br>お聞かせください

<p>ディスカッション</p>
