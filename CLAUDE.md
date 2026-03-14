# Brand Namer — Claude Code Skill

## What this is

A Claude Code skill for professional-grade brand naming. It runs a 13-phase pipeline (brief → divergent generation → cross-model ideation → phonetic filtering → shortlisting → creative riffing → competitive screening → domain checks → variations → variation validation → trademark screening → social handles → final presentation).

Designed to defeat "LLM averaging" — where AI defaults to safe, generic names — by enforcing broad exploration before convergence.

## File structure

```
SKILL.md                          — The main skill (13-phase pipeline + artifact chain)
README.md                         — Overview, installation, usage examples
references/
  naming-taxonomies.md            — 11 naming categories, phonesthetics, riff axes, affix library
  brand-psychology.md             — Aaker dimensions, archetypes, cognitive science, SMILE/SCRATCH
  elicitation-techniques.md       — 10 deepening techniques (SCAMPER, Inversion, Pre-Mortem, etc.)
```

## Key conventions

- **SKILL.md is the skill definition.** It has YAML frontmatter (`name`, `description`) that Claude Code uses for skill detection and triggering.
- **Reference files are loaded on-demand**, not all upfront. Each phase in SKILL.md specifies which reference file to read and when.
- **Artifacts** are output to `brand-namer-output/` (00-brief.md through 04-final.md) with YAML frontmatter for session resumption.
- The skill supports **sidecar** integration for cross-model ideation (GPT/Gemini/Grok).

## Working on this project

- When editing SKILL.md, preserve the phase numbering (1-13) and artifact chain structure.
- Reference files are self-contained reference material — edit them independently.
- The `description` field in SKILL.md frontmatter controls when Claude Code triggers the skill — keep it comprehensive.
- README.md should stay in sync with SKILL.md if phases or features change.
