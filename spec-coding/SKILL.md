---
name: spec-coding
description: "Run an accepted software-coding checklist specification through an efficiency-aware Anthropic challenge, continuous primary-first implementation, proportionate verification, live source-checklist updates, and one independent final Anthropic code review. Use when the user's primary task is strictly software coding or code review. Do not use for operational, diagnostic, research, API/system, documentation, runbook, skill, or non-code configuration work."
---

# Spec Coding

## Workspace isolation

Before reading implementation files or editing, load and apply
`~/.codex/skills/worktree-isolation/SKILL.md`. A dirty base checkout blocks
the task; never reuse the project checkout or a different task worktree.

## Source of truth

Require one accepted source specification with checkboxes. Read it together with recorded decisions, applicable `AGENTS.md`, referenced quality and testing rules, and established repository patterns. Treat the specification as functional scope and the remaining sources as implementation constraints.

Before editing a GitHub-hosted specification or publishing any other GitHub text, read and apply `~/.codex/skills/github-api-fast/references/github-entry-footer.md`. Refuse to start from a specification whose current footer says `akceptacja człowieka: **nie**`, unless the user's current implementation command accepts that exact version; in that case update the footer to `tak` before coding. Preserve `tak` for purely technical checkbox state updates that do not change requirements.

Read the complete canonical specification at startup, after context compaction, and after a specification change. Do not reread it after every checkbox, test, or routine edit. Edit the canonical source directly; never create a copied checklist or parallel progress ledger.

Derive languages, frameworks, commands, branch policy, release gates, and UI verification from the current repository. Do not import assumptions from another project.

Treat the specification as a change contract, not a request to rebuild everything it mentions. Modify only elements explicitly described as added, changed, or removed. Treat every mechanism listed as protected or under `Nie modyfikujemy` as a hard implementation boundary. Descriptive context about existing behavior is not implementation scope; do not refactor, duplicate, replace, or otherwise edit that mechanism unless the accepted specification explicitly requires the change. If the specification ambiguously describes an existing mechanism in a way that could be mistaken for implementation scope, correct or challenge the canonical specification before coding.

## Worktree

Every concrete issue gets exactly one dedicated implementation branch and one dedicated worktree. Never reuse an umbrella issue, parent issue, sibling issue, repository root checkout, or another issue's worktree. Before starting implementation, fetch the repository-defined primary branch and create the issue branch and worktree from its current remote tip, not from a stale local branch.

The primary owns that issue worktree continuously through implementation, corrections, publication, and closure. Challengers, reviewers, and delegated writers inspect or edit the same issue snapshot without registering another Git worktree for that issue. Do not create baselines, review worktrees, temporary worktrees, or parallel branches for the same issue.

Treat worktree removal as part of authorized issue closure. Apply the global
`AGENTS.md` worktree-cleanup protocol, including its fallback for a completed
task whose own app binding cannot be moved. Do not turn an unavailable
self-handoff into a repeated permission request when cleanup is already
authorized and the data-safety checks pass. Finish cleanup and verify its
result before reporting closure; if real data or concurrent-task risks remain,
preserve the work and report that specific blocker instead of forcing removal.

Never overwrite unrelated or human-authored changes. Do not commit, push, open a PR, merge, deploy, or clean up branches without the authority required by repository instructions.

## Phase 1: challenge

Use `$cliproxy-coding-subagents` to start one fresh read-only challenger with `claude-fable-5/high`. When its limit is exhausted, use `gpt-5.6-sol/high`; use `claude-opus-5/high` only for non-limit Fable unavailability. Give it the canonical specification, recorded decisions, applicable instructions, repository access, and relevant current state without implementation rationale or raw tool history.

Require the challenger to inspect completeness, consistency, feasibility, acceptance criteria, dependencies, repository compliance, risk, and execution efficiency. It must answer:

1. What can go wrong?
2. What is missing?
3. What repeats unnecessarily?
4. What is the cheapest safe gate plan?

Require it to count costly gates across the whole task, reject a full lifecycle per checkbox or minor change, preserve extra gates only for a concrete risk boundary, and return `GO` or `NO-GO` with the smallest necessary correction.

If `NO-GO` requires a human decision about scope, behavior, UX, risk, or acceptance, ask one concise question through `$grillowanie-pomyslow`. Otherwise correct the canonical specification and rerun the challenger. Start coding only after `GO`; no additional approval is required when the user already requested implementation.

For an active bug that has taken a previously working solution out of service, respect the specification's recorded recovery-first decision; the challenger must not reorder recovery behind root-cause work or block it while reviewing the remaining scope. Before `GO`, the primary may apply the smallest safe rollback, workaround, feature disablement, or compatibility restoration needed to bring the solution back to life. Preserve diagnostic evidence, avoid irreversible data changes and security regressions, verify the restored path, and label the recovery as temporary rather than closing the bug. The root-cause fix, regression protection, and future hardening remain in the specification and follow the normal challenge gate before implementation.

## Phase 2: primary-first coding

The primary implements the complete accepted scope continuously in one worktree. Do not divide routine work into formal packages or delegate implementation merely because the specification is large.

Before editing, trace the real entrypoint, shared owner, callers, and existing repository pattern. Fix a root cause once at the shared owner when sibling paths have the same defect. Prefer the smallest established mechanism that satisfies the specification.

Run the narrowest deterministic check after each logical change. Run broad suites, builds, external CI, deployments, environment tests, and external measurements only at integrated milestones required by the specification or a concrete risk boundary. Accept a passing check run by the current worktree owner; do not repeat it unless later changes can invalidate its result.

Before invoking CI, derive the smallest sufficient runtime scopes from the actual diff, entrypoints, and callers. Treat an automated change classifier as a candidate plan, not authority: remove every scope without a plausible impact path, especially when a broad directory rule over-classifies a storefront-only, admin-only, cron-only, or infrastructure-only change. Never add or retain jobs "just in case". Use the narrowest supported explicit scopes or filters that still cover the changed runtime; if the workflow cannot express them, record the classifier/filter defect instead of silently accepting unrelated tests.

Treat every checkbox in the canonical issue as an independent synchronization unit. Immediately after its logical result is implemented and verified, update exactly that one checkbox, then read the canonical source back and confirm that checkbox before updating another checkbox or materially starting the next result. If one change proves several items, process them sequentially with a separate mutation and readback for each. Never batch multiple checkbox changes into one mutation or readback, and never defer them to a package, wave, review, or final milestone. A checkbox is not accepted and does not count toward progress until its own readback confirms it. Reopen a disproved item individually; leave a blocked item unchecked with its concrete blocker.

Immediately after each successful checkbox readback, report one standalone Markdown block with exactly these three bullets:

```text
- Postęp: X/Y = Z%
- ETA: A-B (jednostka) aktywnej pracy
- nazwa domkniętego checkboxa
```

Substitute `X` with the current readback-confirmed completed count, `Y` with the current total, `Z` with the resulting canonical percentage, and `(jednostka)` with the current stable active-work ETA unit. Before emitting the block, apply the global progress and ETA protocol to the newly confirmed `X/Y` checkpoint and calculate a fresh ETA from the remaining work; never reuse, decrement, or proportionally scale the previous ETA after progress changes. Never use the checkbox's ordinal position as `X`. Put only the checkbox name in the third bullet, without a `Checkbox`, `domknięty` or similar prefix. Report every checkbox in its own block; never combine checkbox names, mutations, readbacks or notifications.

Use proof-before-scale only when a novel or materially changed mechanism is high-risk or will immediately be replicated broadly. Prove one representative real production path with a targeted check before replication. Routine reuse, localized changes, and ordinary test additions do not require mechanism dossiers, failure probes, pilots, or hard yields.

### Optional implementation delegation

Keep implementation with the primary unless either:

1. the user explicitly requests coding subagents; or
2. at least two ready scopes are genuinely independent, each contains roughly 60–90 minutes of useful work, handwritten files and mechanisms do not overlap, and expected parallel gain exceeds preparation and integration cost.

When that gate holds, use `$cliproxy-coding-subagents`. Never split one root-cause change, shared mechanism, or tightly coupled flow across writers. A delegated writer completes its bounded objective continuously and reports once at objective completion or a genuine decision blocker; never impose hard yields per checkbox or function. The primary retains shared mechanisms, integration, checklist updates, final verification, and publication.

When an accepted specification contains UI requirements or mockups, perform the repository-appropriate visual and interaction verification before accepting those items.

## Phase 3: review and closure

After implementation, the primary performs its own complete code review using the repository checklist, fixes every justified finding, and reruns only invalidated checks. Repeat until the primary has no actionable findings.

Then use `$cliproxy-coding-subagents` to start one fresh independent read-only reviewer with `claude-fable-5/high`. When its limit is exhausted, use `gpt-5.6-sol/high`; use `claude-opus-5/high` only for non-limit Fable unavailability. Review the exact final snapshot against the specification, repository instructions, correctness, regression risk, security, architecture, UX when applicable, and test adequacy. Give the reviewer evidence and code, not the implementer's rationale.

The primary evaluates every finding. Fix justified findings directly, rerun affected checks, and rereview only affected axes; repeat the complete independent review only when a correction materially changes the whole solution. Reject preferences, invented standards, scope expansion, and duplicate findings.

Finish implementation only when every executable checkbox is verified and checked, every remaining unchecked item has a concrete external blocker or explicit deferral, required checks pass for the final snapshot, and both primary and independent review have no actionable findings.

## Reporting

Before sending the final response, run the repository's completion gate. Report the durable issue, specification, PR, commit, or deployment references; summarize the user-visible result and the concrete changed scope; confirm material protected mechanisms that remained untouched; and provide the complete ordered path from the current stage to full issue closure. Do not present implementation, review, publication, merge, or deployment as closure when later required stages remain. If nothing remains, say explicitly that the whole issue is closed. Keep orchestration details internal unless they change the decision or the user asks for them. Derive progress only from the canonical checklist and follow the applicable global progress and ETA protocol.
