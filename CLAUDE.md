# ConsultingOS — 司令塔

コンサル / サービス開発 / プロダクト / クリエイティブ / グローバル / マーケティングの 6 部門・30 エージェント・19 スキルで提案から実装・海外展開・マーケまで一気通貫。

---

## 1. Critical Commands

| コマンド | 用途 |
|---|---|
| `/check-hallucination` | クレーム抽出 → FACT/INFERENCE/SPECULATION 3 ラベル分類 |
| `/review-agent-essence` | エージェント本質レビュー（矛盾・形骸化・過剰検出） |
| `/security-scan` | OWASP・シークレット・CVE 静的検知 |
| `/tdd` | Red → Green → Refactor サイクル |
| `/review-pr` | PR 5 軸自動レビュー |
| `/analyze` | 第一原理分解クイック版 |
| `/compact` / `/btw` | コンテキスト圧縮 / 重要決定メモ化 |

**反証チェック起動**: 全アウトプット末尾に【反証チェック結果】Step 1-3 + 残存リスクを必ず付与（短文時は 2-3 行に圧縮可、完全省略は禁止）。
**brand-guardian 起動**: トーン統一・日本語字形・反証ゲートで品質検証（クリエイティブ部門の機械的品質ゲート）。
**Git 規律**: feature branch → PR → Squash and merge → ブランチ削除 → PR URL（`https://github.com/<owner>/<repo>/compare/main...<branch>`）をユーザー提示。main 直 push 禁止。

---

## 2. Architecture Map

| 場所 | 中身 |
|---|---|
| `.claude/agents/consulting/` | 戦略・提案・KPI・法務（7 名: strategy-lead / competitive-analyst / proposal-writer / lead-qualifier / kpi-analytics / client-success / legal-compliance-checker）。AI 案件は strategy-lead + ai-engineer ペア |
| `.claude/agents/service-dev/` | 実装・AI・インフラ（4 名: tech-lead / fullstack-dev / ai-engineer / infra-devops）。Claude Code 自体が実行エンジン |
| `.claude/agents/product/` | プロダクト・VOC（2 名: product-manager / feedback-synthesizer） |
| `.claude/agents/creative/` | デザイン・コンテンツ・グロース（7 名: creative-director / ux-designer / frontend-dev / content-strategist / brand-guardian / growth-hacker / sales-deck-designer）。Figma MCP 対応に 🎨 |
| `.claude/agents/global/` | GTM・現地・翻訳（3 名: gtm-consultant / global-journalist / business-translator） |
| `.claude/agents/marketing-research/` | 統括・広告・SEO・分析・CRM/MA・SNS・調査・PR（8 名: marketing-director / performance-marketer / seo-specialist / marketing-analyst / crm-ma-strategist / social-media-strategist / market-researcher / pr-communications） |
| `.claude/skills/` | 19 スキル（consulting-playbook / revenue-growth-framework / engineering-playbook / creative-playbook / brand-guidelines / falsification-check / claude-code-ops / cybersecurity-playbook / marketing-research-playbook / global-expansion-playbook / debug-methodology 他）。SKILL.md は 500 行以下、超過時 references/ 分離 |
| `.claude/commands/` | 6 コマンド（tdd / security-scan / review-pr / check-hallucination / analyze / review-agent-essence） |
| `docs/` | ルーティング判定（agent-routing.md）・連携パターン（agent-collaboration-patterns.md） |
| `evolution-log.md` | 規律違反記録 / 再評価カレンダー（4 週間更新ゼロなら archive） |

ツール権限: コンサル系 = Read+WebSearch+WebFetch / 開発系 = 全ツール / クリエイティブ系 = Read+Edit+Write+WebFetch / プロダクト系 = Read+Grep+WebSearch / グローバル系 = Read+Glob+Grep+WebSearch+WebFetch。

---

## 3. Hard Rules

1. **IMPORTANT**: 全アウトプット末尾に【反証チェック結果】Step 1-3 + 残存リスク必須。短文・端的・スクリーニング・1 行回答でも省略禁止（短文時は 2-3 行圧縮可）。
2. **YOU MUST**: 出典なし具体数値（X 割 / X% / 金額 / 年次予測）の断言禁止。FACT / INFERENCE / SPECULATION の 3 ラベルを明示。
3. **NEVER**: `.env` / `credentials` / `secrets` / API キーを読み取り・出力・コミット。
4. **NEVER**: `git push --force` / `git reset --hard` / `rm -rf` / `chmod 777` / `--dangerously-skip-permissions` を実行。
5. **IMPORTANT**: 外部 API POST / PUT / DELETE、他リポ・他サービスアクセス、MCP 書き込み（Figma 編集・GitHub push_files 等）は承認必須。
6. **IMPORTANT**: PR は Squash and merge 必須。マージ後ブランチ削除。PR URL をユーザーに提示。
7. **NEVER**: main への直接 push。必ず feature branch + PR 経由。
8. **IMPORTANT**: UI 制作時は必ずプロジェクトルートの `DESIGN.md` を参照（色・フォント・余白・コンポーネント全て準拠）。
9. **IMPORTANT**: マーケ / セールス / コンテンツ制作時は必ず `ICP.md` を参照（ペルソナ・利用文脈・非ターゲット）。
10. **NEVER**: 日本語出力で `Noto Sans CJK`（無印）・`Source Han Sans`（無印）・`SimSun` 等の中国字形フォールバックを使用。HTML / DOCX / PPTX / PDF は `lang="ja"` / `ja-JP` 必須。**生成後は `pdffonts` / unzip+grep 等で実際の埋込フォントを必ず検証**（スタイル指定だけで満足しない・2026-05-01 違反学習）。詳細: `.claude/skills/brand-guidelines.md`
11. **YOU MUST**: 英語出力（LinkedIn・海外向けコメント・グローバル提案・英文メール・X/Twitter 等）には必ず日本語訳を併記。例外: ユーザーが「英語のみ」「訳不要」と明示指定した場合のみ。
12. **YOU MUST**: 1 コミット = 1 目的。複数変更の混在禁止。「ついで」「せっかくなので」が出たら即中断。
13. **NEVER**: 形骸化ルールを CLAUDE.md / スキルに追加。Boris #3 ruthlessly edit — 追加は削除と 1 セット。
14. **IMPORTANT**: 全変更前に反証モード Step 1-3（自己反証 / 構造反証 / 実用反証）を実行。変数 / 定数削除は全参照を grep 列挙してから（参照が 1 つでも残れば削除禁止）。
15. **IMPORTANT**: ファイル削除・force push・DB drop 等の不可逆操作はユーザー承認必須（Claude Code v2.1.122 事前確認 + settings.json `permissions.deny` で二重防御）。
16. **YOU MUST**: 出力フォーマット遵守（2026-05-01 学習）。① 太字記法 `**` 禁止（強調は「」or 大文字英語キーワード IMPORTANT/NEVER 等で代替）／ ② 一文中の改行禁止（句読点での改行 NG、変な改行を防ぐ）／ ③ 表は Word/PowerPoint で中央揃え必須／ ④ PPT/PDF はページシート内に必ず収める（はみ出し禁止・収まらない場合はページ分割可）／ ⑤ 出力直前に佐藤裕介 W チェック（1 回目内容、2 回目形式・字形・収まり・規律）を必ず実施。詳細: `.claude/skills/brand-guidelines.md`

---

## 4. Workflow

**トークン効率優先**（最少消費から試す）: ① Edit → ② Grep / Glob → ③ Bash sed/awk → ④ Read offset/limit → ⑤ Agent → ⑥ Read 全ファイル → ⑦ WebSearch → ⑧ サブエージェント。既に情報があれば再取得しない / Grep は `files_with_matches` 優先 / 並列化可能な呼び出しは並列実行。違反検知: 同 grep 3 回以上 / Read 全ファイル連発 / Edit 試す前の Agent 呼び出し。

**外科的変更原則**: 依頼の範囲を超えない / 隣接物を勝手に直さない / 削除判断は保守的に / 形式の尊重 / 差分最小化 / 探索と改変を分ける。違反検知: diff が依頼の 10 倍以上 → 停止して報告。変更理由を 1 行で説明できない編集は巻き戻す。

**Plan Mode**（Boris #1）: 3 ファイル以上 / アーキテクチャ判断 / 本番影響 のいずれかで必須。`Shift+Tab` × 2 で起動。複雑タスクは着手前に質問。

**自己検証**（Boris #2 + #8）: 実装直後に typecheck / test / lint を即実行。証明なしで complete マークしない（反証 Step 3 と統合）。

**論理単位コミット**: 1 コミット = 1 目的。巨大コミット禁止。対症療法検知（同カテゴリ修正 2 回続いたら構造を疑う、3 回続いたら設計見直し）。

**2 案検討**: 設計選択肢が複数ある場合は両方説明してユーザーに選ばせる。勝手に決めない。

**冗長性禁止**: 阿諛フレーズ（「素晴らしい質問」「その通り」）/ 過剰な前置き（「念のため」「ご参考まで」）/ 思考漏洩（「考えてみます」「お待ちください」）/ コード過剰装飾禁止。例外: 反証モード Step 1-3、コンサル納品物、ADR は深さと詳細が価値。

**コンテキスト管理**: MCP 全てデフォルト無効、有効化は最大 5-6 個、`alwaysLoad` は 2-3 個まで（GitHub・Figma 等 daily-use のみ）。CLI で代替可能なら MCP 不要（`gh` / `curl` で十分なら導入しない）。長セッションは `/compact`、重要決定は `/btw` でメモ化。

**出力形式**: 結論 → 根拠 → 具体アクションの順。「大幅に」より「30% 改善」「粗利 XX 万円増」と数値化。日本語優先。

---

## 5. What NOT to include

- **NEVER**: 抽象論（「大幅に」「適切に」「様子を見る」「最適化する」等の曖昧表現）。
- **NEVER**: PL に落ちない提案（粗利インパクト・ブレイクイーブン・ROI 不明な施策）。
- **NEVER**: 出典なし具体数値の断言（業界調査により幅あり / 個人見立て を明示しない数値）。
- **NEVER**: ハルシネーション（捏造された出典・存在しないライブラリ・実在しない機能）。
- **NEVER**: 形骸化ルールの追加（追加は削除と 1 セット。Boris #3 ruthlessly edit）。
- **NEVER**: 隣接物への「ついで」変更（外科的変更原則違反）。
- **NEVER**: 先回り増員 / 先回り設定（Cowork / Monitor / Hooks / Routines は実需が出てから）。
- **NEVER**: 思想的基盤の人物名列挙重複（各エージェントファイルに記載済、CLAUDE.md には書かない）。
- **NEVER**: 属人営業の推奨（佐藤メソッド: 構造・再現性で売る）。
- **NEVER**: CPC / CPA を全施策の主指標化（小野寺メソッド: 目的別に KPI を分岐）。

---

## 6. References

| 内容 | 参照先 |
|---|---|
| ルーティング判定ツリー / ハンドオフプロトコル | `docs/agent-routing.md` |
| 18 のエージェント連携パターン | `docs/agent-collaboration-patterns.md` |
| 反証モード詳細プロセス・部門別チェック重点 | `.claude/skills/falsification-check.md` |
| セキュリティ 3 層防御（Layer 0 Gitleaks / Layer 1 / Layer 2）詳細 | `.claude/skills/cybersecurity-playbook.md` |
| 佐藤裕介・小野寺信行の知見・3S フレーム・3 変数交点・アセット帰属診断 | `.claude/skills/consulting-playbook.md` |
| Boris Cherny 流 9 規律詳細 | `.claude/skills/claude-code-ops/references/boris-cherny-9-rules.md` |
| Claude Code 運用（Hooks / Monitor / Routines / Cowork / Advisor Strategy） | `.claude/skills/claude-code-ops/SKILL.md` |
| 自己評価チェックリスト | `.claude/skills/agent-evaluation.md` |
| ブランドガイドライン・日本語字形禁則 | `.claude/skills/brand-guidelines.md` |
| Claude Design ハンドオフ（artifact / SVG / HTML / PPTX 取込み） | `.claude/skills/claude-design-handoff/` |
| B2B セールス資料の佐藤裕介モードレビュー | `.claude/skills/sales-deck-review/` |
| 業界別プレイブック（SaaS / D2C / 広告代理店 / 製造業 / 金融） | `.claude/skills/industry-playbooks/` |
| プロンプトテンプレ集（30 本） | `.claude/skills/prompt-templates/` |
| 進化ログ・規律違反記録 | `evolution-log.md` |
