# brand-namer

A Claude Code skill for professional-grade brand naming. Runs a 4-loop cyclable architecture (Frame → Generate → Select → De-risk) with specialized pipelines for consumer and B2B brands — designed to defeat the "LLM averaging" problem where AI defaults to safe, generic, indistinguishable names.

The skill operates from a **senior brand strategist** persona — not a list generator. Creative ambition, structural discipline, and ownability instinct are baked in. The professional standard: if the user walks away saying "these are fine," the session failed.

## Architecture

The skill uses a **step-file architecture** — the execution pipeline is split into 13 self-contained step files, each stating its purpose, what "done" looks like, and the few guardrails that matter for that step, with the reason behind each. The model loads one step at a time, which keeps it from optimizing away the sequence that is the method.

```
SKILL.md              ← Entry point: Role, Philosophy, Reference Loading, Artifacts, Playbooks
workflow.md           ← Router: execution rules with reasons, session routing, menu format, step table
steps/
  step-00 → step-04f  ← 13 step files, loaded one at a time (just-in-time)
```

**At runtime:** Claude reads SKILL.md (global context) → workflow.md (routing + core rules) → current step file only. Previous step files fall out of context. State is carried by artifacts on disk, not conversation memory.

The instructions are written for current Claude models (Opus 5.5 and later): plain statements of what to do and why, rather than the ALL-CAPS enforcement scaffolding earlier models needed. The rules that protect the method are stated once in workflow.md.

## How It Works

```
                           ┌─────────────────────────────────┐
                           │     BRAND NAMER WORKFLOW         │
                           │                                  │
                           │  SKILL.md (global context)       │
                           │  → Role, Philosophy, Artifacts   │
                           │  → Reference Loading, Playbooks  │
                           │                                  │
                           │  workflow.md (router)             │
                           │  → Core rules, with reasons      │
                           │  → Session routing, menu format  │
                           └──────────────┬───────────────────┘
                                          │
                                          ▼
╔═══════════════════════════════════════════════════════════════════════════╗
║  LOOP 1: FRAME                                                          ║
║                                                                         ║
║  ┌──────────────────┐    ┌──────────────────┐    ┌──────────────────┐   ║
║  │  Step 00          │    │  Step 01a         │    │  Step 01b         │  ║
║  │  SESSION START    │───▶│  BRAND BRIEF      │───▶│  TERRITORIES      │  ║
║  │                   │[C] │                   │[C] │  & WHITESPACE     │  ║
║  │  • Detect session │    │  • Naming target   │    │  • 3-5 territories│  ║
║  │  • Resume/Fresh   │    │  • Audience, JTBD  │    │  • Whitespace map │  ║
║  │  • Session type   │    │  • Seeds, taste    │    │  • Explorer/Focus │  ║
║  │  [R] [F] [V] [C]  │    │  [E] [C]           │    │  [A] [D] [R] [C]  │  ║
║  └──────────────────┘    └──────────────────┘    └────────┬─────────┘   ║
╚═══════════════════════════════════════════════════════════════════════════╝
                                                            │ [C]
                                                            ▼
╔═══════════════════════════════════════════════════════════════════════════╗
║  LOOP 2: GENERATE                                                       ║
║                                                                         ║
║  ┌──────────────────┐    ┌──────────────────┐    ┌──────────────────┐   ║
║  │  Step 02a         │    │  Step 02b         │    │  Step 02c         │  ║
║  │  DIVERGENT        │───▶│  CROSS-           │───▶│  CREATIVE         │  ║
║  │  GENERATION       │[X] │  POLLINATION      │[C] │  RIFFING          │  ║
║  │                   │    │                   │    │                   │  ║
║  │  • 6+ categories  │    │  • Prompt for GPT/ │    │  • Linguistic     │  ║
║  │  • 60+ candidates │    │    Gemini/Grok     │    │  • Conceptual     │  ║
║  │  • Tree of Thought│    │  • Merge paste-ins │    │  • Structural     │  ║
║  │  • Gallery Mode   │    │  • Deduplicate     │    │  • Affix/3-Team   │  ║
║  │  • Ownability ≥30%│    │                   │    │  • 10-20+ per dir │  ║
║  │                   │    │  [P] [M] [C]       │    │                   │  ║
║  │  ══ HARD GATES ══ │    └──────────────────┘    │  [R] [G] [X] [C]   │  ║
║  │  □ 60+ candidates │                           └────────┬─────────┘   ║
║  │  □ 6+ categories  │◀──────────── [G] loop back ────────┘             ║
║  │  □ 3+ struct types│                                                   ║
║  │                   │                                                   ║
║  │ [G][X][R][S][A][O]│                                                   ║
║  └──────────────────┘                                                    ║
╚═══════════════════════════════════════════════════════════════════════════╝
                           │ [S] or [C]
                           ▼
╔═══════════════════════════════════════════════════════════════════════════╗
║  LOOP 3: SELECT                                                         ║
║                                                                         ║
║  ┌─────────────────────────────────────────────────────────────────┐     ║
║  │  Step 03a: CONVERGENT SHORTLISTING                              │    ║
║  │                                                                 │    ║
║  │  ┌─ PHASE 1: Entry Checkpoint ──────────────────────────────┐   │    ║
║  │  │  3 hard gate checks → status summary → menu              │   │    ║
║  │  │  [G] Generate  [X] Cross-poll  [R] Riff                 │   │    ║
║  │  │  [S] ▶ Start shortlisting   [O] Other                   │   │    ║
║  │  └──────────────────────────────────────────────────────────┘   │    ║
║  │                          │ [S]                                  │    ║
║  │                          ▼                                      │    ║
║  │  ┌─ PHASE 2: Shortlisting Process ─────────────────────────┐   │    ║
║  │  │  • Batch elimination (10 at a time, keep/cut)            │   │    ║
║  │  │  • Definitions check (top 5-10 picks)                    │   │    ║
║  │  │  • Preference profile built incrementally                │   │    ║
║  │  │  • Full technique menus offered                          │   │    ║
║  │  └──────────────────────────────────────────────────────────┘   │    ║
║  │                          │                                      │    ║
║  │                          ▼                                      │    ║
║  │  ┌─ PHASE 3: Exit Checkpoint ──────────────────────────────┐   │    ║
║  │  │  3 hard gate checks → riffing checklist status → menu    │   │    ║
║  │  │                                                          │   │    ║
║  │  │  ══ RIFFING CHECKLIST (complete or waive) ══             │   │    ║
║  │  │  B2B: □ SCAMPER □ Alternates □ Respelling □ Industry cpds│   │    ║
║  │  │  Consumer: □ Adj metaphor □ Sensory □ Nature □ French    │   │    ║
║  │  │           □ Shelf / Gift / Social-native tests           │   │    ║
║  │  │                                                          │   │    ║
║  │  │  [A] More riffing  [K] Run checklist (incl. alternates)  │   │    ║
║  │  │  [G] Go back   [C] ▶ Continue to validation             │   │    ║
║  │  └──────────────────────────────────────────────────────────┘   │    ║
║  └─────────────────────────────────────────────────────────────────┘     ║
║          │ [A][K] loop within    │ [G] loops to Loop 2                  ║
╚═══════════════════════════════════════════════════════════════════════════╝
                           │ [C]
                           ▼
╔═══════════════════════════════════════════════════════════════════════════╗
║  LOOP 4: DE-RISK                                                        ║
║                                                                         ║
║  ┌──────────────────┐    ┌──────────────────┐    ┌──────────────────┐   ║
║  │  Step 04a         │    │  Step 04b         │    │  Step 04c         │  ║
║  │  COMPETITIVE      │───▶│  DOMAINS &        │───▶│  VARIATION        │  ║
║  │  SCREENING        │[C] │  POOL RECOVERY    │[C] │  GENERATION       │  ║
║  │                   │    │                   │    │                   │  ║
║  │  • Tier detection │    │  • .com .ai .co   │    │  • Prefix/suffix  │  ║
║  │  • Web search     │    │    .io checks     │    │  • Respelling     │  ║
║  │  • Clear/Flag/Take│    │  • Recovery ≤3    │    │  • SCAMPER        │  ║
║  │  • Death trigger   │    │    rounds max     │    │  • Re-screen      │  ║
║  │                   │    │                   │    │                   │  ║
║  │  [A][B][C][D]     │    │  [G] [R] [C]      │    │  [C]              │  ║
║  │  (dead names)     │    │  ↑ loops to L2    │    │                   │  ║
║  └──────────────────┘    └──────────────────┘    └────────┬─────────┘   ║
║                                                           │ [C]         ║
║  ┌──────────────────┐    ┌──────────────────┐    ┌───────▼──────────┐   ║
║  │  Step 04f         │    │  Step 04e         │    │  Step 04d         │  ║
║  │  FINAL            │◀───│  SOCIAL &         │◀───│  TRADEMARK        │  ║
║  │  PRESENTATION     │[C] │  STRESS TESTS     │[C] │  SCREENING        │  ║
║  │                   │    │                   │    │                   │  ║
║  │  • Tier 1/2/3     │    │  • Handle check   │    │  • USPTO/EUIPO    │  ║
║  │  • Quality stats  │    │  • Pre-Mortem     │    │  • Phonetic match │  ║
║  │  • Top 3 recs     │    │  • System 1/2     │    │  • Lo/Med/Hi risk │  ║
║  │  • Challenge if   │    │  • Extended check │    │  • Not legal adv. │  ║
║  │    "fine"         │    │                   │    │                   │  ║
║  │                   │    │  [P][T][X][G][C]  │    │  [G] [C]          │  ║
║  │  [A] [R] [D]      │    └──────────────────┘    └──────────────────┘   ║
║  └────────┬─────────┘                                                    ║
╚═══════════════════════════════════════════════════════════════════════════╝
            │
            ├── [A] Another round ──────▶ Loop back to Loop 2
            ├── [R] Revise brief ───────▶ Loop back to Loop 1
            └── [D] Done ──────────────▶ Save 04-final.md ✓


═══════════════════════════════════════════════════════════════
 EVERY STEP STATES:
 ┌─────────────────────────────────────────────────────────┐
 │  Purpose                        Done when (outcomes)    │
 │  Guardrails, each with its why  Menu + recommendation   │
 │  Progress: N of 13              Wait for the user       │
 └─────────────────────────────────────────────────────────┘
═══════════════════════════════════════════════════════════════
```

### Loop 1: Frame
Understand what you're naming. Define the strategic space before generating anything.

- **Session start** — detect existing artifacts, offer resume or fresh start, determine session type (quick/deep/iterative/validation-only)
- **Brand brief intake** — extract context from existing docs, fill gaps conversationally, confirm exactly what's being named, capture seed words and taste signals
- **Naming territories** — 3-5 distinct creative directions (Tree of Thought pruning) to prevent "100 names in the same vibe"
- **Competitive whitespace** — map how competitors name themselves, identify the empty territory

### Loop 2: Generate
Produce candidates across many naming categories. Breadth before depth.

- **Divergent generation** across 11 naming categories, with ownability-first compound generation running in parallel for B2B briefs (30% compound minimum before gallery presentation) and suppressed for consumer briefs
- **Three independent generation teams** in deep and focused sessions. The first round runs as three isolated subagents in the spirit of Lexicon's three-team method: one names the brand on-brief, one names it as a brand in a more desirable adjacent category and keeps what transfers, one names it as three far-off products (a perfume house, a climbing-gear company, a jazz label) and keeps what transfers. Separate contexts produce genuinely different vocabularies, which one model pretending to branch cannot: in a prototype on a hot-sauce brief, three teams returned 158 unique names, 91% of them absent from a 248-name in-context run of the same brief, and the far-off team overlapped only 3-7% with the others. A "rival" stance was tried for B2B briefs and dropped after it overlapped the on-brief team by 42% on a cybersecurity brief; B2B briefs now use the same three stances, with a second far-off team when the category has no richer neighbor. Names two teams produce independently are flagged as a convergence signal. The main session owns the must-run moves after the teams return, and Hot gallery rows are grouped into named directions before the second wave spawns one agent per direction. Falls back to in-context branching when subagents are unavailable.
- **Hard generation gates** — minimum 60 candidates, 6+ categories, 3+ structural types. The skill holds these before shortlisting; the user can waive them after hearing the consequence.
- **Cross-pollination** — generates paste-ready prompts for ChatGPT/Gemini/Grok, merges results back into the candidate pool. Offered at least once per deep session (user can decline). When no other model is to hand, offers to run the prompt through any multi-model tool in the session, or in a fresh Claude context with a different stance.
- **Creative riffing** with labeled techniques — the user sees WHY each name was generated. Every riff carries a specific technique tag ("language shift: Latin", not just "riff"). Riff counts verify 10+ new unique riffs per direction (duplicates of existing candidates don't count).
- **Must-run moves per brief type** — six generation moves each for consumer and enterprise briefs (Five Senses Scan, Emotional Temperature, Cultural Tension, Desired-Self, Adjacent-Category codes, Arbitrary/Absurd; Vertical Code Calibration, Category Creation, Trust-Without-Claims, integration topology, the compound track, personified names) run as labeled passes in every deep session. Everything else in the reference files is optional.
- **Untried approaches surfaced at each checkpoint** — the skill tracks which creative moves it has made in free-text frontmatter and names the one or two untried approaches most likely to open new territory for this brief, rather than walking a 40-item checklist.
- **User idea capture** — after each batch and at every checkpoint menu, the user is invited to contribute their own names or fragments sparked by the generated candidates. User-contributed names enter the same pipeline (riffing, validation) as AI-generated ones.
- **Gallery mode** — scannable H/W/C grid, then Hot rows expanded and sent to the second wave, then a fixed Warm-and-Cold step so every generated name is seen once and rescues are recorded

### Loop 3: Select
User-directed convergence. The user makes all cuts.

- **Entry checkpoint** with 3 hard gate checks displayed before shortlisting begins, plus the untried approaches worth a round
- **Batch elimination** builds a preference profile incrementally
- **Definitions check** on shortlisted words — etymology as brand story
- **Deepening and evaluation menu** — riffing, deepening, and evaluation techniques offered for the user to choose from
- **Shortlist deliverable contract** — the shortlist has a fixed shape: ranked top five with case and risk, a definition and reason for every name, ownability variants collapsed into one entry, a SMILE/SCRATCH scorecard on the top ten, a pre-mortem on the top five. Blind testing showed this shape moved client verdicts more than the names did.
- **Per-brief-type evaluations shown per name** — consumer: shelf, gift, social-native, price-signal, trend-cycle, badgeability; enterprise: stack test, sales conversation fit, buyer committee, acronym resilience, objection preemption, lifecycle, champion forwardability
- **Enterprise evaluation with visible output** (B2B briefs) — Stack Test, Sales Conversation Fit, Buyer Committee scoring, Acronym Resilience, Enterprise Objection Preemption, Name Lifecycle Stress Test, and Internal-Champion Forwardability produce per-name tables/results, not just metadata claims
- **Exit checkpoint** with 3 hard gate checks + the **riffing checklist** (deep sessions) — displayed with visible `[x]`/`[ ]` status, completed or explicitly waived before validation. B2B checklist: SCAMPER, three to five compound or coined alternates per found-word root (quality, not a quota: a five-per-root rule once added 163 mechanical names to a pool at the last step), creative respelling, industry-native compound patterns. Consumer checklist: adjacent metaphor, sensory expansion, nature mining, French naturalized vocabulary, shelf/gift/social-native tests. The checklist is the one home for compound alternates; the separate "compound alternatives" menu option was merged into it because the two did the same work on B2B briefs.
- **Structural diversity gate** — if shortlist is >80% one type, flagged before validation proceeds

### Loop 4: De-risk
Validate what survives. Riff on what doesn't.

- **Competitive screening** — web search + technical registries (GitHub, npm, PyPI, MCP), run as parallel low-effort Haiku subagents when screening 5+ names
- **Domain availability** — one call to the bundled `scripts/check-domains.sh`: registry WHOIS with the right server per TLD (16 TLDs mapped), RDAP fallback for .app/.dev and anything unmapped, every lookup in parallel, and a markdown grid back in about a second. Catches registered-but-parked domains that web searches miss. Reports Available / Registered / Unknown, and never reads an ambiguous answer as available.
- **Batched death trigger** — when names die, present them in one table and offer riffing options
- **Pool recovery** — killed names become creative seeds, not dead ends (max 3 recovery rounds)
- **Trademark screening, social handles, stress tests** — tiered by available tooling
- **Session quality self-assessment** — transparent stats on candidates generated, categories attempted, approaches used, structural mix
- **Final presentation** — Tier 1 (clear), Tier 2 (caveats), Tier 3 (reference). Lukewarm sentiment challenged proactively.

---

## How the Method Is Held

### Per-step structure

Every step file states:
- **Purpose** — what the step is for, in a sentence or two
- **Done when** — the outcomes that mean the step succeeded
- **Guardrails** — the one to three constraints that matter for this step, each with the reason it exists
- **Menu** — the checkpoint options with a recommendation, then wait for the user

### Core rules (workflow.md)

Stated once, with their reasons:

| Rule | Why |
|---|---|
| Present everything, cut nothing, in numbered batches of ≤15 | Pre-filtering substitutes the model's taste for the user's |
| Number every selectable list | Users refer to names and options by number |
| Recommend at every checkpoint | A menu without a recommendation is paperwork |
| Hold the volume and diversity gates | Thin or homogeneous pools come out of validation nearly empty |
| Offer cross-model ideation once per deep session | Different models have different creative biases |
| Load the step's reference file before generating | The technique depth lives there; generating from memory averages |

### Hard Gates

| Gate | When | Holds if |
|---|---|---|
| **Candidate count** | Loop 2 → 3 transition | < 60 candidates (deep) or < 40 (focused) |
| **Category coverage** | Loop 2 → 3 transition | < 6 of 11 naming categories attempted |
| **Structural diversity** | Loop 2 → 3 AND 3 → 4 | > 80% of candidates/shortlist is one structural type |
| **Compound minimum** (B2B) | Before gallery presentation | < 30% of candidates are compounds/coined/alternatives |
| **Shortlist size** | Loop 3 → 4 transition | < 15 names entering validation |
| **Riffing checklist** | Before Loop 4 | Core riffing moves not applied to shortlisted directions |

When a gate is failing and the user wants to move on, the skill says so once with the likely consequence, recommends the fix, and proceeds if they confirm. Casual "let's move on" is read as a request for the recommended option, confirmed in one line.

---

## Consumer vs Enterprise

The skill auto-detects the brief type and loads only relevant reference files.

### Consumer Brands (food, beauty, fashion, lifestyle, DTC)

**Loaded:** `naming-categories.md` + `consumer-naming.md` + `brand-psychology.md`

Optimized for products people physically experience. Emphasizes sensory naming, emotional resonance, shelf presence, and social shareability. Suppresses the B2B compound-generation track — this applies to ALL compound techniques including Prefix × Suffix Matrix and systematic affix exploration, which produce consumer-appropriate combinations (nature+nature, sensory pairings) rather than institutional compounds. Fashion/lifestyle conflict flagging is relaxed for cross-industry conflicts but still flags same-industry conflicts.

### Enterprise Brands (SaaS, dev tools, platforms, vertical software)

**Loaded:** `naming-categories.md` + `enterprise-naming.md` + `brand-psychology.md`

Optimized for multi-stakeholder procurement. Emphasizes buyer-committee consensus, sales conversation fit, analyst headline readiness, and platform expansion ceiling.

### Both Types

**Loaded additionally for riffing:** `naming-techniques.md` (riffing axes, affixes, respelling, advanced generation)
**Loaded on demand:** `elicitation-techniques.md` (deepening when stuck or stress-testing finalists)

---

## Consumer Naming Techniques (30)

### Sensory & Experiential
| Technique | What it does |
|---|---|
| **Five Senses Scan** | Generate names by asking what the product looks/smells/feels/tastes/sounds like. The #1 technique for consumer naming. |
| **Sensory Dissonance** | Invert expected sensory associations (Cowshed = barnyard for luxury spa). Calibrated gradient: light/medium/heavy. |
| **Emotional Temperature Mapping** | Map names to bodily feelings: warm/cool, heavy/light, energized/calm, rough/smooth. |
| **Synaesthetic Naming** | Cross-sensory words (touch-word for a sound brand, visual-word for a flavor). Activates broader cortical networks. |

### Consumer Elicitation
| Technique | What it does |
|---|---|
| **Mood Board → Name** | Start with visual inputs (images, textures, colors), derive naming direction from the imagery. |
| **Color → Name Mapping** | "What color IS this brand?" — mine color vocabulary for names that carry emotional weight. |
| **Ingredient/Process Mining** | Walk through how you make the product. The maker's vocabulary often contains the best names. |
| **Origin Story Mining** | Mine the founder's personal narrative for names (Patagonia, Warby Parker, Glossier). |
| **Cultural Tension Naming** | Name from the argument the brand enters, not the product it sells (Liquid Death, Oatly). |
| **Ritual / Usage Moment Mapping** | Map when/where/how the customer uses the product. Mine the ritual vocabulary. |
| **Place / Environment Evocation** | "Where does this brand spiritually live?" Mine the vocabulary of that place. |
| **Social-Native Testing** | Hashtag test, handle test, caption test, screenshot-DM test. |
| **Shelf Test** | Imagine the name between competitors on a physical shelf. Which creates the most curiosity gap? |
| **Gift Test** | "Would you feel proud giving this as a gift?" Tests a quality no other test catches. |

### Consumer Strategy
| Technique | What it does |
|---|---|
| **Desired-Self Naming** | Name from the identity the buyer wants to project. "What kind of person buys this?" |
| **Need-State / After-State** | Name the emotional state the buyer wants to enter (Calm, Relief, Glow). |
| **Price-Signal Calibration** | Tune the name's register to match the price point (luxury vs masstige vs value). |
| **Front-of-Pack Hierarchy Fit** | Test the name inside the full packaging stack (name + descriptor + benefit + variant). |
| **Thumbnail / Commerce-Tile Testing** | How does it look in 80-pixel mobile contexts? Amazon tiles, Instacart, TikTok Shop. |
| **Badgeability / Wearability** | Would a customer proudly display this name on a tote bag, hat, or water bottle? |
| **Adjacent-Category Code Borrowing** | Borrow naming codes from a more desirable category (fragrance for skincare, spirits for non-alc). |
| **Subculture Code-Switch** | Mine vocabulary from specific scenes (sneaker, natural wine, wellness, skate). |
| **Trend-Cycle Audit** | Will this name still work in 5 years, or is it trend-dependent? |
| **Semantic Polysemy** | Design names that mean different things to different audiences ("Culture" = bacterial + good taste). |
| **Relational / Cousin Naming** | Product family names that share DNA without being identical (Bumble → Bizz, BFF). |
| **Memetic / Viral Engineering** | Names designed to be inherently shareable/screenshot-worthy. Kids/family variant included. |
| **Co-Created Naming** | Community votes on or contributes to naming (flavors, limited editions, seasonal drops). |
| **Consumer Portfolio Grammar** | SKU naming rules for flavors, scents, drops, collabs (Le Labo's Santal 33 system). |
| **Story-World / Lore-Seeding** | Can the name spawn campaigns, characters, rituals, limited editions, in-jokes? |
| **Distinctive-Asset Seeding** | Can the name generate icons, mascots, monograms beyond the wordmark? |

### Specialized
| Technique | What it does |
|---|---|
| **Japanese Sound-Symbolism** | Gitaigo vocabulary by sensory domain, half-form naming, CVCV filtering, authenticity calibration. |
| **Age-Gated Pronounceability** | Stricter phonetic constraints for products targeting children under 8. |

---

## B2B / Enterprise Naming Techniques (15)

| Technique | What it does |
|---|---|
| **Buyer Committee Naming** | Score names across champion, economic buyer, technical evaluator, and end users. One veto kills the name. |
| **Category Creation Naming** | When defining a new space, the name must be distinctive enough to anchor the category. |
| **Sales Conversation Fit** | Test in elevator pitch, board deck, RFP, Slack, phone call, and email signature templates. |
| **Integration / Ecosystem Naming** | Stack test: does the name look peer-level alongside Snowflake + Databricks + AWS? |
| **Analyst / Press Headline Testing** | "Gartner names [Name] a Leader in..." — does it carry authority? |
| **Enterprise Objection Preemption** | The CISO test: would a Fortune 500 CISO approve this vendor? The resume test: would a VP put it on LinkedIn? |
| **Platform vs Point-Solution** | If you add a completely different product in 2 years, does the name still work? |
| **Developer / Technical Credibility** | CLI-friendly, lowercase-OK, no -ify/-ly suffixes. Stripe/Vercel energy vs Accenture energy. |
| **Acronym Resilience** | What initials does the name produce? Do they conflict with generic acronyms? |
| **Partner / Channel Grammar** | "[Name] Certified Partner," "[Name] for Healthcare," "Built on [Name]" — does it compound well? |
| **Internal-Champion Forwardability** | Would a champion feel smart forwarding this name in Slack to their VP? |
| **Integration Topology Naming** | Mine connection vocabulary (mesh, relay, conduit, splice) when the product IS interoperability. |
| **Trust-Without-Claims Lexicon** | Signal trust without over-claiming (attest, verify, clear — not guarantee, secure, shield). |
| **Governance / Audit Vocabulary Mining** | Mine controls, attestation, evidence, lineage, policy for GRC and compliance products. |
| **Vertical Code Calibration** | Each vertical (fintech, healthtech, legaltech, cybersecurity, proptech, HR, devtools) has distinct naming norms. |

---

## Core Generation Techniques

### The 11 Naming Categories

| Category | What it is | Examples |
|---|---|---|
| **Evocative** | Suggests feeling/quality without describing the product | Nike, Amazon, Patagonia |
| **Invented / Coined** | New words from Latin/Greek/morphemic roots | Xerox, Kodak, Verizon |
| **Lexical Blends** | Two words fused with overlapping sounds | Pinterest, Instagram, Shopify |
| **Metaphorical** | Borrowed from an entirely different domain | Jaguar, Caterpillar, Slack |
| **Descriptive** | Directly communicates what it does | PayPal, Booking.com |
| **Found Word** | Real dictionary words repurposed | Stripe, Notion, Bench |
| **Foreign-Root** | Non-English words carrying meaning | Audi, Volvo, Lego |
| **Acronymic** | Initials or abbreviated phrases | IKEA, BMW, ASICS |
| **Compound** | Two complete words joined (5 sub-types: Action+Object, Domain+Function, Metaphorical, Stacking, Verb+Noun) | Salesforce, Dropbox, CrowdStrike |
| **Sound-Symbolic** | Engineered for phonetic feel | Google, TikTok, Zoom |
| **Institutional Compound** | Finance/enterprise compound pattern | BlackRock, Benchmark, Cornerstone |

### Additional Generation Angles

| Angle | What it does | Examples |
|---|---|---|
| **Personified Names** | Human names as brands — instant warmth, conversational | Claude, Alexa, Oscar, Ada, Harvey |
| **Founder / Surname** | Founder's name becomes the brand — heritage, authority, accountability. 6 sub-patterns: surname-only, first+last, possessive ('s), title+name, two founders, fictional founder | Chanel, Ford, McDonald's, Dr. Martens, Dolce & Gabbana |
| **Toponym / Place-Name** | Geographic places as brands — borrows cultural associations. Sub-patterns: literal origin, aspirational, ironic, country-as-modifier | Patagonia, Arizona, Corona, San Pellegrino |
| **Multi-Word Phrase** | Full grammatical phrases as names — micro-stories with built-in attitude. Growing fast in DTC/challenger. | Youth to the People, Who Gives a Crap, Rent the Runway |
| **Numeric / Alphanumeric** | Numbers as structural name elements — globally readable, encode meaning | 7UP, Five9, 6sense, Auth0, H2O.ai |
| **Motion & Direction** | Movement, navigation, momentum — forward-looking energy | Stride, Vector, Bearing, Surge, Arc |
| **Arbitrary / Absurd Association** | Zero logical connection to the product — maximum distinctiveness | Apple, Cowshed, Diesel, Penguin, Egg |
| **Verb-as-Brand** | Action verbs as names — the brand is something you DO | Slack, Kindle, Bolt, Drift, Zoom |
| **Contrarian / Anti-Category** | Name deliberately against category conventions — strategic plainness | Bench, Basecamp, Linear, Notion |

### Obscure Real Word Mining

Mine specialized vocabularies where nobody in tech is looking. 18 domains covered:

| Domain | Example words |
|---|---|
| **Metallurgy** | Cupel, Anneal, Smelt, Temper, Crucible |
| **Watchmaking** | Escapement, Mainspring, Calibre, Complication |
| **Maritime** | Sounder, Keelson, Leadline, Bollard, Capstan |
| **Textiles** | Selvedge, Warp, Weft, Nap, Bobbin |
| **Architecture** | Lintel, Quoin, Plinth, Cupola, Spandrel |
| **Cartography** | Azimuth, Meridian, Isoline, Northing, Benchmark |
| **Geology** | Stratum, Basalt, Skarn, Moraine, Alluvium |
| **Optics** | Darkfield, Aperture, Parallax |
| **Chemistry** | Alembic, Retort, Calcine, Assay |
| **Astronomy** | Fornax, Zenith, Transit, Apogee |
| **Culinary** | Umami, Zest, Ferment, Proof, Cask |
| **Biology** | Mycelium, Spore, Biome, Rhizome |
| **Audio** | Chorus, Reverb, Tempo, Timbre, Cadence |
| **Printing** | Colophon, Imprint, Folio, Quarto |
| **Forestry** | Heartwood, Cambium, Coppice, Canopy |
| **Glassmaking** | Cullet, Anneal, Flux, Gather, Pontil |
| **Locksmithing** | Ward, Tumbler, Lever, Escutcheon |
| **Geophysics** | Torrent, Vortex, Kinetic, Tectonic |

---

## Riffing & Transformation Techniques

| Technique | What it does |
|---|---|
| **8 Riffing Axes** | Root compression, etymology, metaphor shift, outcome shift, sensory shift, sound tuning, language shift, structural shift |
| **Productive Affixes** | 11 prefixes, 16 suffixes, 9 bidirectional affixes systematically tested in both positions |
| **Creative Respelling** | K-for-C, Y-for-I, dropped vowels, Ph-for-F, double letters |
| **Alternate Real Spellings** | Dictionary-valid variants (Gauge → Gage) |
| **Industry-Native Compound Patterns** | Dynamic generation of compound elements from the brief's vertical (tech: -OS, -ware, -kit; fashion: Studio, House, Atelier; finance: Capital, Partners; etc.) |
| **Prefix × Suffix Matrix** | Systematic crossing of 6+ prefixes with 10+ suffixes |
| **Classical Stem Engineering** | Systematic Greek/Latin root construction with cliche detection |
| **Semiotic Territory Mapping** | Map meaning-system quadrants before generation |
| **Conceptual Blending** | Blend mental models, not just syllables (Fauconnier & Turner) |
| **Morphological Analysis (Zwicky)** | Systematic combinatorial generation across dimensions |
| **Lexicon Three-Team Method** | On-brief, competitor, unrelated-domain teams generating simultaneously |
| **Truncation / Clipping** | Clip a real word to create shorter, ownable variant — preserves phonetic connection to source | Brex, Deel, Navan, Phenom, Pendo |
| **[Brand] AI Suffix** | Append " AI" to a strong base name — clarifies positioning for AI products (distinct from AI-embedded naming) | Scale AI, Mistral AI, Together AI |
| **Lowercase / Casing Strategy** | Typographic casing as naming decision — all-lowercase, camelCase, CLI-native. Signals "built by engineers." | dbt, vercel, mParticle, nCino |
| **ccTLD Domain Hacks** | TLD completes the word — 12 ccTLDs (.ly, .io, .ai, .is, .us, .me, .al, .it, .co, .so, .er, .to) with generation technique | bit.ly, vend.ly, geni.us, foc.us, stud.io |

---

## Evaluation & Testing

| Technique | What it does |
|---|---|
| **SMILE / SCRATCH** | Rapid pass/fail on Suggestive, Memorable, Imagery, Legs, Emotional / Spelling, Copycat, Restrictive, Annoying, Tame, Curse, Hard-to-pronounce |
| **Semantic Differential Scaling** | Score on bipolar attribute pairs (modern↔traditional, precise↔creative) |
| **Phonotactic Probability Scoring** | Friction score for pronounceability across languages |
| **Speech & Channel Robustness** | Voicemail, podcast, phone support, voice assistant, homophone tests |
| **Searchability & AI Retrieval** | Google branded search, app stores, LLM retrieval, voice resolution |
| **Bouba-Kiki Effect** | Sound-shape-personality mapping for phonetic engineering |
| **Distinctiveness Distance Modeling** | Levenshtein/Soundex/embedding similarity to competitors |
| **Implicit Association Testing** | Fast reaction-time tasks reveal subconscious name associations |
| **Recall & Recognition Protocols** | 24h delayed recall, aided recognition, confusion checks |
| **Visual Wordform Analysis** | Letter silhouette, ascender/descender rhythm, favicon potential |

---

## Session Modes

| Mode | What happens | When to use |
|---|---|---|
| **Quick** | 3-question brief → gallery → react → light riff → present top 8-10. Skip ceremony. | "Just give me good names" |
| **Deep** | Full 13-step pipeline with enforcement gates, riffing checklist, cross-pollination, thorough validation. | "This is our company name, get it right" |
| **Committee** | Semantic Differential Scaling, Nominal Group Technique, weighted scoring by role. | Multiple stakeholders who disagree |
| **Validation only** | User provides names → straight to Loop 4 screening. | "I already have names, just check them" |
| **Iterative** | Save artifacts, sleep on it, resume next session. | "Let me think about these overnight" |

## Scenario Playbooks

Built-in adaptations for: **International-first** (CVCV, cross-language, transliteration), **Regulated industries** (controlled terms pre-screened before generation), **Committee/stakeholder**, **Portfolio/product-line**, **Legacy rename**, **Consumer/lifestyle**, **B2B/enterprise**, **Dual-audience** (kids+parents, partners+paralegals).

---

## Artifact Chain

5 structured artifacts with YAML frontmatter carry state across steps and sessions:

```
brand-namer-output/
├── 00-brief.md          # Brand brief + territories + whitespace + session config
├── 01-candidates.md     # ALL candidates (grows through generation, cross-model, riffs)
├── 02-shortlist.md      # Favorites entering validation + preference profile
├── 03-validation.md     # Competitive + domain + trademark + social results
└── 04-final.md          # Tier 1/2/3 presentation + recommendations
```

Each artifact's frontmatter includes `stepsCompleted` for session resumption. Step 00 detects existing artifacts and offers to resume from the last completed step.

---

## File Structure

```
brand-namer/
├── .claude-plugin/
│   └── plugin.json                         (plugin manifest — name, version, author, keywords)
├── skills/brand-namer/
│   ├── SKILL.md                            (role, philosophy, reference loading, artifacts, playbooks)
│   ├── workflow.md                         (execution rules with reasons, session routing, menu format, step table)
│   ├── steps/
│   │   ├── step-00-session-start.md        (session detection, resume handler)
│   │   ├── step-01a-brief.md              (brand brief intake)
│   │   ├── step-01b-territories.md        (territories, whitespace, session mode)
│   │   ├── step-02a-generation.md         (divergent generation, hard gates, user idea capture)
│   │   ├── step-02b-cross-pollination.md  (cross-model ideation)
│   │   ├── step-02c-riffing.md            (creative riffing, technique library, user idea capture)
│   │   ├── step-03a-shortlisting.md       (shortlisting, checkpoints, riffing checklist)
│   │   ├── step-04a-screening.md          (competitive screening, parallel validation subagents)
│   │   ├── step-04b-domains.md            (domain availability via WHOIS/RDAP, pool recovery)
│   │   ├── step-04c-variations.md         (variation generation)
│   │   ├── step-04d-trademark.md          (trademark screening)
│   │   ├── step-04e-social.md             (social handles, stress tests)
│   │   └── step-04f-final.md              (final tiered presentation)
│   └── references/
│       ├── naming-categories.md           (734 lines — 11 categories, 9 cross-cutting angles, phonesthetics, cross-language)
│       ├── naming-techniques.md           (764 lines — riffing, affixes, respelling, truncation, casing, advanced generation)
│       ├── consumer-naming.md             (694 lines — sensory, experiential, consumer strategy)
│       ├── enterprise-naming.md           (427 lines — B2B techniques, evaluation, compliance)
│       ├── brand-psychology.md            (431 lines — archetypes, personality, cognitive science)
│       └── elicitation-techniques.md      (324 lines — 10 deepening techniques)
│   └── scripts/
│       └── check-domains.sh               (WHOIS/RDAP domain availability grid)
├── README.md                               (this file)
└── CLAUDE.md                               (project conventions)
```

Step files are loaded one at a time. Reference files are loaded on-demand based on brief type.

## Installation

### Option 1: Plugin marketplace (recommended)

```bash
# Add the marketplace
/plugin marketplace add ellisjr/brand-namer

# Install the plugin
/plugin install brand-namer
```

### Option 2: Clone from GitHub

```bash
# Clone as a plugin (user-level — available in all projects)
git clone https://github.com/ellisjr/brand-namer.git ~/.claude/plugins/brand-namer

# Or project-level (available in this project only)
git clone https://github.com/ellisjr/brand-namer.git .claude/plugins/brand-namer
```

### Verify installation

Claude Code auto-detects plugins by their `.claude-plugin/plugin.json` manifest. Once installed, the skill triggers when you mention naming, brand names, company names, product names, or "what should I call this." You can also invoke it directly:

```
/brand-namer
```

## Usage Examples

```
"I need a name for my AI startup"
"Help me name this craft hot sauce brand"
"We need a name for our enterprise security platform"
"I have 5 names — just validate them"
"What should I call this open source tool?"
"We're 3 co-founders who can't agree on a name"
```

## Research & Frameworks Integrated

Lexicon Branding (Placek), Aaker Brand Personality, Mark & Pearson 12 Archetypes, Sound Symbolism (Kohler, Ramachandran, Sapir), Bouba-Kiki Effect, Processing Fluency (Alter & Oppenheimer), Von Restorff Distinctiveness, Mere Exposure (Zajonc), Dual Coding (Paivio), Cognitive Chunking (Miller), Kahneman System 1/2, Fauconnier & Turner Conceptual Blending, Zwicky Morphological Analysis, Rosch Prototype Theory, Iyengar Choice Overload, Osgood Semantic Differential, TRIZ Contradiction Resolution, Christensen Jobs-to-be-Done, Watkins SMILE/SCRATCH.

## Cross-Pollination

The skill generates paste-ready prompts for ChatGPT, Gemini, and Grok to get naming candidates from different creative perspectives. The user pastes results back and the skill deduplicates, classifies, and merges them into the candidate pool. Each model has different biases — ChatGPT trends toward punchy consumer names, Gemini toward systematic foreign-root exploration, Grok toward irreverent breaks. Cross-pollination is offered at least once per deep session (mandatory offer, optional execution).

## Eval Results

Tested across 6 diverse briefs (3 consumer: hot sauce, streetwear, men's skincare; 3 enterprise: cybersecurity, data integration, legaltech) with 135+ assertions per iteration. 4 iterations of eval-driven improvement:

| Iteration | Pass Rate | Key Change |
|---|---|---|
| **Iter-1** (baseline) | 97.7% (127/130) | Initial eval — 3 minor failures (Shelf Test tracking, SCAMPER application) |
| **Iter-2** (first full eval) | 83.8% (109/130) | Added baselines + stricter assertions. Exposed technique coverage gaps + eval design issues |
| **Iter-3** (technique toolkit) | 93.3% (126/135) | Added technique toolkit with [A] all option. Legaltech: 52% → 100%. Streetwear: 85% → 95% |
| **Iter-4** (naming precision) | 91.2% (124/136) | Fixed compound leakage, conflict flagging, visible enterprise output. Remaining failures are technique naming precision |
| **Iter-5** (1.1 rework, Opus executors) | 84.9% (135/159) vs 1.0.0 at 94.3% | Register trim, three-team generation, and removal of the technique toolkit. Lost the blind shortlist comparison 0/6 to 1.0.0; the gap was deliverable structure the toolkit had forced |
| **Iter-6** (shortlist contract + must-runs) | 95.6% (152/159) vs 1.0.0 at 94.3% | Restored the shortlist deliverable shape and six must-run moves per brief type as positive contracts. Won the blind comparison 6/6 (mean 8.67 vs 7.07); content 4.20 vs 4.03, structure 4.46 vs 3.02 |
| **Iter-7** (iteration-6 open items) | 96.6% (57/59) on the two briefs rerun | Dropped the B2B rival stance (second-team overlap 42% → 12%), cut the checklist quota (163 → 39 late names on cybersecurity), main session owns the must-runs, Hot rows grouped into directions, [B] merged into [K], scripted anti-pattern check and a 15-20-direction check added to the evals. Won both blind pairings (8.7 vs 6.6 hot sauce, 8.75 vs 5.65 cybersecurity) |

From iteration 5 the eval runs on Opus at high effort for both arms, with a 1.0.0 snapshot as the baseline, Sonnet graders, and Opus blind comparators judging each pair of shortlists under a fresh random A/B mapping. The blind comparison is the quality measure; assertions check process.

**What the skill produces** (iteration-6 and -7 with-skill runs):
- 360-555 unique candidate names per deep session, from three isolated generation teams, a second wave on the user's Hot directions, the must-run passes, riffing, and the riffing checklist (39-61 alternates since iteration 7, down from 163)
- 8-10 of 11 naming categories attempted
- 60-70 riffs across 5-6 directions with specific technique labels
- A 20-direction shortlist in the deliverable shape: ranked top five with case and risk, definition and reason per name, variants collapsed, SMILE/SCRATCH scorecard, pre-mortem, per-brief-type evaluations
- Full YAML-frontmatter artifacts for session resumption

**Cost:** a deep session through shortlisting runs about 1.15-1.35M tokens and about 30 minutes on Opus, roughly a third in the main session and the rest in the generation teams and the second wave (four or five agents since iteration 7). The skill optimizes for thoroughness and divergence, not speed; economize only on request, by lowering effort rather than dropping a team.

## License

MIT
