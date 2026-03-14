# Brand Namer: 4-Loop Restructure Design

## Summary

Restructure the brand-namer skill from a 13-phase linear pipeline into a 4-loop cyclable architecture (Frame → Generate → Select → De-risk) based on collective feedback from Gemini, GPT, and Codex. The approach preserves existing prose by moving blocks into the new skeleton, adding new stages, and making targeted modifications.

## Motivation

Three independent model reviews identified the same structural issues:
- The 13-phase linear pipeline doesn't match how naming actually works (cyclical, decision-gated)
- Phase 5 (shortlisting) before Phase 6 (riffing) creates a broken handoff
- The pipeline lacks a strategic framing step between brief and generation
- Users fatigue under 13 sequential phases with heavy check-in overhead

## New Architecture

```
Loop 1: Frame
  1a. Brand Brief Intake
  1b. Naming Territories (NEW)
  1c. Competitive Whitespace Mapping (NEW)

Loop 2: Generate
  2a. Divergent Generation (modified)
  2b. Cross-Model Ideation
  2c. Creative Riffing (moved from old Phase 6)
  Inline: Phonetic & Linguistic Quality Checks (dissolved from old Phase 4)

Loop 3: Select
  3a. Convergent Shortlisting (modified)
  Cycle-back: → Loop 2 if user wants more

Loop 4: De-risk
  4a. Competitive Screening
  4b. Domain Availability + Pool Recovery
  4c. Variation Generation + Re-screening (old Phases 9-10 merged)
  4d. Trademark Screening
  4e. Social Handles + Optional Stress Tests + Extended Presence Check (NEW on final 1-3)
  4f. Final Presentation
  Cycle-back: → Loop 2 if pool is thin (pool recovery)

Adaptive Behavior (preserved)
```

## Detailed Changes

### New Stages

#### 1b. Naming Territories

Inserted between brief intake and generation. Before generating any candidates, define 3-5 strategic naming territories — distinct creative directions that each represent a coherent brand world.

For each territory, define:
- Territory name (e.g., "Calm Precision," "Maker Energy," "Institutional Trust")
- Emotional promise — what the user feels encountering this brand
- Semantic field — the word families and metaphor domains to mine
- Phonetic profile — sound texture that fits (reference brand-psychology.md)
- Anti-patterns — what this territory should NOT sound like

Present territories to the user for alignment. Each territory becomes a generation lane in Loop 2. Save in 00-brief.md frontmatter.

#### 1c. Competitive Whitespace Mapping

Using the competitors identified in the brief, map the naming landscape:
- What naming patterns dominate the category?
- What phonetic shapes are overused?
- What metaphor domains are crowded?
- Where is the whitespace — naming territory no competitor occupies?

Present a brief competitive map to the user and weight generation toward whitespace.

#### Extended Presence Check (in 4e, final 1-3 only)

For the top 1-3 finalists only, offer to check:
- App stores (Apple App Store, Google Play)
- Search results (SERP crowding / disambiguation)
- Business registries (LLC/corporation in target state/country)

Offered, not automatic. Framed as "Want me to do a deeper digital presence check on your top picks?"

#### 4e. Full Stage Breakdown

Stage 4e bundles three conditional components from old Phase 12:

1. **Social Handle Check** (always-on for Tier 1 names): Twitter/X, Instagram, LinkedIn, TikTok. Same scope as current Phase 12.
2. **Optional Stress Tests** (offered, not automatic):
   - **Pre-Mortem Analysis**: Imagine the name has failed 18 months post-launch — why? Preserved from current Phase 12 lines 648-650.
   - **System 1 / System 2 Testing**: User-driven dual-speed name testing (gut recall vs analytical). Full framework preserved from current Phase 12 lines 651-668. Results recorded in 03-validation.md.
3. **Extended Presence Check** (offered on final 1-3 only, NEW): App stores, SERP crowding, business registries.

### Moved Stages

#### Creative Riffing → 2c (was Phase 6)

Moved before shortlisting. The riffing pipeline, linguistic/conceptual/structural riffing, homonym/synonym riffing, affix exploration, Lexicon three-team method, and output format — all preserved as-is, just repositioned. This ensures riffs are part of the candidate pool before the shortlist locks.

### Dissolved Stages

#### Phonetic Filtering (was Phase 4) → inline guidance

The standalone phase disappears. Its content (Bar Test, pronounceability, chunking, stress pattern, spelling ambiguity, cross-language checks) becomes a short "Inline Quality Checks" note at the top of Loop 2, instructing the model to weave these into commentary during generation and riffing rather than presenting as a separate gate.

### Merged Stages

#### Variation Generation + Re-screening (was Phases 9-10) → 4c

Phase 10's content folds into Phase 9 as a "then re-screen" paragraph. Same work, one stage instead of two.

### Modified Stages

#### 2a. Divergent Generation — three changes:

1. **User-driven candidate count replaces 100-name hard minimum.** After each generation push, report running total: "That's [N] candidates so far across [M] categories. Want to keep going, shift direction, or move on?" User decides when they have enough.

2. **Institutional Compounds demoted to sub-pattern of Compounds.** "11 naming categories" becomes "10 naming categories" throughout. The Institutional Compounds generation instructions stay but are reframed as a technique within Compound generation, not a standalone category. Explicitly update the generation rule "at least 6 of the 11 naming categories" → "at least 6 of the 10 naming categories."

3. **Gallery Mode added as default presentation in Explorer Mode.** Before diving into categories one by one, offer a high-level gallery — top 3-5 names from each category in a single scannable grid. User identifies which categories to expand. Prevents category-by-category fatigue. In Focused Mode, category-by-category remains the default (user is iterating collaboratively). Gallery Mode supplements but does not replace Explorer/Focused — it is the default initial presentation within Explorer Mode.

#### 3a. Convergent Shortlisting — frameworks demoted:

Replace the full 10-technique menu listing with trigger-based recommendations. Analyze the shortlist and recommend 2-3 techniques with specific reasoning (reduced from the current 3-5). The full library remains in elicitation-techniques.md — referenced only if the user asks "what else is available?"

The existing "Multi-perspective evaluation" block (strategist/creative/analyst lenses) is preserved as an optional framing tool within 3a.

### Artifact Chain

#### Structure preserved (00-04), frontmatter simplified:

**Dropped from frontmatter:**
- `total_candidates`, `flagged_conflicts`, `riff_families_explored`, `generation_rounds`, `techniques_applied` (01-candidates.md)
- `candidates_entering_validation` (02-shortlist.md)
- Per-check counts (03-validation.md)

**Added to 00-brief.md frontmatter:**
```yaml
naming_territories:
  - name: "Territory Name"
    semantic_field: [words]
    phonetic_profile: "description"
competitive_whitespace: "summary"
```

**Artifact flow updated to loop references:**
- Loop 1 (Frame) → writes 00-brief.md (now includes territories + whitespace)
- Loop 2 (Generate) → appends to 01-candidates.md
- Loop 3 (Select) → reads 01-candidates.md, writes 02-shortlist.md
- Loop 4 (De-risk) → reads 02-shortlist.md, writes 03-validation.md progressively, then 04-final.md
- Pool recovery → cycle from De-risk back to Generate, re-validate new names only
- Deepening techniques → can fire at any point; results modify either 01-candidates.md (new candidates) or 02-shortlist.md (refining shortlist)
- Validation log → preserved, tracks which checks completed per name to avoid re-running

### Reference Files

No content changes. Reference file table in SKILL.md updates phase references to loop/stage references:

| File | Current Trigger | New Trigger |
|---|---|---|
| naming-taxonomies.md | Phase 2, Phase 6 | 2a (generation), 2c (riffing) |
| brand-psychology.md | Phase 1, Phase 2, Phase 5-6 | 1a-1b (brief + territories), 2a (phonetic recipes), 3a/2c (evaluation) |
| elicitation-techniques.md | Phase 2 (if convergent), Phase 5, Phase 6, Phase 8, Phase 12 | 2a (if convergent), 3a (deepening), 2c (SCAMPER on riffs), 4b (pool recovery), 4e (Pre-Mortem) |

### README.md

Updated to reflect 4-loop architecture, 10 categories, new stages, and simplified artifact chain.

## Files Modified

| File | Change Type |
|---|---|
| SKILL.md | Major restructure — move blocks into 4-loop skeleton, add new stages, modify existing stages |
| README.md | Update to reflect new architecture |
| references/naming-taxonomies.md | No changes |
| references/brand-psychology.md | No changes |
| references/elicitation-techniques.md | No changes |

## What Is NOT Changing

- Philosophy section (5 principles) — preserved exactly
- Reference file content — untouched
- Artifact filenames and purpose (00-04) — preserved
- Session modes (Explorer/Focused) — preserved (Gallery Mode supplements Explorer, see 2a)
- Adaptive behavior section — preserved
- Resume-across-sessions logic — preserved, updated to loop/stage references:
  - Only 00-brief.md → resume at 2a
  - 01-candidates.md exists → resume at 3a (or 2c if riffing wasn't done)
  - 02-shortlist.md exists → resume at 4a
  - 03-validation.md exists → resume at 4f
- Cross-model ideation content — preserved
- All riffing techniques (linguistic, conceptual, structural, homonym, affix, Lexicon three-team) — preserved
- All validation stage content (competitive, domain, trademark, social, Pre-Mortem, System 1/2) — preserved (frontmatter counts simplified, see Artifact Chain)
- Technical project screening subsection — preserved within 4a
- All deepening technique content in elicitation-techniques.md — preserved
- Inline conflict flagging (philosophy principle #5) — preserved
- Pool recovery mechanism — preserved
- Validation log — preserved

## Implementation Approach

Restructure by moving existing blocks into the new skeleton (approach B). Preserve battle-tested language. Add new stages. Update cross-references. Polish pass at end.
