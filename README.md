# brand-namer

A Claude Code skill for professional-grade brand naming. Runs a 4-loop cyclable architecture (Frame → Generate → Select → De-risk) from creative divergence through competitive validation to a ranked shortlist — designed to defeat the "LLM averaging" problem where AI defaults to safe, generic, indistinguishable names.

## What it does

Guides Claude through a structured naming engagement modeled on how agencies like Lexicon Branding ($15K–$75K+ per project) actually work:

1. **Frame** — brand brief intake with context-aware elicitation, naming architecture (standalone vs. sub-brand vs. portfolio), Jobs-to-be-Done priority, Aaker dimensions and brand archetypes, naming territories definition (3-5 strategic creative directions), competitive whitespace mapping
2. **Generate** — divergent generation across 10 naming categories with user-driven candidate counts, gallery mode presentation, morphological analysis, inline phonetic quality checks and ⚠️ conflict flagging; cross-model ideation via sidecar (GPT/Gemini/Grok); creative riffing with 8 riff axes, Lexicon three-team method, homonym/synonym riffing, systematic affix exploration, bisociation and conceptual blending
3. **Select** — user-directed convergent shortlisting with AI-recommended deepening techniques (SCAMPER, Inversion, Pre-Mortem, Six Hats, Constraint Removal, Role-Play, First Principles, Red Team/Blue Team, Analogical Reasoning, TRIZ) plus SMILE/SCRATCH rapid evaluation
4. **De-risk** — competitive screening (web search + GitHub/npm/PyPI/MCP registries for technical projects), domain availability (.com, .ai, .co, .io) with pool recovery for resurrecting killed favorites, variation generation + re-screening, trademark screening (USPTO, EUIPO, phonetic similarity), social handle checks (Twitter/X, Instagram, LinkedIn, TikTok), optional Pre-Mortem and System 1/System 2 stress tests, extended presence checks on final 1-3 (app stores, SERP, business registries), Tier 1/2/3 final presentation with top 3 recommendation

Loops are cyclable — if De-risk kills too many names, cycle back to Generate with dead names as seeds.

## Artifact chain

The pipeline produces 5 structured markdown artifacts with YAML frontmatter, enabling session resumption, clean loop handoffs, and a full decision trail:

```
brand-namer-output/
├── 00-brief.md          # Session config, naming architecture, JTBD priority, personality targets, territories, whitespace
├── 01-candidates.md     # ALL candidates (grows: generation + cross-model + riffs)
├── 02-shortlist.md      # Favorites entering validation + preference profile + taken-but-loved bucket
├── 03-validation.md     # Competitive + domain + variation + trademark + social results
└── 04-final.md          # Tier 1/2/3 presentation + top 3 recommendation
```

Each artifact's frontmatter carries the state needed by downstream stages. If a session is interrupted, the skill reads existing artifacts and resumes from where it left off.

## Key design decisions

- **Anti-convergence philosophy** — enforces broad exploration before any filtering with user-driven candidate counts and running totals
- **Naming territories** — 3-5 strategic creative directions defined before generation, ensuring intentional diversity
- **Competitive whitespace mapping** — map the competitive naming landscape before ideation to avoid sounding like existing players
- **Gallery mode** — scannable grid presentation in Explorer Mode before diving into categories one by one
- **Explorer vs Focused mode** — user chooses at start whether to see the full possibility space before reacting or iterate category-by-category
- **Inline conflict flagging** — ⚠️ flags from training data during generation, not as a separate late-stage phase
- **Validate to sort, not to discard** — taken names become riffing and deepening seeds, not dead ends
- **Pool recovery loop** — after domain checks, if the survivor pool is thin, resurrect killed favorites through riffing + deepening → re-validate cycle
- **Trigger-based technique recommendations** — instead of listing all 10 deepening techniques, Claude analyzes the shortlist and recommends 2-3 with situation-specific reasoning
- **Structured artifact handoffs** — 5 artifacts with YAML frontmatter enable cross-session resumption and clean loop transitions
- **Technical project screening** — GitHub, npm, PyPI, VS Code Marketplace, MCP registries, Docker Hub, Homebrew

## Installation

Copy the `brand-namer/` folder into your Claude Code skills directory:

```bash
# Option 1: User skills (available in all projects)
cp -r brand-namer/ ~/.claude/skills/brand-namer/

# Option 2: Project-level skills
cp -r brand-namer/ .claude/skills/brand-namer/
```

Claude will automatically detect and trigger the skill when you mention naming, brand names, company names, product names, or brainstorming what to call something.

## File structure

```
brand-namer/
├── SKILL.md                              (761 lines — the main 4-loop pipeline + artifact chain)
├── README.md                             (this file)
└── references/
    ├── naming-taxonomies.md              (457 lines — 10 categories + phonesthetics + riff axes + affix library)
    ├── brand-psychology.md               (388 lines — Aaker, archetypes, cognitive science, SMILE/SCRATCH, failure patterns)
    └── elicitation-techniques.md         (324 lines — 10 deepening techniques)
```

Total: ~1,930 lines across 4 skill files. Reference files are loaded on demand as each stage calls for them.

## Usage examples

```
"I need a name for my AI startup"
"Help me rename our internal platform"
"I have 5 name candidates — just validate them"
"What should I call this open source tool?"
"I need a name for my fund's new product, something like Vestry or Pansight"
```

The skill adapts to session depth:
- **Quick session** — compressed Frame + Generate in ~10 minutes, only produces `04-final.md`
- **Deep session** — full 4-loop pipeline with cross-model ideation and creative riffing, all 5 artifacts
- **Validation only** — user provides names → writes `02-shortlist.md` → runs Loop 4 (De-risk)
- **Iterative** — pause after ideation, resume at validation in a later session using artifact frontmatter

## Frameworks and research integrated

The skill's reference files encode research and methodologies from:

- **Lexicon Branding** (David Placek) — three-team methodology, letter personalities, "great names make you uncomfortable"
- **Aaker's Brand Personality Framework** — 5 dimensions mapped to phonetic recipes
- **Mark & Pearson's 12 Brand Archetypes** — each mapped to sound bias, semantic bias, and naming strategy
- **Sound symbolism research** (Köhler, Ramachandran, Sapir) — bouba/kiki, vowel-size mapping, cross-modal associations
- **Open/Closed Door framework** — narrative potential evaluation with 5 story types
- **Naming failure patterns** — 7 categories from real naming disasters
- **TRIZ** — contradiction resolution applied to naming (institutional AND approachable, technical AND human)
- **Eat My Words (Alexandra Watkins)** — SMILE/SCRATCH rapid evaluation checklists
- **Kahneman's System 1/System 2** — dual-speed name testing for finalists (user-driven)
- **Koestler's Bisociation / Fauconnier & Turner's Conceptual Blending** — frameworks for metaphorical and blend name generation
- **Zwicky's Morphological Analysis** — systematic combinatorial generation across naming dimensions
- **Rosch's Prototype Theory** — identify the prototypical name for a target personality, then generate toward it
- **Miller's Cognitive Chunking** — fewer chunks = lower cognitive load = easier recall
- **Tversky & Kahneman's Availability Heuristic** — high-availability names arrive loaded; low-availability names are blank canvases
- **Semantic Satiation** — robustness test: say it 50 times, does the meaning hold?
- **Christensen's Jobs-to-be-Done** — what's the #1 job this name needs to do?
- **Productive affix library** — 11 prefixes, 16 suffixes, 9 bidirectional affixes, 8 creative respelling patterns

## Sidecar support

If running with [Sidecar](https://github.com/jrenaldi79/sidecar) (or a comparable skill/tool) installed, the skill can spawn parallel naming sessions with other LLMs automatically. Without sidecar, it generates a self-contained paste-ready prompt for manual cross-model ideation.

## License

MIT
