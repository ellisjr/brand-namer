# Step 04c: Variation Generation + Re-screening

**Progress:** Step 10 of 13 — Next: Trademark Screening (step-04d)
**Reads:** `brand-namer-output/03-validation.md` | **Writes:** `brand-namer-output/03-validation.md` (update)

## MANDATORY EXECUTION RULES (READ FIRST)

- Read this COMPLETE file before taking any action
- FORBIDDEN to load next step until user selects [C] Continue
- FORBIDDEN to generate variations without re-screening them through 4a+4b checks
- FORBIDDEN to skip re-screening — every variation must be validated before joining the pool
- Update artifact frontmatter `stepsCompleted` before loading next step
- After handling non-menu user input, ALWAYS re-display the current menu

## SUCCESS METRICS

- 3-5 variations generated for names needing domain workarounds
- Phonetic and emotional qualities of original names preserved in variations
- All variations re-screened through 4a (competitive) + 4b (domain) checks
- SCAMPER applied for creative variations beyond simple prefix/suffix patterns

## FAILURE MODES

- CRITICAL: Generating variations without re-screening them through competitive and domain checks
- CRITICAL: Only generating prefix/suffix patterns without applying creative techniques like SCAMPER
- CRITICAL: Losing the phonetic or emotional qualities that made the original name strong

---

## Execution

### Variation generation

For names where the exact preferred domain is unavailable but the name itself is strong:

- Try prefixes: get[name], use[name], try[name], hello[name], meet[name]
- Try suffixes: [name]hq, [name]app, [name]labs, [name]studio
- Try modifiers: [name]ai, [name]co, [name]io (as part of the name, not just TLD)
- Try creative respellings that preserve pronunciation
- Try compound extensions: [name] + a relevant word
- Try ccTLD domain hacks: can the name (or a riff on it) split naturally at a TLD boundary? E.g., if "Supply" is strong but taken → supp.ly. If "Genius" resonates → geni.us. Check `.ly`, `.is`, `.us`, `.io`, `.me`, `.al`, `.it`, `.to` as word-completion TLDs. The split must be natural — the prefix should be a real word or suggestive fragment, and pronunciation should flow across the dot. See `references/naming-techniques.md` Domain Hacks section for the full ccTLD table and generation technique.

Generate 3-5 variations per name that needs them. Preserve the phonetic and emotional qualities of the original.

For more creative variations beyond prefix/suffix patterns, apply **SCAMPER** from `references/elicitation-techniques.md` to each name — substitute syllables, combine candidates, adapt to other languages, modify spelling, eliminate to the core sound, reverse or rearrange.

### Re-screen variations

Run the same checks from 4a-4b on the new variations:
- Quick competitive landscape search
- Domain availability check

This can be done in a lighter pass since the root names have already been screened. Focus on confirming the variation is actually clear and the domain is actually available.

---

## Menu

- **[C]** Continue — proceed to Trademark Screening (Step 11 of 13)

**My recommendation:** Review the variations table carefully before continuing. Strong variations often outperform the originals — a creative respelling or compound extension can be more ownable and distinctive than the root name.

**HALT — wait for user selection before proceeding.**

IF user provides non-menu input: Respond helpfully, then re-display this menu.
IF [C]: Update `03-validation.md` frontmatter `stepsCompleted`, load next step (`steps/step-04d-trademark.md`).

## Master Rule

Skipping steps, optimizing sequences, auto-advancing past menus, or not following exact instructions is FORBIDDEN and constitutes SYSTEM FAILURE.
