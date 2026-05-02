---
name: claude-design-handoff
description: Claude Design（claude.ai の artifact / design 機能、Opus 4.7 駆動）で生成されたビジュアル資産を、Claude Code 側の HTML/CSS/PPT 実装に取り込むためのハンドオフ手順。画像・SVG・HTML スニペット・PPTX エクスポートすべてに対応。
---

# claude-design-handoff

使用タイミング：
- セールス資料やプレゼンでビジュアル（画像・図版・チャート）が必要なとき
- Claude Code harness 内では画像生成ツールがないため、claude.ai（Claude Design）側で生成した資産を受け取って組み込むとき

## 背景

**Claude Code CLI harness** では DALL·E / Midjourney / Claude Design 相当の画像生成ツールは現状利用できない。一方 **Claude.ai（Web UI）の Claude Design** は Opus 4.7 駆動で下記が可能：
- プロンプトから試作／スライド／1枚もの生成
- Canva/PDF/PPTX/HTML でエクスポート
- 既存コード・デザインを読み込んで自動構築
- Pro/Max/Team/Enterprise で利用可

この2環境を**分業**するのが最適ルート。

## ハンドオフパターン

### Pattern A：画像（PNG/JPG）を受け取る

1. ユーザが Claude.ai で画像生成
2. ユーザがチャットに画像を貼る or ファイル共有
3. エージェント側が `examples/<deck-name>/assets/` に保存
4. HTML に `background-image: url('./assets/<name>.png')` で組込
5. `node render.mjs` で確認、commit、push

### Pattern B：HTML スニペットを受け取る

1. Claude Design で "HTML エクスポート" 選択
2. ユーザがコードブロックを貼る
3. エージェントが既存 `index.html` の該当セクションに統合
4. スタイルの衝突・命名規則は揃える（既存 `.col / .viz` 等と互換に）
5. レンダ → commit → push

### Pattern C：SVG を受け取る

1. Claude Design で SVG エクスポート
2. ユーザがチャットに貼る（そのまま SVG コード）
3. エージェントが `.viz` 内にインライン埋込
4. ブランド色と整合（`fill="#E60012"` 等）するよう最小改修

### Pattern D：PPTX を受け取る

1. Claude Design で PPTX エクスポート
2. エージェントは PPTX を直接取り込めない場合がある → まず画像化してから組込
3. あるいはスクショで受け取って画像として組込

## プロンプト作成ガイド（Claude Design 送り）

資料 P[N] のビジュアル生成を依頼する際、以下のフォーマットで渡す：

```
[対象スライド]
ページ番号・タイトル・対象読者

[ブランドガイド]
- 色：<hex codes>
- フォント系統：<Sans / Serif / 和文指定>
- トーン：<editorial / modernist / minimal / etc.>

[生成希望枚数と仕様]
- 枚数：N枚（横長 1600×480px など）
- 各画像のコンセプト（1行ずつ）

[禁則]
- テキストを画像内に直接入れない（CSS で後から重ねる想定）
- キャラクター感は避ける／プロフェッショナル・経営層向け
- 特定の人種・性別・年齢を連想させない

[整合先の既存デザイン参照]
- <repo-path>/index.html のトーン
- 既存スライドのスクショ
```

## 標準保存パス

生成物は下記で統一：

```
examples/<deck-slug>/
├── index.html
├── assets/
│   ├── era-1.png           # Claude Design 生成（画像）
│   ├── era-2.png
│   └── era-3.png
├── render.mjs
└── ...
```

## CSS 組込パターン（画像）

```css
.col .viz{
  height:100px;
  background-size:cover;
  background-position:center;
  background-color:#0A0A0A; /* fallback */
}
.col:nth-child(1) .viz{background-image:url('./assets/era-1.png')}
.col:nth-child(2) .viz{background-image:url('./assets/era-2.png')}
.col:nth-child(3) .viz{background-image:url('./assets/era-3.png')}
.col .viz::after{content:"";position:absolute;inset:0;background:linear-gradient(180deg,rgba(0,0,0,.2),rgba(0,0,0,.55))}
```

Puppeteer は **ローカル画像**なら確実に読み込む（Unsplash URL は環境依存）。

## 品質チェック

Claude Design 生成物を組み込む前に下記確認：
1. **解像度**：1280×720 スライドに対し横幅1600以上（2倍デバイススケール対応）
2. **色調**：`docs/sales-deck-rules.md` のブランドガイドと整合
3. **余白**：画像上に CSS でテキストを重ねる場合、画像内のコントラストが十分か
4. **トンマナ**：editorial / modernist の一貫性

## 関連

- `.claude/skills/sales-deck-review/SKILL.md`: レビュー用
- `.claude/agents/creative/sales-deck-designer.md`: デッキ実装エージェント
- `docs/sales-deck-rules.md`: コピー・レイアウト完全版ルール
