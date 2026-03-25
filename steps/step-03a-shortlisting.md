# Step 03a: Convergent Shortlisting

**Progress:** Step 7 of 13 — Next: Competitive Screening (step-04a)
**Reads:** `brand-namer-output/01-candidates.md` | **Writes:** `brand-namer-output/02-shortlist.md`

## MANDATORY EXECUTION RULES (READ FIRST)

- Read this COMPLETE file before taking any action
- FORBIDDEN to load next step until user selects [D] in the Phase 3 Exit Checkpoint menu AND the riffing checklist is satisfied (or explicitly waived)
- FORBIDDEN to pre-filter or eliminate candidates before the user sees them — the user decides what stays and what goes
- FORBIDDEN to skip hard gate checks at either entry or exit — both checkpoint menus must be displayed with full gate status
- FORBIDDEN to silently skip the riffing checklist — it must be displayed with current status
- Read `references/naming-techniques.md` now if not already loaded
- Update artifact frontmatter `stepsCompleted` before loading next step
- After handling non-menu user input, ALWAYS re-display the current menu

## SUCCESS METRICS

- All entry gate checks (4 checks) displayed with status before shortlisting begins
- User-directed shortlisting completed — user chose what to keep, not the AI
- Preference profile built from user's keep/cut patterns
- Definitions provided for top 5-10 picks (especially obscure words, foreign roots, non-obvious secondary meanings)
- All exit gate checks (3 checks) displayed with status before proceeding to validation
- Riffing checklist satisfied or explicitly waived by user
- 15+ names entering validation

## FAILURE MODES

- CRITICAL: Not running the 4 hard gate checks at entry — user enters shortlisting without knowing pool quality
- CRITICAL: Pre-filtering candidates before the user sees them — AI substituting its judgment for the user's
- CRITICAL: Not building a preference profile from the user's reactions
- CRITICAL: Not running the riffing checklist at exit — found words enter validation without compound/coined alternatives
- CRITICAL: Entering validation with <15 names without explicit user waiver
- CRITICAL: Auto-advancing past either checkpoint menu

---

## Phase 1: Entry Checkpoint (Loop 2 → Loop 3 Transition)

### Hard gate checks

Before presenting the entry menu, run ALL FOUR hard gate checks by reading `01-candidates.md` frontmatter:

1. **Candidate count gate:** If < 60 candidates (deep session) or < 40 (focused session), warn: "We have [N] candidates — below the [60/40] minimum for a strong shortlist." Recommend (a) or (b) before (e).
2. **Category coverage gate:** Display the coverage table. If < 6 categories attempted, recommend trying missing categories.
3. **Structural diversity gate:** If > 80% of candidates are one type (found words, compounds, or coined), flag it and recommend generating alternatives.
4. **Technique coverage gate:** Display `techniques_not_yet_used` count. If > 8 unused, list them explicitly in option (c).

### Status summary and menu

Display the full status summary, then present the menu:

"**Status:** [N] unique candidates across [M] categories.
**Category coverage:** [N] of 11 attempted. Not yet tried: [list].
**Structural mix:** [N]% found words, [N]% compounds, [N]% coined/other.
**Techniques used:** [list]. **Not yet used:** [list with count].

**What would you like to do?**
- **(a) Generate more** — fresh round in specific directions, or try a category we haven't used
- **(b) Cross-pollinate** — I'll generate a prompt you can paste into ChatGPT/Gemini/Grok for fresh perspectives
- **(c) Apply riffing techniques** — [list SPECIFIC unused techniques: SCAMPER, synonym explosion, affix exploration, respelling, industry-native compound patterns, language shift, compound creation, classical stems, conceptual blending — only list ones not yet applied]
- **(d) Apply deepening techniques** — [list: Inversion, Constraint Removal, Six Hats, First Principles, TRIZ, Analogical Reasoning, Three-Team Method]
- **(e) Move to shortlisting** — review all candidates, pick favorites for validation
- **(f) Something else** — tell me what you need

**My recommendation:** [Always include a specific recommendation with rationale. If any hard gate is failing, recommend addressing it before (e). E.g., "I'd hold off on shortlisting — your pool is 85% found words with only 3 categories attempted. I recommend (a) to try Coined/Invented and Sound-Symbolic categories, then (c) to apply SCAMPER and language shift. That should give us structural diversity before the validation bloodbath."]"

**HALT — wait for user selection before proceeding.**

IF user provides non-menu input: Respond helpfully, then re-display this menu.
IF (a): Route back to step-02a for a fresh generation round in user-specified directions, then return to this checkpoint.
IF (b): Generate a cross-pollination prompt for the user to paste into another LLM, then re-display this menu after they return with results.
IF (c): Route back to step-02c to apply the specified riffing techniques, then return to this checkpoint.
IF (d): Route back to step-02c to apply the specified deepening techniques, then return to this checkpoint.
IF (e): Proceed to Phase 2 (Shortlisting Process) below.
IF (f): Address the user's request, then re-display this menu.

---

## Phase 2: Shortlisting Process

### User-directed shortlisting

The user decides how many rounds of ideation they want. Your role:

- When the user reacts to names ("I like these, not those"), generate more in the directions they prefer
- When they say "these feel too corporate," pivot toward warmer/friendlier categories
- When they narrow to a set of favorites, confirm: "Ready to move into validation, or want another round?"
- Respect the user's timeline. If they want to go fast, move to validation with a larger shortlist. If they want to explore, keep generating.

### Definitions check during shortlisting

For the user's **top 5-10 picks** — especially obscure words, foreign-roots, or words with non-obvious secondary meanings — include the dictionary definition and etymology. Don't auto-define common words the user obviously knows (Gauge, Relay, Grade). Focus definitions where they add genuine value: revealing etymology that enriches the brand story, surfacing secondary meanings the user might not know, or confirming a foreign word means what they think it means. This serves as a reality check — the user should know exactly what the word means before committing to it.

Format:
```
**Assay** (n./v.) — "to test the quality of a metal or ore; to evaluate or examine"
  Etymology: Old French "essai" (trial, attempt), from Latin "exagium" (weighing)
  As a brand: "Every deal undergoes the assay — a test of quality"
```

This also reveals hidden meanings, alternate definitions, and etymological connections that enrich the brand story.

### Batch elimination (for large pools)

When the candidate pool is large (30+ favorites remaining after gallery reactions), offer batch elimination as a rapid convergence technique. Present remaining candidates in numbered batches of 10 and ask the user to make quick keep/cut decisions for each batch:

"Here are candidates 1–10. Which do you want to keep?"

This approach prevents decision fatigue from seeing the full pool at once, generates clear preference signal quickly (the user's cut patterns reveal taste), and works well as a complement to the H/W/C gallery reactions from step-02a. Session testing showed this was the fastest convergence moment — the user suggested it naturally and cut from 30 to 15 in three quick passes.

After batch elimination, compile the Keeps into the working shortlist. If the pool is thin (<8), offer a second pass on the cuts to rescue any the user regrets dropping.

### Deepening techniques — present the full menu

At each transition point, present the FULL menu of available techniques and let the user choose. Don't pre-select 2-3 techniques — show everything and let the user decide what's relevant.

"Before we move into validation, here are the deepening and riffing techniques available. Choose any that interest you, or skip straight to validation:

**Riffing techniques:**
- SCAMPER (7 systematic transformations on each name)
- Synonym explosion (5-10 synonyms per root)
- Affix exploration (prefix/suffix library crossing)
- Creative respelling (Y-for-I, K-for-C, dropped vowels, etc.)
- Industry-native compound patterns (generate compound elements from the brief's vertical, then cross with roots)
- Language shift (Latin, Greek, French translations)
- Compound creation (root x 5+ second words)
- Classical stem engineering (Greek/Latin root construction)
- Conceptual blending (merge mental models, not just syllables)

**Deepening techniques:**
- SCAMPER on the brief itself
- Inversion / reverse brainstorming
- Constraint Removal (what if no constraints existed?)
- Six Thinking Hats evaluation
- Red Team vs Blue Team
- First Principles (strip category conventions)
- Analogical Reasoning (import from parallel domains)
- TRIZ contradiction resolution
- Lexicon Three-Team Method
- Pre-Mortem stress test

**Evaluation techniques:**
- Semantic Differential Scaling (score on bipolar attribute pairs)
- Morphological Productivity (can the name spawn verbs/derivatives?)
- Brand Architecture test (can the name extend to product lines?)
- Speech & Channel Robustness (voicemail/podcast/voice assistant test)

Which would you like to try?"

If the user asks about any technique, explain it briefly. The full library is in `references/elicitation-techniques.md`, `references/naming-techniques.md`, and `references/consumer-naming.md` or `references/enterprise-naming.md` (depending on brief type).

### Multi-perspective evaluation

For high-stakes naming decisions, consider evaluating the shortlist from multiple distinct perspectives simultaneously — not just sequentially through techniques. Frame it as: "Let me look at your top candidates through three lenses at once: the strategist (does this name position you correctly?), the creative (does this name have narrative energy?), and the analyst (does this name have practical risks?)." This cross-pollination often surfaces insights that no single technique catches alone.

### Transition trigger

The user has a shortlist of ~5-20 names they want validated. Confirm the list before proceeding. Write the shortlist to `brand-namer-output/02-shortlist.md` with YAML frontmatter capturing:
- The shortlisted names
- The user's preference profile (patterns from their keep/cut decisions)
- Which techniques have been applied
- Session metadata

Then proceed to Phase 3.

---

## Phase 3: Exit Checkpoint (Loop 3 → Loop 4 Transition)

### Hard gate checks

Before presenting the exit menu, run ALL THREE hard gate checks:

1. **Shortlist size gate:** If fewer than **15 names** are entering validation, warn: "Your shortlist has [N] names. With an 80-90% kill rate for found words, you'll likely end up with [1-3] survivors. I recommend expanding to 15-20 before validating." Recommend (a), (b), or (e).
2. **Structural diversity gate:** If the shortlist is >80% found words (or any single type), flag it: "Your shortlist is [N]% found words. Generating compound/coined alternatives now is critical insurance." Recommend (b).
3. **Riffing checklist gate:** Check whether the mandatory riffing checklist (below) has been satisfied. If not, recommend (c) before (d).

### Status summary and menu

Display the full status summary, then present the menu:

"**Shortlist:** [N] names selected. **Structural mix:** [N]% found words, [N]% compounds, [N]% coined/other.
**Riffing status:** [list which techniques have been applied and which haven't].

**What would you like to do?**
- **(a) Apply more riffing techniques** to the shortlist — [list SPECIFIC unapplied techniques]
- **(b) Generate compound/coined alternatives** for each found word on the shortlist (ownability insurance)
- **(c) Run the mandatory riffing checklist** to ensure coverage, then proceed to validation
- **(d) Skip straight to validation** — take the shortlist as-is into competitive screening
- **(e) Go back** — generate more candidates first

**My recommendation:** [Always include a specific recommendation. If any gate is failing, STRONGLY recommend addressing it. Never recommend (d) when the shortlist is <15 names or >80% found words — those conditions guarantee a thin, disappointing final pool.]"

**HALT — wait for user selection before proceeding.**

IF user provides non-menu input: Respond helpfully, then re-display this menu.
IF (a): Apply the specified riffing techniques to the shortlist names, update `02-shortlist.md`, then re-display this exit checkpoint menu with updated gate status.
IF (b): For each found word on the shortlist, generate 3-5 compound/coined alternatives. Add them to `02-shortlist.md`. Then re-display this exit checkpoint menu with updated gate status.
IF (c): Display the riffing checklist (below) with current status and work through uncompleted items. Then re-display this exit checkpoint menu with updated gate status.
IF (d): Only proceed if the riffing checklist is satisfied OR the user has explicitly waived it. If not satisfied, display the checklist status and ask: "The riffing checklist has gaps. Proceed anyway? (This will likely result in a thin final pool.)" If the user confirms, proceed. Route to: `./step-04a-competitive-screening.md`
IF (e): Route back to step-02a for additional generation, then return to the Phase 1 entry checkpoint of this file.

### Riffing checklist (before entering Loop 4) — BLOCKING

**In deep sessions (default):** This checklist is **blocking** — you must either complete it or get explicit user waiver before entering validation. Display it as a visible checklist with the status of each item. Do not silently skip it.

**In quick sessions:** This checklist is skippable — but warn the user once: "Found words have an 80-90% validation kill rate without compound alternatives. Want to riff first, or go straight to validation?" Then respect their choice.

**Core checklist (mandatory in deep sessions — apply to each direction):**

Before running, check the `techniques_used` array in `01-candidates.md` frontmatter. Display the checklist with current status:

```
Riffing checklist status:
- [x] SCAMPER — applied during 2c
- [ ] Compound creation — NOT YET DONE
- [ ] Creative respelling — NOT YET DONE
- [x] Tech branding patterns — applied during 2c

2 of 4 core techniques applied. Recommend completing before validation.
Proceed anyway? (This will likely result in a thin final pool.)
```

If ALL core techniques for the relevant brief type have been applied, note: "Riffing checklist: all core techniques applied. Proceeding to validation." If gaps remain, **surface the gaps explicitly and recommend completing them.** Only proceed without completing if the user explicitly says to skip.

**For B2B/enterprise/tech briefs — core checklist:**
- [ ] **SCAMPER** — Substitute, Combine, Adapt, Modify, Eliminate, Reverse. Apply the full framework systematically to your top 3-5 shortlisted names — don't skip this even when the technique count is already high. SCAMPER catches transformations that other riffing techniques miss because it forces you through all 7 operations rather than letting you gravitate toward your preferred 2-3.
- [ ] **Compound creation** — each root combined with at least 5 different second words
- [ ] **Creative respelling** — Y-for-I, K-for-C, dropped vowels tested on each root
- [ ] **Industry-native compound patterns** — generate 8-12 compound elements (suffixes, prefixes, structural patterns) native to the brief's specific industry, then systematically cross each shortlisted root with them. For tech/SaaS this might be -works, -craft, -OS, -ware, -kit, -base. For finance it might be Capital, Partners, Group, Advisors. For healthcare it might be Health, Therapeutics, Sciences, Bio. For legal it might be Counsel-adjacent governance vocabulary. The point is NOT to apply a fixed list — it's to identify what compound structures are credible and natural in this specific vertical, then systematically test your roots against them. See `references/naming-techniques.md` for tech/SaaS examples and the dynamic generation process in SKILL.md step-02a. Adapt or skip if the user has explicitly rejected compound patterns for their brief — note the adaptation in the checklist status.

The B2B goal: for every found word on the shortlist, you should have 3-5 compound/coined alternatives ready. When the found word dies in validation (and it probably will), the alternatives are already in the pipeline.

**For consumer/fashion/lifestyle briefs — core checklist:**
Session testing shows the B2B riffing toolkit (compounds, affixes, tech patterns) produces the wrong kind of names for consumer brands and has very low hit rates (~8%). Replace with consumer-appropriate techniques:
- [ ] **Adjacent metaphor** — each shortlisted direction explored via neighboring metaphorical domains (e.g., "collector" -> which animals collect? which natural processes gather?)
- [ ] **Sensory expansion** — Five Senses Scan applied to shortlisted directions not yet explored sensorially
- [ ] **Nature mining** — creatures, plants, natural phenomena, geological features explored for each direction
- [ ] **French naturalized vocabulary** — naturalized French words tested across shortlisted directions (see `references/consumer-naming.md`)
- [ ] **Shelf / Gift / Social-native tests** — run on all shortlisted names: Shelf Test (visualize between competitors on a physical shelf), Gift Test (would someone feel proud giving this?), Social-Native Test (hashtag clean? handle available? caption-ready? verbal sharing test?). These are evaluation tests, not generation techniques — but they must be completed before entering validation because they frequently kill names that look good on paper. If the brief mentions retail placement, DTC, or social media, these tests are non-negotiable.

The consumer goal: for every shortlisted direction, you should have 3-5 alternatives from adjacent metaphorical or sensory territory. Consumer names survive validation through distinctiveness and cultural resonance, not through compound construction.

**Extended checklist (offer to the user — "Want me to go deeper with additional techniques?"):**
- [ ] **Synonym explosion** — 5-10 synonyms tested for each key root
- [ ] **Systematic affix exploration** — each root run through the full prefix AND suffix library (B2B only)
- [ ] **Language shift** — core concept translated into Latin, Greek, French at minimum
- [ ] **Cross-model ideation** — if not already done, get names from other LLMs (especially productive for consumer briefs)

### Cycle-back

If the user wants more candidates after reviewing the shortlist, loop back to step-02a. Generate in the directions they've indicated preference for, then return to the Phase 1 entry checkpoint of this file.

---

## Menu

This step has THREE menus (Phase 1 Entry Checkpoint, Phase 2 Technique Menu, and Phase 3 Exit Checkpoint). Each is defined inline above within its respective phase. The controlling menu for step advancement is the Phase 3 Exit Checkpoint — only option (d) from that menu, after the riffing checklist is satisfied or waived, routes to the next step.

**HALT — wait for user selection before proceeding at each menu.**

IF user provides non-menu input: Respond helpfully, then re-display the current phase's menu.
IF Phase 3 option (d) with riffing checklist satisfied or waived: Update `02-shortlist.md` frontmatter `stepsCompleted`, then read fully and follow: `./step-04a-competitive-screening.md`

## Master Rule

Skipping steps, optimizing sequences, auto-advancing past menus, or not following exact instructions is FORBIDDEN and constitutes SYSTEM FAILURE.
