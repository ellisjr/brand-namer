# Step 04d: Trademark Screening

**Progress:** Step 11 of 13 — Next: Social & Stress Tests (step-04e)
**Reads:** `brand-namer-output/03-validation.md` | **Writes:** `brand-namer-output/03-validation.md` (update)

## MANDATORY EXECUTION RULES (READ FIRST)

- Read this COMPLETE file before taking any action
- FORBIDDEN to load next step until user selects [C] Continue
- FORBIDDEN to claim trademark clearance — this is a preliminary screen, not legal advice
- FORBIDDEN to skip phonetically similar mark checks
- Update artifact frontmatter `stepsCompleted` before loading next step
- After handling non-menu user input, ALWAYS re-display the current menu

## SUCCESS METRICS

- All survivors screened for trademark risk with consistent search methodology
- Each name categorized as Low / Medium / High trademark risk
- Phonetically similar registered marks checked for every candidate
- "Not legal advice" disclaimer included — trademark attorney recommended
- Checkpoint offered after screening in case strong candidates were killed

## FAILURE MODES

- CRITICAL: Claiming trademark clearance instead of recommending a trademark attorney
- CRITICAL: Not checking phonetically similar marks (e.g., "Korvus" must trigger a search for "Corvus")
- CRITICAL: Skipping the "not legal advice" disclaimer

---

## Execution

### Trademark risk assessment

For names that have survived to this point, do a deeper trademark risk assessment:

- Search: `"[name]" trademark` or `"[name]" registered trademark`
- Search: `"[name]" site:uspto.gov` (US Patent and Trademark Office)
- Search: `"[name]" site:euipo.europa.eu` (EU Intellectual Property Office) if relevant
- Check for phonetically similar registered marks (e.g., if the name is "Korvus," search for "Corvus" too)

**Categorize trademark risk:**
- **Low Risk** — no similar trademarks found in related classes
- **Medium Risk** — similar marks exist but in different industries/classes
- **High Risk** — identical or very similar marks in the same or adjacent industry

Important: This is a preliminary screen, not legal advice. Always recommend the user consult a trademark attorney before finalizing any name for registration.

### Checkpoint: generate more?

After trademark results, if any strong candidates were killed, ask: "Trademark screening eliminated [names]. Want to continue to social handle checks with the survivors, or generate more options first?" Same loop-back options as the 4b checkpoint. Only run 4a+4b+4d on new names (check the validation log).

---

## Menu

- **[G]** Generate more — loop back for more options (run 4a+4b+4d on new names only)
- **[C]** Continue — proceed to Social & Stress Tests (Step 12 of 13)

**My recommendation:** If your strongest candidates survived trademark screening with Low Risk ratings, proceed with [C]. If trademark screening killed favorites, use [G] to generate replacements before moving on — it's cheaper to generate now than to restart later.

**HALT — wait for user selection before proceeding.**

IF user provides non-menu input: Respond helpfully, then re-display this menu.
IF [G]: Loop back to generation, then re-validate new names through 4a+4b+4d (check the validation log — skip already-screened names). Return to this menu after.
IF [C]: Update `03-validation.md` frontmatter `stepsCompleted`, load next step (`steps/step-04e-social.md`).

## Master Rule

Skipping steps, optimizing sequences, auto-advancing past menus, or not following exact instructions is FORBIDDEN and constitutes SYSTEM FAILURE.
