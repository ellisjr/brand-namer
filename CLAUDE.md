# Brand Namer — Claude Code Plugin

## What this is

A Claude Code plugin for professional-grade brand naming. It runs a 4-loop cyclable architecture (Frame → Generate → Select → De-risk) with naming territories, competitive whitespace mapping, and gallery mode presentation.

Designed to defeat "LLM averaging" — where AI defaults to safe, generic names — by enforcing broad exploration before convergence.

## File structure

```
.claude-plugin/
  plugin.json                       — Plugin manifest (name, version, author, keywords)
skills/brand-namer/
  SKILL.md                          — Entry point: Role, Philosophy, Reference Loading, Artifacts, Scenario Playbooks
  workflow.md                       — Execution router: core rules with reasons, session routing, menu format, step routing table
  steps/
    step-00-session-start.md        — Session detection, resume handler
    step-01a-brief.md               — Brand brief intake
    step-01b-territories.md         — Naming territories, competitive whitespace, session mode
    step-02a-generation.md          — Divergent generation (core ideation across categories)
    step-02b-cross-pollination.md   — Cross-model ideation with other LLMs
    step-02c-riffing.md             — Creative riffing & directional expansion
    step-03a-shortlisting.md        — Convergent shortlisting + riffing checklist (two checkpoint menus)
    step-04a-screening.md           — Competitive screening (validation setup + web search)
    step-04b-domains.md             — Domain availability via WHOIS/RDAP + pool recovery
    step-04c-variations.md          — Variation generation + re-screening
    step-04d-trademark.md           — Trademark screening
    step-04e-social.md              — Social handles, stress tests, extended presence
    step-04f-final.md               — Final tiered presentation + recommendations
  references/
    naming-categories.md            — 11 categories, 9 cross-cutting angles, phonesthetics, cross-language (always loaded)
    naming-techniques.md            — Riffing, affixes, truncation, casing, domain hacks, advanced generation (loaded during riffing)
    consumer-naming.md              — Sensory, experiential, consumer strategy, Japanese sound-symbolism (consumer briefs only)
    enterprise-naming.md            — B2B techniques, evaluation/testing, compliance (enterprise briefs only)
    brand-psychology.md             — Aaker dimensions, archetypes, cognitive science, SMILE/SCRATCH
    elicitation-techniques.md       — 10 deepening techniques (SCAMPER, Inversion, Pre-Mortem, etc.)
  scripts/
    check-domains.sh                — WHOIS/RDAP domain availability checker; prints a markdown grid (steps 04a-04c)
    cross-pollinate.sh              — Runs a prompt through the Codex CLI (codex exec, read-only, ephemeral); prints the final answer (step 02b)
README.md                           — Overview, installation, usage examples
CLAUDE.md                           — This file (project conventions)
```

## Key conventions

- **SKILL.md is the skill entry point.** It has YAML frontmatter (`name`, `description`) for skill detection, plus Role, Philosophy, Reference Loading, Artifacts, and Scenario Playbooks — global context that persists throughout the session.
- **workflow.md governs execution.** It is the single home for the core rules (each with its reason), how to handle non-menu input and gate waivers, the menu format, session-type detection and the quick-mode fast path, and the step routing table. Nothing in a step file should restate these.
- **Step files in `steps/` are loaded one at a time.** Each step file is self-contained: a Purpose, a "Done when" list of outcomes, a short Guardrails list (only the constraints that matter for that step, each with its why), the execution content, and a menu with a recommendation followed by a wait for the user. The LLM reads only the current step — never peeking ahead.
- **Reference files are loaded on-demand**, not all upfront. Each step file specifies which reference file to read and when.
- **Artifacts** are output to `brand-namer-output/` (00-brief.md through 04-final.md) with YAML frontmatter for session resumption and `stepsCompleted` tracking.
- The skill supports **cross-pollination** with other LLMs: directly through the Codex CLI via `scripts/cross-pollinate.sh` when `codex` is installed, otherwise via a generated prompt the user pastes into Gemini, Grok, or ChatGPT.

## Working on this project

- **Architecture:** SKILL.md → workflow.md → step files. Execution content lives in step files. Global context lives in SKILL.md. Routing and enforcement live in workflow.md.
- **Plugin structure:** `.claude-plugin/plugin.json` is the manifest. Skill files live under `skills/brand-namer/`. Relative paths within skill files resolve from the skill directory: `./workflow.md`, `steps/step-01a-brief.md`, `references/naming-categories.md`, `scripts/check-domains.sh`. Step handlers use the `steps/step-xx.md` form.
- When editing step files, preserve the template structure: Purpose, Done when, Guardrails, Execution, Menu (with recommendation and IF handlers). Write instructions as plain statements with their reasons; the skill targets Opus 5.5 and later, which follow explained instructions better than ALL-CAPS emphasis. Add a guardrail only for a failure that reproduces, and attach its why.
- Technique variety is tracked as free text (`approaches_tried` / `approaches_worth_trying` in `01-candidates.md` frontmatter), not as a canonical-name checklist. Gates are about the pool (count, categories, structural mix, shortlist size, riffing checklist), not about technique counts.
- **Subagents do the parallel work.** Step 02a runs the first generation round as three isolated subagents (on-brief, competitor, unrelated-domain stances) at high effort; step 04a screens names with low-effort Haiku subagents; domain checks run through `scripts/check-domains.sh`, never through a model; the cross-model round in step 02b runs through `scripts/cross-pollinate.sh` (Codex CLI) when installed. Effort guidance lives in workflow.md under "Effort and subagents".
- `scripts/check-domains.sh` is deterministic code with a test-by-hand contract: a known-registered name (google) must come back registered and a nonsense label available on every supported TLD, and an unroutable TLD must come back unknown, never available. Re-run that check after editing the server map or the parsing patterns.
- `scripts/cross-pollinate.sh` wraps `codex exec` with fixed flags (skip the Git check, ephemeral, read-only sandbox, an empty scratch working directory with project-document loading off, final answer to stdout, transcript to stderr, `-o` written only on success). Exit codes: 2 usage, 3 codex missing, 4-6 script-side, 10+N for Codex's own status N. Its test contract: a prompt file asking for the three words "codex test ok" prints them and exits 0, a missing prompt file exits 2, with `codex` off PATH it exits 3 with an install message, and an unwritable `-o` path exits 6 after printing the answer. Never pick a model in the script or the step; the user's Codex config decides. Step 02b runs it with a ten-minute Bash timeout because a 50-name round at high effort outlasts the two-minute default.
- When editing SKILL.md, preserve the loop structure references (Loops 1-4) and the Artifact Chain section.
- Reference files are self-contained reference material — edit them independently.
- The `description` field in SKILL.md frontmatter controls when Claude Code triggers the skill — keep it comprehensive.
- README.md should stay in sync with SKILL.md if loops, stages, or features change.
