# Step 00: Session Start

**Progress:** Step 1 of 13 — Next: Brand Brief (step-01a)
**Reads:** filesystem (`brand-namer-output/` directory) | **Writes:** nothing yet

## Purpose

Detect whether a previous session exists, route to resume or fresh start, and determine the session type that governs the rest of the pipeline.

## Done when

- Session state detected (new or resuming) and any existing artifacts inventoried
- The user has made an explicit routing decision
- Session type (quick, deep, iterative, validation-only) determined, or the user asked when signals are ambiguous

## Guardrails

- No name candidates in this step. The brief does not exist yet, and names generated now anchor the user's taste before you know what you are naming.
- Check the filesystem for `brand-namer-output/` before assuming a fresh start. Resuming saves the user repeating an hour of work.

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
- `session_mode` — Explorer or Focused
- `session_type` — quick, deep, iterative, or validation-only
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

The session type decides which steps run; the definitions, signals, and quick-mode fast path are in `workflow.md` under "Session types and routing". Infer it from the user's signals: a detailed brief or "get this right" means deep; "just brainstorm some ideas" or a sparse brief means quick; "I already have names, just check them" means validation only; a returning user with artifacts on disk means iterative. Users rarely use this vocabulary, so read intent from context.

If the signals are genuinely ambiguous, ask:

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

**My recommendation:** [From the artifacts you just read, not a stock line: name the project and the step they stopped at, say how much work resuming saves ("the brief and 180 candidates are already here"), and recommend [R] if the project matches what the user is describing now, [F] if the brief names a different target, [V] if the frontmatter is sparse or the timestamp is old enough that the user may not remember the session.]

### If no existing artifacts (new session):

**[C]** Continue — proceed to Brand Brief (Step 2 of 13)

**My recommendation:** [From what the user has already said: if their opening message carried a target, audience, and competitors, say the brief is half-written and recommend [C] to confirm it; if it was a sentence, say what the brief still needs (audience, personality, competitors) and that a pitch deck or PRD would answer most of it; if they attached documents, name what you took from them.]

Wait for the user's selection before proceeding.

IF user provides non-menu input: Respond, then bring them back to this menu (see workflow.md).
IF [R]: Read the most advanced artifact's frontmatter, confirm the resume point with the user, then read fully and follow the detected step file.
IF [F]: Move existing `brand-namer-output/` to `brand-namer-output-archived-[timestamp]/`, create a fresh `brand-namer-output/` directory, then read fully and follow: `./step-01a-brief.md`
IF [V]: Display a summary of each artifact's contents (read frontmatter + first section of each), then re-display the resume menu ([R] / [F]).
IF [C]: Read fully and follow: `./step-01a-brief.md`
