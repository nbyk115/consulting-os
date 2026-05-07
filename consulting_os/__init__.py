"""ConsultingOS runtime: Anthropic SDK 上の規律レイヤー.

ConsultingOS を「呼べば動く AI エージェント」として callable にする runtime.
Anthropic SDK が production reliability を担保し、本パッケージが規律
(反証チェック / 出典ラベル / 6 部門 routing) を enforce する。
"""

from consulting_os.invoke import Result, invoke
from consulting_os.types import Agent, Skill

__version__ = "1.0.0"
__all__ = ["invoke", "Result", "Agent", "Skill"]
