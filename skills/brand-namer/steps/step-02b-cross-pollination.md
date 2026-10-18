# Step 02b: Cross-Pollination with Other LLMs

**Progress:** Step 5 of 13 — Next: Creative Riffing (step-02c)
**Reads:** `brand-namer-output/01-candidates.md` | **Writes:** `brand-namer-output/01-candidates.md` (append), `brand-namer-output/cross-pollination-prompt.md`

## Purpose

Widen the possibility space with other models' creative biases.

## Done when

- Cross-pollination offered (it is a standing offer in every deep session; the user can decline)
- If accepted, a self-contained prompt written to `brand-namer-output/cross-pollination-prompt.md`, then either run through the Codex CLI or handed to the user to paste into another LLM
- Results, whether returned by Codex or pasted back, are deduplicated, attributed to the source model, and merged into `01-candidates.md`

## Guardrails

- Deduplicate results against the existing pool and keep the source model on every candidate. A name two models produced independently is a validation signal, not a duplicate to drop silently.
- Ask before the first Codex run in a session. It spends the user's OpenAI plan or credit, which is theirs to approve. Once they have said yes, run further rounds in the same session without asking again; the approval covers the session, not the step.

---

## Execution

Different LLMs have different creative biases. OpenAI's models trend toward punchy consumer brands and portmanteaus, Gemini toward technical and systematic foreign-root exploration, Grok toward irreverent options. A second model breaks the convergence habits of the first, which is why this round is worth the detour even after three isolated generation teams: the teams had different stances but the same model.

**Timing:** In Explorer Mode, offer cross-pollination *during* 2a generation, so the Codex round or the user's paste-in runs while you generate your own candidates, then merge before presenting. In Focused Mode, offer after the first round of user reactions. Cross-pollination is also valuable during 2c (riffing) and 4b (pool recovery); offer it at any point where fresh perspectives would help.

**For consumer/lifestyle/fashion/food briefs, strongly recommend cross-pollination.** Consumer naming rewards lateral creativity, sensory vocabulary, and cultural reference that different models approach from genuinely different angles. Frame it as a near-default: "For consumer brands, I'd strongly recommend a round from another model. It has been the highest-yield stage in live sessions."

### Building the cross-pollination prompt

The same prompt serves both routes below, so build it once and save it to `brand-namer-output/cross-pollination-prompt.md`. It is **self-contained**: the other model sees nothing else. Include:

1. The full brand brief from Loop 1
2. A condensed naming taxonomy: the 11 category names with 1-line descriptions plus the key generation rules (anti-patterns, at least 6 categories, don't self-censor). See "Cross-pollination prompt budget" in SKILL.md for length.
3. Instructions to generate **50+ names across at least 6 categories**, returned as a markdown table with columns `Name | Category | One-line rationale` and no preamble, so the merge step can parse it
4. The anti-convergence instructions: explore widely, don't self-censor, include weird and risky options
5. **The list of candidates already generated**, with the instruction: "Here are the [N] names already generated. Do not repeat these. Focus on categories, directions, and domains not already explored."

Format the prompt so it works as a direct paste, with no setup or preamble needed from the user.

### Route 1: run it through the Codex CLI

When the `codex` command is installed (check with `command -v codex`), run the prompt yourself and merge the results, so the user never copies and pastes. This is true cross-model ideation: Codex runs OpenAI's models with the user's own Codex configuration deciding model and reasoning effort.

```bash
bash <skill directory>/scripts/cross-pollinate.sh brand-namer-output/cross-pollination-prompt.md > brand-namer-output/codex-round-1.md
```

`<skill directory>` is the base directory reported when this skill loaded. The script runs `codex exec` in a read-only sandbox with no persisted session, works outside a Git repository, sends Codex's own transcript to stderr, and prints only the model's final answer on stdout. A 50-name round at high reasoning effort takes one to two minutes. Pass `-m <model>` only if the user asks for a specific model; otherwise their config decides.

Before the first run in a session, say what it costs and ask: "I can run this prompt through Codex (your OpenAI account) and merge the results myself. It will use one Codex turn, roughly the cost of a long chat reply. Go ahead?" After a yes, later rounds in the same session proceed without asking.

If the script exits non-zero, read its stderr. Exit 3 means Codex is not installed, so fall through to Route 2. Any other failure is usually a sign-in problem; tell the user to run `codex login` in a terminal, then offer Route 2 in the meantime rather than stalling the session.

Merge the returned table through the pipeline below with the source recorded as `codex`. Running a second Codex round with a different stance (name it as a rival would; name it as a product in a far-off category) is cheap and often worth it when the first round came back close to the existing pool.

### Route 2: hand the prompt to the user

When Codex is not installed, or when the user wants a model Codex does not reach (Gemini for systematic foreign-root exploration, Grok for irreverent candidates), present the saved prompt and say which model to paste it into and why. The user returns with results and you merge them with [M].

### Route 3: a fresh Claude context

If nothing reaches another model, offer to run the same prompt in a subagent (the Agent tool, `effort: "high"`), with the stance changed to something the main session has not taken: name it as a rival would, or as if it were a product in a far-off category. A fresh context with a different stance breaks some of the session's accumulated habits, though not the model's own biases, so say plainly that this is weaker than a different model and worth doing only if the pool looks homogeneous. Merge through the pipeline below with the source recorded as `claude-fresh-context`.

A note on evidence: the claim that cross-model rounds are the highest-yield stage for consumer briefs comes from one early live session, and no automated eval has exercised this step, because a simulated user declines to spend the user's credit with another provider. Treat the recommendation as experience, not measurement, and tell the user that when they ask.

### When to offer cross-pollination

Include cross-pollination as an option at these checkpoints:
- After the first gallery round (2a): "Want a round from another model before expanding?"
- At the Loop 2 to 3 checkpoint, listed as an option
- During pool recovery (4b): "Your pool is thin. A round from another model often produces the strongest recovery candidates."
- Whenever the hard gate checks reveal structural homogeneity: "Your pool is 90% found words. Another model might generate more coined/compound names."

### Merging results

Whether the table came back from Codex or was pasted in by the user, process it the same way:

1. **Normalize:** One name per line; strip numbering, bullets, and rationale text
2. **Deduplicate:** Check against existing `01-candidates.md`. Flag exact matches as cross-model validation (a name generated independently by two models is a strong signal). Flag near-matches (e.g., "SiftWorks" vs "Sift Works") and let the user choose which form to keep.
3. **Chunk:** Split into blocks of 25 names max for presentation
4. **Classify:** Record the source (`codex`, `gemini`, `grok`, `chatgpt`, `claude-fresh-context`) and any category or territory labels from the original output
5. **Present:** Show each chunk in the standard numbered-batch format for user reaction
6. **Save:** Append all new unique candidates to `01-candidates.md` with source noted, and add the source to `cross_model_sources` in the frontmatter

For paste-ins, ask which model generated the results so the source is right. Present all new unique candidates in the same format used for your own candidates; the user should see exactly what the other model contributed.

### Mandatory offer, optional execution

Offer cross-pollination at least once in every deep session, either after the first gallery round or at the Loop 2 to 3 checkpoint. The user can decline ("no, let's keep going") and that is fine, but they should always know the option exists. Don't skip the offer silently.

---

## Menu

**[K]** Run through Codex — I build the prompt, run it through the Codex CLI on your OpenAI account, and merge the results
**[P]** Generate prompt — a ready-to-paste prompt for Gemini, Grok, ChatGPT, or another LLM
**[M]** Merge results — I have paste-in results from another model
**[C]** Continue — proceed to Creative Riffing (Step 6 of 13)

**My recommendation:** [If `codex` is installed: recommend [K], for consumer briefs as a near-default and for other briefs as the cheapest way to get a second model's biases into the pool. If it is not installed: for consumer briefs recommend [P] with a named model; for other briefs, "[P] if you have another LLM to hand, otherwise [C] to continue to riffing."]

Wait for the user's selection before proceeding.

IF user provides non-menu input: Respond, then bring them back to this menu (see workflow.md).
IF [K]: Build and save the prompt, confirm the spend if this is the first Codex run of the session, run `scripts/cross-pollinate.sh`, merge the returned table with source `codex`, then re-display this menu (a second round with a different stance, or [C]).
IF [P]: Build and save the prompt, present it to the user for copying with the recommended model, then re-display this menu (user will return with paste-in results or choose [C]).
IF [M]: Process the paste-in results using the merge pipeline above, then re-display this menu.
IF [C]: Save to `brand-namer-output/01-candidates.md`, update frontmatter `stepsCompleted: [..., "02b"]`, then read fully and follow: `./step-02c-riffing.md`
