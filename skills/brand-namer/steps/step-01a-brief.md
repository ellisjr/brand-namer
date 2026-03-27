# Step 01a: Brand Brief Intake

**Progress:** Step 2 of 13 — Next: Territories & Whitespace (step-01b)
**Reads:** conversation context, uploaded docs | **Writes:** `brand-namer-output/00-brief.md`

## MANDATORY EXECUTION RULES (READ FIRST)

- Read this COMPLETE file before taking any action
- FORBIDDEN to load next step until user selects [C] Continue
- FORBIDDEN to generate any name candidates during this step — this is intake only
- FORBIDDEN to skip the naming target confirmation ("Just to confirm — we're naming [X], correct?")
- Update artifact frontmatter `stepsCompleted` before loading next step
- After handling non-menu user input, ALWAYS re-display the current menu

## SUCCESS METRICS

- Naming target explicitly confirmed with the user ("We're naming [the platform / the feature / the company]")
- Primary audience is clear and captured
- Brand personality / emotional direction captured (even if provisional)
- Seed words gathered (or user declined)
- Save-as-you-go preference established

## FAILURE MODES

- CRITICAL: Generating names before the brief is complete
- CRITICAL: Not confirming the naming target — ambiguity about WHAT is being named derails everything downstream
- CRITICAL: Not asking about additional inputs — users often have materials that dramatically improve naming quality but don't think to share them unprompted

---

## Execution

Before generating anything, understand what you're naming. Start by working with what you already know.

### Use existing context first

Review the current conversation, any uploaded documents (pitch decks, business plans, PRDs, competitive analyses), and any available context about the user's work. Extract whatever you can about what they're building, who it's for, their industry, competitive landscape, and brand sensibility. Summarize what you've gathered and present it back to the user:

> "Based on what I know, here's what I'm working with — what would you add or correct?"

### Then fill the gaps

Ask about anything not already covered (adapt tone to context — don't interrogate, have a conversation):

**Required (if not already clear from context):**
- What are you naming? (Company, product, feature, fund, sub-brand, app, service, project, etc.)
- What does it do? (One sentence.)
- Who is it for? (Primary audience.)

### Naming architecture

*Critical for sub-brands and products within existing companies.*

If the user is naming something within an existing brand portfolio, ask:

> "Is this a **standalone brand** (like P&G's Tide — its own identity), a **sub-brand** (like Courtyard by Marriott — endorsed by the parent), or a **branded extension** (like FedEx Ground — the parent IS the brand)?"

This fundamentally changes generation: a standalone brand needs maximum distinctiveness; a branded extension needs to harmonize with the master brand's naming patterns. Capture the architecture type in `00-brief.md` frontmatter.

### The name's #1 job (Jobs-to-be-Done framing)

Ask:

> "What's the single most important job this name needs to do?"

A name has many jobs — signal category, convey personality, be memorable, be findable, be speakable, age well — but different contexts prioritize differently. A B2B enterprise name's #1 job might be "signal credibility." A consumer app's #1 job might be "be shareable." A developer tool's #1 job might be "be Googleable." Knowing the priority job sharpens generation and evaluation. Capture in `00-brief.md`.

### Valuable but optional — ask if not volunteered

- What personality should the name convey? (e.g., trustworthy, playful, premium, rebellious, clinical, warm). If helpful, reference the brand archetypes or feeling spectrum from `references/brand-psychology.md` to help the user articulate their target emotional territory — e.g., "Where on the spectrum from Authority to Approachability should this name land?"
- Any names you already like (from any industry)? This reveals taste more than anything else. This also serves as a **prototype target** (see `references/brand-psychology.md`) — the name the user admires becomes a concrete benchmark for the energy, length, and feel to aim at.
- Any names or styles you hate? Equally useful.
- Constraints: must include a specific word? Must be under N characters? Must work in a specific language?
- Competitive context: who are the main competitors and what are they called? (This helps you avoid sounding like them.)

### Seed words and personal resonance

Ask the user:

> "Are there any words — nouns, verbs, adjectives — that resonate with you in the context of this project? They don't have to be name candidates. Maybe a word that captures the feeling you're going for, something from your personal history that connects to why you're building this, a concept from another field that inspires you, or even a word you just like the sound of."

This question serves two purposes: it gives you raw material to weave into generation (directly as candidates, as roots for coined words, as metaphorical seeds), AND it reveals the user's aesthetic instincts in a way that direct questions about "brand personality" often don't. Someone who says "ember" tells you more about their taste than someone who says "warm and energetic."

### Structured facilitation for latent preferences (optional, for deep sessions)

If the user struggles with seed words or gives only generic personality descriptors, offer a brief facilitation exercise to draw out latent preferences. The goal is to pull ideas OUT of the user, not generate FOR them:

- **Rapid association:** "I'll say a word, you say the first thing that comes to mind. Don't filter." Then cycle through 5-6 words related to their domain. Their unfiltered responses reveal aesthetic instincts.
- **Rejection test:** Show 5-6 deliberately diverse name examples from other industries (mix of styles — one punchy, one classical, one playful, one technical, one abstract). Ask: "Which of these do you instinctively like? Which make you cringe?" Their reactions calibrate your generation far more precisely than stated preferences.
- **Analogical prompt:** "If your product were a place, what place would it be? If it were a material, what material? If it were a sound?" These sensory analogies bypass the user's rational filters and access their actual aesthetic vision.

Use the outputs to adjust generation parameters (target personality, phonetic texture, naming categories to emphasize).

Use these seed words as starting points in Loop 2, but don't over-index on them. The skill should ideate heavily beyond the user's initial ideas — the seeds are launch pads, not fences. Generate plenty of candidates that have nothing to do with the seeds. Sometimes the best name comes from a direction the user never considered.

### Ask about additional inputs

Before proceeding, ask:

> "Is there anything else that would help ground this — a pitch deck, a brand mood board, competitor websites, a description of your target customer, or anything else you'd like me to consider?"

Users often have materials that dramatically improve naming quality but don't think to share them unprompted.

### Confirm the naming target

Before moving on, explicitly confirm:

> "Just to confirm — we're naming **[the platform / the feature / the company / etc.]**, correct?"

This prevents downstream confusion. If the user is naming multiple things (e.g., a company AND a product), clarify which one this session is focused on, or whether they want names that work for both.

### Save-as-you-go preference

Ask the user:

> "Would you like me to save structured artifacts as we go? This protects against context loss in long sessions, lets you resume across sessions, and gives you a full decision trail. I'd recommend it."

If the user says yes (or doesn't object), maintain the artifact chain throughout the pipeline. Create the `brand-namer-output/` directory at the start.

If the user prefers just the final answer with no intermediate artifacts, skip saves and only produce `04-final.md` at the end.

---

## Menu

**[E]** Elicit more — apply deepening techniques to draw out preferences (rapid association, rejection test, analogical prompts)
**[C]** Continue — save brief and proceed to Territories & Whitespace (Step 3 of 13)

**My recommendation:** If you've shared a detailed brief or we've had a thorough conversation, [C] is the right move — we have enough to define strong territories. If your answers felt generic or you're unsure what you want the name to "feel like," [E] will sharpen the brief significantly.

**HALT — wait for user selection before proceeding.**

IF user provides non-menu input: Respond helpfully, then re-display this menu.
IF [E]: Run the structured facilitation techniques (rapid association, rejection test, analogical prompt) from the "Structured facilitation for latent preferences" section above. After gathering responses, update the brief summary and re-display this menu.
IF [C]: Save to `brand-namer-output/00-brief.md` with YAML frontmatter (project, namingTarget, audience, personality, seedWords, namingArchitecture, numberOneJob, sessionType, savePreference, stepsCompleted: ["step-00", "step-01a"]), then read fully and follow: `./step-01b-territories.md`

## Master Rule

Skipping steps, optimizing sequences, auto-advancing past menus, or not following exact instructions is FORBIDDEN and constitutes SYSTEM FAILURE.
