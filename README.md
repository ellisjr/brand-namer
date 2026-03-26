# brand-namer

A Claude Code skill for professional-grade brand naming. Runs a 4-loop cyclable architecture (Frame → Generate → Select → De-risk) with specialized pipelines for consumer and B2B brands — designed to defeat the "LLM averaging" problem where AI defaults to safe, generic, indistinguishable names.

The skill operates from a **senior brand strategist** persona — not a list generator. Creative ambition, structural discipline, and ownability instinct are baked in. The professional standard: if the user walks away saying "these are fine," the session failed.

## Architecture

The skill uses a **BMAD-METHOD-style step-file architecture** — the execution pipeline is split into 13 self-contained step files, each with its own enforcement rules, success metrics, and failure definitions. This prevents the LLM from "peeking ahead" and optimizing away steps.

```
SKILL.md              ← Entry point: Role, Philosophy, Reference Loading, Artifacts, Playbooks
workflow.md           ← Enforcement router: MANDATORY RULES, SYSTEM FAILURE defs, step routing
steps/
  step-00 → step-04f  ← 13 step files, loaded one at a time (just-in-time)
```

**At runtime:** Claude reads SKILL.md (global context) → workflow.md (routing + enforcement) → current step file only. Previous step files fall out of context. State is carried by artifacts on disk, not conversation memory.

## How It Works

```
                           ┌─────────────────────────────────┐
                           │     BRAND NAMER WORKFLOW         │
                           │                                  │
                           │  SKILL.md (global context)       │
                           │  → Role, Philosophy, Artifacts   │
                           │  → Reference Loading, Playbooks  │
                           │                                  │
                           │  workflow.md (enforcement)        │
                           │  → 10 SYSTEM FAILURE definitions │
                           │  → HALT / Waiver / Redisplay     │
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
║  │  □ technique cycle │                                                  ║
║  │                   │                                                   ║
║  │ [G][X][R][S][O]   │                                                   ║
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
║  │  │  4 hard gate checks → status summary → menu              │   │    ║
║  │  │  [A] Generate  [B] Cross-poll  [C] Riff  [D] Deepen     │   │    ║
║  │  │  [E] ▶ Enter shortlisting   [F] Other                   │   │    ║
║  │  └──────────────────────────────────────────────────────────┘   │    ║
║  │                          │ [E]                                  │    ║
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
║  │  │  ══ RIFFING CHECKLIST (BLOCKING) ══                      │   │    ║
║  │  │  B2B: □ SCAMPER □ Compounds □ Respelling □ Industry cpds │   │    ║
║  │  │  Consumer: □ Adj metaphor □ Sensory □ Nature □ French    │   │    ║
║  │  │           □ Shelf / Gift / Social-native tests           │   │    ║
║  │  │                                                          │   │    ║
║  │  │  [A] More riffing  [B] Compound alts  [C] Run checklist  │   │    ║
║  │  │  [D] ▶ Proceed to validation   [E] Go back              │   │    ║
║  │  └──────────────────────────────────────────────────────────┘   │    ║
║  └─────────────────────────────────────────────────────────────────┘     ║
║          │ [A]-[C] loop within │ [E] loops to Loop 2                    ║
╚═══════════════════════════════════════════════════════════════════════════╝
                           │ [D]
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
 EVERY STEP ENFORCES:
 ┌─────────────────────────────────────────────────────────┐
 │  📖 MANDATORY EXECUTION RULES    ✅ SUCCESS METRICS     │
 │  🚫 FAILURE MODES                🛑 HALT at every menu  │
 │  🔄 Chat-then-redisplay          📊 Progress: N of 13   │
 │  ⚖️  Master Rule                  💡 Recommendation req'd│
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

- **Divergent generation** across 11 naming categories with **mandatory** ownability-first compound generation in parallel (30% compound minimum before gallery presentation)
- **Tree of Thought branching** — mandatory in deep/focused sessions. Every category generates 3 parallel branches from different semantic domains, evaluates internally, expands the strongest, and prunes the weakest. Prevents the convergence trap where all names come from the same mental neighborhood.
- **Hard generation gates** — minimum 60 candidates, 6+ categories, 3+ structural types, technique cycling check. These are blocking — the skill won't proceed to shortlisting until met or explicitly waived. Technique saturation threshold at 25+ techniques applied.
- **Cross-pollination** — generates paste-ready prompts for ChatGPT/Gemini/Grok, merges results back into the candidate pool. Mandatory offer (user can decline).
- **Creative riffing** with labeled techniques — the user sees WHY each name was generated. Every riff must have a SPECIFIC technique tag ("language shift: Latin", not just "riff"). Riff counts verify 10+ NEW UNIQUE riffs per direction (duplicates of existing candidates don't count).
- **Technique Toolkit** — at every checkpoint (generation, riffing, shortlisting), the skill displays all available techniques with applied/unapplied status. Users can select individual techniques by number, [A] all remaining, or [C] skip. Unapplied techniques resurface at every subsequent checkpoint until used or skipped. This ensures techniques like Desired-Self Naming, Trend-Cycle Audit, and Morphological Analysis don't get silently skipped.
- **User idea capture** — after each batch and at every checkpoint menu, the user is invited to contribute their own names or fragments sparked by the generated candidates. User-contributed names enter the same pipeline (riffing, validation) as AI-generated ones.
- **Gallery mode** — scannable H/W/C grid before diving into category-by-category expansion

### Loop 3: Select
User-directed convergence. The user makes all cuts.

- **Entry checkpoint** with 4 hard gate checks displayed before shortlisting begins + technique toolkit resurfacing unapplied techniques
- **Batch elimination** builds a preference profile incrementally
- **Definitions check** on shortlisted words — etymology as brand story
- **Technique toolkit** carried forward from earlier steps — any unapplied techniques offered again
- **Enterprise evaluation with visible output** (B2B briefs) — Stack Test, Sales Conversation Fit, Buyer Committee scoring, Acronym Resilience, Enterprise Objection Preemption, Name Lifecycle Stress Test, and Internal-Champion Forwardability must all produce per-name tables/results, not just metadata claims
- **Exit checkpoint** with 3 hard gate checks + **blocking riffing checklist** (deep sessions) — displayed with visible `[x]`/`[ ]` status, must be completed or explicitly waived before validation. B2B checklist: SCAMPER (enforced even at high technique counts), compound creation, creative respelling, industry-native compound patterns. Consumer checklist: adjacent metaphor, sensory expansion, nature mining, French naturalized vocabulary, shelf/gift/social-native tests.
- **Structural diversity gate** — if shortlist is >80% one type, flagged before validation proceeds

### Loop 4: De-risk
Validate what survives. Riff on what doesn't.

- **Competitive screening** — web search + technical registries (GitHub, npm, PyPI, MCP)
- **Domain availability** — definitive registration checks via WHOIS CLI (14-TLD server map, pre-installed on macOS, zero setup) with RDAP fallback for .app/.dev. Catches registered-but-parked domains that web searches miss. Parallel batch checking for 20-50 domains in under 2 seconds. Three-tier status: Available / Registered (parked/for-sale) / Active (live website).
- **Batched death trigger** — when names die, present them in one table and offer riffing options
- **Pool recovery** — killed names become creative seeds, not dead ends (max 3 recovery rounds)
- **Trademark screening, social handles, stress tests** — tiered by available tooling
- **Session quality self-assessment** — transparent stats on candidates generated, categories attempted, techniques applied, structural mix
- **Final presentation** — Tier 1 (clear), Tier 2 (caveats), Tier 3 (reference). Lukewarm sentiment challenged proactively.

---

## Enforcement Infrastructure

### Per-Step Enforcement (BMAD Pattern)

Every step file contains its own:
- **MANDATORY EXECUTION RULES** — with emoji severity markers (📖 must do, 🚫 forbidden)
- **SUCCESS METRICS** — what "done" looks like for that step
- **FAILURE MODES** — explicit anti-patterns marked CRITICAL
- **HALT instruction** — after every menu: "HALT — wait for user selection before proceeding."
- **Chat-then-redisplay** — if the user asks a question mid-menu, answer it, then re-display the menu
- **Master Rule** — repeated at the bottom of every step file

### System Failure Definitions (workflow.md)

10 explicit definitions of what constitutes a system failure:

| # | Failure |
|---|---------|
| 1 | Auto-advancing past menus without user selection |
| 2 | Loading next step without user selecting [C] Continue |
| 3 | Silently dropping or pre-filtering candidates |
| 4 | Entering shortlisting with <40 candidates without explicit waiver |
| 5 | Generating names without reading the referenced technique file |
| 6 | Presenting more than 15 candidates in a single batch |
| 7 | Presenting a selectable list without reference numbers |
| 8 | Skipping the cross-pollination offer in deep sessions |
| 9 | Presenting a checkpoint menu without a recommendation |
| 10 | Treating "let's move on" as a menu selection instead of re-displaying |

### Hard Gates

| Gate | When | Blocks if |
|---|---|---|
| **Candidate count** | Loop 2 → 3 transition | < 60 candidates (deep) or < 40 (focused) |
| **Category coverage** | Loop 2 → 3 transition | < 6 of 11 naming categories attempted |
| **Structural diversity** | Loop 2 → 3 AND 3 → 4 | > 80% of candidates/shortlist is one structural type |
| **Technique cycling** | Loop 2 → 3 transition | > 8 creative techniques unused (saturation: 25+ applied = gate satisfied) |
| **Compound minimum** | Before gallery presentation | < 30% of candidates are compounds/coined/alternatives |
| **Shortlist size** | Loop 3 → 4 transition | < 15 names entering validation |
| **Riffing checklist** | Before Loop 4 | Core riffing techniques not applied to shortlisted directions |

All gates can be waived by the user after being warned — but the skill requires explicit confirmation ("proceed anyway"), not casual language ("let's move on").

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
├── SKILL.md                                (425 lines — role, philosophy, reference loading, artifacts, playbooks)
├── workflow.md                             (124 lines — enforcement rules, system failures, step routing)
├── steps/
│   ├── step-00-session-start.md            (134 lines — session detection, resume handler)
│   ├── step-01a-brief.md                   (139 lines — brand brief intake)
│   ├── step-01b-territories.md             (123 lines — territories, whitespace, session mode)
│   ├── step-02a-generation.md              (323 lines — divergent generation, hard gates, technique toolkit, gallery mode, user idea capture)
│   ├── step-02b-cross-pollination.md       (97 lines — cross-model ideation)
│   ├── step-02c-riffing.md                 (211 lines — creative riffing, technique library, riff verification, user idea capture)
│   ├── step-03a-shortlisting.md            (331 lines — shortlisting, checkpoints, riffing checklist, enterprise evaluation)
│   ├── step-04a-screening.md               (164 lines — competitive screening, validation setup)
│   ├── step-04b-domains.md                 (180 lines — domain availability via WHOIS/RDAP, pool recovery)
│   ├── step-04c-variations.md              (69 lines — variation generation)
│   ├── step-04d-trademark.md               (70 lines — trademark screening)
│   ├── step-04e-social.md                  (106 lines — social handles, stress tests)
│   └── step-04f-final.md                   (101 lines — final tiered presentation)
├── README.md                               (this file)
├── CLAUDE.md                               (project conventions)
└── references/
    ├── naming-categories.md                (734 lines — 11 categories, 9 cross-cutting angles, phonesthetics, cross-language)
    ├── naming-techniques.md                (764 lines — riffing, affixes, respelling, truncation, casing, advanced generation)
    ├── consumer-naming.md                  (694 lines — sensory, experiential, consumer strategy)
    ├── enterprise-naming.md                (427 lines — B2B techniques, evaluation, compliance)
    ├── brand-psychology.md                 (431 lines — archetypes, personality, cognitive science)
    └── elicitation-techniques.md           (324 lines — 10 deepening techniques)
```

Total: ~6,030 lines across 21 files (excluding README). Step files are loaded one at a time. Reference files are loaded on-demand based on brief type.

## Installation

### Option 1: Clone from GitHub (recommended)

```bash
# User-level (available in all projects)
git clone https://github.com/ellisjr/brand-namer.git ~/.claude/skills/brand-namer

# Or project-level (available in this project only)
git clone https://github.com/ellisjr/brand-namer.git .claude/skills/brand-namer
```

### Option 2: Copy manually

```bash
# Download and copy the brand-namer/ folder into either:
~/.claude/skills/brand-namer/     # user-level
.claude/skills/brand-namer/       # project-level
```

### Verify installation

Claude Code auto-detects skills by their YAML frontmatter. Once installed, the skill triggers when you mention naming, brand names, company names, product names, or "what should I call this." You can also invoke it directly:

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

**What the skill produces** (average across iter-3/4 with-skill runs):
- ~230 unique candidate names per session
- 9-11 of 11 naming categories attempted
- 30-44 techniques applied per session
- 60-70 riffs across 6-8 directions with specific technique labels
- 15-30 shortlisted names with evaluation scoring
- Full YAML-frontmatter artifacts for session resumption

**Baseline comparison** (no skill): ~111 names in ~142s using ~16k tokens. With skill: ~230 names in ~750s using ~140k tokens. The skill adds 2x name volume but the real value is methodology depth — technique diversity, structural tracking, domain-specific evaluation, consumer/enterprise pathway selection, and artifacts.

## License

MIT
