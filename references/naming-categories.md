# Naming Categories Reference

Core naming categories and generation vocabulary. Load this file during Loop 2 (Divergent Generation, stage 2a). It covers the foundational naming categories, phonetic quality guidelines, cross-language screening, and anti-patterns.

### Key Rules
1. **Attempt at least 6 of 11 categories** — try uncomfortable ones, the best names come from unexpected places
2. **Don't self-censor** — include weird/risky names. The user filters, not you.
3. **Flag conflicts inline** with ⚠️ (Known) or ⚠️? (Uncertain) — but don't invent conflicts you're not sure about

**Cross-references:** For brand personality/archetype guidance → `brand-psychology.md`. For consumer/sensory products → also load `consumer-naming.md`. For B2B → also load `enterprise-naming.md`.

---

## Table of Contents

- [How to Use These Examples](#how-to-use-these-examples)
- [The Eleven Naming Categories](#the-eleven-naming-categories)
  - [1. Evocative](#1-evocative)
  - [2. Invented / Coined](#2-invented--coined)
  - [3. Lexical Blends / Portmanteaus](#3-lexical-blends--portmanteaus)
  - [4. Metaphorical](#4-metaphorical)
  - [5. Descriptive](#5-descriptive)
  - [6. Found Word](#6-found-word)
  - [7. Foreign-Root](#7-foreign-root)
  - [8. Acronymic / Initialism](#8-acronymic--initialism)
  - [9. Compound](#9-compound)
  - [10. Sound-Symbolic / Phonesthetic](#10-sound-symbolic--phonesthetic)
  - [11. Institutional Compounds](#11-institutional-compounds)
- [Personified Names as a Naming Angle](#personified-names-as-a-naming-angle)
- [Motion & Direction as a Naming Angle](#motion--direction-as-a-naming-angle)
- [Arbitrary / Absurd Association as a Naming Angle](#arbitrary--absurd-association-as-a-naming-angle)
- [Verb-as-Brand Pattern](#verb-as-brand-pattern)
- [Obscure Real Word Mining (Specialized Domain Dictionaries)](#obscure-real-word-mining-specialized-domain-dictionaries)
- [Anti-Patterns: The LLM Naming Trap](#anti-patterns-the-llm-naming-trap)
  - [The Usual Suspects (avoid overuse)](#the-usual-suspects-avoid-overuse)
  - [Signs You're Converging Too Fast](#signs-youre-converging-too-fast)
  - [Breaking Out of Convergence](#breaking-out-of-convergence)
- [Cross-Language Pitfalls](#cross-language-pitfalls)
  - [High-Risk Language Checks](#high-risk-language-checks)
  - [Quick Screen Process](#quick-screen-process)
  - [Phonotactic Compatibility by Language Family](#phonotactic-compatibility-by-language-family)

---

## How to Use These Examples

The real-world examples below (Nike, Apple, Slack, etc.) are here to illustrate the *structural mechanics* of each naming category — why the name works, what linguistic pattern it uses, how it maps to brand personality. They are **not** style templates. Do not generate names that sound like variations of these famous examples. The goal is to understand the *technique* (e.g., "repurpose a single-syllable found word with strong visual imagery") and then apply that technique to fresh territory the user's specific brief calls for. If your output reads like "a list of names that could be Apple's sister companies," you're anchoring too hard on the examples.

---

## The Eleven Naming Categories

For each category: what it is, why it works, real examples with analysis, and generation techniques.

### 1. Evocative

Names that suggest a feeling, quality, or aspiration without describing the product.

**Why it works:** Creates emotional resonance and allows the brand to expand beyond its original category. The name becomes a vessel for meaning rather than a label.

**Real examples:**
- **Nike** — Greek goddess of victory. Evokes winning without saying "shoes."
- **Apple** — Friendly, approachable, human-scale. Deliberately contrasted with cold tech names of the era (IBM, DEC).
- **Amazon** — Vastness, power, biodiversity. Bezos wanted something that started with "A" for alphabetical listings AND evoked scale.
- **Patagonia** — Remote, pristine, adventurous. The place name carries the brand's entire ethos.
- **Lumen** — Light, clarity, illumination. Used by the fiber/edge computing company.

**Generation techniques:**
- Start with the *feeling* the brand should evoke, not the product category
- Mine mythology, geography, astronomy, natural phenomena
- Look for words that carry strong sensory associations
- Test: "If I heard this name with zero context, what would I feel?"

### 2. Invented / Coined

Entirely new words, often constructed from Latin, Greek, or other morphemic roots.

**Why it works:** Instantly ownable — no prior associations, no trademark conflicts by default, guaranteed domain availability (usually). Can be engineered for specific phonetic qualities.

**Real examples:**
- **Xerox** — From Greek "xeros" (dry), referencing dry copying process. The X gives it visual and phonetic distinctiveness.
- **Kodak** — George Eastman wanted a word starting and ending with K (his favorite letter). Pure phonetic construction.
- **Häagen-Dazs** — Completely invented pseudo-Scandinavian. No meaning in any language. Evokes European craftsmanship.
- **Verizon** — "Veritas" (truth) + "horizon." Morpheme blend with invented feel.
- **Accenture** — "Accent on the future." Constructed portmanteau designed to sound forward-leaning.

**Generation techniques:**
- Combine meaningful morphemes from Latin, Greek, Sanskrit, or other root languages
- Use phonesthetic principles (see below) to engineer the "feel"
- Test pronounceability across English, Spanish, Mandarin at minimum
- Vary syllable count: 2-3 syllables is the sweet spot for memorability
- Try word-initial consonant clusters for distinctiveness (Br-, Kr-, Str-)

### 3. Lexical Blends / Portmanteaus

Two existing words fused together, usually with overlapping sounds or letters.

**Why it works:** Carries meaning from both source words while creating something new. Often feels clever without being forced.

**Real examples:**
- **Pinterest** — Pin + Interest. The overlap of the "in" sound makes it flow.
- **Instagram** — Instant + Telegram. Evokes speed and communication.
- **Microsoft** — Microcomputer + Software. Descriptive blend that became iconic.
- **Groupon** — Group + Coupon. Immediately communicates the value proposition.
- **Shopify** — Shop + "-ify" (to make). Verb-like energy.

**Generation techniques:**
- List words from two semantic fields relevant to the brand
- Look for phonetic overlaps where one word's ending matches another's beginning
- Try both directions (A+B and B+A)
- Truncate strategically — don't force the full spelling of both words
- The best blends feel "inevitable," like the word should have always existed
- **Conceptual blending (Fauconnier & Turner):** A blend isn't just two words smashed together — it's two *mental spaces* merging into a blended space with emergent properties neither input had alone. "BlackBerry" = black (sleek, premium) + berry (organic, small, natural) → blended space: premium but approachable technology. When generating blends, ask: "What new meaning emerges from this combination that neither word carries alone?" If the answer is "nothing — it's just two words stuck together," the blend is mechanical, not conceptual.

### 4. Metaphorical

Names borrowed from an entirely different domain, creating unexpected associations.

**Why it works:** Metaphors are cognitively sticky. They create a mental image that's hard to forget and invite storytelling.

**Real examples:**
- **Jaguar** — Speed, elegance, predatory grace. Not about cats — about how the car makes you feel.
- **Shell** — Originally sold seashells before pivoting to oil. The name persisted because it's visually distinctive.
- **Caterpillar** — Slow, relentless, grips any surface. Perfect metaphor for heavy machinery.
- **Slack** — "The slack in a rope." Implies taking up the slack in team communication.
- **Snowflake** — Unique, crystalline, structured. Good metaphor for unique data architectures.

**Generation techniques:**
- Identify the brand's core *action* or *quality* (not its product category)
- Search for that quality in nature, animals, tools, weather, mythology, sports
- Avoid overused metaphor domains (space/rocket for startups, brain/neuron for AI)
- The best metaphors have multiple layers of meaning that reveal themselves over time
- **Bisociation (Koestler):** The strongest metaphorical names emerge from the collision of two previously unrelated frames of reference. Ask: "What two worlds collide in this product?" Then name the collision. A payments company + clean geometry = Stripe. Heavy machinery + relentless insects = Caterpillar.

### 5. Descriptive

Names that directly communicate what the product or company does.

**Why it works:** Zero explanation needed. Immediate clarity. Strong for categories where trust and transparency matter.

**Real examples:**
- **General Electric** — Makes electrical things. Broadly.
- **PayPal** — Pay your pal. Friendly money transfer.
- **Booking.com** — You book things. On the internet.
- **WeWork** — We work (together). Community + function.
- **Clarity** — A platform for expert consultations. The name IS the value prop.

**Generation techniques:**
- Combine the core verb (what users do) with the core noun (what they interact with)
- Try adding warmth: possessives (My-), communal pronouns (We-), friendly suffixes (-ly, -ful)
- Descriptive names work best when kept to 1-2 words
- Caution: harder to trademark, easy to sound generic. Add a twist.

### 6. Found Word

Real dictionary words repurposed as brand names. The word exists but gains new meaning in context.

**Why it works:** Familiar and memorable, but the unexpected context creates intrigue. Often the most elegant naming approach.

**Real examples:**
- **Slack** — Everyday word, completely recontextualized for workplace communication.
- **Notion** — An idea, a concept. Perfect for a knowledge/docs tool.
- **Figma** — Not a common word but a real one (a fig-shaped ornament). Sounds designed.
- **Stripe** — A line, a mark. Clean and distinctive for a payments company.
- **Plaid** — A pattern of interwoven threads. Apt metaphor for connecting financial systems.
- **Bench** — Where you sit and work. Bookkeeping made tangible.

**Generation techniques:**
- Browse categories: weather words, textile terms, nautical vocabulary, architectural terms, musical terms, botanical names, geological terms, cooking terminology
- Single-syllable words punch harder (Stripe, Plaid, Bench, Slack)
- Look for words with strong visual imagery
- Test: does the word create a mental picture?
- Check if the .com is available — many single real words are parked as premium domains

### 7. Foreign-Root

Names drawn from non-English languages, carrying meaning that adds depth.

**Why it works:** Adds sophistication and cultural resonance. Often sounds distinctive in English-speaking markets while carrying genuine meaning.

**Real examples:**
- **Audi** — Latin "audi" = "hear/listen." (Also a translation of founder August Horch's surname, which means "listen" in German.)
- **Volvo** — Latin "I roll." Direct and kinetic.
- **Samsung** — Korean for "three stars." Connotes power and permanence.
- **Lego** — Danish "leg godt" = "play well."
- **Hulu** — Mandarin for "gourd" (a vessel for holding precious things) and also means "interactive recording."

**Generation techniques:**
- Start with the brand's core concept, then find translations in Latin, Greek, Japanese, Sanskrit, Finnish, Swahili, etc.
- Latin and Greek are safest for Western markets — they sound "universal"
- Japanese and Finnish have useful phonetic properties (vowel-heavy, musical)
- ALWAYS verify the word doesn't mean something negative in major world languages
- Try combining roots from different languages

### 8. Acronymic / Initialism

Names formed from initials or abbreviated phrases.

**Why it works:** Compact, easy to type, feels established and institutional. Works best when the acronym itself is pronounceable or phonetically pleasing.

**Real examples:**
- **IKEA** — Ingvar Kamprad Elmtaryd Agunnaryd (founder's initials + childhood farm + village)
- **BMW** — Bayerische Motoren Werke
- **ASICS** — "Anima Sana In Corpore Sano" (healthy soul in a healthy body)
- **CAPTCHA** — "Completely Automated Public Turing test to tell Computers and Humans Apart"

**Generation techniques:**
- Write out the brand's core mission as a phrase, then see if the initials form a word
- Work backwards: start with a word you like, then find a phrase that fits the initials
- 3-5 letters is optimal. 2 feels incomplete, 6+ is too long.
- Pronounceable acronyms (words) beat spelled-out initialisms (letters)
- This approach works particularly well for technical/B2B names

### 9. Compound

Two complete, recognizable words joined together.

**Why it works:** Both words contribute meaning independently while the combination creates something new. Often highly memorable because each word acts as a mental anchor.

**Real examples:**
- **Facebook** — Face + Book. A directory of faces.
- **Snapchat** — Snap + Chat. Ephemeral photo conversation.
- **Salesforce** — Sales + Force. Power in selling.
- **Mailchimp** — Mail + Chimp. Email with personality.
- **Dropbox** — Drop + Box. Put things in a box.

**Generation techniques:**
- Pair an action word with an object word (Snapchat, Dropbox)
- Pair a quality with a domain (Salesforce, Brightside)
- Pair two unexpected nouns (Mailchimp, Firestick)
- Keep total syllable count to 2-3 if possible
- The best compounds create a vivid mental image from the collision of the two words

### 10. Sound-Symbolic / Phonesthetic

Names engineered primarily for how they *sound* and *feel* in the mouth, leveraging phoneme psychology.

**Why it works:** Sound symbolism is cross-cultural. Certain sounds inherently "mean" things to humans regardless of language. Names built on this foundation feel *right* even before you know what they mean.

**Real examples:**
- **Google** — The "oo" sound (back vowel) evokes largeness/depth. The hard G gives it solidity.
- **TikTok** — Plosive repetition. Feels rhythmic, clock-like, addictive.
- **Zoom** — The Z onset is energetic, the "oom" is expansive.
- **Bumble** — Soft B, nasal M, liquid L. Feels gentle, approachable, buzzy.
- **Kindle** — Hard K for impact, then softens through "-indle." Evokes sparking a fire.

**Generation techniques:**
- Define the target "texture" first (sharp vs. round, heavy vs. light, fast vs. slow)
- Use the phonesthetic framework below to select appropriate phonemes
- Combine 2-3 syllables with deliberate sound progression (e.g., hard→soft, closed→open)
- Read candidates aloud. If it feels satisfying to say, it's working.

### 11. Institutional Compounds

Names formed by combining two recognizable elements — particularly common and credible in finance, investment, and enterprise software.

**Why it works:** The combination of two grounded words creates instant institutional weight. Each word contributes meaning independently, and the compound feels established rather than invented.

**Sub-patterns:**

**Color + Noun:**
- BlackRock, Blackstone, Greylock, Redpoint, Blueyard, Greenlight, Silvergate, Whitestar
- Why: Colors add visual distinctiveness and emotional tone. Black = authority/premium. Grey = wisdom/stability. Blue = trust. Green = growth. Red = energy.

**Adjective + Noun:**
- TrueVentures, FirstMark, BrightEdge, HighFlyer, DeepView, ClearCapital, BoldStart
- Why: The adjective sets the emotional tone while the noun grounds the name.

**Material + Feature:**
- Irongate, Stonebridge, Steelpoint, Copperfield
- Why: Material names convey durability and permanence.

**Direction + Feature:**
- Northstar, Westbridge, Crosspoint, Meridian (note: heavily used)
- Why: Direction names convey navigation and orientation.

**Noun + Noun:**
- Benchmark, Cornerstone, Lighthouse, Stonebridge, Ironwood
- Why: Two concrete nouns create a vivid mental image.

**Generation technique:**
Take the user's favorite root words and systematically combine with:
- Prefixes: Black-, Grey-, Red-, Blue-, True-, Clear-, Deep-, First-, Iron-, Stone-
- Suffixes: -mark, -point, -line, -view, -gate, -stone, -craft, -works, -well, -field, -bridge

**Anti-pattern:** Avoid combinations that sound like existing fund names (Blackstone, BlackRock are taken). Check each compound against training data immediately (⚠️ flag).

---

## Personified Names as a Naming Angle

Human names used as brand names. This is a cross-cutting generation angle — applicable within Evocative, Found Word, and Foreign-Root categories depending on why the name was chosen.

**Why it works:** Human names create instant warmth and approachability. They're effortlessly memorable (everyone knows how to say and spell a person's name), naturally conversational ("Ask Claude," "Hey Siri"), and can carry historical resonance that adds depth without explanation. They also age well — a human name never sounds dated the way a tech suffix can.

**Real examples:**
- **Claude** — Claude Shannon (information theory). Carries intellectual heritage without requiring the user to know the reference.
- **Alexa** — Evokes the Library of Alexandria. Knowledge + approachability in one name.
- **Siri** — Norse for "beautiful woman who leads you to victory." Musical, short, globally pronounceable.
- **Oscar** — Health insurance. Friendly, human-scale in a cold industry. Named to feel like "a friend who helps you navigate healthcare."
- **Harvey** — Legal AI. Named after Harvey Specter (Suits). Signals legal competence with personality.
- **Ada** — Health platform. Ada Lovelace. Signals intelligence + pioneering spirit.
- **Cleo** — Financial assistant. Short, warm, slightly retro. Works as a name you'd text.
- **Max** — Short, punchy, energetic. Universal across languages. Used by multiple brands.
- **Rosie** — Robotics/automation. Evokes Rosie the Riveter (capability) and The Jetsons' Rosie (helpful automation).

**Sub-patterns:**

| Pattern | What it does | Examples |
|---|---|---|
| **Historical figure** | Borrows credibility and narrative from a real person | Claude (Shannon), Ada (Lovelace), Tesla (Nikola) |
| **Fictional character** | Borrows personality from a known character | Harvey (Specter), Jarvis (Iron Man), Rosie (Jetsons) |
| **Pure first name** | Warmth and approachability without specific reference | Oscar, Max, Cleo, Lola, Finn |
| **Mythological/classical** | Gravitas + storytelling | Athena, Apollo, Minerva, Cassandra |
| **Surname as brand** | Authority, institutional weight | Watson (IBM), Edison, Turing |

**Generation techniques:**
- Start with the brand's core quality, then ask: "What historical figure embodies this quality?" (intelligence → Ada, Claude; strength → Atlas, Titan)
- Browse baby name databases filtered by origin, meaning, and era — Victorian names feel different from modern names
- Test the "coffee shop test": would someone feel natural saying "I'll ask [name]" or "Have you tried [name]?"
- For AI/voice products: prioritize 2-syllable names with clear vowels — they work better as wake words and in conversation
- Cross-reference with mythology databases for names that carry built-in narratives
- Check that the name doesn't feel condescending or gendered in ways that limit the brand (the BIC-for-Her problem)

**Phonetic tendency:** 1-2 syllables, open vowels, soft or liquid consonants (l, r, m, n) for warmth. Hard consonants (k, t, d) for authority. The name should feel like someone you'd want to talk to.

**When to use:** Particularly strong for AI assistants, health/wellness products, financial tools, education platforms, and any product where trust and approachability matter more than technical precision. Less effective for enterprise infrastructure, developer tools aimed at senior engineers, or products where institutional gravitas outweighs warmth.

**Anti-patterns:**
- Avoid names so common they're impossible to own (John, Mike, Sarah) unless paired with a distinctive second element
- Avoid names with strong singular cultural associations that overwhelm brand meaning (Elvis, Oprah, Madonna)
- Avoid names that feel artificially gendered for the product category
- Always check: does this name already belong to a well-known AI/tech product? The space is filling up fast.

---

## Motion & Direction as a Naming Angle

Names that convey movement, direction, or momentum. Particularly effective for products that help users navigate complexity or move faster. This is a cross-cutting generation angle — applicable within Evocative, Found Word, Coined, and Compound categories.

**Forward motion:** Stride, Traverse, Ascend, Advance, Propel
**Direction:** Vector, Bearing, Heading, Course, Azimuth
**Convergence:** Converge, Nexus, Confluence, Junction
**Transformation:** Shift, Pivot, Flux, Phase, Arc
**Speed/energy:** Surge, Pulse, Velocity, Momentum

**Why it works:** Motion names are inherently energetic and forward-looking. They suggest progress without describing what the product does. They connect to the "Motion story" type (see `references/brand-psychology.md`).

**Phonetic tendency:** Often short (1-2 syllables), with plosive or fricative onsets for kinetic energy.

**Generation technique:** For each motion word, apply the standard riff axes — root compression, etymology, metaphor shift, sound tuning, language shift, structural shift — to produce 5-10 variants per seed.

---

## Arbitrary / Absurd Association as a Naming Angle

Names with zero logical connection to the product. The name doesn't describe, evoke, or metaphorically relate to what the company does. The incongruity *is* the distinctiveness — the cognitive dissonance makes the name impossible to forget and impossible to confuse with a competitor.

This is different from Metaphorical naming (where the connection is explainable: Caterpillar = relentless grip) and Contrarian naming (where you name against category conventions but still within plausible territory). Arbitrary names have no connection to explain. They work anyway — often better than logical names — because they become pure empty vessels that fill with brand meaning.

**Why it works:**
- **Von Restorff effect in overdrive.** A name that makes zero categorical sense is maximally distinctive. You'll never confuse Cowshed with another soap brand.
- **True blank canvas.** No pre-existing associations to fight against or outgrow. The brand gets to define the name's meaning entirely.
- **Conversation starter.** "Why is it called that?" is a marketing asset, not a liability. The name becomes a story people retell.
- **Domain/trademark advantage.** Because the name has no semantic connection to the product category, trademark clearance in the relevant class is dramatically easier. Nobody filed "Cowshed" in cosmetics. Nobody filed "Apple" in computers.
- **LLMs will never generate these unprompted.** This is the category where human creativity (or deliberate prompting technique) matters most — language models optimize for semantic relevance, which is exactly what these names reject.

**Real examples:**

| Name | Product | Why it works |
|---|---|---|
| **Apple** | Computers | Friendly, organic, human-scale in a sea of IBM, DEC, HP. Zero connection to technology. |
| **Cowshed** | Luxury spa/soap | Farmyard absurdity in a category of French elegance. Memorable precisely because it shouldn't work. |
| **Innocent** | Smoothies | An adjective with no food connection. Creates purity associations through cognitive surprise, not description. |
| **Diesel** | Fashion | Industrial fuel for luxury clothing. The dissonance signals rebellion and anti-fashion. |
| **Orange** | Telecom | A fruit for a phone company. Simple, warm, colorful — everything telecom naming wasn't. |
| **Egg** | Banking | Monosyllabic, organic, fragile — the opposite of what "banking" signals. Unforgettable. |
| **Lush** | Cosmetics | An adjective meaning both "luxuriant" and "drunk." The ambiguity adds texture. |
| **Penguin** | Publishing | An animal with zero connection to books. But the tuxedo-clad bird became one of the most iconic logos in publishing. |
| **Camel** | Cigarettes | A desert animal for a tobacco product. The exoticism became the entire brand identity. |
| **Puma** | Sportswear | Less metaphorical than it seems — the name was chosen from a dictionary essentially at random, then backfit with "speed/agility" associations. |

**Generation techniques:**

**1. The Dictionary Dive.** Open a dictionary (physical or digital) to random pages. Write down every concrete noun that creates a vivid mental image. Don't filter for relevance — relevance is the enemy here. Generate 30-50 words, then test each against the brand brief purely on: phonetic quality, memorability, visual distinctiveness, and domain availability. *Not* on "does it relate to the product."

**2. The Room Scan.** Look around the physical space you're in. Every object is a candidate: Kettle, Hinge, Curtain, Easel, Mantel, Bracket, Plinth, Spool. Everyday objects carry warmth and concreteness that coined names can't match.

**3. The Category Collision.** Pick 3-4 domains completely unrelated to the product: farming, cooking, geology, textiles, carpentry, astronomy, botany, maritime. Generate 10 words from each domain. Test them against the brief on phonetic feel alone. "Awning" for a fintech app? "Kiln" for a SaaS platform? "Bramble" for a security company? The wronger it feels, the more distinctive it probably is.

**4. The Children's Word Test.** Generate names a 5-year-old would know: Puddle, Pebble, Acorn, Marble, Crayon, Mitten, Cobweb, Blanket, Sparrow. These words are universally pronounceable, concretely imageable, and emotionally warm. They also tend to have excellent phonetic properties (simple syllable structures, familiar stress patterns).

**5. The Adjective Lift.** Pull adjectives that describe a *feeling*, not the product: Honest, Tender, Brave, Gentle, Vivid, Idle, Jolly, Humble, Fierce, Lush. Adjectives-as-brand-names carry immediate emotional tone while saying nothing about the category.

**When to use:**
- When the category's naming conventions are so strong that any "logical" name sounds like a competitor
- When domain/trademark availability has killed every semantically connected name
- When the brand's personality is more important than immediate product comprehension
- When the user has a strong visual identity or brand-building budget (arbitrary names need more brand investment to establish initial comprehension)
- As a deliberate contrast round: "We've generated 50 names that make logical sense. Now here are 10 that make no sense at all."

**When NOT to use:**
- When the product is in a new category that requires explanation (a descriptive or suggestive name does more work)
- When the brand has zero marketing budget (arbitrary names need investment to establish meaning)
- When the name must perform immediate SEO duty for category terms

**Anti-patterns:**
- Don't pick an arbitrary name and then force-fit a rationale. "We chose Penguin because penguins huddle together, which represents community" — no. If the name is arbitrary, own it. Backfit narratives sound desperate.
- Don't use words with strong negative valence (Disease, Coffin, Scab) unless you're deliberately going for Outlaw archetype energy.
- Don't confuse arbitrary with random. A good arbitrary name still has excellent phonetic properties, is easy to spell and pronounce, creates a vivid mental image, and passes the SMILE test. It just doesn't relate to the product.

**Phonetic tendency:** Arbitrary names work best when the word itself is phonetically strong — concrete nouns with 1-2 syllables, clear vowels, and satisfying consonant patterns. The name has to carry itself entirely on sound and imagery since it gets no semantic lift from the product connection.

---

## Verb-as-Brand Pattern

Using action verbs directly as brand names. This crosses Found Word and Evocative but is its own distinct pattern worth calling out.

**Why it works:** Verbs carry inherent energy — they describe doing, not being. A verb name implies the product is an action, not a thing. The brand becomes something you DO, not something you have.

**Real examples:**
- **Slack** — "to take up the slack"
- **Stripe** — "to stripe" (to mark with lines)
- **Kindle** — "to ignite"
- **Bolt** — "to move suddenly"
- **Zoom** — "to move fast"
- **Drift** — "to move gradually"

**Generation technique:**
1. Identify the core action the product performs (screen, sift, sort, gauge, vet, assay, triage, dispatch)
2. List 10-15 verbs that describe that action at different levels of specificity
3. Test each as a standalone brand name
4. For verbs that are too common or taken, use them as roots for compounds (Siftworks, Vetcraft)

**Caution:** Single-syllable English verbs are extremely crowded in the tech namespace. Expect most to be taken. Their primary value is as compound roots, not standalone names.

---

## Obscure Real Word Mining (Specialized Domain Dictionaries)

The most distinctive found-word names often come from specialized fields that tech founders never think to explore. These are real English words with rich meanings that nobody in technology is using.

**The technique:**
1. Identify the core metaphor of the product (transformation, measurement, screening, navigation, etc.)
2. Find the specialized field where that metaphor is LITERAL — where the word describes an actual physical process
3. Mine that field's vocabulary for words that carry the metaphor naturally

**Productive domains to mine:**

| Domain | Metaphor | Example Words |
|---|---|---|
| **Metallurgy/Assaying** | Testing quality, separating valuable from base | Cupel (precious metal test cup), Anneal (strengthen through heat), Smelt (extract from ore), Temper (forged discipline), Crucible |
| **Watchmaking/Horology** | Precision mechanisms, controlled timing | Escapement (controlled energy release), Mainspring (hidden power source), Calibre (the movement), Complication (feature beyond basic), Arbor (central shaft) |
| **Maritime/Navigation** | Depth measurement, direction-finding | Sounder (depth device), Keelson (structural spine), Leadline (measuring tool), Sounding (depth check), Bollard, Capstan |
| **Textiles/Tailoring** | Hidden structure, controlled edges | Selvedge (edge that prevents fraying), Warp (structural threads), Weft (cross threads), Grainline (hidden discipline), Bobbin |
| **Architecture** | Structural support, thresholds | Lintel (beam above doorway), Quoin (cornerstone), Plinth (base), Cupola (observation dome), Spandrel (triangular space between arches), Sill |
| **Cartography/Surveying** | Mapping, measurement, precision | Azimuth (angular direction), Meridian (longitude line), Isoline (equal-value line), Northing (directional coordinate), Benchmark (survey reference point) |
| **Geology/Mineralogy** | Layers, foundation, hidden structure | Stratum (layer), Basalt (foundation rock), Skarn (mineral formation), Moraine (deposited material), Alluvium |
| **Optics/Microscopy** | Revealing hidden structures | Darkfield (technique revealing invisible structures), Aperture (controlled opening), Parallax (shift in perspective) |
| **Chemistry/Distillation** | Purification, extraction of essence | Alembic (distillation vessel), Retort (refinement vessel), Crucible, Calcine (transform through heat), Assay |
| **Astronomy** | Observation, cosmic patterns | Fornax (constellation, Latin "furnace"), Zenith, Transit, Parallax, Apogee |

**Why this works:** These words pass the "Slack test" — they're real English words that create intrigue when encountered out of context. Someone hearing "Cupel" doesn't know what it means, but it sounds like it means something. The explanation ("it's the tool used to test whether metal is gold") becomes the brand story.

**Anti-pattern:** Don't use words so obscure that pronunciation is ambiguous. "Keelson" works in a document but might get mangled in speech. Test each candidate with the bar test.

---

## Anti-Patterns: The LLM Naming Trap

LLMs, including Claude, have strong default tendencies when generating names. Be aware of these traps and actively avoid them:

### The Usual Suspects (avoid overuse)
- **Verb+ly** pattern: Grammarly, Orderly, Shopify → These are fine names but the pattern is exhausted
- **[Tech prefix]+[Suffix]**: Synth-, Nano-, Neuro-, Cyber-, Quantum- + -ify, -io, -ly, -ium, -os
- **Forced mythology**: Every AI company cannot be named after a Greek god
- **Abstract Latin mashups**: Cognivex, Lumivara, Synthetix — these all sound like pharma brands
- **The "-a" suffix trap**: Nvidia, Cigna, Zenvia — adding -a to make something sound like a name is overused

### Signs You're Converging Too Fast
- All suggestions are 2-3 syllables with similar stress patterns
- Everything ends in the same suffix (-ify, -ly, -io, -ia)
- All names are from the same taxonomic category
- Nothing sounds weird, risky, or surprising
- You can't explain why Name A is different from Name B

### Breaking Out of Convergence
When you notice convergence happening:
1. Switch to a naming category you haven't used yet
2. Use a random word generator or dictionary dive as a seed
3. Try a constraint: "only one-syllable words" or "must contain the letter X"
4. Go to a completely unrelated domain (food, architecture, textiles, geology) and find words there
5. Try deliberate "wrong answers" — names that feel too weird — and then sand them down

---

## Cross-Language Pitfalls

Always check candidate names against the target market languages. This section covers major language families — but for international naming, also prompt the user: "Which specific languages and markets must this name work in?" and screen against those explicitly.

### High-Risk Language Checks

**Major Western languages:**
- **Spanish**: Does it sound like a vulgar word? ("Pajero" by Mitsubishi = crude slang). Also check regional variants — Latin American Spanish and Castilian Spanish have different slang.
- **Portuguese**: Check Brazilian Portuguese separately from European Portuguese. Regional slang (especially Brazilian gíria) can create unexpected meanings.
- **French**: Check for false cognates and unintended double meanings.
- **German**: Compound words can create unexpected meanings.

**Asian languages:**
- **Mandarin Chinese**: Check tonal variations. A name might sound fine in one tone but offensive in another. The four tones can radically change meaning.
- **Japanese**: Some English phonemes map to Japanese words with unintended meanings. Check katakana transliteration.
- **Korean**: Check that the name doesn't overlap with common Korean words or brands. Korean phonotactics don't allow certain consonant clusters.
- **Vietnamese**: A tonal language with 6 tones. A name that looks fine on paper could sound like an insult depending on tone marks. Test with native speakers.
- **Thai**: Also tonal (5 tones). Similar risks to Vietnamese.
- **Bahasa Indonesia / Malay**: Large speaker population (300M+), often overlooked. Check for slang and regional meanings. Indonesian and Malaysian Malay have divergent vocabularies.
- **Tagalog/Filipino**: Check for slang meanings. Filipino borrows heavily from Spanish and English, creating unexpected false cognates.

**Other high-population languages:**
- **Arabic**: Check that the name doesn't resemble religious terms or insults. Right-to-left script creates visual considerations.
- **Hindi/Urdu**: Large speaker population (600M+), often overlooked in naming checks. Hindi and Urdu share vocabulary but have different scripts and cultural connotations.
- **Turkish**: Check for meanings in Turkish and phonotactic compatibility. Turkish phonotactics are restrictive.

### Quick Screen Process
For any shortlisted name:
1. Google "[name] meaning in [language]" for all target market languages specifically
2. Google "[name] slang [language]" for slang associations
3. Check Urban Dictionary for English slang associations
4. Say it aloud with different stress patterns and tones — does any pronunciation sound problematic?
5. Ask: would this name work on a billboard in every target market city?
6. For tonal languages (Mandarin, Vietnamese, Thai): explicitly test with different tone patterns
7. For markets with non-Latin scripts: test the transliteration — does it look good in the target script?

### Phonotactic Compatibility by Language Family
Different languages have different phonotactic constraints. A name that flows in English may be unpronounceable elsewhere:

| Language | Common restrictions | Safe patterns |
|---|---|---|
| **Spanish** | No initial /s/ + consonant clusters (must add "e-": "Stripe" → "Estripe") | CVCV, open syllables |
| **Japanese** | Almost all syllables end in vowels or /n/. No /l/ phoneme. | CV, CVN patterns |
| **Mandarin** | Limited consonant clusters. No final consonants except /n/ and /ng/. | CV, CVN patterns |
| **Korean** | Specific onset/coda rules. No /f/ or /v/ phonemes. | CVC with limited codas |
| **Portuguese** | Nasal vowels. More consonant clusters than Spanish. | CVCV, some clusters OK |
| **Indonesian** | Few consonant clusters. Predictable stress (penultimate). | CVCV, CVCVC |
| **Vietnamese** | Tonal. Monosyllabic roots. Limited clusters. | CVC with tones |

**CVCV generation technique:** To systematically generate names with maximum cross-language pronounceability:
1. Select a consonant from your target phonetic profile (e.g., hard /k/ for authority)
2. Select a vowel from your target perception map (e.g., /o/ for stability)
3. Repeat: C₁V₁C₂V₂ — test the resulting name
4. Vary: try CVCVCV (3 syllables), CVCCV (with mild cluster), CVCV + final N
5. Filter by target language phonotactics — does it violate any rules above?

---
