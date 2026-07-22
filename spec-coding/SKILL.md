---
name: spec-coding
description: "Run an accepted checklist specification through mandatory challenge, direct senior coding, and independent iterative review. Use when the user invokes spec-coding or explicitly asks to code an accepted specification containing checkboxes."
---

# Spec Coding

## Input contract

Require one unambiguously identified source specification containing checkboxes. Edit that source directly; never create a copied or parallel checklist. Before work, read the full conversation, the specification, every applicable root and nested `AGENTS.md`, the quality, architecture, UX/UI, aesthetics, testing, and documentation rules they reference, and established patterns in the relevant code and configuration.

Treat the specification as the functional scope and the remaining sources as implementation and quality constraints. Do not invent standards or turn personal preferences into requirements. At the start of each phase, report the role and actual model selected by runtime; when runtime exposes no model name, report that the phase inherits the current session model instead of guessing.

## Phase 1: challenge

Start a separate read-only challenger before coding. Give it the full conversation context, source specification, repository access, and applicable instructions. Require it to check completeness, consistency, feasibility, acceptance criteria, dependencies, and repository compliance, while distinguishing contract-changing gaps from implementation details left to the senior.

If a gap requires a human decision about scope, behavior, UX, risk, or acceptance criteria, do not code. Use `$grillowanie-pomyslow`: ask one short question at a time, usually as a recommendation answerable with `yes` or `no`. Update the source specification immediately after the human answers, then rerun the complete challenge. When no material gap remains, freeze the specification and proceed to coding without another approval.

## Phase 2: coding

The main senior in the current session owns the result end-to-end and writes the code. Do not delegate coding to workers by default. Implement every executable checkbox in dependency and importance order, using the smallest adequate solution and the applicable repository checks.

Immediately change `[ ]` to `[x]` in the source specification only after that item is implemented and adequately verified. Never check partial or unverifiable work. For a blocked item, leave `[ ]`, append the concrete blocker, and continue every independent item. Do not change frozen requirements, expand scope, or start a grill during coding. Do not commit, push, or open a PR without a separate human instruction.

## Phase 3: reviewing

After coding, start a fresh, separate read-only reviewer that did not participate in implementation. Give it a clean context containing the frozen specification, applicable instructions, the complete task change set including staged, unstaged, and untracked files, necessary code, and all check results. Do not include author rationale or implementation discussion history.

Require review against the specification, repository instructions, quality, UX/UI, architecture, established patterns, and regression risk. Accept only concrete, justified, actionable findings. Reject invented standards, preferences, requirement changes, and scope expansion as scope creep.

Keep review findings in a working correction checklist outside the frozen specification. The senior fixes every accepted finding and verifies the change; the same reviewer then reviews the complete updated change set. Continue without a round limit until the reviewer reports no findings or further work is objectively blocked. Do not grill the human or change scope during coding or review.

## Completion and report

Finish successfully only when every executable source checkbox is verified and checked, every blocked checkbox remains unchecked with a concrete annotation, and the reviewer reports no findings. Otherwise report the workflow as incomplete.

Report concisely:

- total, completed, and blocked source checkboxes;
- remaining blockers;
- checks and results;
- role and model used in each phase;
- review-round count and finding count for every round;
- commit and push status.

Do not add model routing, provider pools, manager/worker roles, orchestration scripts, state machines, extra dependencies, or duplicate specifications.
