# Step 02a: Divergent Generation

**Progress:** Step 4 of 13 — Next: Cross-Pollination (step-02b)
**Reads:** `brand-namer-output/00-brief.md` | **Writes:** `brand-namer-output/01-candidates.md` (created here)

## MANDATORY EXECUTION RULES (READ FIRST)

- Read this COMPLETE file before taking any action
- FORBIDDEN to load next step until user selects from the menu
- FORBIDDEN to present more than 15 candidates in a single batch
- FORBIDDEN to select "the strongest" for a curated presentation — present ALL candidates to the user
- FORBIDDEN to skip the hard gate checks before presenting the menu
- Update artifact frontmatter `stepsCompleted` before loading next step
- After handling non-menu user input, ALWAYS re-display the current menu

## SUCCESS METRICS

- 60+ candidates (deep sessions) or 40+ candidates (focused sessions)
- 6+ of 11 naming categories attempted, with at least 5 candidates per category
- 3+ structural types represented (found words, compounds, coined/invented, blends, respellings, foreign-root)
- Ownability compounds make up at least 30% of the candidate pool

## FAILURE MODES

- CRITICAL: Fewer than 40 candidates without user waiver
- CRITICAL: Fewer than 6 categories attempted without user waiver
- CRITICAL: Pool is >80% found words without flagging to the user
- CRITICAL: Presenting more than 15 candidates in one batch
- CRITICAL: Presenting unnumbered lists of selectable items

---

## Execution

Read `references/naming-categories.md` and `references/brand-psychology.md` now.

Use the brand archetype, personality dimensions, and feeling spectrum from the psychology reference to ensure names don't just sound good but *feel right* for the brand's emotional territory.

### Running count

Let the user decide when they have enough. Some sessions need 40 names, others need 150. Your job is to keep generating with breadth and quality until the user says stop — not to hit a fixed number. Include a candidate count only when the user needs orientation (e.g., after a large round or when asked) — don't report after every batch.

**Focused Mode:** Present category-by-category as generated. Still aim for breadth — at least 50 candidates internally across all categories before the user starts cutting.

### Tree of Thought: Generation branching

For each naming category you attempt, don't generate a single linear list. Instead, explore multiple creative branches and expand the most productive:

1. **Branch:** For each category, generate 3 parallel mini-batches of 3-5 names, each from a deliberately different semantic domain or creative approach. For example, when generating Found Words:
   - Branch A: mine textile/craft vocabulary (Weft, Nap, Selvage)
   - Branch B: mine geological/material vocabulary (Basalt, Silt, Loam)
   - Branch C: mine governance/measurement vocabulary (Assay, Gauge, Triage)
2. **Evaluate internally:** Which branch produced the most distinctive, on-brief candidates? Which branch converged on the same energy as names already in the pool? Which branch opened genuinely new territory?
3. **Expand the winners:** Go deeper on the 1-2 strongest branches (generate 5-10 more names in that semantic domain). Abandon the weakest branch — don't show the user dead-end work.
4. **Present all survivors:** Show the user everything from the winning branches. Note which semantic domains were most productive: "Geological vocabulary was the richest vein for this brief."

This branching approach **structurally defeats convergence** — the core problem the skill is designed to solve. Instead of generating 10 names that all come from the same mental neighborhood, you explore 3 neighborhoods simultaneously and go deep on the one with the most untapped potential.

**When to skip branching:** In Quick Mode, skip this — just generate a single strong batch per category. Branching is for deep sessions where generation quality matters more than speed.

**Branching is MANDATORY in deep and focused sessions.** Every category you attempt must go through the branch → evaluate → expand cycle. A linear list of 10 names in a category means you explored one semantic neighborhood and stopped. Three branches of 3-5 names each, with the weakest pruned and the strongest expanded, means you explored three neighborhoods and went deep on the richest one. The output looks similar but the quality is structurally different — branching defeats convergence, linear lists enable it. If you catch yourself generating a flat list without branching, stop and restructure into 3 branches before presenting.

### Rules for this stage

- **Attempt at least 6 of the 11 naming categories** in the reference file. Present at least 4 that produced viable results. Note which categories you attempted and found unproductive: "I tried Acronymic and Sound-Symbolic but neither produced strong fits for this brief." If the user says early on "skip [category]" or "I don't want [style]," respect that — remove it from the attempt list and don't count it toward the minimum. The user can permanently disable categories they know they don't want.
- Generate a **minimum of 5 names per category** you use internally. Present ALL candidates to the user — do not select "the strongest" for a curated presentation. The user sees the full pool and decides what to cut (see Philosophy #3).
- **Do not self-censor.** Include names that feel weird, risky, or "too much." The user will filter. Your job is to fill the possibility space.
- **Flag conflicts inline** with a warning emoji during generation. Don't wait for the competitive screen stage.
- Use the **phonesthetic framework** from the reference file to ensure variety in how names sound, not just what they mean.
- Explicitly explore the **Motion & Direction semantic field** (see `references/naming-categories.md`) — names that convey movement, direction, or momentum are often overlooked but effective.
- Consider **Personified Names** (see `references/naming-categories.md`) — human names used as brands (Claude, Alexa, Oscar, Ada). Particularly strong for AI, health, finance, and trust-dependent products.
- If generation feels convergent or safe despite branching, read `references/elicitation-techniques.md` and apply **SCAMPER** to your best candidates or **Inversion** to identify what to avoid. If the session is stuck, try **Constraint Removal** to find the user's true preferences.

### Hard gates (generation volume) — BLOCKING

These gates are **blocking** — do not proceed to Loop 3 (shortlisting) until they are met or the user explicitly waives them after being warned.

**1. Minimum candidate count:**
- **Deep sessions:** Generate at least **60 unique candidates** before entering shortlisting.
- **Focused sessions:** At least **40 unique candidates**.
- If you have fewer, continue generating — try categories you haven't used, apply techniques from `references/naming-techniques.md`, or run cross-model ideation. Tell the user: "We have [N] candidates. The skill recommends at least [60/40] for a strong shortlist. Want me to generate more, or proceed with what we have?"

**2. Category coverage:**
- Attempt at least **6 of 11 naming categories** with at least **5 candidates each**.
- Before presenting the Loop 2 to 3 checkpoint menu, display a category coverage table:
  - Categories attempted: [list] (N of 11)
  - Categories producing viable results: [list]
  - Categories NOT yet attempted: [list]
- If fewer than 6 categories were attempted, flag it and generate from missing categories before proceeding.

**3. Structural diversity:**
- The candidate pool must contain names from at least **3 different structural types** (found words, compounds, coined/invented, blends, respellings, foreign-root).
- If the pool is >80% one type (e.g., all found words), flag it before proceeding: "Your pool is [N]% [type]. If validation kills [type], you'll have nothing left. I recommend generating [10-15] alternatives from [other types] before shortlisting."

**4. Technique cycling:**
- Before the Loop 2 to 3 transition, check `techniques_not_yet_used` in `01-candidates.md`. If more than **8 techniques** remain unused, flag it: "We've used [N] techniques and have [M] still available: [list]. Want to try any before shortlisting?"
- This prevents the common failure mode where the session stays in one generation groove and never cycles through the full creative toolkit.
- **Technique saturation:** When 25+ techniques have been applied and fewer than 8 remain unused, the technique cycling gate is satisfied. At this depth, the remaining unused techniques (typically backronym, domain-first, semiotic mapping, morphological analysis) have diminishing returns. Note: "25+ techniques applied. Remaining [N] techniques are available but optional at this depth." This does NOT exempt techniques on the riffing checklist — those are enforced separately at step-03a regardless of total technique count.
- **Technique labeling in generation:** When applying named techniques (Tech Branding Patterns, Prefix × Suffix Matrix, Systematic Affix Exploration, Morphological Analysis, etc.), label them explicitly in both the output AND the `techniques_used` array. Don't apply a technique's methodology without recording its name — the technique tracking in YAML frontmatter is how the skill knows what's been done and what remains.

### Five Senses Scan as formal generation round (consumer/physical product briefs)

**For consumer, fashion, lifestyle, food, beauty, and physical product briefs, run the Five Senses Scan as a dedicated generation pass — not inline commentary.** For each sense (sight, smell, touch, taste, sound), generate 5-10 candidate words grounded in the actual physical product experience, then test each as a standalone name. Cross-pollinate across senses (a visual word for a tactile experience, a sound word for a visual quality). Present the results as their own category in the gallery: **"Sensory (Five Senses Scan)"** alongside Evocative, Found Word, Personified, etc. Session testing shows the Five Senses Scan consistently produces strong consumer name candidates (Glint, Mica, Sloe all emerged from sensory mining) — it deserves category-level visibility, not technique-level footnoting. See `references/consumer-naming.md` for the full scan methodology.

### Ownability-first generation (parallel track) — MANDATORY for B2B briefs

**For B2B/enterprise/tech briefs, this is not optional.** Run this alongside category-based generation, not after it. For every promising found word or evocative name you generate, immediately produce 3-5 compound/coined variants. Present both the found word AND its compound variants in the same batch — the user should see both tracks simultaneously, not found words first and compounds as a recovery afterthought.

**For consumer/fashion/food/beauty briefs:** Skip this ownability-first compound track entirely per SKILL.md guidance ("Nobody in streetwear wears Loamworks"). This skip applies to ALL compound generation techniques in this step, including Prefix × Suffix Matrix and systematic affix exploration — when the brief type is consumer/fashion/food/beauty, these techniques should generate consumer-appropriate combinations (nature+nature, sensory pairings, arbitrary compounds like Datadog/Liquid Death) rather than institutional compounds (-works, -craft, -wise, -ware). The brief type overrides the technique's default output register.

**Why this is mandatory:** Found words have an 80-90% kill rate in validation. If your gallery is 100% found words, validation will destroy the pool and you'll be generating compounds under time pressure with a frustrated user. Front-loading compounds means the user reacts to both tracks from the start and develops taste preferences for compound patterns early.

**Enforcement check:** Before presenting the gallery in 2a, verify that at least 30% of candidates are compounds, coined words, or structural alternatives to found words. If the gallery is >70% found words, generate more compounds before presenting.

Do NOT default to a static suffix list — **generate the compound vocabulary dynamically from the brief.**

**The dynamic compound process:**

1. **Identify the brief's industry, personality, and competitive naming patterns.** What compound structures are natural and credible in this specific space? A fashion brand, a dev tool, and a healthcare company each have completely different compound vocabularies.

2. **Generate 8-12 industry-native compound elements.** Ask: "What suffixes, prefixes, and structural patterns would feel at home next to this brand's competitors?" Examples of how this varies:

   | Brief type | Natural compound elements | Example outputs |
   |---|---|---|
   | **Fashion/accessories** | Studio, & Co, House, Atelier, Edit, Supply, Goods, Society, Collection | Crow Studio, Sloe & Co, Moth House |
   | **Dev tools** | Labs, CLI, Protocol, Engine, Hub, Codex, .dev, SDK | Signal Labs, Forge Protocol, Sift Engine |
   | **Healthcare** | Health, Therapeutics, Bio, Sciences, Medical, Care, Rx | Meridian Health, Lumen Therapeutics |
   | **Finance/VC** | Capital, Partners, Ventures, Group, Advisory, Holdings | Benchmark Capital, Greylock Partners |
   | **Food/beverage** | Co, Kitchen, Provisions, Pantry, Brewing, Goods | Sloe Provisions, Bramble Goods |
   | **Consumer DTC** | Co, Supply, Goods, Club, Shop, Studio, Home | Crow Supply, Moth Club |

   These are illustrative — generate fresh for each brief. The point is that a fashion brand's compound vocabulary (Studio, House, Atelier) is completely different from a SaaS brand's (-works, -craft, -OS) and a static list will always be incomplete or wrong for most briefs.

3. **Generate 4-6 cross-industry compound elements.** The most distinctive compounds borrow from OUTSIDE the brand's industry. "Codex" for a dev tool borrows from medieval manuscripts. "Protocol" for a fashion brand borrows from diplomacy. Ask: "What adjacent or aspirational industry would lend this brand unexpected credibility?" Then mine that industry's vocabulary for compound elements.

4. **Also generate conceptual compounds (unexpected pairings):** Combine the root concept with a word from a completely unrelated semantic field — not [root]+[suffix], but [emotion]+[animal], [action]+[object], [domain]+[surprise]. Think Datadog, Snowflake, Cloudbees energy. The pairing should create a spark of cognitive dissonance that makes the name memorable.

5. **Blended meaning compounds:** Words where both halves contribute meaning and the combination creates a third meaning greater than the sum. Salesforce (sales + force = power behind sales), Workday (work + day = the daily work experience).

6. **Three-team compound outputs:** Apply the Lexicon Three-Team Method to compound generation too — one team generates on-brief compounds, one generates as-if-competitor compounds, one generates compounds as if the product were in a completely different category.

See `references/naming-techniques.md` for tech/SaaS-specific affix tables (useful when the brief IS tech), creative respelling patterns, and the Prefix x Suffix Matrix methodology. But treat those tables as examples of what dynamic generation produces for one specific context, not as the universal compound toolkit.

This ensures that when a found word inevitably dies in validation, you already have compound alternatives that carry the same energy — and that the compounds themselves are creative, not just mechanical suffix-swaps. Present both the found word AND its compounds to the user — let them react to both tracks simultaneously.

### Presentation format

**Gallery Mode (default in Explorer Mode):** Before diving into categories one by one, offer a high-level gallery — the top 3-5 names from each category in a single scannable grid. This lets the user see the full breadth at a glance and identify which categories to explore further.

"Here's a quick overview across all categories. For each row, tell me: (H)ot — expand this, (W)arm — include but don't prioritize, (C)old — skip."

| Category | Top Candidates |
|---|---|
| Evocative | Crest, Verdant, Meridian (warning) |
| Found Word | Plinth, Tally, Gauge |
| Compound | Ironmark, Stonewell, Deepcraft |
| ... | ... |

Then expand the categories the user picks, showing the full numbered list with rationale. In **Focused Mode**, category-by-category remains the default.

### Presentation rules (hard constraints)

- **Max 15 candidates per batch.** Never present more than 15 candidates in a single message or table. If a category or round has more, split into sub-batches of 10-15 with a reaction checkpoint after each.
- **Number everything selectable.** All tables and lists where the user might need to refer to specific items MUST include reference numbers. This applies to gallery tables, category expansions, riff presentations, checkpoint menus, validation tables — any display with selectable options. Never present a selectable list without numbering.

### Presentation order and pacing

**Two-step presentation: gallery overview first, then category-by-category expansion.** In Explorer Mode, start with the gallery grid (top 3-5 per category, H/W/C reactions). Then expand the Hot categories one at a time as numbered lists with brief rationale. In Focused Mode, skip the gallery and go straight to category-by-category.

After the user reacts to each category, build their preference profile incrementally: "You consistently picked [patterns]. You consistently skipped [patterns]. This tells me you gravitate toward [summary]." Use this profile to sharpen all subsequent generation and riffing.

**Transparency rule:** After presenting all categories the user asked to see, note what's remaining: "You've seen [M] candidates across [N] categories. [K] more are available in [remaining categories]. Want to see those too, or move on?" Nothing is hidden — but the user controls the pace.

**Category-by-category presentation:**
Present names **ONE CATEGORY AT A TIME**. For each category:
1. Show a numbered list of candidates (with inline warning flags where applicable) and a brief rationale in parentheses
2. Ask the user: which numbers do you like, dislike, or feel neutral about?
3. Move to the next category

After all categories are presented, summarize the user's favorites across categories before proceeding.

```
### Evocative
1. **Crest** (summit, achievement, the wave's peak)
2. **Verdant** (growth, flourishing, green)
3. **Meridian** (warning) Meridian AI — VC CRM (precision, navigation, measurement)
...

Which numbers do you like? Which feel wrong?
```

### Category prioritization

After the user reacts to Round 1 categories, heavily weight subsequent generation toward their preferred categories. If the user liked Evocative and Found Word but disliked Acronymic and Sound-Symbolic:
- Generate 2-3x more candidates in preferred categories
- Generate riffs primarily on candidates from preferred categories
- Still include 2-3 "surprise" candidates from non-preferred categories per round (the best names sometimes come from unexpected places)

### Adaptive territories

When user reactions during generation or triage reveal a strong pull toward a direction not captured by the original territories (e.g., the user keeps starring personified names even though no "Personified" territory was defined, or gravitates toward chess metaphors), **formally add it as a new territory immediately.** Announce it: "Your reactions are showing a clear pattern toward [direction]. I'm adding this as a formal territory and generating deeply in it now." Then run a focused generation round in that territory (minimum 10 candidates) before continuing the original flow. Update `00-brief.md` frontmatter with the new territory. This prevents the common failure mode where the user's actual taste diverges from the initial brief but the skill keeps generating in the original directions.

### Institutional compound patterns (within Compound generation)

When the brief calls for institutional weight (finance, VC, enterprise, professional services), generate compound combinations dynamically from the brief's semantic territory. The classic pattern is two grounded words that create institutional gravitas:

**Common structural patterns** (generate elements appropriate to the specific brief, not from a static list):
- **Color + Noun:** The BlackRock/Blackstone/Greylock pattern — mine colors that match the brand's emotional territory
- **Quality + Noun:** The TrueVentures/BrightEdge pattern — mine adjectives the brief's personality calls for
- **Material + Feature:** The Irongate/Stonebridge pattern — mine materials relevant to the brand's domain
- **Direction + Feature:** The Northstar/Crosspoint pattern — mine directional words that match the brand's motion
- **Noun + Noun:** The Benchmark/Cornerstone pattern — combine the user's favorite roots with each other

**The key principle:** Generate the elements FROM the brief's vocabulary, not from a fixed list. A craft-focused brand generates different adjectives (True, Fine, Hand, Master) than a tech-focused brand (Deep, Clear, Open, Full). A fashion brand generates different nouns (House, Row, Lane, Mark) than a finance brand (Rock, Gate, Point, Capital). The structural patterns are reusable; the vocabulary must be fresh each time.

### Morphological analysis (Zwicky) — systematic combinatorial generation

When intuitive generation plateaus, use morphological analysis to ensure coverage of the full possibility space. Define the dimensions of the naming problem, list options for each, and systematically combine across dimensions:

| Dimension | Options (example for a VC ops platform) |
|---|---|
| **Semantic field** | vision, craft, navigation, truth, signal, structure |
| **Phonetic texture** | hard/decisive, soft/warm, crisp/precise |
| **Syllable count** | 1, 2, 3 |
| **Word class** | noun, verb, adjective, coined |
| **Language origin** | English, Latin, Greek, compound |

Cross the dimensions: "2-syllable Latin-origin noun with crisp phonetics from the 'truth' semantic field" leads to Verity, Verax, Certus. "1-syllable English verb with hard phonetics from the 'craft' field" leads to Forge, Craft, Build. This ensures you don't inadvertently generate everything from the same narrow slice of the possibility space.

### Before presenting the menu

After presenting the initial pool, run the 4 hard gate checks and display the status:

**Hard Gate Status:**
- **Candidate count:** [N] candidates ([pass/fail] — minimum [40/60] for [focused/deep] session)
- **Category coverage:** [N] of 11 categories attempted ([pass/fail] — minimum 6)
- **Structural mix:** [breakdown by type] ([pass/fail] — minimum 3 types, no type >80%)
- **Technique coverage:** [N] techniques used, [M] remaining ([pass/fail] — fewer than 8 unused)

### Technique toolkit — offer remaining techniques

After hard gates, display the technique toolkit showing which techniques have been applied and which are still available. Group by type and filter by brief type. The user can select any combination to run before moving on. **Keep offering this toolkit at every subsequent checkpoint** — techniques that remain unapplied resurface until used or explicitly skipped.

```
**Technique Toolkit** (select any to apply, or skip to menu below):

GENERATION TECHNIQUES
[x] Tree of Thought branching ✓
[ ] Prefix × Suffix Matrix — systematic combinatorial grid
[ ] Morphological Analysis (Zwicky) — dimensional decomposition
[ ] Domain-First Naming — start from available .com domains or ccTLD hacks (.ly, .is, .us, .io, .me, .al)
[ ] Contrarian/Anti-Category — name from the opposite direction
[ ] Truncation/Clipping — clip a real word to create ownable variant (Brex, Deel, Navan, Phenom)
[ ] Toponym Mining — atlas dive for place names with strong cultural/phonetic associations
[ ] Multi-Word Phrase — full grammatical phrases as names (Youth to the People, Rent the Runway)
[ ] Numeric/Alphanumeric — numbers as structural name elements (6sense, Five9, Auth0)
[ ] Founder/Surname Evaluation — assess founder's name for brand viability, try sub-patterns ('s, Title+Name)

CONSUMER-SPECIFIC (show for consumer/fashion/food/beauty briefs)
[x] Five Senses Scan ✓
[x] Sensory Dissonance ✓
[ ] Emotional Temperature Mapping — warm/cool, heavy/light, energized/calm as generation filters
[ ] Price-Signal Calibration — match name register to price tier (luxury/masstige/value)
[ ] Desired-Self Naming — what identity does buying this project?
[ ] Trend-Cycle Audit — will this name feel dated in 5 years?
[ ] Memetic/Viral Engineering — shareability and meme potential
[ ] Cultural Tension Naming — name from the tension the brand resolves

ENTERPRISE-SPECIFIC (show for B2B/enterprise/tech briefs)
[ ] Vertical Code Calibration — match naming register to the specific vertical
[ ] Category Creation Naming — is this joining or creating a category?
[ ] Enterprise Objection Preemption — would a Fortune 500 CISO/VP approve this vendor?
[ ] Lowercase/Casing Strategy — test names in lowercase for dev tool / CLI-native positioning
[ ] [Brand] AI Suffix — test with/without " AI" appended for AI-focused products

DEEPENING TECHNIQUES
[ ] SCAMPER — 7 systematic transformations on each name
[ ] Constraint Removal — "what if there were no rules?"
[ ] Pre-Mortem — "imagine this name failed, why?"
[ ] Inversion — name from the opposite direction
[ ] Three-Team Method — on-brief, competitor, unrelated domain

Select with numbers (e.g., "3, 5, 8") or [A] all remaining, then [C] to skip
```

**Critical: use canonical technique names.** When applying any technique from this toolkit, record it in `techniques_used` using the EXACT name shown here (e.g., "Emotional Temperature Mapping", "Price-Signal Calibration", "Enterprise Objection Preemption", "Category Creation Naming", "Morphological Analysis (Zwicky)"). The technique tracking system depends on name consistency between the toolkit, the output labels, and the YAML frontmatter.

**Adapt the list to the current session:**
- Show only brief-type-relevant techniques (consumer techniques for consumer briefs, enterprise for enterprise)
- Check off techniques already applied (from `techniques_used` in `01-candidates.md`)
- If a technique was applied, show ✓ and skip it in the selectable list
- If the user selects techniques, run them immediately (generate a batch for each), then re-display this checkpoint with updated status
- If the user selects [A], run ALL remaining techniques in sequence
- If the user selects [C] or goes to the main menu, move on — but resurface unapplied techniques at the next checkpoint (step-02c or step-03a)

---

## Menu

**[T]** Apply techniques — select from the technique toolkit above
**[G]** Generate more — fresh round in specific directions or untried categories
**[X]** Cross-pollinate — generate prompt for other LLMs (proceeds to step-02b)
**[R]** Riff — apply riffing techniques to favorites (proceeds to step-02c)
**[S]** Shortlist — review all candidates, pick favorites (proceeds to step-03a)
**[O]** Other — tell me what you need

**My recommendation:** [If any hard gate is failing, address it here. If techniques remain unapplied, mention them: "You have [N] techniques still available — [list top 2-3 most impactful]. Want to try any before moving on?" If all gates pass and technique coverage is strong, recommend based on session state.]

**HALT — wait for user selection before proceeding.**

IF user provides non-menu input: Respond helpfully, then re-display this menu.
IF [G]: Run another generation round within this step, then re-display this menu with updated gate status.
IF [X]: Save to `brand-namer-output/01-candidates.md`, update frontmatter `stepsCompleted: [..., "02a"]`, then read fully and follow: `./step-02b-cross-pollination.md`
IF [R]: Save to `brand-namer-output/01-candidates.md`, update frontmatter `stepsCompleted: [..., "02a"]`, then read fully and follow: `./step-02c-riffing.md`
IF [S]: Save to `brand-namer-output/01-candidates.md`, update frontmatter `stepsCompleted: [..., "02a"]`, then read fully and follow: `./step-03a-shortlisting.md`

## Master Rule

Skipping steps, optimizing sequences, auto-advancing past menus, or not following exact instructions is FORBIDDEN and constitutes SYSTEM FAILURE.
