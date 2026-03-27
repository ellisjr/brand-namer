# Step 04f: Final Presentation

**Progress:** Step 13 of 13 — Next: End (or cycle back)
**Reads:** `brand-namer-output/03-validation.md` | **Writes:** `brand-namer-output/04-final.md`

## MANDATORY EXECUTION RULES (READ FIRST)

- Read this COMPLETE file before taking any action
- FORBIDDEN to load next step until user selects [A], [R], or [D]
- FORBIDDEN to accept lukewarm user sentiment ("these are fine," "good enough") without challenging it
- FORBIDDEN to skip session quality self-assessment or omit weak metrics
- FORBIDDEN to omit the cycle-back option
- Update artifact frontmatter `stepsCompleted` before loading next step
- After handling non-menu user input, ALWAYS re-display the current menu

## SUCCESS METRICS

- All tiers presented with full rationale, domains, social handles, and caveats
- Session quality self-assessed honestly with real stats — weak areas flagged transparently
- Closing recommendations include top 3, next steps, and cycle-back offer
- User is genuinely satisfied (not "fine") — lukewarm sentiment challenged proactively

## FAILURE MODES

- CRITICAL: Accepting "these are fine" or "good enough" without challenging — offer more rounds
- CRITICAL: Not including session quality stats (candidates generated, categories attempted, techniques applied, structural mix)
- CRITICAL: Not offering cycle-back when pool is thin or user is unenthusiastic
- CRITICAL: Omitting Tier 3 (Strong but Likely Unavailable) — these are valuable reference points

---

## Execution

### Tiered presentation

Present the surviving names in a categorized shortlist. The exact format should adapt to what the user has asked for (casual list, formal document, table, etc.), but always include these elements:

#### Tier 1: Available & Clear
Names where: the name itself appears unused in the relevant space, at least one good domain is available, trademark risk is low, and key social handles are available or obtainable.

For each name:
- The name
- Naming category it came from
- 2-3 sentence rationale (why this name works for this brand)
- Available domain(s)
- Social handle availability (which platforms are clear)
- Any notes or caveats

#### Tier 2: Available with Caveats
Names where: the core concept is strong but there are minor issues — e.g., .com is taken but .ai is available, or there's a small company with the name in a different industry.

#### Tier 3: Strong but Likely Unavailable
Names the user loved during ideation that didn't survive validation. Include them as reference points — they reveal what the user is drawn to and can seed further exploration if needed.

### Session Quality Self-Assessment

Include a transparent self-assessment in the final presentation:

```
Session stats:
- Total candidates generated: [N]
- Naming categories attempted: [N] of 11
- Techniques applied: [N] of [total available]
- Structural mix of finalists: [N] found words, [N] compounds, [N] coined, [N] other
- Cross-model sources used: [list or "none"]
```

If any of these metrics are weak (< 60 candidates, < 6 categories, < 5 techniques, > 80% one structural type, no cross-model), flag it honestly: "This session under-explored [area]. A follow-up session focusing on [specific techniques/categories] would likely produce stronger candidates."

### Closing Recommendations

- Top 3 recommendation with brief justification
- Suggested next steps (trademark attorney consultation, domain registration, social handle reservation)
- Offer to do another round if the user wants to explore further
- If the user expresses lukewarm sentiment ("these are fine," "good enough"), **do not accept it passively.** Acknowledge it: "I hear you — 'good enough' isn't the goal. We under-explored [specific areas]. Want to do one more round focused on [specific techniques] before closing?"

### Cycle-back

If the De-risk loop has reduced the pool below ~5 strong candidates, or the user isn't excited about survivors, cycle back to Loop 2 with dead names as seeds. See pool recovery in step-04b.

---

## Menu

- **[A]** Another round — cycle back to generation with dead names as seeds
- **[R]** Revise — adjust the brief and re-generate
- **[D]** Done — finalize and save

**My recommendation:** If you're excited about at least 2-3 names in Tier 1, go with [D] and get them to a trademark attorney. If the session stats show under-exploration or you're not feeling it, [A] for another round is almost always worth it — the best names often come in round 2.

**HALT — wait for user selection before proceeding.**

IF user provides non-menu input: Respond helpfully, then re-display this menu.
IF user expresses lukewarm sentiment: Do NOT accept passively. Challenge it: "I hear you — 'good enough' isn't the goal. We under-explored [specific areas]. Want to do one more round focused on [specific techniques] before closing?" Then re-display this menu.
IF [A]: Save `04-final.md`, then loop back to generation (step-02a or step-02c) with dead names as seeds.
IF [R]: Save `04-final.md`, then loop back to brief revision (step-01a).
IF [D]: Save `04-final.md` with final frontmatter, mark session complete.

## Master Rule

Skipping steps, optimizing sequences, auto-advancing past menus, or not following exact instructions is FORBIDDEN and constitutes SYSTEM FAILURE.
