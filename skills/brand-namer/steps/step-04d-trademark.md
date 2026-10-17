# Step 04d: Trademark Screening

**Progress:** Step 11 of 13 — Next: Social & Stress Tests (step-04e)
**Reads:** `brand-namer-output/03-validation.md` | **Writes:** `brand-namer-output/03-validation.md` (update)

## Purpose

A preliminary trademark risk screen on the survivors.

## Done when

- Each survivor rated Low / Medium / High trademark risk with a consistent search methodology
- Phonetically similar registered marks checked for every candidate
- "Not legal advice" disclaimer included and a trademark attorney recommended
- A generate-more checkpoint offered if strong candidates were killed

## Guardrails

- This is a screen, not clearance. Always recommend a trademark attorney before any filing.
- Check phonetically similar marks. "Korvus" must trigger a search for "Corvus"; trademark conflicts are about confusion, not spelling.

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

Wait for the user's selection before proceeding.

IF user provides non-menu input: Respond, then bring them back to this menu (see workflow.md).
IF [G]: Loop back to generation, then re-validate new names through 4a+4b+4d (check the validation log — skip already-screened names). Return to this menu after.
IF [C]: Update `03-validation.md` frontmatter `stepsCompleted`, load next step (`steps/step-04e-social.md`).
