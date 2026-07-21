---
name: orchestrate-coding
description: "Orchestrate implementation, coding, bug-fix, and refactoring requests through a native Codex manager, mandatory challenge, one worker, and independent review. Do not use for diagnosis, explanation, read-only reporting, or design discussion."
---

# Orchestrate Coding

Run this workflow with native Codex subagents only. Read [model routing](references/model-routing.toml) before delegation; it is the sole model mapping. Respect every applicable root and nested `AGENTS.md` and give each agent only the minimum task package: goal, rationale, acceptance criteria, allowed files, relevant files/instructions, checks, and prohibitions. Never include secrets.

## Roles and boundaries

- The parent session is `manager`: it uses the parent session's full technical access to inspect, plan, delegate, classify feedback, update statuses/checklists, and assess DoD, without exceeding its approvals. It never edits code, tests, migrations, configuration, or product documentation. It updates an issue's source specification only with human approval.
- `challenger` and `reviewer` are read-only. Workers write only in the current workspace; exactly one worker writes at once. No worker commits, pushes, opens PRs, deploys, reads secrets, or expands scope.
- Use `worker-light` only for small, unambiguous, low-risk work in one module (documentation, mechanical edits, simple tests/search/summaries, or small fixes). Never use it for auth, payments, migrations, architecture, unclear requirements, or complex multi-module work. Use `worker-standard` otherwise.

## Workflow

1. Read instructions, current issue/specification, and the relevant repository. Prepare a minimal plan and task package.
2. Run one mandatory read-only challenge against the package and plan. Require each finding to include severity, rationale, and violated requirement or concrete risk. Classify it as accepted, rejected, or requiring a human decision. Stop for any specification change, destructive/external approval, or material business/architecture trade-off. A material plan change changes file/module scope, architecture/approach, risk-relevant operation order, acceptance criteria, or required checks; then run exactly one second challenge. Never run more than two.
3. Delegate the approved package to the selected worker. Require the smallest root-cause diff, reuse of existing code/platform/standard library/dependencies, relevant existing checks, and one smallest executable check for non-trivial changed behavior. Record commands, exit codes, and results. If `worker-light` rejects the package as out of scope, give the same package to `worker-standard`; this is neither a correction round nor a model escalation.
4. Run independent read-only review after implementation and every actual correction round. Give the reviewer the package, instructions, and complete task change set against the agreed base: staged, unstaged, and untracked task files; full contents of changed files and necessary callers; and the full check record with each command's exit code, stdout, and stderr—not worker rationale. Each finding must include severity, location, violated requirement or risk, and reproduction/verification. Classify every finding as accepted, rejected (with reason), deferred (only with human approval if scope changes), or requiring a specification change.
5. Send only accepted findings to the worker. Count a correction round only when code changes; allow at most five. Re-review after every round, including the fifth. If accepted findings remain after that review, stop for the human. If the same accepted finding returns in two consecutive reviews, or the standard model is unavailable/blocked, start a new `worker-standard` context with the escalation mapping, current package, diff, checks, and accepted findings; do not reset counters. If it cannot finish, stop for the human.
6. Use the configured challenger/reviewer fallback only when the primary role is unavailable or produces no useful answer; report it. Stop if both are unavailable. Do not use round-robin or substitute models outside the mapping.

## Done and report

Before completion, independently confirm every executable acceptance criterion, required checks and changed-behavior check, no unresolved accepted critical/important findings, allowed diff scope, and instruction compliance. Ask the worker to fix problems within the remaining limit; never fix them as manager. Commit, push, PR, and deploy remain separate human-authorized actions.

Report changed areas; used roles and models; fallback/escalation and reason; challenge rounds plus critical/important/minor and accepted/rejected/human counts; one row for every review with model and severity/classification counts (including zero); correction-round count; commands and results; risks/deferred items; and commit/push/PR/deploy status.

Install the canonical profiles with `scripts/install-agents.sh`, then start a new Codex session. In VS Code, reload the extension or window only if the roles do not appear in that new session.
