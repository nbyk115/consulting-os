# よるのことば案件: ConsultingOS 機能化ハンドオフ (2026-05-15)

> よるのことばセッション (別リポ nbyk115/yorunokotoba、ブランチ claude/design-tokens-canon) で ConsultingOS を実際に機能させるための実用ハンドオフ。consulting-os の 40 PR 規律拡充が実案件で機能していない (成果物クオリティ低、skill / ツール / デザイン参照 / 競合比較がプロダクト未反映) 問題への、実地の申し送り。

## 1. 案件サマリ

- プロダクト: 女性向け占いアプリ (自社プロダクト)
- /goal: 副収入 月 10-20 万 (月 980 円課金換算)
- 進捗: Phase 1 コンテンツエンジン完了 (PR #98-101) / Phase 3 デザイントークン正典化 進行中 (PR #103) / 次 = ビジュアル抜本リデザイン

## 2. ConsultingOS skill へのアクセス (前提)

ConsultingOS の skill は `~/.claude/skills/` に symlink 済 (consulting-os リポへの symlink)。よるのことばリポで作業しても `~/.claude/skills/<skill>.md` で全 skill にアクセス可能。session 開始時に `cd consulting-os && git pull origin main` で最新化 (Hard Rule 18)。

## 3. よるのことば案件で必ず使う skill (creative + D2C)

| skill | 用途 |
|---|---|
| `creative-playbook.md` | デザインプロセス / L1-L3 品質 / §2.5 ビジュアル品質ルーブリック (16 項目、12 点未満 REJECT) / §2.6 外部デザインカタログ |
| `references/creative-playbook-distinctiveness.md` | 反スロップ識別性ゲート。占いアプリは「107% 陽気な平均値」に陥りやすい。断る力 3 能力 (テイスト / 意思と勇気 / ユーモア) |
| `brand-guidelines.md` | §6 品質ゲート + 識別性ゲート + 日本語字形 + 出力フォーマット |
| `document-creation-6-steps.md` | 提案・資料の 6 ステップ + HTML/Markdown フォーマット判断軸 |
| `industry-playbooks/` | D2C / コンシューマ向けの業界別知見 |
| `aeo-playbook.md` | アプリの AI 検索対応 (Google AI Overviews / ChatGPT 経由の発見) |

## 4. agent 委任プロンプトテンプレート (PR #219/#230 準拠、必須)

agent を起動する時、委任プロンプトに必ず以下を含める。skill 明示なしの起動は `skill-reference-check.sh` hook が warn を出す:

```
[agent 名] として [タスク] を実施。
着手前に必ず以下を Read:
- ~/.claude/skills/creative-playbook.md (§2.5 品質ルーブリック)
- ~/.claude/skills/references/creative-playbook-distinctiveness.md (識別性ゲート)
- [案件固有の参照ファイル]
デザイン作業時は §5 のフローを厳守。結論 + 反証チェック Step 1-4。
```

## 5. デザイン作業フロー (参照 → 競合比較 → 反映 → 検証)

クオリティが低い根本原因は、このフローが実行されていないこと。各ステップを飛ばさない:

1. デザイン参照取得: Lazyweb MCP (token 取得済なら) or Mobbin / creative-playbook §2.6 外部カタログ。占いアプリ + 女性向け D2C で 3-5 件
2. 競合比較: 競合占いアプリ (例: 占い系上位アプリ) の UI / 訴求 / 課金導線を competitive-analyst で分析。「何が標準か」「どこで差別化するか」を明文化
3. プロダクト反映: 参照 + 競合比較の結論を、実際のデザイントークン / 画面に落とす。「参照を見た」で終わらせず、どの知見をどの画面に反映したか 1 行記録
4. 識別性ゲート (PR #226): 「競合の合理的な平均値をどこで断ったか」を 1 行明示。未記載は REVISE。占いアプリが「むき出しレンガ壁」的な無難な平均値に収束していないか
5. 2 段階検証ゲート (PR #213): 成果物 → creative-director チェック → orchestrator チェック

## 6. クリエイティブ品質 床/天井ゲート

- 床ゲート (スロップ回避): outcomes-judge-minimal.sh + template-injection-check.sh (OGP / @media / 日本語字形) + ビジュアル品質ルーブリック 12 点未満 REJECT
- 天井ゲート (識別性確保): 識別性ゲート (合理的推奨をどこで断ったか 1 行明示)
- 両方通過して初めてリリース

## 7. 「OS が機能する」の判定基準

よるのことば成果物が以下を満たせば ConsultingOS が機能している:
- skill (creative-playbook 等) を Read し、その知見が成果物に反映されている (4-3 の 1 行記録で確認)
- デザイン参照 3-5 件を取得し、競合比較を経てプロダクトに落ちている
- 識別性ゲートを通過 (平均値に収束していない)
- 2 段階検証ゲートを通過

満たさなければ、委任プロンプトが雑 (skill 未明示) か、§5 フローが飛ばされている。そこを実地で修正する。

## 8. 反証チェック (Step 1-4 圧縮)

- Step 1: 案件情報は active-engagements.md + yorunokotoba assistant 提供 FACT / 「クオリティ低」はユーザー実観察 FACT / 改善フローは consulting-os 既存 skill (PR #212/#213/#216/#219/#226/#230) の統合 INFERENCE
- Step 2: 本ハンドオフは規律追加でなく 1 案件特化の申し送り (docs/handoff-* 既存パターン、handoff-mizuno-funding-v4.md 同型)、Hard Rule 13 形骸化ルール追加に該当せず
- Step 3 実用反証: consulting-os の 40 PR 規律が よるのことばで機能していない実データを受け、規律でなく実作業フロー (§5 参照→競合比較→反映→検証) の申し送りに変換
- Step 4 リスク即潰し: skill 未活用 → §4 委任テンプレート + skill-reference-check.sh hook / デザイン参照未反映 → §5 フロー 4 ステップ厳守 / 競合比較プロダクト未反映 → §5-3 で 1 行記録義務化 / 平均値収束 → §5-4 識別性ゲート / 形骸化 → 本ハンドオフは よるのことば Phase 3-4 完了で役割終了、archive
