# ConsultingOS

コンサル / サービス開発 / プロダクト / クリエイティブ / グローバル / マーケティングの 6 部門・30 エージェント・19 スキルで提案から実装・海外展開・マーケまで一気通貫のマルチエージェント OS。

## 司令塔ダイアグラム（1 枚で構造把握）

```mermaid
graph TB
    User[ユーザー / クライアント案件]
    CLAUDE[CLAUDE.md 司令塔<br/>115 行・ハードルール 16]

    subgraph Departments["6 部門・30 エージェント"]
        Consulting[Consulting<br/>戦略・提案・KPI・法務<br/>7 名]
        ServiceDev[Service Dev<br/>実装・AI・インフラ<br/>4 名]
        Product[Product<br/>PdM・VOC<br/>2 名]
        Creative[Creative<br/>UX・FE・コンテンツ・ブランド<br/>7 名]
        Global[Global<br/>GTM・現地・翻訳<br/>3 名]
        Marketing[Marketing & Research<br/>広告・SEO・CRM・SNS・PR<br/>8 名]
    end

    subgraph Skills["19 スキル（全エージェント参照）"]
        ConsultingPlaybook[consulting-playbook<br/>佐藤・小野寺の知見]
        BrandGuidelines[brand-guidelines<br/>日本語字形 + 出力規律]
        Falsification[falsification-check<br/>反証モード]
        ClaudeCodeOps[claude-code-ops<br/>SDK + セッション管理]
        Cybersecurity[cybersecurity-playbook<br/>3 層 + GitHub 18 ルール]
        OtherSkills[他 14 スキル]
    end

    subgraph Defense["6 層規律防御"]
        L1[Layer 1 意図<br/>CLAUDE.md ハードルール]
        L2[Layer 2 手順<br/>brand-guidelines 詳細]
        L3[Layer 3 検証<br/>brand-guardian REJECT]
        L4[Layer 4 物理通知<br/>5 hook 注入]
        L5[Layer 5 記録<br/>evolution-log]
        L6[Layer 6 物理ブロック<br/>PreToolUse hook]
    end

    User -->|入力| CLAUDE
    CLAUDE -->|ルーティング| Departments
    Departments -->|参照| Skills
    CLAUDE -.防御.-> Defense
    Defense -.規律徹底.-> Departments

    style CLAUDE fill:#1a1a1a,stroke:#fff,color:#fff
    style User fill:#4a90e2,stroke:#fff,color:#fff
    style Defense fill:#e74c3c,stroke:#fff,color:#fff
```

## バリューチェーン（クライアント案件の流れ）

```mermaid
flowchart LR
    A[案件相談] --> B[ルーティング判定<br/>docs/agent-routing.md]
    B --> C[該当エージェント起動<br/>30 名から選定]
    C --> D[Agent Team 連携<br/>18 連携パターン]
    D --> E[反証チェック<br/>Step 1-3 + 残存リスク]
    E --> F[brand-guardian<br/>機械検証ゲート]
    F --> G[納品<br/>結論 → 根拠 → アクション]

    G -.継続案件.-> A

    style A fill:#4a90e2,stroke:#fff,color:#fff
    style E fill:#e67e22,stroke:#fff,color:#fff
    style F fill:#9b59b6,stroke:#fff,color:#fff
    style G fill:#27ae60,stroke:#fff,color:#fff
```

## 6 層防御の発動順序

```mermaid
sequenceDiagram
    participant U as ユーザー入力
    participant H1 as UserPromptSubmit hook
    participant M as モデル（Claude Code）
    participant H2 as PreToolUse hook
    participant H3 as PostToolUse hook
    participant H4 as Stop hook
    participant E as evolution-log

    U->>H1: prompt 送信
    H1->>H1: 短文化要求検知
    H1->>M: 強制ルール注入<br/>反証必須・**禁止・字形検証<br/>main 直接 push 禁止
    M->>M: 思考・実行
    M->>H2: ツール呼び出し
    H2->>H2: git push origin main 検知?
    alt main 直接 push
        H2-->>M: exit 2 物理ブロック
    else 安全な操作
        H2->>M: exit 0 通過
        M->>H3: ツール完了
        H3->>H3: PDF/DOCX/PPTX 生成?
        H3-->>M: フォント検証必須を案内
        H3->>H3: .md に ** 検出?
        H3-->>M: ハードルール 16 違反警告
    end
    M->>H4: 応答完了
    H4->>U: 完了前チェック 3 項目通知
    Note over E: 違反発生時 evolution-log 追記<br/>SessionStart hook で次回再リマインド
```

## 司令塔ダイアグラム（自己進化サイクル）

```mermaid
graph LR
    Op[運用<br/>クライアント案件] --> Issue[規律違反検出<br/>brand-guardian REJECT]
    Issue --> Log[evolution-log 記録<br/>FACT/INFERENCE/SPECULATION]
    Log --> Calendar[再評価カレンダー<br/>SessionStart hook]
    Calendar --> Improve[5-6 層防御強化<br/>新規 hook 追加]
    Improve --> Op

    Op -.長期蓄積.-> Asset[ストック資産<br/>ブランド人格・1stParty データ<br/>佐藤流アセット帰属]

    style Issue fill:#e74c3c,stroke:#fff,color:#fff
    style Log fill:#f39c12,stroke:#fff,color:#fff
    style Improve fill:#27ae60,stroke:#fff,color:#fff
    style Asset fill:#8e44ad,stroke:#fff,color:#fff
```

## 商業実績

| 案件 | クライアント | 内容 | 受注金額 | 期間 | ステータス |
|---|---|---|---|---|---|
| Hotice セールスデッキ | Hotice（performance marketing agency） | B2B セールスデッキ HTML/CSS 18 スライド + Puppeteer レンダリングパイプライン | 月 5 万円 | 3 ヶ月（15 万円） | 受注済 |

成果物は [`examples/hotice-sales-deck/`](./examples/hotice-sales-deck/) に格納。sales-deck-designer + brand-guardian + claude-design-handoff スキル経由で制作。佐藤裕介モード（具体性・ハルシネーション検出・競合比較表）+ 日本語字形禁則 + 出力フォーマット規律を全適用。

## 構成サマリ

| 項目 | 値 |
|---|---|
| エージェント | 30 名（6 部門） |
| スキル | 19 件 |
| コマンド | 6 個 |
| CLAUDE.md | 115 行・ハードルール 16 |
| 防御層 | 6 層 × 4 系統（反証 / 字形 / 出力フォーマット / 規律違反学習） |
| hook | 5 種（UserPromptSubmit / PreToolUse / PostToolUse / Stop / SessionStart） |
| evolution-log | 違反学習 7 件記録 |
| 再評価カレンダー | 7 項目（自動通知） |
| SDK 化 | Phase 1 PoC（claude-code-action@v1） |

## 主要規律

| 規律 | 出典 |
|---|---|
| 反証モード Step 1-3 + 残存リスク必須 | OS 独自規律 |
| 出典 3 ラベル（FACT / INFERENCE / SPECULATION）| 2026-05-01 違反学習 |
| 日本語字形検証必須（pdffonts / unzip+grep）| 2026-05-01 違反学習 |
| 出力フォーマット規律（`**` 禁止 / 改行 / 中央揃え / 収まり / W チェック）| 2026-05-01 違反学習 |
| main 直接 push 禁止（PreToolUse 物理ブロック）| 2026-05-02 違反学習 |
| GitHub アカウントセキュリティ 18 ルール | マネーフォワード事案学習 |

## 思想的基盤

- 佐藤裕介流: PL 思考・市場構造・3 変数交点・アセット帰属診断・コンセンサス疑念・ruthlessly edit
- 小野寺信行流: 指標を疑う・1stParty データ中心・フロー × ストック統合・代理店 R&D 機関化
- Boris Cherny 流 9 規律: Plan Mode・自己検証・形骸化ルール削除・権限明示
- Anthropic 公式（Sid Bidasaria SDK / Thariq セッション管理 5 つの術）

## Stage 進化ロードマップ

| Stage | 状態 | 例 | ConsultingOS の現在地 |
|---|---|---|---|
| 1. AIを使う | 対話的 | Claude Code セッション | 主軸 |
| 2. AIで自動化 | 単発タスクをコマンド化 | claude -p / パイプ | 一部活用 |
| 3. AIで出荷する | 本番システムに組み込み | GitHub Actions / SaaS | Phase 1 PoC 着手 |

## ファイル構成

```
consulting-os/
├── CLAUDE.md                  司令塔（115 行・ハードルール 16）
├── DESIGN.md                  UI 制作時参照
├── ICP.md                     マーケ・セールス時参照
├── README.md                  本ファイル
├── evolution-log.md           違反学習 + 再評価カレンダー
├── .claude/
│   ├── agents/                30 エージェント（6 部門）
│   ├── skills/                19 スキル
│   ├── commands/              6 コマンド
│   ├── hooks/                 5 hook（規律物理注入）
│   └── settings.json          permissions.deny + hook 設定
├── .github/workflows/         SDK Phase 1 PoC
├── docs/
│   ├── agent-routing.md       ルーティング判定ツリー
│   ├── agent-collaboration-patterns.md  18 連携パターン
│   └── sales-deck-rules.md    セールス資料規律
└── examples/
    └── hotice-sales-deck/     クライアント案件サンプル
```

## 詳細参照

- [`CLAUDE.md`](./CLAUDE.md): 司令塔・ハードルール 16
- [`evolution-log.md`](./evolution-log.md): 違反学習 + 再評価カレンダー
- [`docs/agent-routing.md`](./docs/agent-routing.md): ルーティング判定ツリー
- [`docs/agent-collaboration-patterns.md`](./docs/agent-collaboration-patterns.md): 18 連携パターン
- [`.claude/skills/claude-code-ops/SKILL.md`](./.claude/skills/claude-code-ops/SKILL.md): SDK + セッション管理
- [`.claude/skills/cybersecurity-playbook.md`](./.claude/skills/cybersecurity-playbook.md): 3 層 + GitHub 18 ルール
- [`.claude/skills/consulting-playbook.md`](./.claude/skills/consulting-playbook.md): 佐藤・小野寺の知見

## ライセンス

Private repository. クライアント案件機密情報を含む可能性あり。
