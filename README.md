# brand-namer

A Claude Code skill for professional-grade brand naming. Runs a 13-phase pipeline from creative divergence through competitive validation to a ranked shortlist — designed to defeat the "LLM averaging" problem where AI defaults to safe, generic, indistinguishable names.

## What it does

Guides Claude through a structured naming engagement modeled on how agencies like Lexicon Branding ($15K–$75K+ per project) actually work:

1. **Brand brief intake** — context-aware, pulls from uploaded docs, naming architecture (standalone vs. sub-brand vs. portfolio), Jobs-to-be-Done priority, structured facilitation for latent preferences, Aaker dimensions and brand archetypes
2. **Divergent generation** — 11 naming categories, 100+ candidates (Explorer Mode minimum), morphological analysis for systematic coverage, category-by-category presentation with inline ⚠️ conflict flagging
3. **Cross-model ideation** — spawns sidecar sessions with GPT/Gemini/Grok for creative diversity (or generates paste-ready prompts)
4. **Phonetic & linguistic filtering** — Bar Test, cognitive chunking, pronounceability, stress patterns, cross-language checks
5. **Convergent shortlisting** — user-directed with AI-recommended techniques from a library of 10 (SCAMPER, Inversion, Pre-Mortem, Six Hats, Constraint Removal, Role-Play, First Principles, Red Team/Blue Team, Analogical Reasoning, TRIZ) plus SMILE/SCRATCH rapid evaluation
6. **Creative riffing** — 8 riff axes, Lexicon three-team method, homonym/synonym riffing, systematic affix exploration, bisociation and conceptual blending, institutional compound generation, motion/direction semantic field
7. **Competitive screening** — web search + GitHub/npm/PyPI/MCP registries for technical projects
8. **Domain availability** — .com, .ai, .co, .io with pool recovery checkpoint for resurrecting high-potential killed names
9. **Variation generation** — prefix/suffix, respelling, SCAMPER on surviving candidates
10. **Variation validation** — re-screen new variants
11. **Trademark screening** — USPTO, EUIPO, phonetic similarity checks
12. **Social handle check** — Twitter/X, Instagram, LinkedIn, TikTok + optional Pre-Mortem stress test + optional System 1/System 2 name testing
13. **Final presentation** — Tier 1/2/3 with rationale, door type, risk flags, top 3 recommendation

## Artifact chain

The pipeline produces 5 structured markdown artifacts with YAML frontmatter, enabling session resumption, clean phase handoffs, and a full decision trail:

```
brand-namer-output/
├── 00-brief.md          # Session config, naming architecture, JTBD priority, personality targets, seed words
├── 01-candidates.md     # ALL candidates (grows: generation + cross-model + riffs)
├── 02-shortlist.md      # Favorites entering validation + preference profile + taken-but-loved bucket
├── 03-validation.md     # Competitive + domain + variation + trademark + social results
└── 04-final.md          # Tier 1/2/3 presentation + top 3 recommendation
```

Each artifact's frontmatter carries the state needed by downstream phases. If a session is interrupted, the skill reads existing artifacts and resumes from where it left off.

## Key design decisions

- **Anti-convergence philosophy** — enforces broad exploration before any filtering; 100-candidate hard minimum in Explorer Mode
- **Explorer vs Focused mode** — user chooses at start whether to see the full possibility space before reacting or iterate category-by-category
- **Inline conflict flagging** — ⚠️ flags from training data during generation, not as a separate late-stage phase
- **Validate to sort, not to discard** — taken names become riffing and deepening seeds, not dead ends
- **Pool recovery loop** — after domain checks, if the survivor pool is thin, resurrect killed favorites through riffing + deepening → re-validate cycle
- **AI-recommended techniques** — instead of listing all 10 deepening techniques, Claude analyzes the shortlist and recommends the 3-5 most relevant with situation-specific reasoning
- **Structured artifact handoffs** — 5 artifacts with YAML frontmatter enable cross-session resumption and clean phase transitions
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
├── SKILL.md                              (708 lines — the main 13-phase pipeline + artifact chain)
├── README.md                             (this file)
└── references/
    ├── naming-taxonomies.md              (457 lines — 11 categories + phonesthetics + riff axes + affix library)
    ├── brand-psychology.md               (388 lines — Aaker, archetypes, cognitive science, SMILE/SCRATCH, failure patterns)
    └── elicitation-techniques.md         (324 lines — 10 deepening techniques)
```

Total: ~1,877 lines across 4 skill files. Reference files are loaded on demand as each phase calls for them.

## Usage examples

```
"I need a name for my AI startup"
"Help me rename our internal platform"
"I have 5 name candidates — just validate them"
"What should I call this open source tool?"
"I need a name for my fund's new product, something like Vestry or Pansight"
```

The skill adapts to session depth:
- **Quick session** — compressed generation + shortlist in ~10 minutes, only produces `04-final.md`
- **Deep session** — full 13-phase pipeline with cross-model ideation and creative riffing, all 5 artifacts
- **Validation only** — user provides names → writes `02-shortlist.md` → runs Phases 7-13
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
