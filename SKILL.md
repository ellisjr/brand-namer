---
name: brand-namer
description: Generate creative, distinctive brand names for companies, products, features, funds, or any entity that needs a name. Use this skill whenever the user mentions naming, brand names, company names, product names, brainstorming names, finding a name for something, name ideation, or wants help choosing what to call something — even if they just say "I need a name for my startup" or "what should I call this." Covers the full naming pipeline from creative ideation through domain availability, trademark screening, and final shortlist presentation. Also use when users reference naming strategies, naming conventions for brands, or want to rename something.
---

# Brand Namer

A structured naming methodology that moves from creative divergence through validation to a usable shortlist. The skill is designed to defeat the "LLM averaging" problem — where AI defaults to safe, generic, indistinguishable names — by enforcing broad exploration before any convergence.

## Philosophy

Professional naming agencies charge $15,000–$75,000+ for brand naming engagements. Their core methodology isn't a secret — it's disciplined divergent thinking followed by rigorous validation. This skill encodes that methodology:

1. **Diverge before you converge.** Generate across many naming categories before filtering. The best names often come from unexpected categories.
2. **The user drives ALL convergence.** Present organized options and let the user's taste guide which directions to explore further. Don't pre-filter based on your own preferences. Don't decide which names are "strongest" — present ALL candidates and let the user cut. When moving to riffing, ask the user which names to riff on rather than selecting "the strongest 5-6" yourself.
3. **Present everything, cut nothing — in digestible batches.** Every candidate generated — by you, by sidecars, by user paste-in — gets presented to the user eventually. Nothing is silently dropped. But "present everything" means **eventual full exposure via batched rounds**, not an immediate dump of 150 names. The process: gallery overview first → batched expansion (10 at a time) of preferred categories → remaining categories available on request. At each point, be transparent about what's been shown and what's waiting: "I've generated [N] candidates. You've seen [M] so far. [K] more are available in [categories]. Want to continue, or move on?" Preference data from earlier selections should sharpen GENERATION (what you produce next), not PRESENTATION (what you show).
4. **Validate what survives — and riff on what doesn't.** A beautiful name is worthless if the domain is taken, the trademark is filed, or it means something vulgar in Mandarin. But a taken name that the user loves is a powerful creative signal. Validate to sort, not to discard — names that fail validation become seeds for riffing and deepening in the next pass.
5. **Ask before you advance — offer menus at checkpoints.** At each major transition, present options rather than suggesting a single next step. **First time** at each transition: show the full menu of available options. **Subsequent times** at the same transition: use a short form — "Generate more, riff more, or move on? (show full menu)" — unless the user asks for the full list. Don't barrel through the pipeline — naming is a creative partnership, but menus shouldn't feel like paperwork.
6. **Flag conflicts inline with confidence levels.** For every name you generate, immediately check your training data for known companies, products, or brands with the same or very similar name. If you know of a conflict, flag it inline with a confidence indicator:
   - ⚠️ **Known** — "⚠️ Meridian AI — VC CRM" (you're confident this conflict exists)
   - ⚠️? **Uncertain** — "⚠️? I recall something called Meridian in tech but may be misremembering" (flag but note uncertainty)
   - Do NOT flag conflicts you're inventing or guessing at. False flags are worse than missed flags — they kill good names prematurely. If you're not confident, skip the flag and let web search catch it in Loop 4.
   Flagged names should be deprioritized in presentation but NOT removed — the user decides whether to pursue them. This prevents the heartbreak of falling in love with a name only to discover it's taken during validation. Do this during generation, riffing, AND variation stages — not as a separate step.
7. **Isolate context — name ONLY what's being named.** When the user provides background documents (PRDs, pitch decks, business plans), extract information about the NAMING TARGET only. Do not let surrounding context bleed into the naming brief. If the user is naming a platform built for a fund called "InnovateHealth Ventures," you are naming the PLATFORM, not the fund. If the user is naming a feature within an app, you are naming the FEATURE, not the app. Confirm the naming target explicitly before generating: "Just to confirm — we're naming [the platform/the feature/the company], correct?"
8. **Show your work — technique transparency.** When applying riffing or generation techniques, label which technique produced each candidate. Don't just show outputs — show the technique name alongside each result. This lets the user understand WHY a name was generated and request more of a specific technique if it's working. Format: `**Name** | technique used | rationale`
9. **Narrate before you act.** Before any multi-step operation (validation runs, sidecar spawning, batch generation, pool recovery), tell the user what you're about to do, how many steps it involves, and what to expect. "I'm going to screen your 12 shortlisted names — web search for each, then domain checks. I'll present results in a single table when done." This prevents the user from sitting in silence wondering what's happening during long operations.
10. **Recommend at every checkpoint.** Every checkpoint menu (a/b/c/d options) MUST include your recommendation with brief rationale based on the current session state — pool size, technique coverage, user energy. The user may override, but the guidance helps. "I'd lean toward (a) — your pool is thin after validation and riffing on the dead names usually produces the strongest survivors."

## Reference Files — Context Budget Policy

This skill has **6 reference files** in `references/`, organized by when they're needed. **Load only the files relevant to the current stage and brief type.** No session should load all 6.

### Loading strategy

| File | Lines | When to load | Brief type |
|---|---|---|---|
| `references/naming-categories.md` | ~550 | **2a (Generation)** — always | All briefs |
| `references/naming-techniques.md` | ~600 | **2c (Riffing), 3a (Shortlisting), 4b (Pool recovery)** | All briefs |
| `references/consumer-naming.md` | ~660 | **2a (Generation)** — for consumer/lifestyle/food/beauty/fashion | Consumer briefs only |
| `references/enterprise-naming.md` | ~420 | **1a (Brief), 2a (Generation), 3a (Shortlisting), 4a-4e (Validation)** | B2B/enterprise briefs only |
| `references/brand-psychology.md` | ~430 | **1a-1b (Brief/Territories)** — load once, retain | All briefs |
| `references/elicitation-techniques.md` | ~325 | **When triggered** (user asks, session stuck, stress-testing) | On demand |

**For a consumer brief:** Load naming-categories.md + consumer-naming.md + brand-psychology.md = ~1,640 lines across the session. Never load enterprise-naming.md.

**For a B2B brief:** Load naming-categories.md + enterprise-naming.md + brand-psychology.md = ~1,400 lines across the session. Never load consumer-naming.md.

**For a quick session:** Load naming-categories.md only (~550 lines). Add consumer-naming.md if it's a sensory/physical product. Skip everything else.

### Troubleshooting — when the session gets stuck

| Problem | Likely cause | Load this file | Apply this technique |
|---|---|---|---|
| Names all sound the same | Convergent generation, stuck in one category | `naming-categories.md` | Try categories you haven't used. Apply Contrarian or Arbitrary/Absurd from `naming-techniques.md`. |
| Names are generic / "LLM averaged" | Not enough sensory or experiential input | `consumer-naming.md` | Run the Five Senses Scan. Apply Sensory Dissonance. |
| Can't find available names | All found words are taken | `naming-techniques.md` | Apply Tech Branding Patterns, Prefix × Suffix Matrix, Creative Respelling. |
| User hates everything | Taste not captured correctly | `brand-psychology.md` | Re-run archetype identification. Try Constraint Removal from `elicitation-techniques.md`. |
| Committee can't agree | No shared evaluation framework | `enterprise-naming.md` | Apply Semantic Differential Scaling. Use Nominal Group Technique from SKILL.md committee playbook. |
| Names don't fit the vertical | Wrong register/codes | `enterprise-naming.md` | Check Vertical Code Calibration table for the specific vertical. |
| Names fail in real-world speech | Not tested in context | `enterprise-naming.md` | Run Sales Conversation Fit templates. Run Speech & Channel Robustness tests. |
| Pool too thin after validation | Normal — 80-90% kill rate for found words | `naming-techniques.md` | Pool recovery with Tech Branding compounds. Try Domain-First Naming. |

### Context health management

In long sessions (50+ turns, 100+ candidates), context pressure will degrade quality. Manage it:

1. **Artifacts are the authoritative state.** If context compresses, the artifacts contain everything needed to resume. Treat `01-candidates.md` and `02-shortlist.md` as the source of truth, not conversation history.
2. **Save frequently.** After every batch of candidates, every user reaction round, and every validation step — save to the appropriate artifact immediately.
3. **Summarize before advancing.** At each loop transition, write a brief status summary into the conversation: "Status: [N] candidates, [M] shortlisted, [K] validated. Preference profile: [summary]. Next: [stage]." This survives context compression better than scattered details across many turns.
4. **Don't re-read reference files.** Load sections once per stage. If you need to re-reference a technique, recall it from what you've already loaded — don't re-read the file.

### Sidecar briefing budget

When briefing sidecars, do NOT include full reference files. Instead:
- Include the brand brief (from `00-brief.md`)
- Include a **condensed taxonomy summary** — the 11 category names with 1-line descriptions + the key generation rules (anti-patterns, at least 6 categories, don't self-censor). ~50 lines, not 1,200.
- Include existing candidates (for deduplication)
- Include specific technique instructions if you want the sidecar to try a particular approach

**Sidecar model selection by task:**

| Task | Recommended model | Thinking level | Why |
|---|---|---|---|
| Cross-model name ideation | `gemini` or `gpt` | `--thinking medium` | Creative breadth. High thinking adds latency without better naming. |
| Taxonomy/skill review | `gemini` or `gpt` | `--thinking high` | Analytical depth needed for structural critique. |
| Quick conflict screening | `gemini` | No `--thinking` flag | Fast factual lookups, no creative reasoning needed. |
| Consumer naming ideation | `gpt` | `--thinking medium` | GPT tends toward punchier consumer names. |
| Systematic/foreign-root exploration | `gemini` | `--thinking medium` | Gemini is more thorough at systematic exploration. |
| Irreverent/unconventional names | `grok` | Default | Grok breaks patterns other models won't. |

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

#### Tree of Thought: Territory exploration

Don't generate territories sequentially. Instead, explore broadly and prune:

1. **Branch:** Generate 8-10 candidate territories internally — cast a wide net across different emotional registers, semantic domains, and phonetic textures. Include at least 2 territories that feel unexpected or uncomfortable for the brief.
2. **Evaluate:** Score each territory against three criteria simultaneously:
   - **Differentiation from competitors** — does this territory occupy whitespace, or overlap with how competitors already name themselves?
   - **Brief alignment** — does the territory's emotional promise match the user's stated personality, archetype, and #1 job?
   - **Generative potential** — will this territory produce a rich pool of diverse candidates, or will it run dry after 5-6 obvious names?
3. **Prune:** Select the 3-5 territories that score strongest across all three criteria. Drop territories that overlap with each other or with the competitive set.
4. **Default territory checks:** Before finalizing, apply these brief-type-specific checks:

   **For daily-use tools, OS, or assistants** — something the user will talk to or about every day — always include **"Personified / Domain Figures"** as one of the 3-5 territories. This territory mines: historical figures from the product's domain (e.g., Benjamin Graham for VC, Florence Nightingale for healthcare), clean first/last names with the right phonetic energy, and names that pass the "coffee shop test" ("Let me check [name]"). Prompt the user: "Who are the famous figures in [domain] that you admire?" Their answers become generation seeds. The user can still drop this territory during alignment, but it should be presented by default — personified names are consistently strong for daily-use products and often emerge as the user's preferred direction.

   **For consumer/physical product/fashion/lifestyle briefs** — always include **"Animal / Nature Curator"** as one of the 3-5 territories. This territory mines: creatures that embody the brand's core action (magpies collect shiny objects, moths are drawn to light, kestrels hover with precision before striking), plants and trees with relevant symbolism (rowan for protection, briar for resilience, sloe for dark sophistication), and natural phenomena that mirror the product experience. Prompt the user: "What creature or natural thing does what your brand does?" Session testing shows animal/nature names consistently emerge as a dominant direction for consumer brands — they carry rich metaphorical depth, are instantly imageable, and pass the badge test effortlessly. The user can still drop this territory during alignment.
5. **Present:** Show only the pruned territories to the user. Note which territories you explored and dropped, and why — this transparency builds trust and lets the user rescue a dropped territory if they disagree.

For each surviving territory, define:
- **Territory name** (e.g., "Calm Precision," "Maker Energy," "Institutional Trust")
- **Emotional promise** — what the user feels encountering this brand
- **Semantic field** — the word families and metaphor domains to mine
- **Phonetic profile** — sound texture that fits (reference `references/brand-psychology.md`)
- **Anti-patterns** — what this territory should NOT sound like

Present the territories to the user for alignment before proceeding. They may adjust, merge, add territories, or rescue dropped ones. Each territory becomes a generation lane in Loop 2.

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

### Session mode (infer, don't ask)

**Explorer Mode:** Maximum ideation first. Generate across all categories, present everything organized by category for the user to react to. Best when the user wants to see the full possibility space before making any cuts.

**Focused Mode:** Step-by-step with user input at each stage. Present one category at a time, get reactions, riff only on what the user likes, check in frequently. Best when the user wants to stay in control and iterate collaboratively.

Both modes use the same pipeline — they just differ in when the user enters the loop. **Infer the mode from the user's signals rather than asking explicitly.** "Show me everything" / "I want to see the full range" → Explorer. "Let's go step by step" / "walk me through options" → Focused. A detailed brief with clear taste signals → Explorer (they know what they want, show them breadth). A sparse brief with uncertain taste → Focused (build understanding incrementally). Only ask when the signals are genuinely ambiguous.

The chosen mode is captured in `00-brief.md` frontmatter so it persists across sessions.

If the user gives you a sparse brief ("I need a name for my AI startup"), work with what you have but note the gaps. You can generate a first round and let their reactions fill in what the brief didn't.

---

## The Validation Reality

**Set expectations early:** In the current naming landscape, almost every single English word is already used by a tech company. For found-word and single-word names, expect an **80-90% kill rate** during competitive screening. Beautiful names like Fathom, Sift, Flux, Lantern, Gauge — all taken by active companies.

This means:
1. **Generate found words for inspiration, compounds for survival.** Found words reveal the user's taste and emotional direction. Compounds and coined names are what actually survives validation. Run both tracks in parallel from the start — not sequentially.
2. **The `-works` / `-craft` / `-wise` / `-ware` compound pattern is the most productive survival strategy.** Of dozens of names screened in testing, clear survivors were almost exclusively compounds. Single found words are inspirational seeds; compounds are what you can actually own.
3. **Don't fall in love with found words before validation.** Present them alongside compound alternatives early so the user isn't emotionally committed to names that will die.

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

This is where the magic happens — and where discipline matters most. Read `references/naming-categories.md` for naming categories and `references/brand-psychology.md` for emotional frameworks. Use the brand archetype, personality dimensions, and feeling spectrum from the psychology reference to ensure names don't just sound good but *feel right* for the brand's emotional territory.

#### Running count
Let the user decide when they have enough. Some sessions need 40 names, others need 150. Your job is to keep generating with breadth and quality until the user says stop — not to hit a fixed number. Include a candidate count only when the user needs orientation (e.g., after a large round or when asked) — don't report after every batch.

**Focused Mode:** Present category-by-category as generated. Still aim for breadth — at least 50 candidates internally across all categories before the user starts cutting.

#### Tree of Thought: Generation branching

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

#### Rules for this stage:
- **Attempt at least 6 of the 11 naming categories** in the reference file. Present at least 4 that produced viable results. Note which categories you attempted and found unproductive: "I tried Acronymic and Sound-Symbolic but neither produced strong fits for this brief." If the user says early on "skip [category]" or "I don't want [style]," respect that — remove it from the attempt list and don't count it toward the minimum. The user can permanently disable categories they know they don't want.
- Generate a **minimum of 5 names per category** you use internally. Present ALL candidates to the user — do not select "the strongest" for a curated presentation. The user sees the full pool and decides what to cut (see Philosophy #3).
- **Do not self-censor.** Include names that feel weird, risky, or "too much." The user will filter. Your job is to fill the possibility space.
- **Flag conflicts inline** with ⚠️ during generation (see Philosophy principle #5). Don't wait for the competitive screen stage.
- Use the **phonesthetic framework** from the reference file to ensure variety in how names sound, not just what they mean.
- Explicitly explore the **Motion & Direction semantic field** (see `references/naming-categories.md`) — names that convey movement, direction, or momentum are often overlooked but effective.
- Consider **Personified Names** (see `references/naming-categories.md`) — human names used as brands (Claude, Alexa, Oscar, Ada). Particularly strong for AI, health, finance, and trust-dependent products.
- If generation feels convergent or safe despite branching, read `references/elicitation-techniques.md` and apply **SCAMPER** to your best candidates or **Inversion** to identify what to avoid. If the session is stuck, try **Constraint Removal** to find the user's true preferences.

#### Five Senses Scan as formal generation round (consumer/physical product briefs)
**For consumer, fashion, lifestyle, food, beauty, and physical product briefs, run the Five Senses Scan as a dedicated generation pass — not inline commentary.** For each sense (sight, smell, touch, taste, sound), generate 5-10 candidate words grounded in the actual physical product experience, then test each as a standalone name. Cross-pollinate across senses (a visual word for a tactile experience, a sound word for a visual quality). Present the results as their own category in the gallery: **"Sensory (Five Senses Scan)"** alongside Evocative, Found Word, Personified, etc. Session testing shows the Five Senses Scan consistently produces strong consumer name candidates (Glint, Mica, Sloe all emerged from sensory mining) — it deserves category-level visibility, not technique-level footnoting. See `references/consumer-naming.md` for the full scan methodology.

#### Ownability-first generation (parallel track)
**Run this alongside category-based generation, not after it.** For every promising found word or evocative name you generate, immediately produce 3-5 compound/coined variants. But do NOT default to a static suffix list — **generate the compound vocabulary dynamically from the brief.**

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

See `references/naming-techniques.md` for tech/SaaS-specific affix tables (useful when the brief IS tech), creative respelling patterns, and the Prefix × Suffix Matrix methodology. But treat those tables as examples of what dynamic generation produces for one specific context, not as the universal compound toolkit.

This ensures that when a found word inevitably dies in validation, you already have compound alternatives that carry the same energy — and that the compounds themselves are creative, not just mechanical suffix-swaps. Present both the found word AND its compounds to the user — let them react to both tracks simultaneously.

#### Presentation format

**Gallery Mode (default in Explorer Mode):** Before diving into categories one by one, offer a high-level gallery — the top 3-5 names from each category in a single scannable grid. This lets the user see the full breadth at a glance and identify which categories to explore further.

"Here's a quick overview across all categories. For each row, tell me: (H)ot — expand this, (W)arm — include but don't prioritize, (C)old — skip."

| Category | Top Candidates |
|---|---|
| Evocative | Crest, Verdant, Meridian ⚠️ |
| Found Word | Plinth, Tally, Gauge |
| Compound | Ironmark, Stonewell, Deepcraft |
| ... | ... |

Then expand the categories the user picks, showing the full numbered list with rationale. In **Focused Mode**, category-by-category remains the default.

#### Presentation rules (hard constraints)
- **Max 15 candidates per batch.** Never present more than 15 candidates in a single message or table. If a category or round has more, split into sub-batches of 10-15 with a reaction checkpoint after each.
- **Number everything selectable.** All tables and lists where the user might need to refer to specific items MUST include reference numbers. This applies to gallery tables, category expansions, riff presentations, checkpoint menus, validation tables — any display with selectable options. Never present a selectable list without numbering.

#### Presentation order and pacing
**Two-step presentation: gallery overview first, then category-by-category expansion.** In Explorer Mode, start with the gallery grid (top 3-5 per category, H/W/C reactions). Then expand the Hot categories one at a time as numbered lists with brief rationale. In Focused Mode, skip the gallery and go straight to category-by-category.

After the user reacts to each category, build their preference profile incrementally: "You consistently picked [patterns]. You consistently skipped [patterns]. This tells me you gravitate toward [summary]." Use this profile to sharpen all subsequent generation and riffing.

**Transparency rule:** After presenting all categories the user asked to see, note what's remaining: "You've seen [M] candidates across [N] categories. [K] more are available in [remaining categories]. Want to see those too, or move on?" Nothing is hidden — but the user controls the pace.

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

#### Adaptive territories
When user reactions during generation or triage reveal a strong pull toward a direction not captured by the original territories (e.g., the user keeps starring personified names even though no "Personified" territory was defined, or gravitates toward chess metaphors), **formally add it as a new territory immediately.** Announce it: "Your reactions are showing a clear pattern toward [direction]. I'm adding this as a formal territory and generating deeply in it now." Then run a focused generation round in that territory (minimum 10 candidates) before continuing the original flow. Update `00-brief.md` frontmatter with the new territory. This prevents the common failure mode where the user's actual taste diverges from the initial brief but the skill keeps generating in the original directions.

#### Institutional compound patterns (within Compound generation)
When the brief calls for institutional weight (finance, VC, enterprise, professional services), generate compound combinations dynamically from the brief's semantic territory. The classic pattern is two grounded words that create institutional gravitas:

**Common structural patterns** (generate elements appropriate to the specific brief, not from a static list):
- **Color + Noun:** The BlackRock/Blackstone/Greylock pattern — mine colors that match the brand's emotional territory
- **Quality + Noun:** The TrueVentures/BrightEdge pattern — mine adjectives the brief's personality calls for
- **Material + Feature:** The Irongate/Stonebridge pattern — mine materials relevant to the brand's domain
- **Direction + Feature:** The Northstar/Crosspoint pattern — mine directional words that match the brand's motion
- **Noun + Noun:** The Benchmark/Cornerstone pattern — combine the user's favorite roots with each other

**The key principle:** Generate the elements FROM the brief's vocabulary, not from a fixed list. A craft-focused brand generates different adjectives (True, Fine, Hand, Master) than a tech-focused brand (Deep, Clear, Open, Full). A fashion brand generates different nouns (House, Row, Lane, Mark) than a finance brand (Rock, Gate, Point, Capital). The structural patterns are reusable; the vocabulary must be fresh each time.

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

**For consumer/lifestyle/fashion/food briefs, strongly recommend cross-model ideation.** Session testing shows cross-model rounds consistently produce the highest hit rate for consumer names (46% vs 8% for riffing in one tested session). Consumer naming rewards lateral creativity, sensory vocabulary, and cultural reference that different models approach from genuinely different angles — GPT tends toward punchy, emotionally resonant consumer names; Gemini toward systematic foreign-root and nature exploration; Grok toward irreverent breaks. For consumer briefs, frame this as a near-default rather than an optional add-on: "For consumer brands, I'd strongly recommend getting ideas from other models — it's consistently the highest-yield stage."

#### If sidecar tools are available (preferred):
Check whether you have access to `sidecar:sidecar_start`. If you do, offer to spawn parallel naming sessions with other models automatically. Recommended models for creative naming work:

- **GPT-4o** (alias: `gpt`) — Strong at consumer-friendly, punchy names. Good at portmanteaus and sound-symbolic names.
- **Gemini 2.5 Pro with thinking** (alias: `gemini-pro`) — Excellent at foreign-root and invented/coined names. Thorough at systematic exploration.
- **Grok** (alias: `grok`) — Good at unconventional, irreverent, and surprising name candidates that break patterns.

For each sidecar, send a briefing that includes:
1. The brand brief from Loop 1
2. The naming categories from `references/naming-categories.md` (include the full taxonomy — the sidecar doesn't have access to local files)
3. An explicit instruction to generate at least 50 candidates across multiple naming categories, organized by category with brief rationale per name
4. The anti-convergence instructions: explore widely, don't self-censor, include weird/risky options
5. **A list of candidates already generated** — instruct the sidecar: "Here are the [N] names already generated. Do NOT repeat these. Focus on categories, directions, and domains NOT already explored." This prevents the 70%+ overlap that occurs when multiple models receive identical briefs without deduplication guidance.

When sidecar results come back, **immediately append ALL external candidates to `01-candidates.md`** with the source model noted. Deduplicate against existing candidates — mark duplicates as "independently generated by [model]" (this is validation signal, not waste). Present all NEW unique candidates to the user in the same numbered-batch format used for your own candidates. Do not silently absorb external candidates into your pool — the user should see exactly what each model contributed.

#### Sidecar failure detection
If a sidecar completes in under 10 seconds or returns empty/near-empty results (fewer than 5 candidates), treat it as failed — the model likely didn't execute the prompt. Do not present empty results to the user. Instead: (1) Note the failure transparently: "The [model] sidecar didn't return usable results — likely a connection issue." (2) Fallback: run a **domain-specific vocabulary mining** round as a substitute — mine specialized vocabulary from the brief's domain (industry terminology, historical figures, tools of the trade, specialized measurement instruments) and use those as generation seeds. This replaces the creative breadth the sidecar was supposed to provide. (3) Offer to retry the sidecar or continue without it.

#### User paste-in handling
When the user pastes results from another LLM, apply the same process: append to `01-candidates.md` with source noted, deduplicate, present new unique candidates to the user for reaction. Ask which model generated them so you can track the source.

#### Large-input ingestion protocol
If the user pastes a large batch (20+ names), don't just dump them into the conversation. Process systematically:

1. **Normalize:** Standardize formatting — one name per line, remove numbering/bullets, strip rationale text
2. **Deduplicate:** Check against existing `01-candidates.md`. Flag exact matches as cross-model validation. Flag near-matches (different spacing, hyphenation, pluralization — e.g., "SiftWorks" vs "Sift Works" vs "Siftworks") and let the user choose which form to keep.
3. **Chunk:** Split into blocks of 25 names max for presentation
4. **Classify:** Note the source model and any category/territory labels from the original output
5. **Present:** Show each chunk in the standard numbered-batch format for user reaction
6. **Save:** Append all new unique candidates to `01-candidates.md` after each chunk is presented

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

#### Which names to riff on — the user decides
Do NOT select "the strongest 5-6" for riffing yourself. Present the full shortlist and ask the user: "Which of these do you want me to riff on? Pick as many or as few as you like." The user may choose names you wouldn't have selected — their taste is the compass, not your assessment of "strength."

If the user asks you to pick, explain: "I can suggest names that seem most riffable (words with rich etymologies, multiple meanings, or strong phonetic roots), but the names that matter most are the ones YOU feel drawn to — even if you can't articulate why." Then offer your suggestions as a starting point, not a final selection.

#### The riffing pipeline
For each name the user selects, follow this sequence:
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
Many affixes work as both prefixes AND suffixes, or have multiple viable forms. For each promising root, systematically run through the affix library in `references/naming-techniques.md` (see "Productive Affixes for Name Construction"):

**The process:**
1. Take the root (e.g., "signal," "craft," "true," "bit")
2. Run it through prefix position: Signal→, Craft→, True→, Bit→ (e.g., Bitwise, Bitspark, Bitcraft)
3. Run it through suffix position: →Signal, →Craft, →True, →Bit (e.g., Truebit, Clearbit, Databit)
4. Test each combination for ⚠️ conflicts, pronounceability, and emotional fit
5. The best affixes are chameleons — "bit" as prefix (Bitwise = technical precision) feels different from "bit" as suffix (Clearbit = small/focused/modular)

See the full affix reference table in `references/naming-techniques.md` for a comprehensive list of productive prefixes and suffixes with their semantic contributions.

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

Columns: **candidate | technique used | emotional feel | door type (open/closed/balanced) | risk flags**

Be specific about the technique: not just "riff" but "synonym explosion on 'light'", "SCAMPER-Substitute on Lighthouse", "affix: True- prefix", "language shift: Latin 'lucerna'", "tech pattern: -works suffix", "respelling: Y-for-I". This transparency lets the user see WHICH techniques are productive and request more of the ones that work.

This format helps the user make informed comparisons rather than just reacting to a flat list. See `references/brand-psychology.md` for the open-door/closed-door framework and story type classifications.

Ask the user: "Want me to riff further on any of these directions, or are you ready to take the full list into shortlisting?"

---

## Loop 3: Select

### Checkpoint menu (Loop 2 → Loop 3 transition)

Before entering shortlisting, present a status summary and full menu:

"**Status:** [N] unique candidates across [M] categories from [K] sources (you + [sidecar models]).

**What would you like to do?**
- (a) **Generate more** — fresh round in specific directions, or try a category we haven't used
- (b) **Cross-model ideation** — get ideas from other LLMs via sidecar
- (c) **Apply riffing techniques** — [list available: SCAMPER, synonym explosion, affix exploration, respelling, tech branding, language shift, compound creation, classical stems, conceptual blending]
- (d) **Apply deepening techniques** — [list: Inversion, Constraint Removal, Six Hats, First Principles, TRIZ, Analogical Reasoning, Three-Team Method]
- (e) **Move to shortlisting** — review all candidates, pick favorites for validation
- (f) **Something else** — tell me what you need

**My recommendation:** [Always include a specific recommendation with rationale based on the current session state. E.g., "I'd lean toward (e) — you have 40+ candidates with a clear preference profile, and more generation is unlikely to change your direction. But if your pool feels thin in any area, (a) or (c) can fill the gaps."]"

### 3a. Convergent Shortlisting (User-Directed)

**Reads:** `01-candidates.md` | **Writes:** `02-shortlist.md` (the clean handoff to validation)

The user decides how many rounds of ideation they want. Your role:

- When the user reacts to names ("I like these, not those"), generate more in the directions they prefer
- When they say "these feel too corporate," pivot toward warmer/friendlier categories
- When they narrow to a set of favorites, confirm: "Ready to move into validation, or want another round?"
- Respect the user's timeline. If they want to go fast, move to validation with a larger shortlist. If they want to explore, keep generating.

#### Definitions check during shortlisting
For the user's **top 5-10 picks** — especially obscure words, foreign-roots, or words with non-obvious secondary meanings — include the dictionary definition and etymology. Don't auto-define common words the user obviously knows (Gauge, Relay, Grade). Focus definitions where they add genuine value: revealing etymology that enriches the brand story, surfacing secondary meanings the user might not know, or confirming a foreign word means what they think it means. This serves as a reality check — the user should know exactly what the word means before committing to it.

Format:
```
**Assay** (n./v.) — "to test the quality of a metal or ore; to evaluate or examine"
  Etymology: Old French "essai" (trial, attempt), from Latin "exagium" (weighing)
  As a brand: "Every deal undergoes the assay — a test of quality"
```

This also reveals hidden meanings, alternate definitions, and etymological connections that enrich the brand story.

#### Batch elimination (for large pools)
When the candidate pool is large (30+ favorites remaining after gallery reactions), offer batch elimination as a rapid convergence technique. Present remaining candidates in numbered batches of 10 and ask the user to make quick keep/cut decisions for each batch:

"Here are candidates 1–10. Which do you want to keep?"

This approach prevents decision fatigue from seeing the full pool at once, generates clear preference signal quickly (the user's cut patterns reveal taste), and works well as a complement to the H/W/C gallery reactions from 2a. Session testing showed this was the fastest convergence moment — the user suggested it naturally and cut from 30 to 15 in three quick passes.

After batch elimination, compile the Keeps into the working shortlist. If the pool is thin (<8), offer a second pass on the cuts to rescue any the user regrets dropping.

#### Deepening techniques — present the full menu

At each transition point, present the FULL menu of available techniques and let the user choose. Don't pre-select 2-3 techniques — show everything and let the user decide what's relevant.

"Before we move into validation, here are the deepening and riffing techniques available. Choose any that interest you, or skip straight to validation:

**Riffing techniques:**
- SCAMPER (7 systematic transformations on each name)
- Synonym explosion (5-10 synonyms per root)
- Affix exploration (prefix/suffix library crossing)
- Creative respelling (Y-for-I, K-for-C, dropped vowels, etc.)
- Tech branding patterns (-OS, -ware, -wise, -er, -base, -box)
- Language shift (Latin, Greek, French translations)
- Compound creation (root × 5+ second words)
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

#### Multi-perspective evaluation
For high-stakes naming decisions, consider evaluating the shortlist from multiple distinct perspectives simultaneously — not just sequentially through techniques. Frame it as: "Let me look at your top candidates through three lenses at once: the strategist (does this name position you correctly?), the creative (does this name have narrative energy?), and the analyst (does this name have practical risks?)." This cross-pollination often surfaces insights that no single technique catches alone.

**Transition trigger:** The user has a shortlist of ~5-20 names they want validated. Confirm the list before proceeding.

### Checkpoint menu (Loop 3 → Loop 4 transition)

Before entering validation, present:

"**Shortlist:** [N] names selected. **Riffing status:** [list which techniques have been applied and which haven't].

**What would you like to do?**
- (a) **Apply more riffing techniques** to the shortlist — [list unapplied techniques]
- (b) **Generate compound/coined alternatives** for each found word on the shortlist (ownability insurance)
- (c) **Run the mandatory riffing checklist** to ensure coverage, then proceed to validation
- (d) **Skip straight to validation** — take the shortlist as-is into competitive screening
- (e) **Go back** — generate more candidates first

**My recommendation:** [Always include a specific recommendation with rationale. E.g., "I'd lean toward (b) — your shortlist is mostly found words, which have an 80-90% kill rate in validation. Generating compound alternatives now gives you survivable backups before the bloodbath."]"

#### Riffing checklist (before entering Loop 4)

**In deep sessions (default):** This checklist is mandatory. Apply techniques to each shortlisted **direction** (group names by theme — e.g., "the measurement direction" covers Assay, Gauge, Caliber together), not to each individual name.

**In quick sessions:** This checklist is skippable — but warn the user once: "Found words have an 80-90% validation kill rate without compound alternatives. Want to riff first, or go straight to validation?" Then respect their choice.

**Core checklist (mandatory in deep sessions — apply to each direction):**

Before running, check the `techniques_used` array in `01-candidates.md` frontmatter. If ALL core techniques for the relevant brief type have already been applied to all shortlisted directions during 2c, the checklist is satisfied — don't surface it as a visible step. Just note: "Riffing checklist: all core techniques already applied during riffing. Proceeding to validation." If gaps remain, surface only the unapplied techniques.

**For B2B/enterprise/tech briefs — core checklist:**
- [ ] **SCAMPER** — Substitute, Combine, Adapt, Modify, Eliminate, Reverse
- [ ] **Compound creation** — each root combined with at least 5 different second words
- [ ] **Creative respelling** — Y-for-I, K-for-C, dropped vowels tested on each root
- [ ] **Tech branding patterns** — -OS, -ware, -wise, -er, -base, -box applied to each root

The B2B goal: for every found word on the shortlist, you should have 3-5 compound/coined alternatives ready. When the found word dies in validation (and it probably will), the alternatives are already in the pipeline.

**For consumer/fashion/lifestyle briefs — core checklist:**
Session testing shows the B2B riffing toolkit (compounds, affixes, tech patterns) produces the wrong kind of names for consumer brands and has very low hit rates (~8%). Replace with consumer-appropriate techniques:
- [ ] **Adjacent metaphor** — each shortlisted direction explored via neighboring metaphorical domains (e.g., "collector" → which animals collect? which natural processes gather?)
- [ ] **Sensory expansion** — Five Senses Scan applied to shortlisted directions not yet explored sensorially
- [ ] **Nature mining** — creatures, plants, natural phenomena, geological features explored for each direction
- [ ] **French naturalized vocabulary** — naturalized French words tested across shortlisted directions (see `references/consumer-naming.md`)

The consumer goal: for every shortlisted direction, you should have 3-5 alternatives from adjacent metaphorical or sensory territory. Consumer names survive validation through distinctiveness and cultural resonance, not through compound construction.

**Extended checklist (offer to the user — "Want me to go deeper with additional techniques?"):**
- [ ] **Synonym explosion** — 5-10 synonyms tested for each key root
- [ ] **Systematic affix exploration** — each root run through the full prefix AND suffix library (B2B only)
- [ ] **Language shift** — core concept translated into Latin, Greek, French at minimum
- [ ] **Cross-model ideation** — if not already done, get names from other LLMs (especially productive for consumer briefs)

#### Cycle-back

If the user wants more candidates after reviewing the shortlist, loop back to Loop 2. Generate in the directions they've indicated preference for, then return here.

---

## Loop 4: De-risk

### Model optimization for validation

Validation is factual and parallelizable — it doesn't need the creative reasoning that generation requires. Use smaller/faster models to save tokens and time:

**Subagent spawning for validation (recommended):**
When validating 5+ names, spawn parallel subagents at Haiku tier rather than doing sequential searches with the main model. Each subagent handles one name:

```
For each shortlisted name, spawn a Haiku subagent:
"Search for '[name]' as a company, brand, or software product.
 Classify: Clear (no conflicts) / Flagged (something exists, different industry) / Taken (active conflict in related space).
 Check domains: [name].com, [name].ai, [name].co, [name].io — search site:[name].[tld] for each.
 Return: name, competitive_status, conflicts_found, domain_status_per_tld"
```

This turns 20 minutes of sequential main-model searches into 2-3 minutes of parallel Haiku work. The main model then consolidates results and presents the batched screening table.

**Sidecar model optimization:**
- **Cross-model ideation (2b):** Use `gemini --thinking medium` for creative breadth (high thinking adds latency without proportionally better naming output)
- **Quick conflict checks:** Use `gemini` without `--thinking` flag for fast factual screening
- **Deep review/evaluation:** Use `gemini --thinking high` or `gpt --thinking high` only when analyzing or critiquing

**Session-level model recommendations:**
- **Quick Mode:** Sonnet is sufficient and significantly cheaper than Opus. The compressed pipeline doesn't benefit from Opus's deeper reasoning.
- **Deep Mode:** Opus recommended for best creative output, especially during generation branching and riffing.
- **Validation-heavy sessions:** Run the main session on Sonnet/Opus, spawn Haiku subagents for all screening tasks.

### Validation tools and limitations

**Set up before starting validation.** Web searches are unreliable proxies for domain availability and trademark clearance. Use the right tools:

- **Domain availability:** Check specific TLDs explicitly using `site:[name].[tld]` searches or direct registrar lookups (Namecheap, Cloudflare, GoDaddy). Do NOT say "check name.ai" without actually searching for it — search `site:name.ai` or `"name.ai"` directly. Check `.com`, `.ai`, `.co`, `.io` for every candidate.
- **Trademark search:** [MarkerAPI](https://markerapi.com/) offers text-based USPTO trademark search via REST API (paid). [Apify AI Trademark Conflict Analyzer](https://apify.com/vibexcoder/ai-trademark-conflict-analyzer/api/mcp) provides risk scores and phonetic matching as an MCP server (needs Apify account). The [jordanburke/trademark-mcp-server](https://github.com/jordanburke/trademark-mcp-server) searches by serial/registration number only (not by name) and requires a USPTO API key. For common English words (e.g., "Triage," "Assay"), a trademark attorney is essential for Class 9/42 clearance.
- **Social handles:** Search `x.com/[name]`, `instagram.com/[name]`, and LinkedIn company pages directly.

If no trademark tools are available, use web search proxies (`"[name]" trademark USPTO software`) but note the limitation clearly to the user.

### Validation degradation tiers

Not every session has access to full tooling. Adapt validation depth to what's available:

| Tier | Tools available | What you can do |
|---|---|---|
| **Tier A (Full)** | Web search + domain registrar + trademark API + social search | Full validation pipeline: competitive screen, explicit TLD checks, trademark search, social handle checks |
| **Tier B (Web only)** | Web search only | Competitive screening via web search, domain checks via `site:[name].[tld]` searches, trademark via `"[name]" trademark USPTO` proxies. Note limitations to user. |
| **Tier C (Offline)** | No external tools | Conflict flagging from training data only (⚠️ inline flags). Heuristic risk labeling based on name characteristics (common English words = high risk, compounds = lower risk, coined = lowest risk). Recommend the user do their own domain/trademark checks and provide a checklist. |

Detect your tier at the start of Loop 4 and inform the user: "I have access to [tools]. This means I can [capabilities]. For [gaps], I recommend [workaround]."

### 4a. Competitive Screening

**Reads:** `02-shortlist.md` | **Writes:** `03-validation.md` (created here, updated through 4e)

The inline ⚠️ flagging throughout Loop 2 has already caught conflicts visible in training data. This stage catches what training data missed — recent companies, small competitors, and names that only show up via web search.

Confirm the shortlist with the user: "Here are the [N] names we're taking into validation: [list]. The ⚠️ flags caught some obvious conflicts during generation. Now I'll do web searches to catch anything my training data missed, then check domains, generate variations where needed, screen trademarks, and check social handles. Ready to proceed?"

For each shortlisted name (focusing on those WITHOUT existing ⚠️ flags — flagged names get a lighter check), do a web search:

- Search: `"[name]"` — is there a well-known company or product with this exact name?
- Search: `"[name]" + [industry/category]` — is there a direct competitor using it?

**Consistent search templates:** Define query templates BEFORE starting and apply the same set to every name in the batch. For example: Template A: `"[name]" software company platform`, Template B: `"[name]" [industry] AI`. Do NOT improvise different search variations for different names — inconsistent queries produce inconsistent signal, making results incomparable. If a name warrants deeper investigation after the standard pass, run additional searches, but the baseline must be consistent.

**Categorize each name after this pass:**
- **Clear** — no obvious conflicts found
- **Flagged** — there's something out there with this name but it might not be a conflict (different industry, tiny company, defunct)
- **Taken** — there's a clear, active company/product with this name in a related space

**Resolving "Flagged" names inline:** Include a "Decision" column directly in the competitive screening table for flagged names. Don't present a separate resolution menu — fold it into the same view:

| Name | Status | Conflict | Decision |
|---|---|---|---|
| Siftworks | Clear | — | — |
| Gauge | Taken | Gauge.ai, GaugeOnline | → riff or note for later |
| Headland | Flagged | Headlands Technologies (quant trading) | Proceed / Kill / Defer to attorney? |

Ask the user to mark each flagged name inline. This keeps the flow administrative-light and avoids a separate resolution step.

Report results to the user. **Do NOT remove "Taken" names from the working set.** Move them to a "Taken — available for riffing & deepening" bucket. A taken name that the user loves is a powerful creative signal: it tells you exactly what emotional territory to explore. Use taken names as inputs to:
- **Riffing (2c techniques):** SCAMPER, etymological mining, adjacent metaphors, compound creation, structural shifts
- **Deepening (3a techniques):** Constraint Removal (what if the domain didn't matter — what's the *feeling* you want?), Inversion (what makes this name work — now find something available with the same properties), Six Thinking Hats (evaluate the taken name's strengths systematically, then hunt for available names that hit the same marks)
- **Variation Generation (4c):** prefix/suffix, creative respelling, compound extensions

The goal is to find an *available* name that carries the same energy. Taken names are creative assets, not dead ends.

#### Validation-death trigger (mandatory — batched)
When names die in competitive screening, don't fire a recovery prompt for each one individually. Collect all deaths from the validation round, then present one consolidated recovery menu:

"**[N] names died in this round:**

| Name | Killed by | What made it compelling |
|---|---|---|
| [Name 1] | [conflict] | [energy/quality the user liked] |
| [Name 2] | [conflict] | [energy/quality] |
| ... | ... | ... |

**Which (if any) do you want to riff on?** Pick by number, or:
- (a) **Riff on selected** — I'll generate available alternatives with the same energy
- (b) **Riff on all** — full recovery pass on every dead name
- (c) **Note all for later** — add to taken-but-loved bucket for pool recovery
- (d) **Move on** — work with survivors only"

This turns validation failures into generation triggers while keeping the session flowing.

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
1. **Apply the core riffing techniques** to each taken-but-loved direction (grouped by theme, not individual names):
   - SCAMPER (all 7 lenses)
   - Compound creation (each root × 5+ second words)
   - Creative respelling (Y-for-I, K-for-C, dropped vowels)

   Then ask: "Want me to go deeper with additional techniques?" If yes, escalate to:
   - Synonym explosion (5-10 synonyms per root)
   - Language shift (Latin, Greek, French at minimum)
   - Systematic affix exploration (prefix AND suffix positions)
   - Tech branding patterns (-OS, -ware, -wise, -er, -base, -box)
   - Zoom in/out and adjacent metaphor
   - Lexicon Three-Team method (on-brief, competitor, unrelated domain)
   - Conceptual riffing (TRIZ, First Principles, Analogical Reasoning)
2. **Present riff results to the user for reaction** before validating — let them pick favorites
3. **Re-validate the new candidates before they rejoin the pool:** run them through 4a (competitive screen — including technical project screening if applicable) and 4b (domain check, with explicit TLD searches) → update `03-validation.md`. Only candidates that pass re-enter the active pool alongside the original survivors.

This is a mini-loop, not a full pipeline restart. Pool recovery is often where the BEST names emerge — the taken-but-loved names tell you exactly what emotional territory works, and the full riffing toolkit finds available alternatives in that territory.

#### Loop exit criteria
Recovery loops can amplify churn — each round generates new candidates that need validation, which kills more names, which triggers more recovery. Prevent endless loops:

- **Maximum 3 recovery rounds** before forcing a decision checkpoint: "We've done [N] recovery rounds. We have [M] survivors. Options: (a) proceed to final presentation with these, (b) one more targeted round on a specific direction, (c) step back and reframe the brief."
- **Minimum delta check:** If a recovery round produces fewer than 3 new viable candidates (post-validation), the technique is exhausted. Switch to a different approach or accept the current pool.
- **Explicit stop gate:** After each recovery round, ask: "Continue recovering, or work with what we have?" Don't auto-loop.

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
total_unique_candidates: 87
deduplication_log: ["Meridian generated by Claude + Gemini + GPT", "Triage generated by Claude + Gemini + GPT"]
techniques_used: [evocative_generation, found_word_generation, compound_generation, SCAMPER, synonym_explosion, affix_exploration, Y_for_I_respelling, tech_branding_OS, tech_branding_ware, language_shift_latin, three_team_method]
techniques_not_yet_used: [morphological_analysis, classical_stem_engineering, semiotic_mapping, contrarian_naming, conceptual_blending, backronym, domain_first]
timestamp: ISO-8601
---
```

**Technique accountability:** Update `techniques_used` and `techniques_not_yet_used` after every generation batch. This forces conscious cycling through the full toolkit rather than defaulting to the same 3-4 techniques. When presenting checkpoint menus, reference the unused techniques: "Techniques not yet tried: [list]. Want to apply any before moving on?"

**Deduplication rule:** Maintain a running list of all candidate names in `01-candidates.md`. Before presenting any batch (generation, sidecar merge, riff output), check against the existing list. If a name is a duplicate: (a) note it as independently generated by [source] (valuable validation signal), (b) do NOT present it again to the user as a new candidate. If a near-duplicate exists (e.g., "Siftworks" and "Sift Works"), flag both and let the user decide which form to keep.

**02-shortlist.md:**
```yaml
---
preference_profile:
  preferred_categories: [evocative, found_word]
  disliked_categories: [acronymic, sound_symbolic]
  preferred_directions: [precision_measurement, elevated_view, craft_mastery]
  phonetic_preferences: "V-onset, 2 syllables, trochaic"
  personality_target: "competence + sage"
  user_likes_pattern: "mechanism/action words, institutional compounds, motion/direction"
  user_dislikes_pattern: "warm/soft/contemplative, overly niche/obscure, static/descriptive"
  preferred_suffixes: [-works, -craft, -wise, -ware, -OS]
  preferred_prefixes: [True-, Clear-, Deep-, Iron-, Signal-]
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

The preference profile is critical — it captures taste data from the user's batch-by-batch selections. Build it incrementally during reaction-gathering and use it to sharpen all subsequent generation and riffing. A well-built preference profile makes pool recovery dramatically more productive because you know exactly which compound patterns, phonetic textures, and semantic territories to target.

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

### Artifact save triggers (mandatory)

**Save often enough that a context reset at any point loses at most one round of work.** The artifacts are the session's memory — save aggressively so the user can always pick up where they left off.

- **After each generation batch** (each category presented to the user): update `01-candidates.md`
- **After each user triage/reaction round** (user provides H/W/C or picks favorites): update `01-candidates.md` with preference data
- **After each riff round** (riffs on a direction presented and reacted to): update `01-candidates.md`
- **After cross-model merge** (sidecar or paste-in candidates integrated): update `01-candidates.md`
- **After shortlisting** (user has confirmed favorites): write `02-shortlist.md`
- **After each validation step** (competitive screen, domain check, trademark, social handles): update `03-validation.md`
- **After pool recovery rounds**: update both `01-candidates.md` and `03-validation.md`
- **When context is getting long** (50+ turns, or you notice context compression happening): save everything immediately to all relevant artifacts — they are the authoritative state that survives compression

### Running count (optional — include only when the user needs orientation)

Don't report candidate counts at every transition — it becomes noise. Include a count only when it helps the user orient: after a large generation round, when entering validation, or when the user asks "how many do we have?" If the user seems well-oriented, skip it.

### How artifacts flow

- **Loop 1 (Frame)** → writes `00-brief.md`
- **Loop 2 (Generate: 2a-2c)** → appends to `01-candidates.md` at stage boundaries (this artifact grows; each round adds candidates)
- **Loop 3 (Select: 3a)** → reads `01-candidates.md`, writes `02-shortlist.md` (the clean handoff to validation, including preference profile)
- **Loop 4 (De-risk: 4a-4f)** → reads `02-shortlist.md`, writes `03-validation.md` (updated after EACH validation step, not just at the end), then writes `04-final.md`
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

This skill should flex to the user's needs. The session type determines which stages are mandatory vs. optional:

- **Quick session ("I need 5 name ideas in 10 minutes"):** Use the **Quick Mode Fast Path** below. Skip most ceremony.
- **Deep session ("I want to really get this right"):** Run the full pipeline including 2b cross-model ideation and 2c creative riffing. Riffing checklist is **mandatory** before entering validation. Multiple ideation rounds. Thorough validation. All 5 artifacts.
- **Iterative session ("Let me think about these overnight"):** Save `01-candidates.md` after generation/riffing. When the user returns, read its frontmatter to resume at 3a or 4a.
- **Validation only ("I already have names, just check them"):** User provides names → write directly to `02-shortlist.md` → run Loop 4 (4a-4f). Riffing checklist is **skippable** (the user arrived with names they've already developed).

The user may not use the loop/stage terminology. Read intent from context and jump to the relevant stage. Check for existing artifacts in `brand-namer-output/` to detect where a previous session left off.

### Quick Mode Fast Path

When the user wants speed over thoroughness, strip the pipeline to essentials:

1. **Brief (3 questions only):** What are you naming? Who is it for? Any names you like or hate?
2. **Generate:** 30-40 names across 4-5 categories. Gallery-mode presentation only — no category-by-category expansion unless the user asks. Include ownability-first compounds alongside found words from the start.
3. **React:** User picks favorites from the gallery. One round only.
4. **Light riff:** Quick compound variants on the top picks. No mandatory checklist. No technique menus.
5. **Present:** Top 8-10 names with brief rationale and domain suggestions. No tiered presentation unless there are clear availability differences.

6. **For consumer/sensory products:** Run the **Five Senses Scan** during generation even in quick mode. It takes 30 seconds of structured thinking per sense and consistently produces the session's best candidates for physical products (food, beauty, fashion, home). Don't skip it for speed — it IS the speed technique for consumer naming.
7. **Ownability risk check.** If the shortlist is entirely found words with zero compounds or coined names, flag it: "Your shortlist is all found words — beautiful but high collision risk for domains and trademarks. Want me to generate 2-3 compound alternatives as insurance before you go?" This is especially important in Quick Mode where the user killed compounds early for aesthetic reasons.
8. **Optional: Quick conflict check.** Before closing, offer: "Want me to quick-check your top 2-3 for obvious conflicts? Takes 2 minutes." If yes, run a light competitive screen (web search only) on the user's top picks. This catches the most heartbreaking kills without the full Loop 4 ceremony.

**Skip entirely in quick mode:** Territories (1b), competitive whitespace (1c), session mode selection, cross-model ideation (2b), full riffing checklist, checkpoint menus, deepening techniques, full validation (Loop 4), artifacts (unless requested). No running count, no preference profile compilation, no technique transparency labels.

**Detecting session type:** If the user doesn't state their intent, infer from signals: brief length (sparse = likely quick), tone ("just brainstorm some ideas" = quick; "this is our company name, it needs to be perfect" = deep), and time references. When in doubt, ask: "Would you like a quick brainstorm or a thorough naming engagement?"

### Scenario Playbooks

Beyond session type, certain naming contexts require specific adaptations:

**International-first naming:**
When the primary market is non-English, front-load cross-language checks (don't defer to Loop 4). Favor CVCV structures for global pronounceability (see the CVCV generation technique in `references/naming-categories.md`). Prompt for ALL target languages explicitly — don't assume "international" means the 6 languages in the Cross-Language Pitfalls section. Check the Phonotactic Compatibility table for language-specific constraints.

Distinguish two subtypes:
- **Non-Latin-script markets** (Chinese, Japanese, Korean, Arabic, Hindi): Prioritize Cross-Script/Transliteration testing. Test how the name looks and sounds when transliterated.
- **Latin-script international** (Spanish, Portuguese, French, Indonesian, Vietnamese, Turkish): Key challenges are false cognates, regulatory terminology variation by jurisdiction, tonal language risks (Vietnamese, Thai), and regional slang. Cross-Script testing is less relevant; phonotactic compatibility and cross-language pitfalls are more important.

Deprioritize English-centric techniques (verb-as-brand, Anglo-Saxon compounds). Prompt for per-market competitors, not just global ones.

**Regulated industries (healthcare, finance, legal):**
Load the Regulated-Industry Lexical Compliance section from `references/enterprise-naming.md` BEFORE generation, not during validation. Screen forbidden/controlled terms as a generation constraint, not a validation filter. Names that imply clinical claims, fiduciary status, or regulatory coverage should be flagged during 2a, not caught in 4d.

**Committee/stakeholder naming:**
When multiple decision-makers are involved, adapt the pipeline for group dynamics:

*Brief intake (1a) — capture divergence:*
When personality or taste answers diverge across stakeholders, capture each person's position explicitly. Name the dimensions of disagreement: "We have a 4-7 spread on authority. That tells us the name needs enough weight to satisfy [person A] but enough sharpness to avoid the zone [person B] flags." Use the divergence as territory-definition input, not something to resolve immediately.

*Generation presentation — rotate order:*
Present names in different orders across rounds to counter primacy bias. The first name shown disproportionately influences the most vocal person, who anchors the group.

*Shortlisting — Nominal Group Technique (operationalized):*
1. **Silent scoring:** Each stakeholder scores the shortlist independently (use Semantic Differential Scaling with custom scales relevant to the brief's key tensions). No discussion during scoring.
2. **Round-robin reveal:** Each person shares their top 3 and bottom 3 with brief reasoning. Others listen without debating.
3. **Discussion:** Open discussion on divergence points only — where scores differ by 3+ points on any dimension.
4. **Re-vote:** Each stakeholder re-scores after hearing the discussion. Convergence usually improves.

*Weighted scoring by role:*
The CTO's score on "developer credibility" should carry more weight than the CMO's, and vice versa for "sales-deck impact." Ask the committee to identify which stakeholder is the authority on which dimension, then weight accordingly.

*Deadlock-breaking escalation:*
If the committee is stuck after Semantic Differential + Nominal Group: (a) switch to elimination voting — "Which name would you cut first?" Subtraction is psychologically easier than selection. (b) If still stuck: "Which name would you regret NOT choosing?" This reframe breaks ties by revealing loss aversion.

*Parking lot for side arguments:*
When an intra-committee debate threatens to derail progress (e.g., 5 minutes debating whether "dark" signals sophistication or edginess), flag the disagreement, note it in the artifact, and return to it at the appropriate stage: "Good debate. I've noted this — we'll test it during stress-testing. For now, let's keep the name in the pool."

*Final presentation — tiered with Choice Overload guard:*
Present Tier 1 (max 5 names) as the primary decision space. Research shows decisions degrade past 7-9 options. If the committee can't decide between finalists, reduce via elimination: "Let's cut one at a time. Which goes first?"

**B2B / Enterprise naming:**
Load the **B2B / Enterprise Naming Techniques** from `references/enterprise-naming.md` during brief intake (1a) and shortlisting (3a). Key B2B-specific tests to run on finalists:
- **Buyer Committee test:** Does the name work for the champion, CFO, technical evaluator, AND end users?
- **Sales Conversation Fit:** Test in elevator pitch, board deck, RFP, Slack, phone call, and email signature templates.
- **Stack test:** Write the name alongside the customer's existing tools. Does it look peer-level?
- **Platform vs Point-Solution:** If this is a platform, confirm the name doesn't describe a single function.
- **Acronym Resilience:** How will people shorten it? Do the initials conflict?
- **Enterprise Objection Preemption:** Would a Fortune 500 CISO approve this vendor? Would a VP put it on their LinkedIn?

For developer tools specifically: favor short found words, lowercase convention, CLI-friendly names. Avoid -ify/-ly/-hub suffixes (read as marketing, not engineering).

**Portfolio/product-line naming:**
When naming within an existing brand portfolio, load the Brand Architecture section from `references/naming-techniques.md` during 1a (Brief). Run the naming grammar test on ALL finalists before final presentation — a name that can't extend to features and sub-products will break at scale.

**Dual-audience naming (kids+parents, partners+paralegals, CISOs+engineers):**
When the name must serve two fundamentally different audiences simultaneously, optimize the WORD for the audience that encounters it most frequently (daily users), and let brand system elements (packaging, copy, design, badges) handle the other audience. The managing partner sees the name in a board deck once; the paralegal types it 30 times a day — optimize for the paralegal. The parent reads the ingredient list; the child screams the name in the grocery aisle — optimize for the child. In the brief, capture both audiences explicitly and identify which is the "word audience" vs the "system audience."

**Legacy rename:**
When replacing an existing name, the brief must capture what equity exists in the old name (recognition, trust, search ranking) and what the new name must preserve vs. shed. Apply the Name Lifecycle Stress Test early. Consider bridge strategies (OldName → OldName by NewName → NewName).

**Consumer / culture-heavy brands:**
The reference files include both B2B and consumer examples, but default generation can skew institutional. For consumer brands targeting youth, lifestyle, or cultural audiences: weight generation toward Sound-Symbolic, Jester/Outlaw archetypes, Arbitrary/Absurd Association, and Contrarian naming. Deprioritize Institutional Compounds and Classical Stems. The bar test and podcast test matter more than the trademark search.

Consumer brand examples to anchor on (not to copy, but to calibrate energy): Glossier, Allbirds, Oatly, Liquid Death, Cowshed, Innocent, Lush, Gymshark, Hims, Olipop.

**Fashion/lifestyle note on conflict tolerance:** Fashion brands routinely use names with trademark conflicts in other classes (Acne Studios, Kapital, Diesel, Lush). The naming culture is far more permissive than tech/B2B. For fashion briefs, relax the conflict-flagging anxiety — a name used by a plumbing company is irrelevant. Focus conflict screening on fashion/retail/lifestyle specifically, not the entire trademark universe. Note how many of these are found words, arbitrary associations, sensory dissonance, or contrarian choices — not compounds or classical stems.

**Skip the ownability-first compound track** for fashion, lifestyle, food, and beauty brands. Nobody in streetwear wears "Loamworks." Nobody buys hot sauce called "Bloomcraft." Consumer brands win with single found words, sensory names, arbitrary associations, and contrarian choices — not institutional compounds. The compound track is a B2B survival strategy; for consumer brands it actively damages the output. If validation kills found-word favorites, riff toward creative respelling and alternate real spellings rather than compounds.

For consumer/sensory products, load the **Sensory & Experiential Naming** section from `references/consumer-naming.md` during generation (2a). This includes:
- **Five Senses Scan** — generate names by asking what the product looks/smells/feels/tastes/sounds like
- **Sensory Dissonance** — the Cowshed strategy: invert expected sensory associations for distinctiveness
- **Emotional Temperature Mapping** — warm/cool, heavy/light, energized/calm as generation filters
- **Synaesthetic Naming** — cross-sensory words that activate multiple neural pathways

These techniques are often more productive than conceptual generation for products people physically experience.
