# Brand Namer — Workflow Router

Follow SKILL.md for Role, Philosophy, Reference Loading, Artifacts, and Scenario Playbooks. This file governs execution flow.

## MANDATORY EXECUTION RULES (READ FIRST)

- 📖 ALWAYS read the COMPLETE step file before taking any action within it
- 🚫 NEVER load multiple step files simultaneously — one step at a time
- 🚫 NEVER skip steps or optimize the sequence
- 🚫 NEVER proceed past a menu without user selection — HALT and wait
- 🚫 NEVER create mental todo lists from future steps — focus only on the current step
- 📖 ALWAYS halt at menus and wait for user input — silence means wait
- 📖 ALWAYS update artifact frontmatter before loading the next step
- 📖 ALWAYS re-display the current menu after handling any non-menu user input

## SYSTEM FAILURE Definitions

The following constitute SYSTEM FAILURE — these must never happen:

1. **Auto-advancing past menus** — proceeding without the user selecting an option
2. **Skipping the [C] gate** — loading the next step without user selecting [C] Continue
3. **Silent candidate filtering** — dropping or pre-filtering candidates before the user sees them
4. **Premature shortlisting** — entering Loop 3 with fewer than 40 candidates without explicit user waiver
5. **Skipping reference files** — generating names without reading the referenced technique file for the current stage
6. **Batch overflow** — presenting more than 15 candidates in a single batch
7. **Unnumbered selectables** — presenting a selectable list without reference numbers
8. **Skipping cross-pollination offer** — not offering cross-model ideation at least once in deep sessions
9. **Menu without recommendation** — presenting a checkpoint menu without your specific recommendation
10. **Implicit progression** — treating "let's move on" or "what's next" as a menu selection instead of re-displaying the menu

## User Waiver Protocol

When a hard gate is blocking (e.g., <60 candidates, <6 categories attempted):

1. The user must explicitly say "proceed anyway" or "skip this gate"
2. Casual language ("let's move on", "what's next", "I think we're good") is **NOT** a valid waiver
3. Confirm the waiver: "Just to confirm — you want to proceed with [N] candidates, below the recommended [M]? This may result in [consequence]."
4. After confirmed waiver, note in artifact frontmatter: `gate_waived: [gate_name]`

## Chat-Then-Redisplay Pattern

When the user provides input that is NOT a menu selection (questions, comments, context, tangents):

1. Respond helpfully to their input
2. Then re-display the current menu: "Here are your options again:"
3. **HALT — wait for a menu selection**

This prevents users from getting "lost" in the workflow after a side conversation.

## Menu Format Standard

ALL menus use this bracket-letter format:

```
**[A]** Description of option A
**[B]** Description of option B
**[C]** Continue — save and proceed to [Next Step Name] (Step N of 13)

**My recommendation:** [Specific suggestion with rationale based on current session state — pool size, technique coverage, user energy. NEVER omit this.]

**HALT — wait for user selection before proceeding.**
```

Rules:
- ALL selectable items MUST be numbered or lettered in brackets
- Include progress indicator in [C] option: "(Step N of 13)"
- Maximum 15 items per selectable batch
- Every checkpoint menu MUST include a recommendation with brief rationale
- After every menu presentation, include the HALT instruction

## Step Routing Table

| # | Step ID | File | Purpose | Gate Type |
|---|---------|------|---------|-----------|
| 1 | 00 | `steps/step-00-session-start.md` | Detect existing session, offer resume or start fresh | Auto / [C] |
| 2 | 01a | `steps/step-01a-brief.md` | Brand brief intake — understand what we're naming | [C] Continue |
| 3 | 01b | `steps/step-01b-territories.md` | Naming territories, competitive whitespace, session mode | [C] Continue |
| 4 | 02a | `steps/step-02a-generation.md` | Divergent generation — core ideation across categories | Checkpoint menu |
| 5 | 02b | `steps/step-02b-cross-pollination.md` | Cross-model ideation with other LLMs | [C] Continue |
| 6 | 02c | `steps/step-02c-riffing.md` | Creative riffing & directional expansion | Checkpoint menu |
| 7 | 03a | `steps/step-03a-shortlisting.md` | Convergent shortlisting + riffing checklist | Checkpoint menu |
| 8 | 04a | `steps/step-04a-screening.md` | Competitive screening via web search | [C] Continue |
| 9 | 04b | `steps/step-04b-domains.md` | Domain availability + pool recovery | Checkpoint menu |
| 10 | 04c | `steps/step-04c-variations.md` | Variation generation + re-screening | [C] Continue |
| 11 | 04d | `steps/step-04d-trademark.md` | Trademark screening | [C] Continue |
| 12 | 04e | `steps/step-04e-social.md` | Social handles, stress tests, extended presence | [C] Continue |
| 13 | 04f | `steps/step-04f-final.md` | Final tiered presentation + recommendations | End |

## Execution Flow

1. ALWAYS start with `steps/step-00-session-start.md`
2. Each step file specifies which step to load next via its "Next Step" section
3. Only load the NEXT step file when instructed by the current step — never look ahead
4. At checkpoint menus, the user may choose to loop back to earlier steps — load the target step directly
5. When looping back, do not re-run intervening steps

## Quick Mode Routing

When Quick Mode is detected (user wants speed over thoroughness):

- Step 00 → Step 01a (abbreviated: 3 questions only) → Step 02a (30-40 names, gallery only) → Step 03a (one round) → Step 04f (light presentation)
- **Skip:** Step 01b (territories), Step 02b (cross-pollination), most of Step 02c (riffing)
- **Skip:** Steps 04a-04e (full validation) — offer optional quick conflict check only
- See "Quick Mode Fast Path" in SKILL.md for full details

## Loop Structure

The 13 steps organize into 4 loops that can cycle:

```
Loop 1: FRAME     → Steps 00, 01a, 01b
Loop 2: GENERATE  → Steps 02a, 02b, 02c
Loop 3: SELECT    → Step 03a
Loop 4: DE-RISK   → Steps 04a, 04b, 04c, 04d, 04e, 04f
```

Cycle-back paths (defined in step files):
- Loop 3 → Loop 2: User wants more candidates before shortlisting
- Loop 4 → Loop 2: Validation killed too many names, need recovery generation
- Loop 4 → Loop 3: Need to re-shortlist after recovery

## Master Rule

Skipping steps, optimizing sequences, auto-advancing past menus, or not following exact instructions in step files is FORBIDDEN and constitutes SYSTEM FAILURE.
