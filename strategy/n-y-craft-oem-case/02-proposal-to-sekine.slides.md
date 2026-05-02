---
marp: true
theme: default
size: 16:9
paginate: true
header: "N.Y.CRAFT × ConsultingOS パートナーシップ提案"
footer: "2026.04 | Confidential | v6"
lang: ja
style: |
  @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500;700&display=swap');
  section {
    font-family: "Noto Sans JP", "Noto Sans CJK JP", "Yu Gothic", "游ゴシック", "Hiragino Sans", "ヒラギノ角ゴ ProN", "IPAGothic", "Meiryo", sans-serif;
    background-color: #FAFAF7;
    color: #0A0A0A;
    padding: 40px 56px;
    font-size: 20px;
    line-height: 1.5;
  }
  h1 {
    color: #0A0A0A;
    border-bottom: 3px solid #E60012;
    padding-bottom: 8px;
    font-size: 30px;
    margin-top: 0;
    margin-bottom: 20px;
  }
  h2 {
    color: #1A1A1A;
    font-size: 22px;
    margin-top: 14px;
    margin-bottom: 6px;
  }
  h3 {
    color: #1A1A1A;
    font-size: 18px;
    margin-top: 10px;
    margin-bottom: 4px;
  }
  p, li, td, th {
    font-size: 17px;
  }
  table {
    margin: 10px auto;
    border-collapse: collapse;
    text-align: center;
  }
  th {
    background-color: #0A0A0A;
    color: #FAFAF7;
    padding: 6px 10px;
    text-align: center;
    font-weight: 700;
  }
  td {
    border: 1px solid #E5E5E5;
    padding: 5px 10px;
    text-align: center;
    vertical-align: middle;
  }
  td:first-child {
    text-align: left;
    font-weight: 600;
  }
  ul, ol {
    margin: 6px 0;
    padding-left: 22px;
  }
  li {
    margin-bottom: 3px;
  }
  blockquote {
    border-left: 4px solid #E60012;
    padding: 4px 14px;
    color: #1A1A1A;
    background-color: #F2F2EE;
    margin: 10px 0;
  }
  .accent { color: #E60012; font-weight: 700; }
  .neutral { color: #666666; }
  .small { font-size: 15px; }
  .grid-2 {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
    align-items: start;
  }
  .card {
    background-color: #FFFFFF;
    border: 1px solid #E5E5E5;
    border-radius: 6px;
    padding: 14px 18px;
  }
  .card.before { border-left: 4px solid #999999; }
  .card.after { border-left: 4px solid #E60012; }
  .label {
    display: inline-block;
    font-size: 13px;
    font-weight: 700;
    padding: 2px 9px;
    border-radius: 3px;
    margin-bottom: 6px;
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
    margin: 0 auto 14px;
    padding-bottom: 10px;
    font-size: 36px;
  }
  section.title p {
    font-size: 18px;
    opacity: 0.9;
    color: #F2F2EE;
  }
  .role-flow {
    display: grid;
    grid-template-columns: 1fr 50px 1fr 50px 1fr;
    gap: 0;
    align-items: center;
    margin: 18px 0;
  }
  .role-box {
    background: #FFFFFF;
    border: 2px solid #0A0A0A;
    border-radius: 6px;
    padding: 14px;
    text-align: center;
    min-height: 100px;
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
    font-size: 24px;
    text-align: center;
    color: #E60012;
  }
---

<!-- _class: title -->

# N.Y.CRAFT × ConsultingOS<br>パートナーシップ ご提案

属人化された経営知見を「規律ある専門家チーム」として再現する<br>30 の AI エージェントから成る事業 OS

<p class="neutral">2026.04 / v6</p>

---

# 本日のアジェンダ

<div class="grid-2">
<div>

## 1. 現状の整理

ご要望の確認と<br>既存ツールで届かなかった理由

## 2. ConsultingOS とは何か

AI エージェント OS の中身<br>普通の Claude Code との違い<br>各部門の思想的基盤

</div>
<div>

## 3. 関根さんver で何が変わるか

具体ストーリー 3 本<br>関根さんメソッドの組み込み箇所

## 4. パートナーシップ・価格・進め方

役割分担と 4 つの収益層<br>価格サマリーと次のアクション

</div>
</div>

---

# ご相談の整理

<div class="grid-2">
<div>

## 関根さんから頂いたご要望

1. ご自身の<strong>コンサル手法・営業研修トーク</strong>を高精度に再現したい
2. その再現を<strong>スペシャリストに使わせて</strong>、LP・トーク・営業資料・マネジメント方針を量産したい
3. 関根さん本人を介さずに動かせる状態にし、より多くの中小企業の課題解決へ展開したい

</div>
<div>

## 過去の試み

NotebookLM で実装を試みたが<span class="accent">「単なる辞書代わり」</span>に留まり、求める水準には到達しなかった

<blockquote class="small">
判断・思考の再現は、文書から関連情報を検索して引用するタイプの AI ツールでは原理的に届かない領域
</blockquote>

</div>
</div>

---

# なぜ NotebookLM では届かなかったのか

| 観点 | NotebookLM | 関根さんが本当に求めるもの |
|---|---|---|
| 出力の性格 | 文書からの<strong>検索・引用</strong> | 関根さんの<strong>判断・規律</strong>の再現 |
| 質問への返答 | 「何が書いてあるか」 | 「関根さんならどう判断するか」 |
| 構造 | 静的な知識ベース | 動的な意思決定 ＋ 品質保証 |
| 担い手 | 単一エージェント | <span class="accent">役割別の専門家チーム</span> |

<div class="center" style="margin-top:20px;">
NotebookLM は<span style="background:#FFF3CD; padding:2px 8px;">「辞書」</span>。求められているのは<span class="accent">「判断装置 × 専門家チーム × 品質ガード」</span>
</div>

---

# ConsultingOS とは — 30 の AI エージェントから成る事業 OS

<div class="grid-2">
<div>

## 6 部門・30 エージェント

| 部門 | 人数 | 役割 |
|---|:---:|---|
| コンサル | 7 | 戦略・提案・KPI・法務 |
| サービス開発 | 4 | 実装・AI・インフラ |
| プロダクト | 2 | プロダクト責任者・顧客の声分析 |
| クリエイティブ | 6 | デザイン・コンテンツ |
| グローバル | 3 | 海外市場参入・現地・翻訳 |
| マーケ調査 | 8 | 広告・SEO・分析・PR |

</div>
<div>

## 19 スキル ＋ ハードルール ＋ 継続改善

<strong>プレイブック・テンプレ群</strong><br>
コンサル / クリエイティブ / エンジニア各分野<br>業界プレイブック 5 業界 / プロンプトテンプレ 30 本

<strong>反証モード（品質ガード）</strong><br>
出力前に Step 1〜3 のトリプルチェック必須

<strong>ハードルール</strong>（OS の規律ルール集）<br>
粗利試算なし提案を禁止 / 出典なし数値断言禁止 / 属人営業推奨を禁止

<strong>継続改善基盤</strong><br>
学習ログで規律違反を蓄積し再発防止

</div>
</div>

---

# 普通の Claude Code とは何が違うのか

| 観点 | 普通の Claude Code | ConsultingOS（AI エージェント OS） |
|---|---|---|
| 性格 | エンジニア向けコード支援ツール | <span class="accent">事業オペレーティングシステム</span> |
| 担い手 | 単一の AI が応答 | 30 のエージェントが <span class="accent">役割分担して連携</span> |
| 業界知識 | 汎用 | 5 業界別プレイブック ＋ N.Y.CRAFT 専用版を新設 |
| 品質保証 | なし（プロンプト次第） | 反証モード + 規律ルールで <span class="accent">機械的に弾く</span> |
| 思想的基盤 | なし | 著名コンサル・経営者の <span class="accent">実証知見を組込み</span> |
| 学習 | セッション内のみ | 学習ログで <span class="accent">永続蓄積</span>、再発防止 |
| ブランド維持 | なし | 顧客像・ブランド基盤を全エージェントが参照 |

<blockquote class="small" style="margin-top:14px;">
普通の Claude Code は「答える AI」。ConsultingOS は「規律ある事業オペレーション基盤」
</blockquote>

---

# 思想的基盤 — 30 名のエージェントが拠って立つ知見

<div class="grid-2">
<div>

## コンサル部門

佐藤裕介（フリークアウト/STORES）<br>
構造で売る／敵地で戦わない／粗利試算必須

小野寺信行（電通デジタル）<br>
指標を疑う／フロー × ストック統合

ポーター（5 Forces）／ティール（10x 独占）

## マーケ調査部門

リトソン（診断ファースト／60:40 ルール）<br>
パパロ（Era of Outcomes）／グリーン（Open Internet）

## クリエイティブ部門

アイブ（Care over Disruption）<br>
ハットフィールド（3 層ストーリーテリング）

</div>
<div>

## プロダクト部門

ケーガン（成果 over アウトプット）<br>
クリステンセン（Jobs to be Done）

## グローバル部門

ホフマン（Blitzscaling）<br>
オスターワルダー（VPC / BMC）<br>
ホフステード（文化軸）／ゲマワット（CAGE 距離）

## サービス開発部門

ファウラー（進化的アーキテクチャ）<br>
12-Factor／Strangler Fig

<blockquote class="small" style="margin-top:8px;">
著名コンサル・経営者・研究者の実証された知見が、各エージェントの判断軸として組み込まれている
</blockquote>

</div>
</div>

---

# ストーリー 1：営業資料を作るとき

<div class="grid-2">
<div class="card before">
<span class="label before">Before — NotebookLM 時代</span>

スペシャリストが資料作成に着手<br>
↓<br>
NotebookLM で過去資料を検索<br>
↓<br>
<strong>断片は出るが組み立て方が分からない</strong><br>
↓<br>
関根さんに毎回相談・添削依頼<br>
↓<br>
<strong>関根さんの時間が消費される</strong>

<div class="small neutral">完成までに 3〜5 営業日（推定）</div>

</div>
<div class="card after">
<span class="label after">After — 関根さんver OS</span>

「業界・課題・予算」を入力<br>
↓<br>
顧客像定義書・ブランド基盤書を自動参照<br>
<span class="small neutral">（ICP.md / DESIGN.md：N.Y.CRAFT 専用に作成）</span><br>
↓<br>
戦略リードが論点フレーム提示<br>
提案書ライターがドラフト生成（粗利試算込み）<br>
ブランド監査 + 反証モードが品質ゲート<br>
↓<br>
<strong>関根さん基準のアウトプット</strong>が出る

<div class="small accent">完成までに 1 営業日 / 関根さんはレビューのみ（推定）</div>

</div>
</div>

---

# ストーリー 2：中小企業 A 社のコンサル案件を組み立てるとき

<div class="grid-2">
<div class="card before">
<span class="label before">Before — 今までのやり方</span>

A 社訪問・課題ヒアリング<br>
↓<br>
関根さん本人が課題整理・打ち手検討<br>
↓<br>
営業資料・提案書を関根さんが個人で作成<br>
↓<br>
<strong>1 案件で関根さんの時間が 2〜3 日消費</strong><br>
↓<br>
抱えられる案件数に物理的上限

</div>
<div class="card after">
<span class="label after">After — 関根さんver OS</span>

A 社情報を入力（業界・規模・課題）<br>
↓<br>
業界プレイブック ＋ 戦略リードが論点整理<br>
↓<br>
提案書ライターが粗利試算込みドラフト生成<br>
↓<br>
関根さんは「自分の判断軸」で仕上げ<br>
反証モード ＋ ブランド監査が品質ゲート<br>
↓<br>
<strong>関根さんの時間は半日に短縮、並行案件数が拡大</strong>

<div class="small accent">関根さんの「中小企業の課題解決をより多くへ展開したい」という願いが量産可能な構造で実現される</div>

</div>
</div>

---

# ストーリー 3：月末の振り返りが「資産」になる

<div class="grid-2">
<div class="card before">
<span class="label before">Before</span>

案件終了 → 個別に振り返り<br>
↓<br>
失敗の学びは個人のメモに留まる<br>
↓<br>
<strong>同じ失敗が別案件で再発</strong><br>
↓<br>
関根さんが何度も同じ指摘をする

</div>
<div class="card after">
<span class="label after">After</span>

案件中の判断ミス・修正が学習ログに記録<br>
↓<br>
反証チェックリストに自動反映<br>
↓<br>
<strong>翌月以降のアウトプットで自動防御</strong><br>
↓<br>
関根さんメソッドが<strong>永続資産</strong>として蓄積

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
| 業界プレイブック | <span class="accent">中堅・中小企業／レガシービジネス向けプレイブックを新設</span>（既存 5 業界に追加） |
| 顧客像定義書 / ブランド基盤書 | N.Y.CRAFT の顧客像・ブランド基盤を全エージェント共通参照に |
| 反証モード（品質ガード） | 関根さん流の「絶対外しちゃダメ」をチェックリストに組込み |
| 学習ログ | 関根さんが「これは違う」と言ったケースを永続学習化 |

<div class="center accent" style="margin-top:14px;">
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
<span class="small">品質保証・継続進化<br>学習ログのメンテ</span>
</div>
</div>

<div class="center" style="margin-top:18px;">
関根さんは <strong>関係性</strong> に集中／こちらは OS の <strong>規律と品質</strong> に集中
</div>

---

# 提供する 3 つの層

| 層 | 内容 | 性格 | 対価の対象 |
|---|---|---|---|
| ① プロジェクト | 関根さんver OS の構築 | 一回もの | 資産（OS）の構築 |
| ② ランニング | 品質維持・運用サポート・進化反映 | 月額固定 | 資産の継続改善 |
| ③ 成果報酬 | OS 活用で立った売上に連動 | 売上連動 | 共に成果を作る |

<blockquote class="small" style="margin-top:14px;">
対価の対象が違うものを別契約に分離。後で揉めない／関根さんも社内説明しやすい構造<br>
※ 既存の業務委託（壁打ち・アドテク領域）は本提案とは別契約として現状継続
</blockquote>

---

# プロジェクト Phase 1（約 3 ヶ月）

<div class="grid-2">
<div>

## 構築ステップ

1. 関根さんヒアリング（1h × 1回）<br><span class="small neutral">既存業務委託で関係構築済のため確認会のみ</span>
2. 既存資料の構造化・スキル素材化
3. 顧客像定義書・ブランド基盤書を構築
4. コアエージェント中核 15 名を関根さんver 化
5. 関根さんメソッド・スキル化
6. 中堅・中小企業向け業界プレイブック新設
7. 反証モード関根さん流カスタム
8. 試運転・学習ログのセットアップ
9. キックオフ研修（1h × 2 回〜）

</div>
<div>

## 完了定義

スペシャリストが品質ゲートを通過したアウトプットを単独で出せる状態

関根さんが「自分の判断軸・規律と一致」と感じる精度

N.Y.CRAFT 全案件で粗利試算ハードルールが機能している状態

## Phase 1（第 1 段階）で含まないもの

- グローバル部門のカスタマイズ
- サービス開発部門の本格対応
- 顧客向け OS 再販（他社ブランド提供／成果報酬 15% で別契約）

</div>
</div>

---

# ランニング と 成果報酬（別の対価です）

<blockquote class="small" style="margin-bottom:14px;">
② ランニング（月額固定）と ③ 成果報酬（売上連動）は<strong>別建ての対価</strong>です。<br>
ランニングは品質維持の月額、成果報酬は OS 活用で実際に売上が立った時のみ発生します。
</blockquote>

<div class="grid-2">
<div>

## ② ランニング（月額固定）

月 15 万円 / 工数上限 月 8h

| メニュー | 頻度 |
|---|---|
| 月次レビュー会 | 90 分×月 1 回 |
| 学習ログのメンテ | 随時 |
| エージェント本質レビュー | 月次 |
| スキル更新 | 四半期 1 回 |
| 質問対応 | 営業日 48h 以内 |

<span class="small">超過時は時間単価 2 万で追加 or 翌月相殺</span>

</div>
<div>

## ③ 成果報酬（売上連動 / 24 ヶ月適用）

| 対象 | 料率 |
|---|:---:|
| 契約後の新規受注（OS 活用） | <span class="accent">5%</span> |
| OS 自体の再販・他社ブランド提供 | <span class="accent">15%</span> |
| 既存顧客への継続受注 | 対象外 |
| 関根さん個人の登壇・著作等 | 対象外 |

<blockquote class="small">
売上が出てから払う「後払い」型。N.Y.CRAFT 側に前払いの金銭リスクは発生しない
</blockquote>

</div>
</div>

---

# 価格サマリー

| 項目 | 金額 | 備考 |
|---|---:|---|
| ① プロジェクト | <span class="accent">50 万円</span> | 着手前一括／Phase 1 |
| ② ランニング | <span class="accent">月 15 万円</span> | 工数上限 月 8h |
| ③ 成果報酬（通常 / 再販） | 5% / 15% | 24 ヶ月 |

<div class="grid-2" style="margin-top:14px;">
<div>

## 12 ヶ月分のベース支払い見通し

| 項目 | 金額 |
|---|---:|
| プロジェクト | 50 万 |
| ランニング 15万×12 | 180 万 |
| ベース合計 | <strong>230 万円</strong> |

<span class="small">＋ 成果報酬（売上連動・後払い）<br>※ 既存の業務委託は本提案外</span>

</div>
<div>

## Light プラン（更に絞りたい場合）

プロジェクト 30 万 ＋ ランニング 月 12 万<br>
12 ヶ月分ベース：<strong>174 万円</strong>

Phase 1 スコープ縮小（業界プレイブック新設を Phase 2 送り／中核エージェント 10 名／顧客像・ブランド基盤書は既存テンプレ流用）

</div>
</div>

---

# リファレンス第 1 号 — N.Y.CRAFT 側のメリット

本プロジェクトを ConsultingOS の他社展開における第 1 事例として位置付けることで、N.Y.CRAFT 側に発信機会と価格メリットが生まれます。

<div class="grid-2" style="margin-top:14px;">
<div>

## N.Y.CRAFT が得るもの

<strong>「規律ある事業 OS 採用 第 1 社」としてリリース可能</strong><br>
<span class="small">プレスリリース・業界誌・カンファレンス登壇等</span>

<strong>先進的経営の対外発信材料</strong><br>
<span class="small">中堅・中小企業向け営業時のブランディング強化</span>

<strong>プロジェクトフィーの大幅圧縮</strong><br>
<span class="small">標準 102 万 → 50 万（約 50% 圧縮）</span>

</div>
<div>

## こちら側にいただきたい協力

N.Y.CRAFT 名出しでの事例公開・共同プレスリリース

構築プロセス・成果のケーススタディ化

他社展開時のリファレンスコール協力（年 2 回まで）

学習ログの匿名データを他案件に活用する権利

</div>
</div>

---

# 期待される成果

<div class="grid-2">
<div>

## 短期（〜6 ヶ月）

- 関根さん本人の作業時間削減：月 10〜30 時間相当（推定）
- スペシャリストが品質ゲートを通過したアウトプットを単独で出せる
- 関根さんの判断・規律が永続的な資産として蓄積開始

## 中期（〜1 年）

- 関根さんの時間が「個別作業」から<strong>「戦略・新規開拓・関係構築」</strong>へシフト
- 粗利試算ハードルールで提案打率が構造的に上昇
- 新人スペシャリスト育成期間が短縮

</div>
<div>

## 長期（1 年〜）

事業継続性の根本改善（関根さん依存度の低下）

OS 自体を商品化して再販する選択肢の獲得（成果報酬 15% 対象）

業界内での <strong>「N.Y.CRAFT メソッド × 規律ある事業 OS」</strong> ブランド確立

学習ログの蓄積が、N.Y.CRAFT 独自の<strong>業界知識ベース資産</strong> に進化

</div>
</div>

---

# 次のアクション

| ステップ | アクション | タイミング |
|---|---|---|
| 1 | 本提案の大筋合意 | TBU |
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
