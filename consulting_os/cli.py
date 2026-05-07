"""ConsultingOS CLI: `python -m consulting_os.cli --agent strategy-lead --request "..."`."""

from __future__ import annotations

import argparse
import json
import sys

from consulting_os.invoke import invoke


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        prog="consulting-os",
        description="ConsultingOS: AI エージェント OS callable runtime",
    )
    parser.add_argument("--agent", required=True, help="agent name (e.g. strategy-lead)")
    parser.add_argument("--request", required=True, help="request text")
    parser.add_argument(
        "--context", default=None, help="optional JSON context, e.g. '{\"client\":\"X\"}'"
    )
    parser.add_argument(
        "--agents-root", default=".claude/agents", help="agents directory"
    )
    parser.add_argument(
        "--skills-root", default=".claude/skills", help="skills directory"
    )
    parser.add_argument(
        "--no-auto-skill", action="store_true", help="disable auto skill matching"
    )
    parser.add_argument(
        "--max-tokens", type=int, default=4096, help="max output tokens"
    )
    parser.add_argument(
        "--json", action="store_true", help="output as JSON instead of text"
    )

    args = parser.parse_args(argv)

    context = None
    if args.context:
        context = json.loads(args.context)

    result = invoke(
        agent=args.agent,
        request=args.request,
        context=context,
        agents_root=args.agents_root,
        skills_root=args.skills_root,
        auto_skill=not args.no_auto_skill,
        max_tokens=args.max_tokens,
    )

    if args.json:
        print(json.dumps(
            {
                "agent": result.agent,
                "discipline_pass": result.discipline_pass,
                "violations": result.violations,
                "output": result.output,
                "falsification_complete": (
                    result.falsification.has_all_steps if result.falsification else False
                ),
                "bare_numbers": result.sources.bare_numbers,
            },
            ensure_ascii=False,
            indent=2,
        ))
    else:
        print(result.output)
        print("\n---")
        print(f"[ConsultingOS] discipline_pass: {result.discipline_pass}")
        if result.violations:
            for violation in result.violations:
                print(f"  ⚠ {violation}")
        if result.sources.bare_numbers:
            print(f"  bare numbers: {len(result.sources.bare_numbers)}")

    return 0 if result.discipline_pass else 1


if __name__ == "__main__":
    sys.exit(main())
