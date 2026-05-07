"""ConsultingOS runtime utilities (zero cost).

実 runtime = Claude Code (ユーザー既存契約)。本パッケージは Anthropic API を
直接叩かず、以下のみ提供:

  - format_prompt(agent, request, context) -> dict[str, str]
      agent + skill + 規律 instruction を統合してプロンプト整形

  - validate_output(output_text) -> Result
      応答テキストに対して反証チェック + 出典ラベル + 裸数値を機械検証

API 課金は発生しない (markdown / yaml parsing と regex 検証のみ)。
Claude Code への引き渡しは format_prompt() の戻り値を使う。
"""

from consulting_os.invoke import Result, format_prompt, validate_output
from consulting_os.types import Agent, Skill

__version__ = "1.1.0"
__all__ = ["format_prompt", "validate_output", "Result", "Agent", "Skill"]
