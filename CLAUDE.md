# Brand Namer — Claude Code Skill

## What this is

A Claude Code skill for professional-grade brand naming. It runs a 4-loop cyclable architecture (Frame → Generate → Select → De-risk) with naming territories, competitive whitespace mapping, and gallery mode presentation.

Designed to defeat "LLM averaging" — where AI defaults to safe, generic names — by enforcing broad exploration before convergence.

## File structure

```
SKILL.md                          — Entry point: Role, Philosophy, Reference Loading, Artifacts, Scenario Playbooks
workflow.md                       — Execution router: MANDATORY RULES, SYSTEM FAILURE defs, step routing table
steps/
  step-00-session-start.md        — Session detection, resume handler
  step-01a-brief.md               — Brand brief intake
  step-01b-territories.md         — Naming territories, competitive whitespace, session mode
  step-02a-generation.md          — Divergent generation (core ideation across categories)
  step-02b-cross-pollination.md   — Cross-model ideation with other LLMs
  step-02c-riffing.md             — Creative riffing & directional expansion
  step-03a-shortlisting.md        — Convergent shortlisting + riffing checklist (two checkpoint menus)
  step-04a-screening.md           — Competitive screening (validation setup + web search)
  step-04b-domains.md             — Domain availability + pool recovery
  step-04c-variations.md          — Variation generation + re-screening
  step-04d-trademark.md           — Trademark screening
  step-04e-social.md              — Social handles, stress tests, extended presence
  step-04f-final.md               — Final tiered presentation + recommendations
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

- **SKILL.md is the skill entry point.** It has YAML frontmatter (`name`, `description`) for skill detection, plus Role, Philosophy, Reference Loading, Artifacts, and Scenario Playbooks — global context that persists throughout the session.
- **workflow.md governs execution.** It contains MANDATORY EXECUTION RULES, SYSTEM FAILURE definitions, the step routing table, user waiver protocol, chat-then-redisplay pattern, and menu format standard.
- **Step files in `steps/` are loaded one at a time.** Each step file is self-contained with its own MANDATORY EXECUTION RULES, SUCCESS METRICS, FAILURE MODES, execution content, menu with HALT, and Master Rule. The LLM reads only the current step — never peeking ahead.
- **Reference files are loaded on-demand**, not all upfront. Each step file specifies which reference file to read and when.
- **Artifacts** are output to `brand-namer-output/` (00-brief.md through 04-final.md) with YAML frontmatter for session resumption and `stepsCompleted` tracking.
- The skill supports **cross-pollination** with other LLMs (ChatGPT/Gemini/Grok) via generated prompts the user can paste into other models.

## Working on this project

- **Architecture:** SKILL.md → workflow.md → step files. Execution content lives in step files. Global context lives in SKILL.md. Routing and enforcement live in workflow.md.
- When editing step files, preserve the BMAD-style template structure: MANDATORY EXECUTION RULES, SUCCESS METRICS, FAILURE MODES, Execution, Menu with HALT, Master Rule.
- When editing SKILL.md, preserve the loop structure references (Loops 1-4) and the Artifact Chain section.
- Reference files are self-contained reference material — edit them independently.
- The `description` field in SKILL.md frontmatter controls when Claude Code triggers the skill — keep it comprehensive.
- README.md should stay in sync with SKILL.md if loops, stages, or features change.
