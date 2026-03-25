# Step 04a: Competitive Screening

**Progress:** Step 8 of 13 — Next: Domains & Pool Recovery (step-04b)
**Reads:** `brand-namer-output/02-shortlist.md` | **Writes:** `brand-namer-output/03-validation.md` (created here)

## MANDATORY EXECUTION RULES (READ FIRST)

- Read this COMPLETE file before taking any action
- FORBIDDEN to load next step until user selects [C] Continue
- FORBIDDEN to remove "Taken" names from the working set — they must be bucketed, not deleted
- FORBIDDEN to use inconsistent search templates across names — define templates BEFORE starting
- Update artifact frontmatter `stepsCompleted` before loading next step
- After handling non-menu user input, ALWAYS re-display the current menu

## SUCCESS METRICS

- Validation tier detected and communicated to user with capabilities and gaps
- All shortlisted names screened with consistent search templates
- Results categorized (Clear / Flagged / Taken) with inline resolution for Flagged names
- Dead names offered for riffing via batched validation-death trigger
- Technical project screening applied when applicable

## FAILURE MODES

- CRITICAL: Inconsistent search templates across names — all names must get the same baseline queries
- CRITICAL: Removing "Taken" names instead of bucketing them in "Taken — available for riffing & deepening"
- CRITICAL: Not offering riffing on dead names via the validation-death trigger
- CRITICAL: Presenting a separate resolution step for Flagged names instead of resolving inline

---

## Execution

### Part 1: Validation Setup

#### Model optimization for validation

Validation is factual and parallelizable — it doesn't need the creative reasoning that generation requires. Use smaller/faster models to save tokens and time:

**Subagent spawning for validation (recommended):**
When validating 5+ names, spawn parallel subagents at Haiku tier rather than doing sequential searches with the main model. Each subagent handles one name:

```
For each shortlisted name, spawn a Haiku subagent:
"Search for '[name]' as a company, brand, or software product.
 Classify: Clear (no conflicts) / Flagged (something exists, different industry) / Taken (active conflict in related space).
 Check domains: [name].com, [name].ai, [name].co, [name].io — search site:[name].[tld] for each.
 Return: name, competitive_status, conflicts_found, domain_status_per_tld"
```

This turns 20 minutes of sequential main-model searches into 2-3 minutes of parallel Haiku work. The main model then consolidates results and presents the batched screening table.

**Session-level model recommendations:**
- **Quick Mode:** Sonnet is sufficient and significantly cheaper than Opus. The compressed pipeline doesn't benefit from Opus's deeper reasoning.
- **Deep Mode:** Opus recommended for best creative output, especially during generation branching and riffing.
- **Validation-heavy sessions:** Run the main session on Sonnet/Opus, spawn Haiku subagents for all screening tasks.

#### Validation tools and limitations

**Set up before starting validation.** Web searches are unreliable proxies for domain availability and trademark clearance. Use the right tools:

- **Domain availability:** Check specific TLDs explicitly using `site:[name].[tld]` searches or direct registrar lookups (Namecheap, Cloudflare, GoDaddy). Do NOT say "check name.ai" without actually searching for it — search `site:name.ai` or `"name.ai"` directly. Check `.com`, `.ai`, `.co`, `.io` for every candidate.
- **Trademark search:** [MarkerAPI](https://markerapi.com/) offers text-based USPTO trademark search via REST API (paid). [Apify AI Trademark Conflict Analyzer](https://apify.com/vibexcoder/ai-trademark-conflict-analyzer/api/mcp) provides risk scores and phonetic matching as an MCP server (needs Apify account). The [jordanburke/trademark-mcp-server](https://github.com/jordanburke/trademark-mcp-server) searches by serial/registration number only (not by name) and requires a USPTO API key. For common English words (e.g., "Triage," "Assay"), a trademark attorney is essential for Class 9/42 clearance.
- **Social handles:** Search `x.com/[name]`, `instagram.com/[name]`, and LinkedIn company pages directly.

If no trademark tools are available, use web search proxies (`"[name]" trademark USPTO software`) but note the limitation clearly to the user.

#### Validation degradation tiers

Not every session has access to full tooling. Adapt validation depth to what's available:

| Tier | Tools available | What you can do |
|---|---|---|
| **Tier A (Full)** | Web search + domain registrar + trademark API + social search | Full validation pipeline: competitive screen, explicit TLD checks, trademark search, social handle checks |
| **Tier B (Web only)** | Web search only | Competitive screening via web search, domain checks via `site:[name].[tld]` searches, trademark via `"[name]" trademark USPTO` proxies. Note limitations to user. |
| **Tier C (Offline)** | No external tools | Conflict flagging from training data only (inline flags). Heuristic risk labeling based on name characteristics (common English words = high risk, compounds = lower risk, coined = lowest risk). Recommend the user do their own domain/trademark checks and provide a checklist. |

Detect your tier at the start of this step and inform the user: "I have access to [tools]. This means I can [capabilities]. For [gaps], I recommend [workaround]."

### Part 2: Competitive Screening

The inline flagging throughout Loop 2 has already caught conflicts visible in training data. This stage catches what training data missed — recent companies, small competitors, and names that only show up via web search.

Confirm the shortlist with the user: "Here are the [N] names we're taking into validation: [list]. The flags caught some obvious conflicts during generation. Now I'll do web searches to catch anything my training data missed, then check domains, generate variations where needed, screen trademarks, and check social handles. Ready to proceed?"

For each shortlisted name (focusing on those WITHOUT existing flags — flagged names get a lighter check), do a web search:

- Search: `"[name]"` — is there a well-known company or product with this exact name?
- Search: `"[name]" + [industry/category]` — is there a direct competitor using it?

**Consistent search templates:** Define query templates BEFORE starting and apply the same set to every name in the batch. For example: Template A: `"[name]" software company platform`, Template B: `"[name]" [industry] AI`. Do NOT improvise different search variations for different names — inconsistent queries produce inconsistent signal, making results incomparable. If a name warrants deeper investigation after the standard pass, run additional searches, but the baseline must be consistent.

**Categorize each name after this pass:**
- **Clear** — no obvious conflicts found
- **Flagged** — there's something out there with this name but it might not be a conflict (different industry, tiny company, defunct)
- **Taken** — there's a clear, active company/product with this name in a related space

**Resolving "Flagged" names inline:** Include a "Decision" column directly in the competitive screening table for flagged names. Don't present a separate resolution menu — fold it into the same view:

| Name | Status | Conflict | Decision |
|---|---|---|---|
| Siftworks | Clear | — | — |
| Gauge | Taken | Gauge.ai, GaugeOnline | → riff or note for later |
| Headland | Flagged | Headlands Technologies (quant trading) | Proceed / Kill / Defer to attorney? |

Ask the user to mark each flagged name inline. This keeps the flow administrative-light and avoids a separate resolution step.

Report results to the user. **Do NOT remove "Taken" names from the working set.** Move them to a "Taken — available for riffing & deepening" bucket. A taken name that the user loves is a powerful creative signal: it tells you exactly what emotional territory to explore. Use taken names as inputs to:
- **Riffing (2c techniques):** SCAMPER, etymological mining, adjacent metaphors, compound creation, structural shifts
- **Deepening (3a techniques):** Constraint Removal (what if the domain didn't matter — what's the *feeling* you want?), Inversion (what makes this name work — now find something available with the same properties), Six Thinking Hats (evaluate the taken name's strengths systematically, then hunt for available names that hit the same marks)
- **Variation Generation (4c):** prefix/suffix, creative respelling, compound extensions

The goal is to find an *available* name that carries the same energy. Taken names are creative assets, not dead ends.

#### Validation-death trigger (mandatory — batched)
When names die in competitive screening, don't fire a recovery prompt for each one individually. Collect all deaths from the validation round, then present one consolidated recovery menu:

"**[N] names died in this round:**

| Name | Killed by | What made it compelling |
|---|---|---|
| [Name 1] | [conflict] | [energy/quality the user liked] |
| [Name 2] | [conflict] | [energy/quality] |
| ... | ... | ... |

**Which (if any) do you want to riff on?** Pick by number, or:
- **[A]** Riff on selected — generate available alternatives with the same energy
- **[B]** Riff on all — full recovery pass on every dead name
- **[C]** Note for later — add to taken-but-loved bucket for pool recovery
- **[D]** Move on — work with survivors only"

This turns validation failures into generation triggers while keeping the session flowing.

#### Technical project screening (for dev tools, open source, skills, MCPs, plugins)
When naming a technical project, add these sources to the competitive screen:

- **GitHub:** Search `github.com/search?q=[name]&type=repositories` — look for repos with >100 stars or active development
- **npm:** Search `npmjs.com/search?q=[name]` — check for published packages with meaningful download counts
- **PyPI:** Search `pypi.org/search/?q=[name]` — check for published Python packages
- **VS Code Marketplace:** Search for extensions with the name
- **MCP server registries:** Search Smithery.ai, mcp.run, and glama.ai for registered MCP servers
- **Claude Code skills directories:** Search awesome-claude-code-skills repos and similar directories
- **Docker Hub:** Search for official or popular images with the name
- **Homebrew:** Search `brew search [name]` formulae

Categorize technical conflicts the same way (Clear / Flagged / Taken). A 50-star GitHub repo in an unrelated domain is "Flagged"; a 5,000-star repo in the same space is "Taken." Package registry names are particularly important — if `npm install [name]` already resolves to something, that's a meaningful conflict even if the package is small.

---

## Menu

- **[C]** Continue — proceed to Domain Checks (Step 9 of 13)

**My recommendation:** If names died during screening, use the validation-death trigger menu above before continuing. Taken names with strong energy are your best creative seeds — riff on them now rather than losing that signal.

**HALT — wait for user selection before proceeding.**

IF user provides non-menu input: Respond helpfully, then re-display this menu.
IF [C]: Save `03-validation.md`, update frontmatter `stepsCompleted`, load next step (`steps/step-04b-domains.md`).

## Master Rule

Skipping steps, optimizing sequences, auto-advancing past menus, or not following exact instructions is FORBIDDEN and constitutes SYSTEM FAILURE.
