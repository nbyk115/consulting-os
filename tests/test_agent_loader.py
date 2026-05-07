"""Smoke test for agent_loader."""

from pathlib import Path

import pytest

from consulting_os.agent_loader import get_agent, load_all_agents, load_agent


REPO_ROOT = Path(__file__).resolve().parent.parent
AGENTS_ROOT = REPO_ROOT / ".claude" / "agents"


def test_load_all_agents_returns_27():
    agents = load_all_agents(AGENTS_ROOT)
    assert len(agents) == 27, f"Expected 27 agents, got {len(agents)}"


def test_load_agent_strategy_lead():
    agent_file = AGENTS_ROOT / "consulting" / "strategy-lead.md"
    agent = load_agent(agent_file)
    assert agent.name == "strategy-lead"
    assert agent.department == "consulting"
    assert agent.model in {"opus", "sonnet", "haiku"}
    assert "戦略" in agent.system_prompt or "strategy" in agent.system_prompt.lower()


def test_get_agent_by_name():
    agent = get_agent("sales-deck-designer", agents_root=AGENTS_ROOT)
    assert agent.name == "sales-deck-designer"
    assert agent.department == "creative"


def test_get_agent_unknown_raises():
    with pytest.raises(KeyError):
        get_agent("nonexistent-agent", agents_root=AGENTS_ROOT)


def test_load_all_agents_no_duplicates():
    agents = load_all_agents(AGENTS_ROOT)
    names = list(agents.keys())
    assert len(names) == len(set(names))
