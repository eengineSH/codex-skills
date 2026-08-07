---
name: spec-coding
description: "Run an accepted checklist specification through mandatory challenge, direct senior coding, and independent iterative review. Use when the user invokes spec-coding or explicitly asks to code an accepted specification containing checkboxes."
---

# Spec Coding

## Input contract

Require one unambiguously identified source specification containing checkboxes. Edit that source directly; never create a copied or parallel checklist. Before work, read the full conversation, the specification, every applicable root and nested `AGENTS.md`, the quality, architecture, UX/UI, aesthetics, testing, and documentation rules they reference, and established patterns in the relevant code and configuration.

Treat the specification as the functional scope and the remaining sources as implementation and quality constraints. Do not invent standards or turn personal preferences into requirements. At the start of each phase, report the role and actual model selected by runtime; when runtime exposes no model name, report that the phase inherits the current session model instead of guessing.

## Worktree lifecycle

When the source specification is stored in a GitHub issue, create a dedicated branch and linked worktree before coding. Keep all implementation, checks, and review rounds in that worktree; do not reuse the main worktree or one containing unrelated changes.

If the authorized workflow later includes merging and pushing to `main`, first verify that both operations succeeded. Then remove the dedicated worktree and delete its local branch plus the remote branch when it still exists. Never force cleanup over uncommitted changes, and leave the worktree and branch intact when merge or push fails.

Treat an explicit `c+p do main` while working on a dedicated branch as authorization to skip the PR and external code review: commit the branch, merge it into `main`, push `main`, and perform the cleanup above.

## Phase 1: challenge

Start a separate read-only challenger before coding. Give it the full conversation context, source specification, repository access, and applicable instructions. Require it to check completeness, consistency, feasibility, acceptance criteria, dependencies, and repository compliance, while distinguishing contract-changing gaps from implementation details left to the senior. In the context of the challenged specification, require it to answer two explicit questions separately: `What can go wrong?` and `What is missing here?`

If a gap requires a human decision about scope, behavior, UX, risk, or acceptance criteria, do not code. Use `$grillowanie-pomyslow`: ask one short question at a time, usually as a recommendation answerable with `yes` or `no`. Update the source specification immediately after the human answers, then rerun the complete challenge. When no material gap remains, freeze the specification and proceed to coding without another approval.

## Phase 2: coding

The main senior in the current session owns the result end-to-end and writes the code. Do not delegate coding to workers by default. Implement every executable checkbox in dependency and importance order, using the smallest adequate solution and the applicable repository checks.

Immediately change `[ ]` to `[x]` in the source specification only after that item is implemented and adequately verified. Never check partial or unverifiable work. For a blocked item, leave `[ ]`, append the concrete blocker, and continue every independent item. Do not change frozen requirements, expand scope, or start a grill during coding. Do not commit, push, or open a PR without a separate human instruction.

When an accepted specification contains UI mockups, visual verification is mandatory. For every web screen and specified state, run the implemented application, use Playwright to render the reference viewport, compare the result with the approved mockup and its contract, and fix material differences before checking the item. Show or retain the resulting screenshots so the comparison is auditable. Component tests, DOM assertions, or code inspection do not replace this Playwright comparison. For native UI use the corresponding simulator, device, or widget render because Playwright covers the web surface only.

## Phase 3: reviewing

After coding, start a fresh, separate read-only reviewer that did not participate in implementation. Give it a clean context containing the frozen specification, applicable instructions, the complete task change set including staged, unstaged, and untracked files, necessary code, and all check results. Do not include author rationale or implementation discussion history.

Require review against the specification, repository instructions, quality, UX/UI, architecture, established patterns, and regression risk. Accept only concrete, justified, actionable findings. Reject invented standards, preferences, requirement changes, and scope expansion as scope creep.

Keep review findings in a working correction checklist outside the frozen specification. The senior fixes every accepted finding and verifies the change; the same reviewer then reviews the complete updated change set. Continue without a round limit until the reviewer reports no findings or further work is objectively blocked. Do not grill the human or change scope during coding or review.

## Completion and report

Finish successfully only when every executable source checkbox is verified and checked, every blocked checkbox remains unchecked with a concrete annotation, and the reviewer reports no findings. Otherwise report the workflow as incomplete.

Lead the final report with the result. Add a section `Rekomendowane następne kroki` only when a material action still remains; never invent one merely to fill the section. Keep recommendations proportional to scope, risk, uncertainty, repository policy, and verification already performed. If the next action is safe, authorized, and executable now, perform it instead of recommending it.

Do not recommend a PR or Copilot review merely because implementation is complete. For a small, localized, well-tested change, prefer no publication recommendation or the repository's simplest accepted publication path. Recommend a PR when repository policy requires it or the change benefits materially from review; recommend Copilot review only when the human explicitly requests it or concrete size, cross-cutting risk, security/data risk, or unresolved implementation uncertainty justifies its cost. When recommending an action Codex cannot initiate, state who initiates it and why it is proportionate.

Mention checks and their results briefly. Mention an unchecked checkbox or blocker only when it gates or changes a recommended next step; keep the source specification as the full status ledger instead of copying its unfinished inventory into the response. Do not report phase roles, selected models, worktree mechanics, checkbox totals, review-round bookkeeping, or commit/push/stage status unless the user asks or the information materially changes the recommended next action.

Never end with an ownerless statement such as "validation remains" or "next: deploy". When external action is required, name its owner and the trigger that lets Codex continue.

Do not add model routing, provider pools, manager/worker roles, orchestration scripts, state machines, extra dependencies, or duplicate specifications.
