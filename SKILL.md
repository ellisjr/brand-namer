---
name: brand-namer
description: Generate creative, distinctive brand names for companies, products, features, funds, or any entity that needs a name. Use this skill whenever the user mentions naming, brand names, company names, product names, brainstorming names, finding a name for something, name ideation, or wants help choosing what to call something — even if they just say "I need a name for my startup" or "what should I call this." Covers the full naming pipeline from creative ideation through domain availability, trademark screening, and final shortlist presentation. Also use when users reference naming strategies, naming conventions for brands, or want to rename something.
---

# Brand Namer

A structured naming methodology that moves from creative divergence through validation to a usable shortlist. The skill is designed to defeat the "LLM averaging" problem — where AI defaults to safe, generic, indistinguishable names — by enforcing broad exploration before any convergence.

## Philosophy

Professional naming agencies charge $15,000–$75,000+ for brand naming engagements. Their core methodology isn't a secret — it's disciplined divergent thinking followed by rigorous validation. This skill encodes that methodology:

1. **Diverge before you converge.** Generate across many naming categories before filtering. The best names often come from unexpected categories.
2. **The user drives convergence.** Present organized options and let the user's taste guide which directions to explore further. Don't pre-filter based on your own preferences.
3. **Validate what survives — and riff on what doesn't.** A beautiful name is worthless if the domain is taken, the trademark is filed, or it means something vulgar in Mandarin. But a taken name that the user loves is a powerful creative signal. Validate to sort, not to discard — names that fail validation become seeds for riffing and deepening in the next pass.
4. **Ask before you advance.** At each major transition, check in with the user before moving to the next stage. Don't barrel through the pipeline — naming is a creative partnership. At transition points, briefly explain what the next step does and ask if they're ready, want to repeat the current step, or want to try an elicitation technique to go deeper first.
5. **Flag conflicts inline.** For every name you generate, immediately check your training data for known companies, products, or brands with the same or very similar name. If you know of a conflict, flag it inline with ⚠️ and a brief note (e.g., "⚠️ Meridian AI — VC CRM"). Flagged names should be deprioritized in presentation but NOT removed — the user decides whether to pursue them. This prevents the heartbreak of falling in love with a name only to discover it's taken during validation. Do this during generation, riffing, AND variation stages — not as a separate step.

## Reference Files — When to Read Them

This skill has three reference files in `references/`. **Do not read them all upfront** — load each one when its stage calls for it:

| File | Read it when... | Used in |
|---|---|---|
| `references/naming-taxonomies.md` | You're about to generate names (2a) | 2a (categories, phonesthetics, anti-patterns), 2c (systematic riffing, riff axes) |
| `references/brand-psychology.md` | You're building the brand brief (1a-1b) or evaluating candidates (2c, 3a) | 1a-1b (archetypes, feeling spectrum, territories), 2a (phonetic recipes), 2c/3a (open/closed door, story types, failure patterns) |
| `references/elicitation-techniques.md` | The user wants to deepen, the session is stuck, or you're stress-testing finalists | 2a (if convergent), 3a (deepening), 2c (SCAMPER on riffs), 4b (pool recovery), 4e (Pre-Mortem) |

Each file has a table of contents. Read the whole file the first time you need it in a session — the content is designed to inform generation and evaluation throughout, not just at the specific trigger point.

---

## Loop 1: Frame

### 1a. Brand Brief Intake

Before generating anything, understand what you're naming. Start by working with what you already know.

#### Use existing context first
Review the current conversation, any uploaded documents (pitch decks, business plans, PRDs, competitive analyses), and any available context about the user's work. Extract whatever you can about what they're building, who it's for, their industry, competitive landscape, and brand sensibility. Summarize what you've gathered and present it back to the user: "Based on what I know, here's what I'm working with — what would you add or correct?"

#### Then fill the gaps
Ask about anything not already covered (adapt tone to context — don't interrogate, have a conversation):

**Required (if not already clear from context):**
- What are you naming? (Company, product, feature, fund, sub-brand, app, service, project, etc.)
- What does it do? (One sentence.)
- Who is it for? (Primary audience.)

**Naming architecture (critical for sub-brands and products within existing companies):**
If the user is naming something within an existing brand portfolio, ask: "Is this a standalone brand (like P&G's Tide — its own identity), a sub-brand (like Courtyard by Marriott — endorsed by the parent), or a branded extension (like FedEx Ground — the parent IS the brand)?" This fundamentally changes generation: a standalone brand needs maximum distinctiveness; a branded extension needs to harmonize with the master brand's naming patterns. Capture the architecture type in `00-brief.md` frontmatter.

**The name's #1 job (Jobs-to-be-Done framing):**
Ask: "What's the single most important job this name needs to do?" A name has many jobs — signal category, convey personality, be memorable, be findable, be speakable, age well — but different contexts prioritize differently. A B2B enterprise name's #1 job might be "signal credibility." A consumer app's #1 job might be "be shareable." A developer tool's #1 job might be "be Googleable." Knowing the priority job sharpens generation and evaluation. Capture in `00-brief.md`.

**Valuable but optional — ask if not volunteered:**
- What personality should the name convey? (e.g., trustworthy, playful, premium, rebellious, clinical, warm). If helpful, reference the brand archetypes or feeling spectrum from `references/brand-psychology.md` to help the user articulate their target emotional territory — e.g., "Where on the spectrum from Authority to Approachability should this name land?"
- Any names you already like (from any industry)? This reveals taste more than anything else. This also serves as a **prototype target** (see `references/brand-psychology.md`) — the name the user admires becomes a concrete benchmark for the energy, length, and feel to aim at.
- Any names or styles you hate? Equally useful.
- Constraints: must include a specific word? Must be under N characters? Must work in a specific language?
- Competitive context: who are the main competitors and what are they called? (This helps you avoid sounding like them.)

#### Seed words and personal resonance
Ask the user: "Are there any words — nouns, verbs, adjectives — that resonate with you in the context of this project? They don't have to be name candidates. Maybe a word that captures the feeling you're going for, something from your personal history that connects to why you're building this, a concept from another field that inspires you, or even a word you just like the sound of."

This question serves two purposes: it gives you raw material to weave into generation (directly as candidates, as roots for coined words, as metaphorical seeds), AND it reveals the user's aesthetic instincts in a way that direct questions about "brand personality" often don't. Someone who says "ember" tells you more about their taste than someone who says "warm and energetic."

#### Structured facilitation for latent preferences (optional, for deep sessions)
If the user struggles with seed words or gives only generic personality descriptors, offer a brief facilitation exercise to draw out latent preferences. The goal is to pull ideas OUT of the user, not generate FOR them:

- **Rapid association:** "I'll say a word, you say the first thing that comes to mind. Don't filter." Then cycle through 5-6 words related to their domain. Their unfiltered responses reveal aesthetic instincts.
- **Rejection test:** Show 5-6 deliberately diverse name examples from other industries (mix of styles — one punchy, one classical, one playful, one technical, one abstract). Ask: "Which of these do you instinctively like? Which make you cringe?" Their reactions calibrate your generation far more precisely than stated preferences.
- **Analogical prompt:** "If your product were a place, what place would it be? If it were a material, what material? If it were a sound?" These sensory analogies bypass the user's rational filters and access their actual aesthetic vision.

Use the outputs to adjust generation parameters (target personality, phonetic texture, naming categories to emphasize).

Use these seed words as starting points in Loop 2, but don't over-index on them. The skill should ideate heavily beyond the user's initial ideas — the seeds are launch pads, not fences. Generate plenty of candidates that have nothing to do with the seeds. Sometimes the best name comes from a direction the user never considered.

#### Ask about additional inputs
Before proceeding, ask: "Is there anything else that would help ground this — a pitch deck, a brand mood board, competitor websites, a description of your target customer, or anything else you'd like me to consider?" Users often have materials that dramatically improve naming quality but don't think to share them unprompted.

#### Save-as-you-go preference
Ask the user: "Would you like me to save structured artifacts as we go? This protects against context loss in long sessions, lets you resume across sessions, and gives you a full decision trail. I'd recommend it."

If the user says yes (or doesn't object), maintain the artifact chain described in the Artifacts section below. Create the output directory at the start.

### 1b. Naming Territories

Before generating names, define 3-5 naming territories — distinct creative directions that each represent a coherent brand world. This prevents generation from being "many names in the same vibe" and ensures intentional diversity.

For each territory, define:
- **Territory name** (e.g., "Calm Precision," "Maker Energy," "Institutional Trust")
- **Emotional promise** — what the user feels encountering this brand
- **Semantic field** — the word families and metaphor domains to mine
- **Phonetic profile** — sound texture that fits (reference `references/brand-psychology.md`)
- **Anti-patterns** — what this territory should NOT sound like

Example for a VC ops platform:

| Territory | Emotional Promise | Semantic Field | Phonetic Profile | Anti-patterns |
|---|---|---|---|---|
| Precision Instrument | "This tool is exact" | measurement, optics, calibration | crisp consonants, front vowels | no soft/warm sounds |
| Trusted Guide | "You're in good hands" | navigation, cartography, light | balanced, trochaic | no clinical/cold |
| Maker's Workshop | "Built by craftspeople" | forge, craft, materials | hard onsets, Anglo-Saxon roots | no corporate jargon |

Present the territories to the user for alignment before proceeding. They may adjust, merge, or add territories. Each territory becomes a generation lane in Loop 2.

Save territories in `00-brief.md` frontmatter.

### 1c. Competitive Whitespace Mapping

Before generating, map the naming landscape the brand will live in.

Using the competitors identified in the brief:
- What naming patterns dominate the category? (e.g., "every fintech is [noun]Pay")
- What phonetic shapes are overused?
- What metaphor domains are crowded?
- Where is the whitespace — naming territory no competitor occupies?

Present a brief competitive map to the user:

"Your competitors cluster around [pattern]. The whitespace is [description]. I'll weight generation toward the whitespace."

This sharpens generation and gives the user confidence that names won't accidentally sound like the competitive set.

### Session mode
Ask the user which approach they prefer:

**Explorer Mode:** Maximum ideation first. Generate across all categories, auto-riff on strongest candidates, run deepening techniques on the full pool — THEN present everything organized by category for the user to react to. Best when the user wants to see the full possibility space before making any cuts.

**Focused Mode:** Step-by-step with user input at each stage. Present one category at a time, get reactions, riff only on what the user likes, check in frequently. Best when the user wants to stay in control and iterate collaboratively.

Both modes use the same pipeline — they just differ in when the user enters the loop. The chosen mode is captured in `00-brief.md` frontmatter so it persists across sessions.

If the user gives you a sparse brief ("I need a name for my AI startup"), work with what you have but note the gaps. You can generate a first round and let their reactions fill in what the brief didn't.

---

## Loop 2: Generate

### Phonetic & linguistic quality (inline, not a separate stage)

As you generate and riff, weave these checks into your commentary — don't present them as a gate:
- **Bar Test:** Could someone say this in a noisy bar and have the listener find it?
- **Pronounceability:** Correct on first read-aloud?
- **Chunking:** 1-3 syllables strongest. Familiar phoneme patterns = single chunk.
- **Stress:** Trochaic (STRONG-weak) is most natural in English.
- **Spelling:** If heard, would they spell it right?
- **Cross-language:** Fast scan against major languages for obvious problems.

### 2a. Divergent Generation

**Reads:** `00-brief.md` | **Writes:** `01-candidates.md` (created here, grows through 2b and 2c)

This is where the magic happens — and where discipline matters most. Read `references/naming-taxonomies.md` for naming categories and `references/brand-psychology.md` for emotional frameworks. Use the brand archetype, personality dimensions, and feeling spectrum from the psychology reference to ensure names don't just sound good but *feel right* for the brand's emotional territory.

#### Running count
After each generation push (a batch of names in a category or direction), report the running total: "That's [N] candidates so far across [M] categories. Want to keep going, shift direction, or move on?"

Let the user decide when they have enough. Some sessions need 40 names, others need 150. Your job is to keep generating with breadth and quality until the user says stop — not to hit a fixed number.

**Focused Mode:** Present category-by-category as generated. Still aim for breadth — at least 50 candidates internally across all categories before the user starts cutting.

#### Rules for this stage:
- Generate across **at least 6 of the 10 naming categories** in the reference file. You may skip categories that clearly don't fit, but you must try categories that feel uncomfortable — the best names often come from unexpected places.
- Generate a **minimum of 5 names per category** you use internally. If the user asked for a curated pass, select the strongest candidates across categories for presentation, but keep the full pool available for follow-up rounds.
- **Do not self-censor.** Include names that feel weird, risky, or "too much." The user will filter. Your job is to fill the possibility space.
- **Flag conflicts inline** with ⚠️ during generation (see Philosophy principle #5). Don't wait for the competitive screen stage.
- Use the **phonesthetic framework** from the reference file to ensure variety in how names sound, not just what they mean.
- Explicitly explore the **Motion & Direction semantic field** (see `references/naming-taxonomies.md`) — names that convey movement, direction, or momentum are often overlooked but effective.
- If generation feels convergent or safe, read `references/elicitation-techniques.md` and apply **SCAMPER** to your best candidates or **Inversion** to identify what to avoid. If the session is stuck, try **Constraint Removal** to find the user's true preferences.

#### Presentation format

**Gallery Mode (default in Explorer Mode):** Before diving into categories one by one, offer a high-level gallery — the top 3-5 names from each category in a single scannable grid. This lets the user see the full breadth at a glance and identify which categories to explore further.

"Here's a quick overview across all categories. After scanning, tell me which rows pull you in and I'll expand those."

| Category | Top Candidates |
|---|---|
| Evocative | Crest, Verdant, Meridian ⚠️ |
| Found Word | Plinth, Tally, Gauge |
| Compound | Ironmark, Stonewell, Deepcraft |
| ... | ... |

Then expand the categories the user picks, showing the full numbered list with rationale. In **Focused Mode**, category-by-category remains the default.

**Category-by-category presentation:**
Present names **ONE CATEGORY AT A TIME**. For each category:
1. Show a numbered list of candidates (with inline ⚠️ flags where applicable) and a brief rationale in parentheses
2. Ask the user: which numbers do you like, dislike, or feel neutral about?
3. Move to the next category

After all categories are presented, summarize the user's favorites across categories before proceeding.

```
### Evocative
1. **Crest** (summit, achievement, the wave's peak)
2. **Verdant** (growth, flourishing, green)
3. **Meridian** ⚠️ Meridian AI — VC CRM (precision, navigation, measurement)
...

Which numbers do you like? Which feel wrong?
```

#### Category prioritization
After the user reacts to Round 1 categories, heavily weight subsequent generation toward their preferred categories. If the user liked Evocative and Found Word but disliked Acronymic and Sound-Symbolic:
- Generate 2-3x more candidates in preferred categories
- Generate riffs primarily on candidates from preferred categories
- Still include 2-3 "surprise" candidates from non-preferred categories per round (the best names sometimes come from unexpected places)

#### Institutional compound patterns (within Compound generation)
When generating compounds, also explore institutional compound patterns. For each promising root word from the user's preferred candidates, systematically generate combinations:

- **Color + Root:** Black[root], Grey[root], Red[root], Blue[root], Green[root], Silver[root]
- **Adjective + Root:** True[root], Clear[root], Deep[root], First[root], Bright[root], High[root]
- **Root + Suffix:** [root]mark, [root]point, [root]line, [root]view, [root]gate, [root]stone, [root]craft, [root]works, [root]well, [root]field
- **Direction + Root:** North[root], Cross[root], Over[root], Trans[root]
- **Material + Root:** Iron[root], Stone[root], Steel[root], Copper[root]
- **Root + Root (noun compounds):** Combine the user's favorite roots with each other

This is particularly strong for finance/VC/institutional naming where the BlackRock/Blackstone/Benchmark pattern is established and credible.

#### Morphological analysis (Zwicky) — systematic combinatorial generation
When intuitive generation plateaus, use morphological analysis to ensure coverage of the full possibility space. Define the dimensions of the naming problem, list options for each, and systematically combine across dimensions:

| Dimension | Options (example for a VC ops platform) |
|---|---|
| **Semantic field** | vision, craft, navigation, truth, signal, structure |
| **Phonetic texture** | hard/decisive, soft/warm, crisp/precise |
| **Syllable count** | 1, 2, 3 |
| **Word class** | noun, verb, adjective, coined |
| **Language origin** | English, Latin, Greek, compound |

Cross the dimensions: "2-syllable Latin-origin noun with crisp phonetics from the 'truth' semantic field" → Verity, Verax, Certus. "1-syllable English verb with hard phonetics from the 'craft' field" → Forge, Craft, Build. This ensures you don't inadvertently generate everything from the same narrow slice of the possibility space.

After presenting the initial pool, check in: "Here's the first round. Before we go further — would you like to get additional ideas from other AI models (2b), start narrowing these down, do another generation round in specific directions, or try any deepening techniques (SCAMPER, Inversion, etc.)?"

### 2b. Cross-Model Ideation (Optional but Recommended)

**Appends to:** `01-candidates.md` (merge external candidates, update frontmatter cross_model_sources)

Different LLMs have different creative biases. GPT-4o trends toward punchy consumer brands, Gemini toward technical/precise names, Grok toward irreverent options. Using multiple models dramatically widens the possibility space and helps break out of any single model's convergence patterns.

**Timing:** In Explorer Mode, offer to spawn cross-model sessions *during* 2a generation — generate your own candidates while sidecars run in parallel, then merge before presenting. In Focused Mode, offer cross-model after the first round of user reactions. Cross-model input is also valuable during 2c (riffing) and 4b (pool recovery) — offer it at any point where fresh perspectives would help.

#### If sidecar tools are available (preferred):
Check whether you have access to `sidecar:sidecar_start`. If you do, offer to spawn parallel naming sessions with other models automatically. Recommended models for creative naming work:

- **GPT-4o** (alias: `gpt`) — Strong at consumer-friendly, punchy names. Good at portmanteaus and sound-symbolic names.
- **Gemini 2.5 Pro with thinking** (alias: `gemini-pro`) — Excellent at foreign-root and invented/coined names. Thorough at systematic exploration.
- **Grok** (alias: `grok`) — Good at unconventional, irreverent, and surprising name candidates that break patterns.

For each sidecar, send a briefing that includes:
1. The brand brief from Loop 1
2. The naming categories from `references/naming-taxonomies.md` (include the full taxonomy — the sidecar doesn't have access to local files)
3. An explicit instruction to generate at least 50 candidates across multiple naming categories, organized by category with brief rationale per name
4. The anti-convergence instructions: explore widely, don't self-censor, include weird/risky options

When sidecar results come back, merge the external candidates into the master pool alongside your own 2a output. Deduplicate and note which model generated each name — this can be interesting signal for the user.

#### If sidecar is not available (manual workflow):
Offer the user a ready-to-paste prompt they can run in other LLMs. Present it as a copyable block:

"I have a prompt you can paste into ChatGPT, Gemini, or another LLM to get additional naming candidates from a different creative perspective. Each model has different creative biases, so this often surfaces names that wouldn't emerge from a single model. Want me to generate the prompt?"

When the user says yes, generate a self-contained prompt that includes:
- The full brand brief
- The naming taxonomy framework (condensed but complete — the external model doesn't have the reference file)
- Instructions to generate 50+ names across at least 6 categories, organized by category with rationale
- The anti-convergence rules
- A note to the user about which models to try: **ChatGPT (GPT-4o)** for consumer-friendly creativity, **Gemini 2.5 Pro (with thinking/reasoning enabled)** for systematic foreign-root and coined-word exploration, **Grok** for unconventional and irreverent candidates

Format the prompt so it works as a direct paste — no setup, no preamble needed from the user.

When the user pastes results back, merge them into the master pool alongside your 2a output. Ask the user to indicate which model generated the results so you can note the source.

#### Skipping this stage:
If the user wants to move fast or doesn't have access to other models, skip this stage entirely. It's additive, not required.

### 2c. Creative Riffing & Directional Expansion

**Appends to:** `01-candidates.md` (riffs become new candidates)

Before shortlisting, take each promising name direction and systematically generate variants and riffs. This is different from 4c (Variation Generation for domain workarounds) — this stage is about creative expansion while the possibility space is still wide open.

#### The riffing pipeline
For each shortlisted name or direction, follow this sequence:
1. **Define the semantic territory** — What does this name/concept mean? Map its sub-territories (e.g., "light" can mean clarity, guidance, ignition, speed, dawn, signal)
2. **Build root families** — Find English roots AND classical/cross-linguistic roots in the same meaning space
3. **Generate variants by transformation type** — Use the techniques below
4. **Tune phonetic feel** — Adjust mouthfeel to match the brand personality (see `references/brand-psychology.md`)
5. **Screen for narrative potential** — Does each riff tell a story? Is it open-door or closed-door?

Aim for **10-20+ riffs per promising direction**, not just 3-5. Professional naming teams start with thousands of candidates. Quantity protects originality.

#### Riff on taken roots — always
When a name is ⚠️ flagged or confirmed taken, mention the conflict but riff on it anyway. A taken root is a *proven* concept — the word works, it just needs a fresh form. "Meridian is taken by Meridian AI, but the root concept (precision measurement, navigation) is strong. Let me riff on it:" → Meridia, Meridex, TrueMeridian, Bearing, Azimuth, etc. The riffs may well be clear even though the root isn't. Flag inline which riffs inherit the conflict vs. which are far enough away to be independently viable.

For each shortlisted name (or each direction the user likes), generate riffs using these techniques:

#### Linguistic Riffing
- **Morpheme swap**: Replace one morpheme with a synonym or related root. "Luminary" → "Luminex," "Lumivox," "Lumicore," "Luminara"
- **Language shift**: Translate the core concept into Latin, Greek, Japanese, Finnish, etc. "Light" → "Lux," "Phos," "Hikari," "Valo"
- **Etymology mining**: Find the word's roots and build new words from sibling roots. "Navigate" → "Navan" (Lexicon's actual process for this name — from "navigate" + "avant")
- **Phonetic texture shift**: Keep the meaning but change the sound profile. Hard version vs soft version. "Crest" (hard) → "Summit" (softer) → "Pinnacle" (more formal)

#### Conceptual Riffing
- **Zoom in/out**: If the name is a broad concept, zoom into a specific instance. If it's specific, zoom out to the category. "Ocean" → "Riptide" (zoomed in) or "Horizon" (zoomed out)
- **Adjacent metaphor**: Move to a neighboring metaphorical domain. "Lighthouse" (guidance/maritime) → "Compass" (guidance/navigation) → "Meridian" (navigation/geography) → "Waypoint" (navigation/journey)
- **Sensory shift**: Move the concept to a different sense. A visual concept → what does it sound like? What does it feel like? "Bright" → "Chime" (sound of brightness) → "Spark" (kinetic brightness)

#### Structural Riffing
- **Syllable reduction**: Compress to its punchiest form. "Illuminate" → "Illumi" → "Lumi" → "Lux"
- **Compound creation**: Pair with unexpected second words. "Light" + "craft" = "Lightcraft," + "well" = "Lightwell," + "forge" = "Lightforge"
- **Blend exploration**: Find overlapping phonemes with other relevant words. "Navigate" + "avant" = "Navan." "Craft" + "after" = "Crafter."

#### Homonym, Synonym & Sound-Alike Riffing
For each component of a compound or multi-morpheme name, systematically explore:

- **Homophone substitution**: Replace a component with a word that sounds the same but means something different. "Geobit" → "Jiobit" (creative respelling of geo- using the phonetic Ji-). "Insight" → "Incite" (same sound, shifts from observation to action). "Siteline" → "Citeline" (site → cite, shifts to authority/reference).
- **Synonym explosion**: For each meaningful component, list 5-10 synonyms and test each in the compound. "Truesight" → Clearsight, Keensight, Finesight, Deepsight, Widesight, Netsight. "Lightwell" → Lightspring, Lightsource, Lightpool, Lightcourt.
- **Near-homophone creative respelling**: Find words that are *close* to the sound but not exact, creating coined names. "Clarity" → "Klariti," "Claritis." "Metric" → "Metrik," "Metrica."
- **Component decomposition**: Break any multi-syllable name into its components and riff on each independently, then recombine. "Panopticon" → Pan (all) + Optic (sight) + -on (suffix). Riff on each: Pan → Omni, Holo, Total. Optic → Sight, View, Lens, Scope. -on → -ix, -is, -um, -a. Recombine: "Omniscope," "Holoview," "Totalis."

#### Systematic Affix Exploration
Many affixes work as both prefixes AND suffixes, or have multiple viable forms. For each promising root, systematically run through the affix library in `references/naming-taxonomies.md` (see "Productive Affixes for Name Construction"):

**The process:**
1. Take the root (e.g., "signal," "craft," "true," "bit")
2. Run it through prefix position: Signal→, Craft→, True→, Bit→ (e.g., Bitwise, Bitspark, Bitcraft)
3. Run it through suffix position: →Signal, →Craft, →True, →Bit (e.g., Truebit, Clearbit, Databit)
4. Test each combination for ⚠️ conflicts, pronounceability, and emotional fit
5. The best affixes are chameleons — "bit" as prefix (Bitwise = technical precision) feels different from "bit" as suffix (Clearbit = small/focused/modular)

See the full affix reference table in `references/naming-taxonomies.md` for a comprehensive list of productive prefixes and suffixes with their semantic contributions.

#### The Lexicon Three-Team Method
Inspired by Lexicon Branding's actual process: approach the same brief from three angles simultaneously:
1. **On-brief team**: Generate names directly responding to the brand brief
2. **Competitor team**: Generate names as if you're naming a competitor (breaks assumptions about what "works" in the category)
3. **Unrelated domain team**: Generate names as if the product were in a completely different category (e.g., "if this were a bike brand, what would it be called?")

The third team often produces the most unexpected — and ultimately strongest — candidates.

#### Output format for riffs

**Numbering:** Do NOT use a separate numbering scheme (e.g., "R1, R2"). Continue the category numbering from 2a. If Evocative was items 1-14, riffs on Evocative names become 15, 16, 17, etc. within the same category.

**Presentation:** Present riff families ONE AT A TIME. For each family:
1. State which original name is the seed
2. Show the riffs as a numbered continuation
3. Include the analysis table (transformation type, feel, door type, risk)
4. Flag conflicts inline with ⚠️
5. Ask for reactions before moving to the next family

```
**Riffing on: Lighthouse (Evocative #3)**

15. **Pharos** | etymological metaphor | trusted, directional | Open/strong | may feel too classical
16. **Luma** | clipped luminous family | warm, clear | Balanced | ⚠️ Luma AI (3D capture)
17. **Beamforge** | blend (beam + forge) | builder energy | Open/balanced | may skew industrial

Which of these resonate? Any direction worth pushing further?
```

Columns: **candidate | transformation type | emotional feel | door type (open/closed/balanced) | risk flags**

This format helps the user make informed comparisons rather than just reacting to a flat list. See `references/brand-psychology.md` for the open-door/closed-door framework and story type classifications.

Ask the user: "Want me to riff further on any of these directions, or are you ready to take the full list into shortlisting?"

---

## Loop 3: Select

### 3a. Convergent Shortlisting (User-Directed)

**Reads:** `01-candidates.md` | **Writes:** `02-shortlist.md` (the clean handoff to validation)

The user decides how many rounds of ideation they want. Your role:

- When the user reacts to names ("I like these, not those"), generate more in the directions they prefer
- When they say "these feel too corporate," pivot toward warmer/friendlier categories
- When they narrow to a set of favorites, confirm: "Ready to move into validation, or want another round?"
- Respect the user's timeline. If they want to go fast, move to validation with a larger shortlist. If they want to explore, keep generating.

#### Deepening techniques (triggered, not listed)

Before moving to validation, don't present the full menu of 10 techniques. Instead, analyze the current shortlist and recommend 2-3 techniques with specific reasoning:

"Before we move into validation, I'd suggest a couple of techniques based on what I'm seeing in your shortlist:

- [Technique] — because [specific observation about the shortlist that makes this relevant]
- [Technique] — because [specific observation]

Want to try either? Or skip straight to validation."

If the user asks "what else is available?", reference the full library in `references/elicitation-techniques.md`.

#### Multi-perspective evaluation
For high-stakes naming decisions, consider evaluating the shortlist from multiple distinct perspectives simultaneously — not just sequentially through techniques. Frame it as: "Let me look at your top candidates through three lenses at once: the strategist (does this name position you correctly?), the creative (does this name have narrative energy?), and the analyst (does this name have practical risks?)." This cross-pollination often surfaces insights that no single technique catches alone.

**Transition trigger:** The user has a shortlist of ~5-20 names they want validated. Confirm the list before proceeding.

#### Cycle-back

If the user wants more candidates after reviewing the shortlist, loop back to Loop 2. Generate in the directions they've indicated preference for, then return here.

---

## Loop 4: De-risk

### 4a. Competitive Screening

**Reads:** `02-shortlist.md` | **Writes:** `03-validation.md` (created here, updated through 4e)

The inline ⚠️ flagging throughout Loop 2 has already caught conflicts visible in training data. This stage catches what training data missed — recent companies, small competitors, and names that only show up via web search.

Confirm the shortlist with the user: "Here are the [N] names we're taking into validation: [list]. The ⚠️ flags caught some obvious conflicts during generation. Now I'll do web searches to catch anything my training data missed, then check domains, generate variations where needed, screen trademarks, and check social handles. Ready to proceed?"

For each shortlisted name (focusing on those WITHOUT existing ⚠️ flags — flagged names get a lighter check), do a web search:

- Search: `"[name]"` — is there a well-known company or product with this exact name?
- Search: `"[name]" + [industry/category]` — is there a direct competitor using it?

**Categorize each name after this pass:**
- **Clear** — no obvious conflicts found
- **Flagged** — there's something out there with this name but it might not be a conflict (different industry, tiny company, defunct)
- **Taken** — there's a clear, active company/product with this name in a related space

Report results to the user. **Do NOT remove "Taken" names from the working set.** Move them to a "Taken — available for riffing & deepening" bucket. A taken name that the user loves is a powerful creative signal: it tells you exactly what emotional territory to explore. Use taken names as inputs to:
- **Riffing (2c techniques):** SCAMPER, etymological mining, adjacent metaphors, compound creation, structural shifts
- **Deepening (3a techniques):** Constraint Removal (what if the domain didn't matter — what's the *feeling* you want?), Inversion (what makes this name work — now find something available with the same properties), Six Thinking Hats (evaluate the taken name's strengths systematically, then hunt for available names that hit the same marks)
- **Variation Generation (4c):** prefix/suffix, creative respelling, compound extensions

The goal is to find an *available* name that carries the same energy. Taken names are creative assets, not dead ends.

#### Technical project screening (for dev tools, open source, skills, MCPs, plugins)
When naming a technical project, add these sources to the competitive screen:

- **GitHub:** Search `github.com/search?q=[name]&type=repositories` — look for repos with >100 stars or active development
- **npm:** Search `npmjs.com/search?q=[name]` — check for published packages with meaningful download counts
- **PyPI:** Search `pypi.org/search/?q=[name]` — check for published Python packages
- **VS Code Marketplace:** Search for extensions with the name
- **MCP server registries:** Search Smithery.ai, mcp.run, and glama.ai for registered MCP servers
- **Claude Code skills directories:** Search awesome-claude-code-skills repos and similar directories
- **Docker Hub:** Search for official or popular images with the name
- **Homebrew:** Search `brew search [name]` formulae

Categorize technical conflicts the same way (Clear / Flagged / Taken). A 50-star GitHub repo in an unrelated domain is "Flagged"; a 5,000-star repo in the same space is "Taken." Package registry names are particularly important — if `npm install [name]` already resolves to something, that's a meaningful conflict even if the package is small.

### 4b. Domain Availability + Pool Recovery

**Updates:** `03-validation.md` (add domain results)

For each surviving name, search for domain availability across key TLDs:

- `.com` (most important for most use cases)
- `.ai` (increasingly important for tech companies)
- `.co` (common alternative)
- `.io` (developer/tech standard)

Use web search to check domain registrars or WHOIS lookups. Note for each name:
- **Available:** The domain appears to be unregistered
- **Parked/For Sale:** Domain is registered but not in active use (may be purchasable)
- **Active:** Domain is in use by an existing entity

Present as a quick-reference table.

#### Validation log
Maintain a running log of which checks have been completed for each name. This prevents re-running expensive searches when names re-enter the pipeline through recovery loops or new generation rounds. Track:
- **Competitive screen:** done/not done (4a)
- **Domain check:** done/not done (4b)
- **Trademark screen:** done/not done (4d)
- **Social handle check:** done/not done (4e)

When new names enter the pipeline (from recovery riffing, new generation rounds, or variation generation), only run checks they haven't already passed. When saving stage outputs to markdown, include this log so it persists across sessions.

#### Checkpoint: generate more?
After presenting domain results, ask the user:

"We're down to [N] candidates after competitive and domain checks. Want to continue to trademark screening with these, or would you like to generate more options first? I can riff on the taken names that had strong energy, run a fresh generation round in directions you liked, or try a deepening technique to find new territory."

If the user wants more: loop back to Loop 2 (riffing on taken seeds or fresh generation), then re-validate only the NEW names (check the validation log — skip names already screened).

#### Pool recovery checkpoint
After the domain check, assess the surviving pool. If validation (4a-4b) has reduced the pool below ~5 strong candidates, or if the user's favorites were disproportionately killed, proactively offer to resurrect earlier names:

"The validation pipeline was aggressive — we're down to [N] survivors. But several names that got killed had strong energy. Want me to bring any of these back for riffing and deepening? I won't use the taken names directly, but I can use them as starting points to generate available alternatives that carry the same feeling."

Present the taken-but-loved bucket from `02-shortlist.md` frontmatter, plus any names the user starred during ideation that were cut. For each, note:
- Why it was killed (competitor, domain, trademark)
- What made it compelling (the emotional territory, the phonetic quality, the story type)

Let the user select which (if any) to bring back into the mix. Then:
1. Run a focused riffing pass (2c techniques) on the selected names → append results to `01-candidates.md`
2. Apply deepening techniques (Constraint Removal, Inversion, SCAMPER) to extract what made them work
3. **Re-validate the new candidates before they rejoin the pool:** run them through 4a (competitive screen — including technical project screening if applicable) and 4b (domain check) → update `03-validation.md`. Only candidates that pass re-enter the active pool alongside the original survivors.

This is a mini-loop, not a full pipeline restart. The riff → validate cycle can repeat if the first recovery pass doesn't yield enough viable candidates — ask the user if they want another round before moving on.

### 4c. Variation Generation + Re-screening

**Updates:** `03-validation.md` (add variations section)

For names where the exact preferred domain is unavailable but the name itself is strong:

- Try prefixes: get[name], use[name], try[name], hello[name], meet[name]
- Try suffixes: [name]hq, [name]app, [name]labs, [name]studio
- Try modifiers: [name]ai, [name]co, [name]io (as part of the name, not just TLD)
- Try creative respellings that preserve pronunciation
- Try compound extensions: [name] + a relevant word

Generate 3-5 variations per name that needs them. Preserve the phonetic and emotional qualities of the original.

For more creative variations beyond prefix/suffix patterns, apply **SCAMPER** from `references/elicitation-techniques.md` to each name — substitute syllables, combine candidates, adapt to other languages, modify spelling, eliminate to the core sound, reverse or rearrange.

#### Re-screen variations
Run the same checks from 4a-4b on the new variations:
- Quick competitive landscape search
- Domain availability check

This can be done in a lighter pass since the root names have already been screened. Focus on confirming the variation is actually clear and the domain is actually available.

### 4d. Trademark Screening

**Updates:** `03-validation.md` (add trademark risk per candidate)

For names that have survived to this point, do a deeper trademark risk assessment:

- Search: `"[name]" trademark` or `"[name]" registered trademark`
- Search: `"[name]" site:uspto.gov` (US Patent and Trademark Office)
- Search: `"[name]" site:euipo.europa.eu` (EU Intellectual Property Office) if relevant
- Check for phonetically similar registered marks (e.g., if the name is "Korvus," search for "Corvus" too)

**Categorize trademark risk:**
- **Low Risk** — no similar trademarks found in related classes
- **Medium Risk** — similar marks exist but in different industries/classes
- **High Risk** — identical or very similar marks in the same or adjacent industry

Important: This is a preliminary screen, not legal advice. Always recommend the user consult a trademark attorney before finalizing any name for registration.

#### Checkpoint: generate more?
After trademark results, if any strong candidates were killed, ask: "Trademark screening eliminated [names]. Want to continue to social handle checks with the survivors, or generate more options first?" Same loop-back options as the 4b checkpoint. Only run 4a+4b+4d on new names (check the validation log).

### 4e. Social Handles, Stress Tests & Extended Presence Check

**Updates:** `03-validation.md` (add social handle availability and stress test results)

#### Social handle check (Tier 1 names)
For names that have reached Tier 1 (Available & Clear), do a final check on social media handle availability. This applies only to the strongest candidates — don't waste time checking names that have already been flagged.

Search for handle availability on the platforms most relevant to the brand:
- **Twitter/X** — search `x.com/[name]` or `twitter.com/[name]`
- **Instagram** — search `instagram.com/[name]`
- **LinkedIn** — search for company pages with the name
- **TikTok** — if relevant to the brand's audience

Note for each: available, taken by an inactive/unrelated account, or actively in use. A name with a clean sweep across domain + social handles is significantly more valuable.

#### Checkpoint: generate more?
After social handle results, if the final pool feels thin or the user isn't excited about any survivors: "We have [N] names with clean availability across domains and social handles. Want to move to final presentation, or generate one more round?" Same loop-back options. Only run the full validation chain (4a+4b+4d+4e) on new names — check the validation log.

#### Optional: Pre-Mortem Stress Test
Before final presentation, consider running a **Pre-Mortem Analysis** (see `references/elicitation-techniques.md`) on the top 3-5 candidates. For each: imagine it's 18 months post-launch and the name has caused problems — what went wrong? This surfaces risks that optimism hides. Offer this to the user: "Want me to stress-test these finalists before presenting?"

#### Optional: System 1 / System 2 name testing (user-driven)
This exercise must be driven by the user, not the AI. LLMs can only do analytical evaluation (System 2) — they cannot simulate the pre-cognitive, millisecond-level gut reactions that determine how a name actually lands in the real world. The user's gut is the instrument here.

Offer this to the user for the top 3-5 finalists:

"Before we finalize, I'd like to run a quick two-speed test on your finalists. This is based on Daniel Kahneman's System 1/System 2 framework — most name testing only measures analytical thinking, but real-world name encounters happen in split seconds.

**Round 1 — System 1 (gut recall):** Present all finalist names together as a simple list — no rationale, no context, just the names. Then ask:
- "Which name did your eye land on first?"
- "Which one made you flinch or feel resistance?"
- "Which one are you most curious about?"
- "Which one feels forgettable?"
The user already had gut reactions when they saw the list — these questions surface those reactions before analytical thinking overwrites them.

**Round 2 — System 2 (analytical, take your time):** Now go back through the same names one at a time and evaluate them deliberately: what does this name communicate? What story does it tell? What are its strengths and weaknesses?

**Then we compare:** If a name scores well analytically but triggered a negative gut reaction, the gut usually wins in the real world — customers won't stop to analyze your name, they'll just react. If a name triggered a positive gut reaction but has analytical weaknesses, that's worth investigating — the emotional pull might outweigh the logical objections. The strongest finalists are names where both systems agree."

Record the results in `03-validation.md`. Divergence between System 1 and System 2 scores is a meaningful signal — flag it in the final presentation.

#### Extended presence check (offer on final 1-3 only)
For the top 1-3 finalists, offer to check broader digital presence:
- **App stores:** Apple App Store, Google Play — is the name taken by an existing app?
- **Search results:** Google "[name]" — how crowded are the results? Would this brand struggle to rank?
- **Business registries:** Is there an LLC or corporation with this name in the user's target state/country?

"Want me to do a deeper digital presence check on your top picks before we finalize?"

### 4f. Final Presentation

**Reads:** `03-validation.md` | **Writes:** `04-final.md`

Present the surviving names in a categorized shortlist. The exact format should adapt to what the user has asked for (casual list, formal document, table, etc.), but always include these elements:

#### Tier 1: Available & Clear
Names where: the name itself appears unused in the relevant space, at least one good domain is available, trademark risk is low, and key social handles are available or obtainable.

For each name:
- The name
- Naming category it came from
- 2-3 sentence rationale (why this name works for this brand)
- Available domain(s)
- Social handle availability (which platforms are clear)
- Any notes or caveats

#### Tier 2: Available with Caveats
Names where: the core concept is strong but there are minor issues — e.g., .com is taken but .ai is available, or there's a small company with the name in a different industry.

#### Tier 3: Strong but Likely Unavailable
Names the user loved during ideation that didn't survive validation. Include them as reference points — they reveal what the user is drawn to and can seed further exploration if needed.

#### Closing Recommendations
- Top 3 recommendation with brief justification
- Suggested next steps (trademark attorney consultation, domain registration, social handle reservation)
- Offer to do another round if the user wants to explore further

#### Cycle-back

If the De-risk loop has reduced the pool below ~5 strong candidates, or the user isn't excited about survivors, cycle back to Loop 2 with dead names as seeds. See pool recovery in 4b.

---

## Artifact Chain

The pipeline produces **5 structured artifacts**, each with YAML frontmatter that carries the state needed by downstream stages. These are handoff documents, not session logs — each one is self-contained enough that the skill can resume from it if context resets.

```
brand-namer-output/
├── 00-brief.md          # Brand brief + session config + territories + whitespace
├── 01-candidates.md     # ALL candidates (generation + cross-model + riffs) — grows over time
├── 02-shortlist.md      # Consolidated favorites entering validation + preference profile
├── 03-validation.md     # Competitive + domain + variation + trademark + social results
└── 04-final.md          # Tier 1/2/3 presentation + recommendations
```

**Artifact frontmatter templates:**

**00-brief.md:**
```yaml
---
session_mode: explorer | focused
naming_target: "what is being named"
one_liner: "what it does"
audience: "who it's for"
personality: [list of target traits]
archetype: "primary brand archetype"
feeling_spectrum: { authority_vs_approachability: 7, innovation_vs_heritage: 8 }
seed_words: [list]
constraints: [list]
competitors: [list of competitor names]
naming_territories:
  - name: "Territory Name"
    semantic_field: [words]
    phonetic_profile: "description"
  - name: "Territory Name"
    semantic_field: [words]
    phonetic_profile: "description"
competitive_whitespace: "summary of competitive landscape and available whitespace"
timestamp: ISO-8601
---
```

**01-candidates.md** (grows as generation, cross-model, and riffing add candidates):
```yaml
---
categories_used: [evocative, coined, found_word, compound]
cross_model_sources: [gpt-4o, gemini]
user_preferred_categories: [evocative, found_word]
user_disliked_categories: [acronymic]
territories_explored: [precision_instrument, trusted_guide, makers_workshop]
timestamp: ISO-8601
---
```

**02-shortlist.md:**
```yaml
---
preference_profile:
  preferred_categories: [evocative, found_word]
  preferred_directions: [precision_measurement, elevated_view, craft_mastery]
  phonetic_preferences: "V-onset, 2 syllables, trochaic"
  personality_target: "competence + sage"
taken_but_loved:
  - name: Meridian
    killed_by: "Meridian AI — VC CRM"
    compelling_because: "precision, navigation, measurement energy"
  - name: Fundry
    killed_by: "fundry.io — real estate AI"
    compelling_because: "fund + foundry, maker energy"
techniques_applied_during_shortlisting: [red_team_blue_team, constraint_removal]
timestamp: ISO-8601
---
```

**03-validation.md:**
```yaml
---
competitive_screen:
  technical_sources_checked: [github, npm, pypi]
domain_check:
  tlds_checked: [.com, .ai, .co, .io]
pool_recovery_triggered: true
resurrection_candidates: [Meridian, Fundry]
trademark_screening:
  methodology: "USPTO + EUIPO + phonetic similarity"
social_handles:
  platforms_checked: [twitter, instagram, linkedin, tiktok]
timestamp: ISO-8601
---
```

**04-final.md:**
```yaml
---
tier_1_count: 5
tier_2_count: 5
tier_3_count: 4
top_3: [Vestry, Pansight, Thesis]
timestamp: ISO-8601
---
```

### How artifacts flow

- **Loop 1 (Frame)** → writes `00-brief.md`
- **Loop 2 (Generate: 2a-2c)** → appends to `01-candidates.md` (this artifact grows; each round adds candidates)
- **Loop 3 (Select: 3a)** → reads `01-candidates.md`, writes `02-shortlist.md` (the clean handoff to validation)
- **Loop 4 (De-risk: 4a-4f)** → reads `02-shortlist.md`, writes `03-validation.md` (updated progressively as each validation step completes), then writes `04-final.md`
- **Pool recovery** → reads taken-but-loved from `02-shortlist.md`, appends resurrection riffs to `01-candidates.md`, re-validates into `03-validation.md`
- **Deepening techniques** → can fire at any point; results modify either `01-candidates.md` (if generating new candidates) or `02-shortlist.md` (if refining the shortlist)

### Resuming across sessions
If the user returns after a break, check which artifacts exist in `brand-namer-output/`:
- Only `00-brief.md` exists → resume at 2a
- `01-candidates.md` exists → read its frontmatter, resume at 3a (or 2c if riffing wasn't done)
- `02-shortlist.md` exists → resume at 4a
- `03-validation.md` exists → resume at 4f
- All exist → present `04-final.md` or offer to do another round

Always confirm with the user: "I found your previous session artifacts. Here's where we left off: [summary from frontmatter]. Want to continue from here, or start fresh?"

If the user prefers just the final answer with no intermediate artifacts, skip saves and only produce `04-final.md` at the end.

## Adaptive Behavior

This skill should flex to the user's needs:

- **Quick session ("I need 5 name ideas in 10 minutes"):** Compress Loop 1 and 2a into a fast generation round. Skip 2b cross-model ideation, 2c creative riffing, and Loop 4 validation. Only produce `04-final.md`.
- **Deep session ("I want to really get this right"):** Run the full pipeline including 2b cross-model ideation and 2c creative riffing. Multiple ideation rounds. Thorough validation. All 5 artifacts.
- **Iterative session ("Let me think about these overnight"):** Save `01-candidates.md` after generation/riffing. When the user returns, read its frontmatter to resume at 3a or 4a.
- **Validation only ("I already have names, just check them"):** User provides names → write directly to `02-shortlist.md` → run Loop 4 (4a-4f).

The user may not use the loop/stage terminology. Read intent from context and jump to the relevant stage. Check for existing artifacts in `brand-namer-output/` to detect where a previous session left off.
