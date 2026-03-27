# Step 02b: Cross-Pollination with Other LLMs

**Progress:** Step 5 of 13 — Next: Creative Riffing (step-02c)
**Reads:** `brand-namer-output/01-candidates.md` | **Writes:** `brand-namer-output/01-candidates.md` (append)

## MANDATORY EXECUTION RULES (READ FIRST)

- Read this COMPLETE file before taking any action
- FORBIDDEN to load next step until user selects [C] Continue
- FORBIDDEN to skip offering cross-pollination — it is a mandatory offer in every deep session
- FORBIDDEN to auto-merge paste-in results without deduplication and user review
- Update artifact frontmatter `stepsCompleted` before loading next step
- After handling non-menu user input, ALWAYS re-display the current menu

## SUCCESS METRICS

- Cross-pollination offered to the user (mandatory in every deep session)
- If user accepted: self-contained prompt generated, ready to paste into another LLM
- If user pasted results back: results deduplicated, classified, chunked, and integrated into `01-candidates.md` with source model tracked

## FAILURE MODES

- CRITICAL: Not offering cross-pollination at all during a deep session
- CRITICAL: Not deduplicating paste-in results against existing candidates
- CRITICAL: Not tracking which model generated the paste-in results (source attribution missing)

---

## Execution

Different LLMs have different creative biases. ChatGPT trends toward punchy consumer brands, Gemini toward technical/precise names, Grok toward irreverent options. Using multiple models dramatically widens the possibility space and helps break out of any single model's convergence patterns.

**Timing:** In Explorer Mode, offer cross-pollination *during* 2a generation — generate your own candidates while the user runs prompts in other models, then merge before presenting. In Focused Mode, offer after the first round of user reactions. Cross-pollination is also valuable during 2c (riffing) and 4b (pool recovery) — offer it at any point where fresh perspectives would help.

**For consumer/lifestyle/fashion/food briefs, strongly recommend cross-pollination.** Session testing shows cross-model rounds consistently produce the highest hit rate for consumer names (46% vs 8% for riffing in one tested session). Consumer naming rewards lateral creativity, sensory vocabulary, and cultural reference that different models approach from genuinely different angles. For consumer briefs, frame this as a near-default: "For consumer brands, I'd strongly recommend getting ideas from other models — it's consistently the highest-yield stage."

### Generating the cross-pollination prompt

Offer the user a ready-to-paste prompt they can run in other LLMs:

"I have a prompt you can paste into ChatGPT, Gemini, or another LLM to get additional naming candidates from a different creative perspective. Each model has different creative biases, so this often surfaces names that wouldn't emerge from a single model. Want me to generate it?"

When the user says yes, generate a **self-contained prompt** that includes:
1. The full brand brief from Loop 1
2. A condensed naming taxonomy — the 11 category names with 1-line descriptions + the key generation rules (anti-patterns, at least 6 categories, don't self-censor). See "Cross-pollination prompt budget" for length guidelines.
3. Instructions to generate **50+ names across at least 6 categories**, organized by category with brief rationale per name
4. The anti-convergence instructions: explore widely, don't self-censor, include weird/risky options
5. **A list of candidates already generated** — instruct the external model: "Here are the [N] names already generated. Do NOT repeat these. Focus on categories, directions, and domains NOT already explored."
6. A note about which models to try: **ChatGPT** for consumer-friendly creativity and portmanteaus, **Gemini (with thinking/reasoning enabled)** for systematic foreign-root and coined-word exploration, **Grok** for unconventional and irreverent candidates

Format the prompt so it works as a direct paste — no setup, no preamble needed from the user.

### When to offer cross-pollination

Include cross-pollination as an option at these checkpoints:
- After the first gallery round (2a) — "Want to get fresh perspectives from other models before expanding?"
- At the Loop 2 to 3 checkpoint — listed as an option
- During pool recovery (4b) — "Your pool is thin. Getting names from another model often produces the strongest recovery candidates."
- Whenever the hard gate checks reveal structural homogeneity — "Your pool is 90% found words. Another model might generate more coined/compound names."

### Handling paste-in results

When the user pastes results from another LLM, process them systematically:

1. **Normalize:** Standardize formatting — one name per line, remove numbering/bullets, strip rationale text
2. **Deduplicate:** Check against existing `01-candidates.md`. Flag exact matches as cross-model validation (a name generated independently by two models is a strong signal). Flag near-matches (e.g., "SiftWorks" vs "Sift Works") and let the user choose which form to keep.
3. **Chunk:** Split into blocks of 25 names max for presentation
4. **Classify:** Note the source model and any category/territory labels from the original output
5. **Present:** Show each chunk in the standard numbered-batch format for user reaction
6. **Save:** Append all new unique candidates to `01-candidates.md` with source noted

Ask which model generated the results so you can track the source. Present all NEW unique candidates in the same format used for your own candidates — the user should see exactly what the external model contributed.

### Mandatory offer, optional execution

You **must** offer to generate the cross-pollination prompt at least once during every deep session — either after the first gallery round or at the Loop 2 to 3 checkpoint. The user can decline ("no, let's keep going"), and that's fine. But they should always know the option exists. Don't skip the offer silently.

---

## Menu

**[P]** Generate prompt — create a ready-to-paste prompt for another LLM
**[M]** Merge results — I have paste-in results from another model
**[C]** Continue — proceed to Creative Riffing (Step 6 of 13)

**My recommendation:** [For consumer/lifestyle/fashion/food briefs: "I'd strongly recommend generating a cross-pollination prompt — it's consistently the highest-yield stage for consumer brands." For other briefs: "If you have access to another LLM, cross-pollination often surfaces names that wouldn't emerge from a single model. Otherwise, [C] to continue to riffing."]

**HALT — wait for user selection before proceeding.**

IF user provides non-menu input: Respond helpfully, then re-display this menu.
IF [P]: Generate the self-contained prompt, present it to the user for copying, then re-display this menu (user will return with paste-in results or choose [C]).
IF [M]: Process the paste-in results using the handling pipeline above (normalize, deduplicate, chunk, classify, present, save), then re-display this menu.
IF [C]: Save to `brand-namer-output/01-candidates.md`, update frontmatter `stepsCompleted: [..., "02b"]`, then read fully and follow: `./step-02c-riffing.md`

## Master Rule

Skipping steps, optimizing sequences, auto-advancing past menus, or not following exact instructions is FORBIDDEN and constitutes SYSTEM FAILURE.
