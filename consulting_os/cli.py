"""ConsultingOS CLI (zero-cost): format prompt + validate output.

実 runtime = Claude Code (ユーザー既存契約)。本 CLI は API を叩かず、
プロンプト整形と応答検証のみ提供する = コスト 0。
"""

from __future__ import annotations

import argparse
import json
import sys

from consulting_os.invoke import format_prompt, validate_output


def _add_format_subcommand(subparsers: argparse._SubParsersAction) -> None:
    parser = subparsers.add_parser(
        "format-prompt",
        help="agent + skill + 規律 instruction を統合した prompt を出力",
    )
    parser.add_argument("--agent", required=True, help="agent name (e.g. strategy-lead)")
    parser.add_argument("--request", required=True, help="request text")
    parser.add_argument(
        "--context", default=None, help='optional JSON, e.g. \'{"client":"X"}\''
    )
    parser.add_argument("--agents-root", default=".claude/agents")
    parser.add_argument("--skills-root", default=".claude/skills")
    parser.add_argument("--no-auto-skill", action="store_true")
    parser.add_argument(
        "--format",
        choices=["json", "text"],
        default="text",
        help="text = system / user を区切って出力 / json = 構造化",
    )


def _add_validate_subcommand(subparsers: argparse._SubParsersAction) -> None:
    parser = subparsers.add_parser(
        "validate",
        help="stdin から応答テキストを読み、規律 (反証 / 出典) を検証",
    )
    parser.add_argument("--agent", default="", help="agent name (任意、ログ用)")
    parser.add_argument("--request", default="", help="original request (任意、ログ用)")
    parser.add_argument(
        "--format", choices=["json", "text"], default="text", help="出力形式"
    )


def _add_list_subcommand(subparsers: argparse._SubParsersAction) -> None:
    subparsers.add_parser("list-agents", help="登録済 27 agent の一覧を表示")


def cmd_format_prompt(args: argparse.Namespace) -> int:
    context = json.loads(args.context) if args.context else None
    prompt = format_prompt(
        agent=args.agent,
        request=args.request,
        context=context,
        agents_root=args.agents_root,
        skills_root=args.skills_root,
        auto_skill=not args.no_auto_skill,
    )
    if args.format == "json":
        print(json.dumps(prompt, ensure_ascii=False, indent=2))
    else:
        print(f"=== Agent: {prompt['agent']} (model_hint: {prompt['model_hint']}) ===")
        print("--- SYSTEM ---")
        print(prompt["system"])
        print("--- USER ---")
        print(prompt["user"])
    return 0


def cmd_validate(args: argparse.Namespace) -> int:
    output = sys.stdin.read()
    result = validate_output(output, agent=args.agent, request=args.request)
    if args.format == "json":
        print(json.dumps(
            {
                "discipline_pass": result.discipline_pass,
                "violations": result.violations,
                "falsification_complete": (
                    result.falsification.has_all_steps if result.falsification else False
                ),
                "bare_numbers": result.sources.bare_numbers,
                "labels": {
                    "fact": len(result.sources.facts),
                    "inference": len(result.sources.inferences),
                    "speculation": len(result.sources.speculations),
                },
            },
            ensure_ascii=False,
            indent=2,
        ))
    else:
        status = "PASS" if result.discipline_pass else "FAIL"
        print(f"[ConsultingOS] discipline_pass: {status}")
        for violation in result.violations:
            print(f"  ⚠ {violation}")
        print(f"  FACT: {len(result.sources.facts)}")
        print(f"  INFERENCE: {len(result.sources.inferences)}")
        print(f"  SPECULATION: {len(result.sources.speculations)}")
        if result.sources.bare_numbers:
            print("  bare numbers:")
            for bare in result.sources.bare_numbers[:10]:
                print(f"    - {bare}")
    return 0 if result.discipline_pass else 1


def cmd_list_agents(args: argparse.Namespace) -> int:
    from consulting_os.agent_loader import load_all_agents

    agents = load_all_agents()
    departments: dict[str, list[str]] = {}
    for agent in agents.values():
        departments.setdefault(agent.department, []).append(agent.name)
    for dept, names in sorted(departments.items()):
        print(f"== {dept} ({len(names)}) ==")
        for name in sorted(names):
            agent = agents[name]
            print(f"  - {name}: {agent.description}")
    return 0


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        prog="consulting-os",
        description="ConsultingOS CLI (zero cost: Claude Code が runtime)",
    )
    subparsers = parser.add_subparsers(dest="command", required=True)

    _add_format_subcommand(subparsers)
    _add_validate_subcommand(subparsers)
    _add_list_subcommand(subparsers)

    args = parser.parse_args(argv)

    handlers = {
        "format-prompt": cmd_format_prompt,
        "validate": cmd_validate,
        "list-agents": cmd_list_agents,
    }
    return handlers[args.command](args)


if __name__ == "__main__":
    sys.exit(main())
