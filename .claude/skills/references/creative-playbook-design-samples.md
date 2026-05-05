## Colors
- Primary: #XXXX
- Secondary: #XXXX
- Neutral: gray scale
- Semantic: success/warning/error/info

## Typography
- Heading: font-family, weight, sizes (h1-h6)
- Body: font-family, line-height, sizes
- 日本語フォントスタック: Noto Sans JP → Hiragino → sans-serif
- Monospace: JetBrains Mono

## Spacing
- Base unit: 4px
- Scale: 4, 8, 12, 16, 24, 32, 48, 64, 96

## Components
- Button: variants, sizes, states (default/hover/active/disabled)
- Card: padding, border-radius, shadow
- Form: input height, label position, error states
- Navigation: header height, mobile breakpoint

## Do / Don't
- Do: [守るべきルール]
- Don't: [やってはいけないこと]

## Hover / Interaction
- ホバー時の挙動（transition duration, opacity変化）
- フォーカスリングのスタイル
- アニメーションの原則（duration, easing）

## Responsive
- Breakpoints: sm(640) / md(768) / lg(1024) / xl(1280)
- モバイルファースト
```

### DESIGN.md生成フロー

```
1. brand-guidelines.md からトーン・カラー・フォント基準を抽出
2. 既存のFigmaデザインがあれば、デザイントークンをエクスポート
3. creative-director がプロジェクトのDESIGN.mdをドラフト
4. brand-guardian がbrand-guidelinesとの整合性を検証
5. frontend-dev が実装時にDESIGN.mdを自動参照
```

### 注意事項
- **getdesign.md等の外部DESIGN.mdはお手本として参照するのみ**。そのまま本番利用は権利的にNG
- 自社プロダクトは**自社のbrand-guidelinesをもとにDESIGN.mdを書く**のが本筋
- Figmaは消えない。画面を見ながら詰める工程は人間に必要。DESIGN.mdはAIへの指示書
- 複雑なコンポーネント（カルーセル・モーダル・アニメーション）はDESIGN.md単独ではカバーしきれない。追加指示が必要

---

## スキル横断リファレンス

| 状況 | 参照スキル |
|---|---|
| トーン・表現の品質チェック | → `brand-guidelines.md` |
| AIに選ばれるコンテンツ設計 | → `prompt-engineering.md` §3 RAG設計 |
| フロントエンドの品質ゲート | → `code-quality-gates.md` |
| API連携画面の設計 | → `api-design-patterns.md` |
| 収益に直結するコンテンツ | → `revenue-growth-framework.md` §3 アセット蓄積 |
| 出力の事実検証が必要 | → `falsification-check.md` + `/check-hallucination` |

---

## 適用エージェント
- `creative/creative-director` — デザイン方針・レビュー
- `creative/ux-designer` — UX/UI設計
- `creative/frontend-dev` — フロントエンド実装
- `creative/content-strategist` — コンテンツ制作・AIO/GEO最適化
- `creative/growth-hacker` — キャンペーン施策カレンダー・グロース実装
- `creative/brand-guardian` — 品質チェック



> 反証モード（トリプルチェック）の共通ルールは CLAUDE.md を参照。
---

## バージョン履歴

| Ver | 日付 | 変更内容 | 根拠 | 効果 |
|---|---|---|---|---|
| 1.0.0 | 2026-03-25 | 初版 | — | ベースライン |
