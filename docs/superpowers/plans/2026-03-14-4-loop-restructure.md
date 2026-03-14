# 4-Loop Restructure Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Restructure SKILL.md from 13 linear phases into 4 cyclable loops (Frame → Generate → Select → De-risk), adding naming territories, competitive whitespace mapping, and gallery mode while preserving all existing content.

**Architecture:** Approach B — move existing prose blocks into a new 4-loop skeleton. New stages are inserted at the appropriate points. Cross-references, artifact chain, and resume logic updated to use loop/stage notation.

**Tech Stack:** Markdown (skill definition files)

**Spec:** `docs/superpowers/specs/2026-03-14-4-loop-restructure-design.md`

---

## File Structure

| File | Action | Responsibility |
|---|---|---|
| `SKILL.md` | Major restructure | Main skill definition — all 4 loops, artifact chain, adaptive behavior |
| `README.md` | Update | Reflect new architecture, 10 categories, new stages |
| `CLAUDE.md` | Update | Reflect new structure |
| `references/*.md` | No changes | — |

---

## Chunk 1: SKILL.md Restructure

### Task 1: Create new skeleton with frontmatter and top sections

**Files:**
- Modify: `SKILL.md` (full rewrite, preserving content)

- [ ] **Step 1: Back up current SKILL.md**

```bash
cp SKILL.md SKILL.md.bak
```

- [ ] **Step 2: Write the new file header (frontmatter + intro + philosophy)**

Write the new SKILL.md starting with:
- YAML frontmatter (preserved exactly from current lines 1-4)
- `# Brand Namer` heading and intro paragraph (preserved from lines 6-8)
- `## Philosophy` section (preserved exactly from lines 10-18)

- [ ] **Step 3: Write the updated Reference Files table**

Replace the current phase-referenced table (lines 20-30) with loop/stage references per the spec mapping:

```markdown
## Reference Files — When to Read Them

This skill has three reference files in `references/`. **Do not read them all upfront** — load each one when its stage calls for it:

| File | Read it when... | Used in |
|---|---|---|
| `references/naming-taxonomies.md` | You're about to generate names (2a) | 2a (categories, phonesthetics, anti-patterns), 2c (systematic riffing, riff axes) |
| `references/brand-psychology.md` | You're building the brand brief (1a-1b) or evaluating candidates (2c, 3a) | 1a-1b (archetypes, feeling spectrum, territories), 2a (phonetic recipes), 2c/3a (open/closed door, story types, failure patterns) |
| `references/elicitation-techniques.md` | The user wants to deepen, the session is stuck, or you're stress-testing finalists | 2a (if convergent), 3a (deepening), 2c (SCAMPER on riffs), 4b (pool recovery), 4e (Pre-Mortem) |

Each file has a table of contents. Read the whole file the first time you need it in a session.
```

- [ ] **Step 4: Commit skeleton**

```bash
git add SKILL.md SKILL.md.bak
git commit -m "Start restructure: skeleton with frontmatter, philosophy, ref table"
```

---

### Task 2: Loop 1 — Frame (1a, 1b, 1c)

- [ ] **Step 1: Write Loop 1 header and move 1a (Brand Brief Intake)**

Write `## Loop 1: Frame` header. Copy the entire current Phase 1 content (lines 32-224) as stage `### 1a. Brand Brief Intake`. Preserve all subsections:
- Use existing context first
- Then fill the gaps (required, naming architecture, JTBD, optional)
- Seed words and personal resonance
- Structured facilitation for latent preferences
- Ask about additional inputs
- Save-as-you-go preference

**Do NOT include** the artifact chain section yet (lines 84-200) — that moves to a standalone section after all loops.

**Do include** the session mode section (lines 214-224) within 1a.

- [ ] **Step 2: Write 1b (Naming Territories) — NEW**

Insert after 1a, before session mode:

```markdown
### 1b. Naming Territories

Before generating names, define 3-5 naming territories — distinct creative directions that each represent a coherent brand world. This prevents generation from being "many names in the same vibe" and ensures intentional diversity.

For each territory, define:
- **Territory name** (e.g., "Calm Precision," "Maker Energy," "Institutional Trust")
- **Emotional promise** — what the user feels encountering this brand
- **Semantic field** — the word families and metaphor domains to mine
- **Phonetic profile** — sound texture that fits (reference `references/brand-psychology.md`)
- **Anti-patterns** — what this territory should NOT sound like

Example for a VC ops platform:

| Territory | Emotional Promise | Semantic Field | Phonetic Profile | Anti-patterns |
|---|---|---|---|---|
| Precision Instrument | "This tool is exact" | measurement, optics, calibration | crisp consonants, front vowels | no soft/warm sounds |
| Trusted Guide | "You're in good hands" | navigation, cartography, light | balanced, trochaic | no clinical/cold |
| Maker's Workshop | "Built by craftspeople" | forge, craft, materials | hard onsets, Anglo-Saxon roots | no corporate jargon |

Present the territories to the user for alignment before proceeding. They may adjust, merge, or add territories. Each territory becomes a generation lane in Loop 2.

Save territories in `00-brief.md` frontmatter.
```

- [ ] **Step 3: Write 1c (Competitive Whitespace Mapping) — NEW**

Insert after 1b:

```markdown
### 1c. Competitive Whitespace Mapping

Before generating, map the naming landscape the brand will live in.

Using the competitors identified in the brief:
- What naming patterns dominate the category? (e.g., "every fintech is [noun]Pay")
- What phonetic shapes are overused?
- What metaphor domains are crowded?
- Where is the whitespace — naming territory no competitor occupies?

Present a brief competitive map to the user:

"Your competitors cluster around [pattern]. The whitespace is [description]. I'll weight generation toward the whitespace."

This sharpens generation and gives the user confidence that names won't accidentally sound like the competitive set.
```

- [ ] **Step 4: Verify Loop 1 completeness**

Read the new Loop 1 section. Check:
- All Phase 1 content from original (lines 32-224) is present
- 1b and 1c are properly placed between brief and generation
- Session mode section is included
- No artifact chain content included (that's separate)

- [ ] **Step 5: Commit**

```bash
git add SKILL.md
git commit -m "Add Loop 1: Frame (brief intake + territories + whitespace)"
```

---

### Task 3: Loop 2 — Generate (2a, 2b, 2c + inline phonetic)

- [ ] **Step 1: Write Loop 2 header and inline phonetic guidance**

Write `## Loop 2: Generate` header, then add the dissolved Phase 4 as inline guidance:

```markdown
## Loop 2: Generate

### Phonetic & linguistic quality (inline, not a separate stage)

As you generate and riff, weave these checks into your commentary — don't present them as a gate:
- **Bar Test:** Could someone say this in a noisy bar and have the listener find it?
- **Pronounceability:** Correct on first read-aloud?
- **Chunking:** 1-3 syllables strongest. Familiar phoneme patterns = single chunk.
- **Stress:** Trochaic (STRONG-weak) is most natural in English.
- **Spelling:** If heard, would they spell it right?
- **Cross-language:** Fast scan against major languages for obvious problems.
```

- [ ] **Step 2: Move 2a (Divergent Generation) with modifications**

Copy current Phase 2 (lines 226-301) as `### 2a. Divergent Generation`. Apply three changes:

1. **Replace volume preference section** (lines 232-238). Remove the Explorer Mode 100-candidate hard minimum. Replace with:

```markdown
### Running count
After each generation push (a batch of names in a category or direction), report the running total: "That's [N] candidates so far across [M] categories. Want to keep going, shift direction, or move on?"

Let the user decide when they have enough. Some sessions need 40 names, others need 150. Your job is to keep generating with breadth and quality until the user says stop — not to hit a fixed number.
```

2. **Update category count**: Change "at least 6 of the 11 naming categories" (line 240) to "at least 6 of the 10 naming categories." Remove "(including Category 11: Institutional Compounds when appropriate)" from the same line.

3. **Add Gallery Mode** after the current presentation format section (after line 257):

```markdown
**Gallery Mode (default in Explorer Mode):** Before diving into categories one by one, offer a high-level gallery — the top 3-5 names from each category in a single scannable grid. This lets the user see the full breadth at a glance and identify which categories to explore further.

"Here's a quick overview across all categories. After scanning, tell me which rows pull you in and I'll expand those."

| Category | Top Candidates |
|---|---|
| Evocative | Crest, Verdant, Meridian ⚠️ |
| Found Word | Plinth, Tally, Gauge |
| Compound | Ironmark, Stonewell, Deepcraft |
| ... | ... |

Then expand the categories the user picks, showing the full numbered list with rationale. In **Focused Mode**, category-by-category remains the default.
```

4. **Reframe Institutional Compounds section** (lines 275-285): Change the heading from standalone category to a technique within compound generation. Change to `### Institutional compound patterns (within Compound generation)` and adjust intro text from "For each promising root word..." to "When generating compounds, also explore institutional compound patterns. For each promising root word..."

- [ ] **Step 3: Move 2b (Cross-Model Ideation)**

Copy current Phase 3 (lines 302-343) as `### 2b. Cross-Model Ideation`. Preserve entirely — only update any internal phase references (e.g., "Phase 2 generation" → "2a generation", "Phase 6 riffing" → "2c riffing", "Phase 8 pool recovery" → "4b pool recovery").

- [ ] **Step 4: Move 2c (Creative Riffing)**

Copy current Phase 6 (lines 403-493) as `### 2c. Creative Riffing & Directional Expansion`. Preserve all subsections:
- The riffing pipeline (5 steps)
- Riff on taken roots
- Linguistic Riffing
- Conceptual Riffing
- Structural Riffing
- Homonym, Synonym & Sound-Alike Riffing
- Systematic Affix Exploration
- The Lexicon Three-Team Method
- Output format for riffs

Update artifact references: "Appends to: `01-candidates.md`" stays. Remove "Before entering the validation pipeline" from the intro since this is now before shortlisting, not before validation. Replace with "Before shortlisting, take each promising name direction and systematically generate variants and riffs."

Update internal phase references (e.g., "Phase 9 (Variation Generation)" → "4c (Variation Generation)").

- [ ] **Step 5: Verify Loop 2 completeness**

Read the new Loop 2 section. Check:
- Inline phonetic guidance present (from old Phase 4)
- 2a has all Phase 2 content with 3 modifications applied
- 2b has all Phase 3 content
- 2c has all Phase 6 content
- All internal phase references updated to loop/stage notation
- No old Phase 4 standalone section exists

- [ ] **Step 6: Commit**

```bash
git add SKILL.md
git commit -m "Add Loop 2: Generate (divergent gen + cross-model + riffing + inline phonetic)"
```

---

### Task 4: Loop 3 — Select (3a)

- [ ] **Step 1: Move 3a (Convergent Shortlisting) with modifications**

Write `## Loop 3: Select` header. Copy current Phase 5 (lines 359-401) as `### 3a. Convergent Shortlisting`.

Apply modifications:

1. **Replace the deepening techniques section** (lines 370-396). Remove the full 10-technique numbered menu. Replace with:

```markdown
### Deepening techniques (triggered, not listed)

Before moving to validation, don't present the full menu of 10 techniques. Instead, analyze the current shortlist and recommend 2-3 techniques with specific reasoning:

"Before we move into validation, I'd suggest a couple of techniques based on what I'm seeing in your shortlist:

- [Technique] — because [specific observation about the shortlist that makes this relevant]
- [Technique] — because [specific observation]

Want to try either? Or skip straight to validation."

If the user asks "what else is available?", reference the full library in `references/elicitation-techniques.md`.
```

2. **Preserve Multi-perspective evaluation** block (lines 398-400) after the deepening section.

3. **Add cycle-back instruction** after the transition trigger:

```markdown
### Cycle-back

If the user wants more candidates after reviewing the shortlist, loop back to Loop 2. Generate in the directions they've indicated preference for, then return here.
```

4. Update artifact references: "Reads: `01-candidates.md` | Writes: `02-shortlist.md`" stays.

- [ ] **Step 2: Verify Loop 3 completeness**

Read the new Loop 3 section. Check:
- All Phase 5 content present (user-directed shortlisting, transition trigger)
- Deepening techniques now trigger-based, not full menu
- Multi-perspective evaluation preserved
- Cycle-back instruction present

- [ ] **Step 3: Commit**

```bash
git add SKILL.md
git commit -m "Add Loop 3: Select (shortlisting with trigger-based techniques)"
```

---

### Task 5: Loop 4 — De-risk (4a-4f)

- [ ] **Step 1: Write Loop 4 header and move 4a (Competitive Screening)**

Write `## Loop 4: De-risk` header. Copy current Phase 7 (lines 495-532) as `### 4a. Competitive Screening`. Preserve all content including the technical project screening subsection. Update internal references (phase → loop/stage).

- [ ] **Step 2: Move 4b (Domain Availability + Pool Recovery)**

Copy current Phase 8 (lines 534-582) as `### 4b. Domain Availability + Pool Recovery`. Preserve all content including:
- Domain checks (.com, .ai, .co, .io)
- Validation log
- Checkpoint: generate more?
- Pool recovery checkpoint

Update cycle-back references: "loop back to Phase 6" → "loop back to Loop 2", "Phase 2 (fresh generation)" → "2a (fresh generation)".

- [ ] **Step 3: Write 4c (Variation Generation + Re-screening) — merged**

Merge current Phases 9-10 (lines 584-609) into a single stage:

Copy Phase 9 (lines 584-599) as `### 4c. Variation Generation + Re-screening`. Then append Phase 10 content (lines 600-609) as a paragraph within the same section rather than a separate stage:

```markdown
### Re-screen variations

Run the same checks from 4a-4b on the new variations — competitive landscape search and domain availability. This can be a lighter pass since the root names have already been screened. Focus on confirming the variation is actually clear and the domain is actually available.
```

- [ ] **Step 4: Move 4d (Trademark Screening)**

Copy current Phase 11 (lines 610-630) as `### 4d. Trademark Screening`. Preserve all content. Update the checkpoint's loop-back references (phase → loop/stage).

- [ ] **Step 5: Write 4e (Social Handles + Stress Tests + Extended Presence Check)**

Copy current Phase 12 (lines 631-669) as `### 4e. Social Handles, Stress Tests & Extended Presence Check`. Preserve all three sub-components:

1. Social handle check content (lines 631-646) — preserved
2. Pre-Mortem stress test (lines 648-650) — preserved
3. System 1/System 2 testing (lines 651-669) — preserved

Then add the NEW extended presence check:

```markdown
### Extended presence check (offer on final 1-3 only)

For the top 1-3 finalists, offer to check broader digital presence:
- **App stores:** Apple App Store, Google Play — is the name taken by an existing app?
- **Search results:** Google "[name]" — how crowded are the results? Would this brand struggle to rank?
- **Business registries:** Is there an LLC or corporation with this name in the user's target state/country?

"Want me to do a deeper digital presence check on your top picks before we finalize?"
```

Update checkpoint loop-back references.

- [ ] **Step 6: Move 4f (Final Presentation)**

Copy current Phase 13 (lines 671-698) as `### 4f. Final Presentation`. Preserve entirely.

- [ ] **Step 7: Add cycle-back instruction**

After 4f, add:

```markdown
### Cycle-back

If the De-risk loop has reduced the pool below ~5 strong candidates, or the user isn't excited about survivors, cycle back to Loop 2 with dead names as seeds. See pool recovery in 4b.
```

- [ ] **Step 8: Verify Loop 4 completeness**

Read the new Loop 4 section. Check:
- 4a has all Phase 7 content including technical project screening
- 4b has all Phase 8 content including validation log and pool recovery
- 4c merges Phases 9-10 into one stage
- 4d has all Phase 11 content
- 4e has all Phase 12 content (social + Pre-Mortem + System 1/2) plus new extended presence check
- 4f has all Phase 13 content
- Cycle-back instruction present
- All internal phase references updated

- [ ] **Step 9: Commit**

```bash
git add SKILL.md
git commit -m "Add Loop 4: De-risk (screening + domain + variations + trademark + social + presentation)"
```

---

### Task 6: Artifact Chain + Resume Logic + Adaptive Behavior

- [ ] **Step 1: Write the artifact chain section**

After Loop 4, write the artifact chain as a standalone section. Move current lines 84-200 here. Apply changes:

1. **Simplified 00-brief.md frontmatter** — add territories and whitespace fields:

```yaml
---
session_mode: explorer | focused
naming_target: "what is being named"
one_liner: "what it does"
audience: "who it's for"
personality: [list of target traits]
archetype: "primary brand archetype"
feeling_spectrum: { authority_vs_approachability: 7, innovation_vs_heritage: 8 }
seed_words: [list]
constraints: [list]
competitors: [list of competitor names]
naming_territories:
  - name: "Territory Name"
    semantic_field: [words]
    phonetic_profile: "description"
competitive_whitespace: "summary"
timestamp: ISO-8601
---
```

2. **Simplified 01-candidates.md frontmatter** — drop counts:

```yaml
---
categories_used: [evocative, coined, found_word, compound]
cross_model_sources: [gpt-4o, gemini]
user_preferred_categories: [evocative, found_word]
user_disliked_categories: [acronymic]
territories_explored: [precision_instrument, trusted_guide, makers_workshop]
timestamp: ISO-8601
---
```

3. **Simplified 02-shortlist.md frontmatter** — drop `candidates_entering_validation`:

Keep preference_profile and taken_but_loved. Drop the count.

4. **Simplified 03-validation.md frontmatter** — drop per-check counts:

Keep per-name status (clear/flagged/taken) but drop aggregate counts like `clear: 14, flagged: 6`.

5. **Simplified 04-final.md frontmatter** — preserve as-is (already lean).

6. **Preserve the validation log section** from the original artifact chain — its content (tracks which checks have been completed per name to avoid re-running) must remain intact.

7. **Update artifact flow** to loop references:

```markdown
### How artifacts flow

- **Loop 1 (Frame)** → writes `00-brief.md`
- **Loop 2 (Generate: 2a-2c)** → appends to `01-candidates.md` (grows through generation, cross-model, and riffing)
- **Loop 3 (Select: 3a)** → reads `01-candidates.md`, writes `02-shortlist.md` (the clean handoff to validation)
- **Loop 4 (De-risk: 4a-4f)** → reads `02-shortlist.md`, writes `03-validation.md` (updated progressively), then writes `04-final.md`
- **Pool recovery** → reads taken-but-loved from `02-shortlist.md`, cycles back to Loop 2, appends riffs to `01-candidates.md`, re-validates into `03-validation.md`
- **Deepening techniques** → can fire at any point; results modify either `01-candidates.md` (if generating new candidates) or `02-shortlist.md` (if refining the shortlist)
```

8. **Preserve the "skip saves" note** (original line 212): "If the user prefers just the final answer with no intermediate artifacts, skip saves and only produce `04-final.md` at the end."

9. **Update resume logic** to loop/stage references:

```markdown
### Resuming across sessions
If the user returns after a break, check which artifacts exist in `brand-namer-output/`:
- Only `00-brief.md` exists → resume at 2a
- `01-candidates.md` exists → read its frontmatter, resume at 3a (or 2c if riffing wasn't done)
- `02-shortlist.md` exists → resume at 4a
- `03-validation.md` exists → resume at 4f
- All exist → present `04-final.md` or offer to do another round

Always confirm with the user: "I found your previous session artifacts. Here's where we left off: [summary from frontmatter]. Want to continue from here, or start fresh?"
```

- [ ] **Step 2: Move Adaptive Behavior section**

Copy current Adaptive Behavior (lines 700-708) as `## Adaptive Behavior`. Update phase references to loop/stage notation:
- "Compress Phases 1-5" → "Compress Loop 1 and 2a into a fast generation round"
- "Skip cross-model ideation, creative riffing, and validation" → "Skip 2b, 2c, and Loop 4"
- "Run the full pipeline including Phase 3 cross-model ideation and Phase 6 creative riffing" → "Run the full pipeline including 2b cross-model ideation and 2c creative riffing"
- "Save `01-candidates.md` after generation/riffing. When the user returns, read its frontmatter to resume at Phase 5 or 7" → "resume at 3a or 4a"
- "User provides names → write directly to `02-shortlist.md` → run Phases 7-13" → "run Loop 4 (4a-4f)"

- [ ] **Step 3: Verify completeness**

Check:
- All artifact frontmatter templates present (00-04)
- Artifact flow uses loop references
- Resume logic uses loop/stage references
- Adaptive behavior uses loop/stage references
- Deepening techniques flow rule preserved
- Validation log mentioned

- [ ] **Step 4: Commit**

```bash
git add SKILL.md
git commit -m "Add artifact chain, resume logic, and adaptive behavior with loop refs"
```

---

### Task 7: Delete backup and final SKILL.md verification

- [ ] **Step 1: Read complete new SKILL.md**

Read the entire file end-to-end to verify structure and flow.

- [ ] **Step 2: Content audit against original**

Using SKILL.md.bak, verify NO content was silently dropped. Check each original section has a home:

| Original Section | New Location | Status |
|---|---|---|
| Frontmatter (lines 1-4) | Top of file | |
| Intro (lines 6-8) | Top of file | |
| Philosophy (lines 10-18) | Top of file | |
| Reference table (lines 20-30) | Top of file (updated) | |
| Phase 1: Brief (lines 32-80) | 1a | |
| Artifact chain (lines 84-200) | Standalone section after loops | |
| Resume logic + skip saves (lines 201-213) | Standalone section (within artifact chain) | |
| Session mode (lines 214-224) | Within 1a | |
| Phase 2: Generation (lines 226-301) | 2a (modified) | |
| Phase 3: Cross-model (lines 302-343) | 2b | |
| Phase 4: Phonetic (lines 344-358) | Inline at top of Loop 2 | |
| Phase 5: Shortlisting (lines 359-401) | 3a (modified) | |
| Phase 6: Riffing (lines 403-493) | 2c | |
| Phase 7: Competitive (lines 495-532) | 4a | |
| Phase 8: Domain (lines 534-582) | 4b | |
| Phase 9: Variation gen (lines 584-599) | 4c (merged) | |
| Phase 10: Variation val (lines 600-609) | 4c (merged) | |
| Phase 11: Trademark (lines 610-630) | 4d | |
| Phase 12: Social/stress (lines 631-669) | 4e | |
| Phase 13: Final (lines 671-698) | 4f | |
| Adaptive behavior (lines 700-708) | Adaptive Behavior section | |

- [ ] **Step 3: Verify all new content is present**

Check the three new additions exist:
- 1b (Naming Territories) with example table
- 1c (Competitive Whitespace Mapping)
- Extended Presence Check in 4e

- [ ] **Step 4: Verify all modifications applied**

Check:
- 100-name minimum replaced with running count + user choice
- "11 naming categories" → "10" and "6 of 11" → "6 of 10"
- Institutional Compounds reframed as sub-pattern (check lines 275-285 area)
- Gallery Mode present in 2a (default in Explorer Mode, not Focused)
- Deepening techniques trigger-based in 3a: 2-3 recommendations (not 3-5, not full menu)
- Multi-perspective evaluation preserved within 3a
- Phases 9-10 merged in 4c
- 4e contains all three sub-components: social handles (always-on for Tier 1), stress tests (Pre-Mortem + System 1/2, optional), extended presence check (new, final 1-3)
- System 1/2 results recording to 03-validation.md instruction preserved
- Inline conflict flagging (philosophy principle #5) preserved
- Validation log preserved with full content
- All phase references updated to loop/stage notation throughout

- [ ] **Step 5: Delete backup**

```bash
rm SKILL.md.bak
```

- [ ] **Step 6: Commit**

```bash
git add SKILL.md
git commit -m "Complete SKILL.md restructure: verify content, remove backup"
```

---

## Chunk 2: README.md and CLAUDE.md Updates

### Task 8: Update README.md

**Files:**
- Modify: `README.md`

- [ ] **Step 1: Update "What it does" section**

Replace the current 13-phase numbered list with the 4-loop structure:

```markdown
1. **Frame** — brand brief intake, naming territories definition, competitive whitespace mapping
2. **Generate** — divergent generation across 10 naming categories, cross-model ideation with GPT/Gemini/Grok, creative riffing with 8 riff axes, inline phonetic quality checks
3. **Select** — user-directed convergent shortlisting with AI-recommended deepening techniques (SCAMPER, TRIZ, Red Team/Blue Team, etc.)
4. **De-risk** — competitive screening, domain availability, variation generation, trademark screening, social handles, optional stress tests (Pre-Mortem, System 1/2), extended presence checks on finalists
```

Note: preserve the detail level — mention key sub-stages so readers understand the depth.

- [ ] **Step 2: Update "Artifact chain" section**

Update artifact flow description to use loop references instead of phase references.

- [ ] **Step 3: Update "Key design decisions" section**

- Change "100-candidate hard minimum in Explorer Mode" to "User-driven candidate counts with running totals"
- Add "Naming territories — strategic creative directions defined before generation"
- Add "Competitive whitespace mapping — avoid sounding like the competitive set"
- Add "Gallery Mode — scannable grid presentation in Explorer Mode"
- Change "AI-recommended techniques" to "Trigger-based technique recommendations"

- [ ] **Step 4: Update "File structure" section**

Update line count for SKILL.md (will change after restructure). Update description to mention "4 loops" instead of "13-phase pipeline."

- [ ] **Step 5: Update "Usage examples" section**

Update session depth descriptions to use loop terminology instead of phase numbers.

- [ ] **Step 6: Verify README accuracy against new SKILL.md**

Read both files. Confirm README claims match SKILL.md reality.

- [ ] **Step 7: Commit**

```bash
git add README.md
git commit -m "Update README to reflect 4-loop architecture"
```

---

### Task 9: Update CLAUDE.md

**Files:**
- Modify: `CLAUDE.md`

- [ ] **Step 1: Update project description**

Change "13-phase pipeline" to "4-loop cyclable architecture (Frame → Generate → Select → De-risk)."

- [ ] **Step 2: Update key conventions**

- Add mention of naming territories and competitive whitespace in Frame loop
- Update "Reference files are loaded on-demand" to reference loop/stage notation
- Update artifact output description

- [ ] **Step 3: Update "Working on this project"**

Change "preserve the phase numbering (1-13)" to "preserve the loop structure (1-4) and stage lettering (a-f)."

- [ ] **Step 4: Commit**

```bash
git add CLAUDE.md
git commit -m "Update CLAUDE.md for 4-loop architecture"
```

---

### Task 10: Final push

- [ ] **Step 1: Push all commits to remote**

```bash
git push
```

- [ ] **Step 2: Verify commit history**

```bash
git log --oneline -10
```

Expected: ~8 clean commits showing the restructure progression.
