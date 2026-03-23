# Brand Namer — Claude Code Skill

## What this is

A Claude Code skill for professional-grade brand naming. It runs a 4-loop cyclable architecture (Frame → Generate → Select → De-risk) with naming territories, competitive whitespace mapping, and gallery mode presentation.

Designed to defeat "LLM averaging" — where AI defaults to safe, generic names — by enforcing broad exploration before convergence.

## File structure

```
SKILL.md                          — The main skill (4-loop pipeline + artifact chain)
README.md                         — Overview, installation, usage examples
references/
  naming-categories.md            — 11 naming categories, phonesthetics, anti-patterns, cross-language (always loaded)
  naming-techniques.md            — Riffing axes, affixes, tech branding, ownability, advanced generation (loaded during riffing)
  consumer-naming.md              — Sensory, experiential, consumer strategy, Japanese sound-symbolism (consumer briefs only)
  enterprise-naming.md            — B2B techniques, evaluation/testing, compliance (enterprise briefs only)
  brand-psychology.md             — Aaker dimensions, archetypes, cognitive science, SMILE/SCRATCH
  elicitation-techniques.md       — 10 deepening techniques (SCAMPER, Inversion, Pre-Mortem, etc.)
  naming-taxonomies.md            — [ARCHIVE] Original monolithic file, superseded by the 4 split files above
```

## Key conventions

- **SKILL.md is the skill definition.** It has YAML frontmatter (`name`, `description`) that Claude Code uses for skill detection and triggering.
- **Reference files are loaded on-demand**, not all upfront. Each stage in SKILL.md specifies which reference file to read and when.
- **Artifacts** are output to `brand-namer-output/` (00-brief.md through 04-final.md) with YAML frontmatter for session resumption.
- The skill supports **cross-pollination** with other LLMs (ChatGPT/Gemini/Grok) via generated prompts the user can paste into other models.

## Working on this project

- When editing SKILL.md, preserve the loop structure (Loops 1-4) and stage lettering (a-f).
- Reference files are self-contained reference material — edit them independently.
- The `description` field in SKILL.md frontmatter controls when Claude Code triggers the skill — keep it comprehensive.
- README.md should stay in sync with SKILL.md if loops, stages, or features change.
