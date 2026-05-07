"""Dataclasses for ConsultingOS runtime."""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Optional


@dataclass
class Agent:
    name: str
    description: str
    model: str
    department: str
    system_prompt: str
    file_path: str


@dataclass
class Skill:
    name: str
    description: str
    body: str
    file_path: str


@dataclass
class FalsificationCheck:
    step1_self: str
    step2_structural: str
    step3_practical: str
    residual_risk: str
    has_all_steps: bool


@dataclass
class SourceLabels:
    facts: list[str] = field(default_factory=list)
    inferences: list[str] = field(default_factory=list)
    speculations: list[str] = field(default_factory=list)
    bare_numbers: list[str] = field(default_factory=list)


@dataclass
class Result:
    agent: str
    request: str
    output: str
    falsification: Optional[FalsificationCheck]
    sources: SourceLabels
    discipline_pass: bool
    violations: list[str] = field(default_factory=list)
    raw_response: Optional[dict] = None
