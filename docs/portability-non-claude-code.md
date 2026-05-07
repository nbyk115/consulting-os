# Portability: Claude Code 以外の AI ツールでの ConsultingOS 利用

ConsultingOS は Claude Code を主 runtime とするが、`consulting_os` Python utility は Claude Code 以外の環境でも format_prompt + validate_output が portable に動作する。本 doc は対応マトリクス + 利用手順を提示。

## 対応マトリクス

| ツール | format_prompt 利用 | validate_output 利用 | hook 連動 | 備考 |
|---|---|---|---|---|
| Claude Code (Desktop / Web / VS Code / JetBrains) | ✓ | ✓ | ✓ 全 18 hook | 主 runtime、追加コスト 0 |
| Claude.ai web (claude.ai/chat) | ✓ | ✓ | ✗ hook 非対応 | prompt 貼付 + 応答コピペ で 2 段階運用 |
| Anthropic Console (console.anthropic.com) | ✓ | ✓ | ✗ | API 課金あり、ConsultingOS 規律は手動適用 |
| Cline (VS Code 拡張) | ✓ | ✓ | △ Cline 独自 hook | format_prompt の system + user を Cline の System Prompt 欄に投入 |
| Cursor (Cursor IDE) | ✓ | ✓ | △ Cursor 独自 rules | .cursorrules に format_prompt の system 部分を貼付 |
| Continue (VS Code / JetBrains) | ✓ | ✓ | △ Continue 独自 config | config.yaml の systemMessage に貼付 |
| Aider (CLI) | ✓ | ✓ | ✗ | --message-file で prompt 渡し可能 |
| Open WebUI / LibreChat | ✓ | ✓ | ✗ | カスタムプロンプト機能で system 投入 |

## Claude.ai web での利用例

```bash
# 1. プロンプト整形
consulting-os format-prompt \
  --agent strategy-lead \
  --request "N.Y.CRAFT の OEM 戦略を 3 軸で評価" \
  --context '{"client":"N.Y.CRAFT"}' \
  --format json > prompt.json

# 2. system + user を結合して claude.ai/chat に貼付
python3 -c "
import json
with open('prompt.json') as f:
    p = json.load(f)
print('# SYSTEM')
print(p['system'])
print()
print('# USER')
print(p['user'])
" | xclip -selection clipboard

# 3. Claude.ai web で応答を得て、コピーして response.txt 保存

# 4. 規律検証
cat response.txt | consulting-os validate
```

## Cline (VS Code) での利用例

```bash
# Cline の Custom Instructions / Mode に system prompt を投入
consulting-os format-prompt \
  --agent strategy-lead \
  --request "{user request}" \
  --no-auto-skill \
  --format json | python3 -c "
import json, sys
print(json.load(sys.stdin)['system'])
" > .vscode/cline-strategy-lead.system.md

# Cline の Custom Mode で参照
# settings.json:
#   {
#     \"cline.customInstructions\": {
#       \"strategy-lead\": \"@./.vscode/cline-strategy-lead.system.md\"
#     }
#   }
```

## Cursor (.cursorrules) での利用例

```bash
# Cursor は .cursorrules を auto-load する
consulting-os format-prompt \
  --agent strategy-lead \
  --request "" \
  --no-auto-skill \
  --format json | python3 -c "
import json, sys
print(json.load(sys.stdin)['system'])
" > .cursorrules
```

## Aider (CLI) での利用例

```bash
# Aider は --message-file で system プロンプトを直接渡せる
consulting-os format-prompt \
  --agent strategy-lead \
  --request "{user request}" \
  --format json > /tmp/prompt.json

python3 -c "
import json
p = json.load(open('/tmp/prompt.json'))
print(p['system'])
print()
print(p['user'])
" > /tmp/aider-msg.txt

aider --message-file /tmp/aider-msg.txt --model claude-opus-4-7
```

## 規律 enforcement の portability

Claude Code 以外では hook が動かないため、以下の 3 件を手動で運用する:

1. 反証チェック (Rule 1): `consulting-os validate < response.txt` で機械検証
2. 出典ラベル (Rule 2): 同 validate で裸数値を検知
3. 日本語字形 (Rule 10): PDF / DOCX 生成後に `pdffonts` / `unzip + grep` で手動検証

ConsultingOS の真の価値は markdown 規律 + Python utility にあり、Claude Code は最も統合度が高い runtime だが必須ではない。

## 検証

```bash
# format_prompt が portable な dict を返すことの確認
python3 -c "
from consulting_os import format_prompt
p = format_prompt(agent='strategy-lead', request='test', auto_skill=False)
assert isinstance(p, dict)
assert 'system' in p and 'user' in p
print('portable OK')
"

# validate_output が dependency 0 (Anthropic SDK 不要) で動くことの確認
python3 -c "
from consulting_os import validate_output
r = validate_output('test text without 反証')
assert r.discipline_pass is False
print('validate_output portable OK')
"
```

両 API とも Anthropic SDK / Claude Code に依存しない pure Python なので、上記任意ツールから利用可能。
