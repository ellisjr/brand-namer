# Step 04b: Domain Availability + Pool Recovery

**Progress:** Step 9 of 13 — Next: Variation Generation (step-04c)
**Reads:** `brand-namer-output/03-validation.md` | **Writes:** `brand-namer-output/03-validation.md` (update)

## MANDATORY EXECUTION RULES (READ FIRST)

- Read this COMPLETE file before taking any action
- FORBIDDEN to load next step until user selects [C] Continue
- FORBIDDEN to skip any of the 4 TLDs (.com, .ai, .co, .io) — check all four for every name
- FORBIDDEN to allow more than 3 recovery rounds without a decision checkpoint
- FORBIDDEN to auto-loop recovery — always ask before each round
- Update artifact frontmatter `stepsCompleted` before loading next step
- After handling non-menu user input, ALWAYS re-display the current menu

## SUCCESS METRICS

- All survivors checked for domain availability across all 4 TLDs (.com, .ai, .co, .io)
- Validation log maintained tracking which checks each name has passed
- Pool recovery offered proactively if pool drops below ~5 strong candidates
- Recovery rounds capped at 3 with minimum delta check enforced

## FAILURE MODES

- CRITICAL: Not checking all 4 TLDs for every surviving name
- CRITICAL: Allowing endless recovery loops (>3 rounds) without forcing a decision checkpoint
- CRITICAL: Not tracking which names have already been validated (re-running expensive searches)
- CRITICAL: Not offering pool recovery when pool is dangerously thin

---

## Execution

### Domain availability check

For each surviving name, check domain registration across key TLDs:

- `.com` (most important for most use cases)
- `.ai` (increasingly important for tech companies)
- `.co` (common alternative)
- `.io` (developer/tech standard)
- Additional ccTLDs if the brief involves domain hacks (`.ly`, `.is`, `.us`, `.me`, `.al`, `.it`, `.to`)

#### Method: WHOIS via CLI (primary)

Use `whois -h <server> <domain>` via bash to get definitive registration status. This is pre-installed on macOS, requires no API keys, and catches registered-but-parked domains that web searches miss.

**WHOIS server map — use the `-h` flag to target the correct server:**

| TLD | WHOIS Server | Command example |
|---|---|---|
| `.com`, `.net` | `whois.verisign-grs.com` | `whois -h whois.verisign-grs.com candidatename.com` |
| `.org` | `whois.pir.org` | `whois -h whois.pir.org candidatename.org` |
| `.io` | `whois.nic.io` | `whois -h whois.nic.io candidatename.io` |
| `.ai` | `whois.nic.ai` | `whois -h whois.nic.ai candidatename.ai` |
| `.co` | `whois.nic.co` | `whois -h whois.nic.co candidatename.co` |
| `.ly` | `whois.nic.ly` | `whois -h whois.nic.ly candidatename.ly` |
| `.is` | `whois.isnic.is` | `whois -h whois.isnic.is candidatename.is` |
| `.me` | `whois.nic.me` | `whois -h whois.nic.me candidatename.me` |
| `.so` | `whois.nic.so` | `whois -h whois.nic.so candidatename.so` |
| `.tv` | `whois.nic.tv` | `whois -h whois.nic.tv candidatename.tv` |
| `.sh` | `whois.nic.sh` | `whois -h whois.nic.sh candidatename.sh` |
| `.gg` | `whois.gg` | `whois -h whois.gg candidatename.gg` |
| `.xyz` | `whois.nic.xyz` | `whois -h whois.nic.xyz candidatename.xyz` |
| `.app`, `.dev` | **No WHOIS** — use RDAP | See RDAP fallback below |

**Parsing WHOIS results:** If the output contains any of these strings (case-insensitive), the domain is **available**: `"No match"`, `"NOT FOUND"`, `"No entries found"`, `"does not exist"`, `"No Object Found"`, `"Domain not found"`. Any other response with registration data means the domain is **registered**.

**Performance:** Run checks in parallel using bash background processes. 20-50 domains can be checked in under 2 seconds. Example for batch checking:

```bash
for domain in name1.com name1.ai name2.com name2.ai; do
  (whois -h whois.verisign-grs.com "$domain" 2>/dev/null | grep -qi "no match\|not found\|no entries\|does not exist\|no object" && echo "$domain: AVAILABLE" || echo "$domain: REGISTERED") &
done
wait
```

Adjust the WHOIS server per TLD. For mixed-TLD batches, route each domain to the correct server.

#### Fallback: RDAP (for .app, .dev, or when WHOIS fails)

RDAP is the modern replacement for WHOIS. It returns JSON over HTTP — HTTP 404 means available, HTTP 200 means registered.

```bash
curl -s -o /dev/null -w "%{http_code}" "https://rdap.org/domain/candidatename.app"
```

The `rdap.org` bootstrap service auto-routes to the correct registry. For direct endpoints:
- `.app`, `.dev` → `https://pubapi.registry.google/rdap/domain/{name}`
- `.com` → `https://rdap.verisign.com/com/v1/domain/{name}`
- `.ly` → `https://rdap.nic.ly/domain/{name}`
- `.is` → `https://rdap.isnic.is/rdap/domain/{name}`

#### Categorize results

| Status | What it means | How detected |
|---|---|---|
| **Available** | Domain is not registered | WHOIS returns "no match" / RDAP returns 404 |
| **Registered** | Domain is registered (may be parked, for sale, or active) | WHOIS returns registration data / RDAP returns 200 |
| **Active** | Domain has a live website | Supplementary web search confirms active use |

**Important:** "Registered" does NOT mean "has a website." Many registered domains are parked, for sale, or have no DNS configured. If a domain is registered, optionally do a supplementary web search (`site:[name].[tld]`) to determine if it has an active website — this helps the user assess whether purchase might be possible.

Present results as a quick-reference table.

### Validation log

Maintain a running log of which checks have been completed for each name. This prevents re-running expensive searches when names re-enter the pipeline through recovery loops or new generation rounds. Track:
- **Competitive screen:** done/not done (4a)
- **Domain check:** done/not done (4b)
- **Trademark screen:** done/not done (4d)
- **Social handle check:** done/not done (4e)

When new names enter the pipeline (from recovery riffing, new generation rounds, or variation generation), only run checks they haven't already passed. When saving stage outputs to markdown, include this log so it persists across sessions.

### Checkpoint: generate more?

After presenting domain results, ask the user:

"We're down to [N] candidates after competitive and domain checks. Want to continue to trademark screening with these, or would you like to generate more options first? I can riff on the taken names that had strong energy, run a fresh generation round in directions you liked, or try a deepening technique to find new territory."

If the user wants more: loop back to Loop 2 (riffing on taken seeds or fresh generation), then re-validate only the NEW names (check the validation log — skip names already screened).

### Pool recovery checkpoint

After the domain check, assess the surviving pool. If validation (4a-4b) has reduced the pool below ~5 strong candidates, or if the user's favorites were disproportionately killed, proactively offer to resurrect earlier names:

"The validation pipeline was aggressive — we're down to [N] survivors. But several names that got killed had strong energy. Want me to bring any of these back for riffing and deepening? I won't use the taken names directly, but I can use them as starting points to generate available alternatives that carry the same feeling."

Present the taken-but-loved bucket from `02-shortlist.md` frontmatter, plus any names the user starred during ideation that were cut. For each, note:
- Why it was killed (competitor, domain, trademark)
- What made it compelling (the emotional territory, the phonetic quality, the story type)

Let the user select which (if any) to bring back into the mix. Then:
1. **Apply the core riffing techniques** to each taken-but-loved direction (grouped by theme, not individual names):
   - SCAMPER (all 7 lenses)
   - Compound creation (each root x 5+ second words)
   - Creative respelling (Y-for-I, K-for-C, dropped vowels)

   Then ask: "Want me to go deeper with additional techniques?" If yes, escalate to:
   - Synonym explosion (5-10 synonyms per root)
   - Language shift (Latin, Greek, French at minimum)
   - Systematic affix exploration (prefix AND suffix positions)
   - Tech branding patterns (-OS, -ware, -wise, -er, -base, -box)
   - Zoom in/out and adjacent metaphor
   - Lexicon Three-Team method (on-brief, competitor, unrelated domain)
   - Conceptual riffing (TRIZ, First Principles, Analogical Reasoning)
2. **Present riff results to the user for reaction** before validating — let them pick favorites
3. **Re-validate the new candidates before they rejoin the pool:** run them through 4a (competitive screen — including technical project screening if applicable) and 4b (domain check, with explicit TLD searches) then update `03-validation.md`. Only candidates that pass re-enter the active pool alongside the original survivors.

This is a mini-loop, not a full pipeline restart. Pool recovery is often where the BEST names emerge — the taken-but-loved names tell you exactly what emotional territory works, and the full riffing toolkit finds available alternatives in that territory.

### Loop exit criteria

Recovery loops can amplify churn — each round generates new candidates that need validation, which kills more names, which triggers more recovery. Prevent endless loops:

- **Maximum 3 recovery rounds** before forcing a decision checkpoint: "We've done [N] recovery rounds. We have [M] survivors. Options: (a) proceed to final presentation with these, (b) one more targeted round on a specific direction, (c) step back and reframe the brief."
- **Minimum delta check:** If a recovery round produces fewer than 3 new viable candidates (post-validation), the technique is exhausted. Switch to a different approach or accept the current pool.
- **Explicit stop gate:** After each recovery round, ask: "Continue recovering, or work with what we have?" Don't auto-loop.

---

## Menu

- **[G]** Generate more — riff on dead names or fresh generation (loop to step-02c or step-02a)
- **[R]** Recover — run pool recovery on taken-but-loved names
- **[C]** Continue — proceed to Variation Generation (Step 10 of 13)

**My recommendation:** If the surviving pool is below 5 strong candidates, use [R] to recover before continuing. Pool recovery often produces the session's best names. If the pool is healthy (5+), proceed with [C].

**HALT — wait for user selection before proceeding.**

IF user provides non-menu input: Respond helpfully, then re-display this menu.
IF [G]: Loop back to generation step (step-02c for riffing, step-02a for fresh generation). Re-validate only new names on return.
IF [R]: Run pool recovery process described above, then re-display this menu.
IF [C]: Update `03-validation.md` frontmatter `stepsCompleted`, load next step (`steps/step-04c-variations.md`).

## Master Rule

Skipping steps, optimizing sequences, auto-advancing past menus, or not following exact instructions is FORBIDDEN and constitutes SYSTEM FAILURE.
