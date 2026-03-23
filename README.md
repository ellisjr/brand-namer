# brand-namer

A Claude Code skill for professional-grade brand naming. Runs a 4-loop cyclable architecture (Frame → Generate → Select → De-risk) with specialized pipelines for consumer and B2B brands — designed to defeat the "LLM averaging" problem where AI defaults to safe, generic, indistinguishable names.

The skill operates from a **senior brand strategist** persona — not a list generator. Creative ambition, structural discipline, and ownability instinct are baked in. The professional standard: if the user walks away saying "these are fine," the session failed.

## How It Works

```
Frame → Generate → Select → De-risk
  ↑                            |
  └────── (if pool is thin) ───┘
```

### Loop 1: Frame
Understand what you're naming. Define the strategic space before generating anything.

- **Brand brief intake** — extract context from existing docs, fill gaps conversationally, confirm exactly what's being named
- **Naming territories** — 3-5 distinct creative directions (Tree of Thought pruning) to prevent "100 names in the same vibe"
- **Competitive whitespace** — map how competitors name themselves, identify the empty territory

### Loop 2: Generate
Produce candidates across many naming categories. Breadth before depth.

- **Divergent generation** across 11 naming categories with **mandatory** ownability-first compound generation in parallel (30% compound minimum before gallery presentation)
- **Hard generation gates** — minimum 60 candidates, 6+ categories, 3+ structural types, technique cycling check. These are blocking — the skill won't proceed to shortlisting until met or explicitly waived.
- **Cross-pollination** — generates paste-ready prompts for ChatGPT/Gemini/Grok, merges results back into the candidate pool. Mandatory offer (user can decline).
- **Creative riffing** with labeled techniques — the user sees WHY each name was generated
- **Gallery mode** — scannable H/W/C grid before diving into category-by-category expansion

### Loop 3: Select
User-directed convergence. The user makes all cuts.

- **Batch elimination** builds a preference profile incrementally
- **Definitions check** on shortlisted words — etymology as brand story
- **Menu of deepening techniques** — SCAMPER, TRIZ, Constraint Removal, Red Team/Blue Team, Three-Team Method, etc.
- **Blocking riffing checklist** (deep sessions) — displayed with visible status, must be completed or explicitly waived before validation
- **Structural diversity gate** — if shortlist is >80% one type, flagged before validation proceeds

### Loop 4: De-risk
Validate what survives. Riff on what doesn't.

- **Competitive screening** — web search + technical registries (GitHub, npm, PyPI, MCP)
- **Domain availability** — explicit TLD checks (.com, .ai, .co, .io)
- **Batched death trigger** — when names die, present them in one table and offer riffing options
- **Pool recovery** — killed names become creative seeds, not dead ends
- **Trademark screening, social handles, stress tests** — tiered by available tooling
- **Session quality self-assessment** — transparent stats on candidates generated, categories attempted, techniques applied, structural mix
- **Final presentation** — Tier 1 (clear), Tier 2 (caveats), Tier 3 (reference)

---

## Enforcement Gates

The skill includes hard gates to prevent common session failures (thin pools, structural homogeneity, technique tunnel vision):

| Gate | When | Blocks if |
|---|---|---|
| **Candidate count** | Loop 2 → 3 transition | < 60 candidates (deep) or < 40 (focused) |
| **Category coverage** | Loop 2 → 3 transition | < 6 of 11 naming categories attempted |
| **Structural diversity** | Loop 2 → 3 AND 3 → 4 | > 80% of candidates/shortlist is one structural type |
| **Technique cycling** | Loop 2 → 3 transition | > 8 creative techniques unused |
| **Compound minimum** | Before gallery presentation | < 30% of candidates are compounds/coined/alternatives |
| **Shortlist size** | Loop 3 → 4 transition | < 15 names entering validation |
| **Riffing checklist** | Before Loop 4 | Core riffing techniques not applied to shortlisted directions |

All gates can be waived by the user after being warned — the skill surfaces the risk, the user decides.

---

## Consumer vs Enterprise

The skill auto-detects the brief type and loads only relevant reference files.

### Consumer Brands (food, beauty, fashion, lifestyle, DTC)

**Loaded:** `naming-categories.md` + `consumer-naming.md` + `brand-psychology.md`

Optimized for products people physically experience. Emphasizes sensory naming, emotional resonance, shelf presence, and social shareability. Suppresses the B2B compound-generation track (nobody in streetwear wears "Loamworks").

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
| **Compound** | Two complete words joined | Salesforce, Dropbox, Mailchimp |
| **Sound-Symbolic** | Engineered for phonetic feel | Google, TikTok, Zoom |
| **Institutional Compound** | Finance/enterprise compound pattern | BlackRock, Benchmark, Cornerstone |

### Additional Generation Angles

| Angle | What it does | Examples |
|---|---|---|
| **Personified Names** | Human names as brands — instant warmth, conversational | Claude, Alexa, Oscar, Ada, Harvey |
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
| **Tech Branding Patterns** | -OS, -ware, -wise, -er, -base, -box, -kit, -lab, -stack, -grid, domain hacks |
| **Prefix × Suffix Matrix** | Systematic crossing of 6+ prefixes with 10+ suffixes |
| **Classical Stem Engineering** | Systematic Greek/Latin root construction with cliché detection |
| **Semiotic Territory Mapping** | Map meaning-system quadrants before generation |
| **Conceptual Blending** | Blend mental models, not just syllables (Fauconnier & Turner) |
| **Morphological Analysis (Zwicky)** | Systematic combinatorial generation across dimensions |
| **Lexicon Three-Team Method** | On-brief, competitor, unrelated-domain teams generating simultaneously |

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
| **Deep** | Full 4-loop pipeline with enforcement gates, riffing checklist, cross-pollination, thorough validation. | "This is our company name, get it right" |
| **Committee** | Semantic Differential Scaling, Nominal Group Technique, weighted scoring by role. | Multiple stakeholders who disagree |
| **Validation only** | User provides names → straight to Loop 4 screening. | "I already have names, just check them" |
| **Iterative** | Save artifacts, sleep on it, resume next session. | "Let me think about these overnight" |

## Scenario Playbooks

Built-in adaptations for: **International-first** (CVCV, cross-language, transliteration), **Regulated industries** (controlled terms pre-screened before generation), **Committee/stakeholder**, **Portfolio/product-line**, **Legacy rename**, **Consumer/lifestyle**, **B2B/enterprise**, **Dual-audience** (kids+parents, partners+paralegals).

---

## File Structure

```
brand-namer/
├── SKILL.md                               (1,351 lines — main 4-loop pipeline + enforcement gates + playbooks)
├── README.md                              (this file)
├── CLAUDE.md                              (project conventions)
└── references/
    ├── naming-categories.md               (554 lines — 11 categories, phonesthetics, anti-patterns, cross-language)
    ├── naming-techniques.md               (606 lines — riffing, affixes, respelling, ownability, advanced generation)
    ├── consumer-naming.md                 (694 lines — sensory, experiential, consumer strategy, Japanese sound-symbolism)
    ├── enterprise-naming.md               (427 lines — B2B techniques, evaluation/testing, compliance)
    ├── brand-psychology.md                (431 lines — archetypes, personality, cognitive science, SMILE/SCRATCH)
    └── elicitation-techniques.md          (324 lines — 10 deepening techniques)
```

Total: ~4,387 lines across 7 files. Reference files are loaded on-demand based on brief type — no session loads all 6.

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

Lexicon Branding (Placek), Aaker Brand Personality, Mark & Pearson 12 Archetypes, Sound Symbolism (Köhler, Ramachandran, Sapir), Bouba-Kiki Effect, Processing Fluency (Alter & Oppenheimer), Von Restorff Distinctiveness, Mere Exposure (Zajonc), Dual Coding (Paivio), Cognitive Chunking (Miller), Kahneman System 1/2, Fauconnier & Turner Conceptual Blending, Zwicky Morphological Analysis, Rosch Prototype Theory, Iyengar Choice Overload, Osgood Semantic Differential, TRIZ Contradiction Resolution, Christensen Jobs-to-be-Done, Watkins SMILE/SCRATCH.

## Cross-Pollination

The skill generates paste-ready prompts for ChatGPT, Gemini, and Grok to get naming candidates from different creative perspectives. The user pastes results back and the skill deduplicates, classifies, and merges them into the candidate pool. Each model has different biases — ChatGPT trends toward punchy consumer names, Gemini toward systematic foreign-root exploration, Grok toward irreverent breaks. Cross-pollination is offered at least once per deep session (mandatory offer, optional execution).

## License

MIT
