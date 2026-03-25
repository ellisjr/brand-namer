# Step 00: Session Start

**Progress:** Step 1 of 13 — Next: Brand Brief (step-01a)
**Reads:** filesystem (`brand-namer-output/` directory) | **Writes:** nothing yet

## MANDATORY EXECUTION RULES (READ FIRST)

- Read this COMPLETE file before taking any action
- FORBIDDEN to load next step until user selects [C] Continue
- FORBIDDEN to generate any names during this step — this is purely session detection and routing
- FORBIDDEN to skip artifact detection — always check the filesystem before proceeding
- Update artifact frontmatter `stepsCompleted` before loading next step
- After handling non-menu user input, ALWAYS re-display the current menu

## SUCCESS METRICS

- Session state detected correctly (new session vs. resumption) with artifacts inventoried
- User understands where they are and has made an explicit routing decision
- Session type (quick / deep / iterative / validation-only) determined before proceeding

## FAILURE MODES

- CRITICAL: Auto-routing without presenting options to the user
- CRITICAL: Not checking for existing artifacts in `brand-namer-output/`
- CRITICAL: Not detecting or asking about session type when signals are ambiguous

---

## Execution

### 1. Check for existing artifacts

Immediately check whether `brand-namer-output/` exists and which artifacts are present. The possible artifacts are:

| Artifact | File | Indicates |
|----------|------|-----------|
| Brief | `00-brief.md` | Loop 1 complete — brief, territories, whitespace captured |
| Candidates | `01-candidates.md` | Loop 2 complete — divergent generation done |
| Shortlist | `02-shortlist.md` | Loop 3 complete — convergent selection done |
| Validation | `03-validation.md` | Loop 4 in progress — de-risking underway |
| Final | `04-final.md` | Full pipeline complete |

For each artifact found, read its YAML frontmatter to extract:
- `project` — the naming project identifier
- `stepsCompleted` — which steps have been completed
- `sessionMode` — Explorer or Focused
- `sessionType` — quick, deep, iterative, or validation-only
- Any other frontmatter fields that capture session state (territories, naming architecture, etc.)

### 2. Route based on artifact state

#### If artifacts exist

Summarize what was found to the user. Be specific:

> "I found your previous session artifacts for **[project name from frontmatter]**. Here's where you left off:
>
> - **Brief** (`00-brief.md`): [summary — naming target, audience, key personality notes]
> - **Candidates** (`01-candidates.md`): [summary — how many candidates, which territories, whether riffing was completed]
> - [etc. for each artifact found]
>
> Based on the artifacts, you're ready to resume at **[detected step]**."

Then present resume options (see Menu below).

Artifact-to-step resume mapping:
- Only `00-brief.md` exists → resume at step-02a (Divergent Generation)
- `01-candidates.md` exists → read its frontmatter; resume at step-03a (Convergent Selection), or step-02c if riffing wasn't completed
- `02-shortlist.md` exists → resume at step-04a (De-risk / Validation)
- `03-validation.md` exists → resume at step-04f (Final Recommendation)
- All exist → present `04-final.md` or offer to do another round

#### If no artifacts exist

This is a new session. Check whether the user has already provided context in the conversation — uploaded documents (pitch decks, business plans, PRDs, competitive analyses), a description of what they're building, or any other material that would feed into the brief.

If context is present: Acknowledge it and route to step-01a (Brand Brief).
If no context yet: Welcome the user and route to step-01a (Brand Brief).

### 3. Detect session type

The session type determines which stages are mandatory vs. optional throughout the pipeline. Infer the type from the user's signals:

- **Quick session** ("I need 5 name ideas in 10 minutes," "just a quick brainstorm"): Use the Quick Mode Fast Path. Skip most ceremony. Minimal brief (3 questions), 30-40 names gallery-mode, one reaction round, done.

- **Deep session** ("I want to really get this right," "this is for our Series A rebrand," detailed brief with lots of context): Run the full pipeline including cross-model ideation and creative riffing. Riffing checklist is **mandatory** before entering validation. Multiple ideation rounds. Thorough validation. All 5 artifacts.

- **Iterative session** ("Let me think about these overnight," "I'll come back to this"): Save artifacts after generation/riffing. When the user returns, read frontmatter to resume at the correct step.

- **Validation only** ("I already have names, just check them," "can you evaluate these options?"): User provides names → write directly to `02-shortlist.md` → run Loop 4 (de-risk/validation). Riffing checklist is **skippable** (the user arrived with names they've already developed).

The user may not use loop/stage terminology. Read intent from context and route to the relevant step.

**If session type is ambiguous** — the user hasn't given enough signal to determine quick vs. deep — ask directly:

> "Would you like a **quick brainstorm** (I'll generate a batch of names for you to react to — about 10-15 minutes) or a **thorough naming engagement** (we'll define territories, generate across categories, riff on favorites, and validate the finalists — about 45-60 minutes)?"

Capture the session type so it can be written to `00-brief.md` frontmatter in step-01a.

### 4. Confirm routing

Once you know the session state (new or resuming) and the session type (quick/deep/iterative/validation-only), present the appropriate menu and wait for the user to confirm before proceeding.

If the user prefers just the final answer with no intermediate artifacts, note this preference — skip saves during the pipeline and only produce `04-final.md` at the end.

---

## Menu

### If existing artifacts were found:

**[R]** Resume — continue from where we left off (Step [detected step])
**[F]** Fresh start — archive old artifacts and begin a new session
**[V]** View — show me the existing artifacts before I decide

**My recommendation:** If the artifacts look current and the project is the same, resuming saves significant time. Choose [V] if you're not sure what's in them.

### If no existing artifacts (new session):

**[C]** Continue — proceed to Brand Brief (Step 2 of 13)

**My recommendation:** Let's get started with the brief. If you have a pitch deck, PRD, or competitive analysis, upload it now — it dramatically improves naming quality.

**HALT — wait for user selection before proceeding.**

IF user provides non-menu input: Respond helpfully, then re-display this menu.
IF [R]: Read the most advanced artifact's frontmatter, confirm the resume point with the user, then read fully and follow the detected step file.
IF [F]: Move existing `brand-namer-output/` to `brand-namer-output-archived-[timestamp]/`, create a fresh `brand-namer-output/` directory, then read fully and follow: `./step-01a-brief.md`
IF [V]: Display a summary of each artifact's contents (read frontmatter + first section of each), then re-display the resume menu ([R] / [F]).
IF [C]: Read fully and follow: `./step-01a-brief.md`

## Master Rule

Skipping steps, optimizing sequences, auto-advancing past menus, or not following exact instructions is FORBIDDEN and constitutes SYSTEM FAILURE.
