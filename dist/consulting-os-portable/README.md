# ConsultingOS — Portable

`nbyk115/consulting-os` を新規プロジェクトに導入するためのワンコマンド配布。

## インストール

```bash
cd /path/to/your/project
curl -sL https://raw.githubusercontent.com/nbyk115/consulting-os/main/dist/consulting-os-portable/install.sh | bash
git add CLAUDE.md .claude
git commit -m "feat: ConsultingOS 導入"
git push
```

## 配布物

- `CLAUDE.md` — ルート指示書
- `.claude/agents/` — 34エージェント（6部門）
- `.claude/skills/` — 22スキル + sales-deck-* / claude-design-handoff
- `.claude/commands/` — 10コマンド
- `.claude/hooks/` — UserPromptSubmit 等
- `.claude/settings.json` — permissions / hooks 設定

## 既存 .claude/ への上書き挙動

`agents / skills / commands / hooks / settings.json` を**上書き**します。プロジェクト固有のメモリ（`.claude/memory/`）や `codemap.md` は配布版では削除されますが、それ以外のプロジェクト独自ファイルは保持されます。

## ソース

- 正本：[nbyk115/consulting-os](https://github.com/nbyk115/consulting-os)
- 旧配布元：`nbyk115/yorunokotoba`（移行済・archived）
