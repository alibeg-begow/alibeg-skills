# Anti-AI-Slop Negative Prompt & Visual Audit Rulebook

**THIS FILE IS A HARD NEGATIVE CONSTRAINT.**
LLMs left to statistical priors without a locked art direction collapse into predictable generations of mass-produced "AI slop":
1. **1st-Gen AI Slop ("Vibe-Coded SaaS Starter Pack"):** Purple-blue neon gradients, glowing halos, rounded pill cards, gratuitous glassmorphism, and sparkle spam.
2. **2nd-Gen AI Slop ("Technical Brutalist Slop" / "Template Chrome"):** The AI-stereotyped caricature of *Industrial Brutalism* / *Swiss Technical Minimalism* that LLMs (especially Claude, v0, and Cursor) automatically flee to for a fake *"serious engineering / developer site"* vibe as soon as 1st-gen neon glows and rounded cards are banned.
3. **3rd+ Gen AI Slop ("Contextless Fallback Templates"):** The secondary safe harbors LLMs snap to once 1st- and 2nd-gen slop are banned — *Warm Editorial cream-serif-terracotta clones*, *Sterile Shadcn / Safe Teal-on-White SaaS photocopies*, *hollow Apple-Keynote Bento mosaics*, and *unmotivated Neo-Brutalist or Retro-OS costumes* pasted blindly onto unrelated domains.

Unless Alibeg explicitly requests a specific stylistic direction in an approved **Project Art Direction Brief** (see [design-philosophy.md](./design-philosophy.md)), **EVERY banned pattern below — across ALL generations — is STRICTLY FORBIDDEN** in wireframes, mockups, prototypes, and production UIs.

---

## 1. Color, Gradient & Atmospheric Slop — BANNED

### STRICTLY BANNED
- **VibeCode Purple / Indigo-to-Cyan Gradients:** No purple, violet, indigo, electric blue, or magenta gradients (`#6366f1 -> #a855f7 -> #06b6d4`) on backgrounds, cards, hero sections, borders, or CTAs.
- **Gradient Text Headlines:** No `background-clip: text` rainbow/purple/cyan gradient fills slapped onto `<h1>` or `<h2>` headlines to fake "modernity".
- **Glowing Ambient Orbs & Radial Blobs:** No massive heavily blurred purple/blue/pink radial gradient blobs (`blur-3xl opacity-30`) floating behind hero sections or cards.
- **Lazy Pitch-Black + Neon Dark Mode:** No flat `#000000` backgrounds paired with harsh neon cyan/violet/lime accents and unreadable medium-gray body text.
- **Unmotivated Multi-Hue Tag Clouds:** No rainbow badges where every status/tag uses a different loud pastel or neon color without semantic meaning.

### REQUIRED CRAFT ALTERNATIVE
- Use a disciplined, perceptually calibrated palette (prefer OKLCH or deliberately tinted warm/cool neutrals).
- Follow a restrained **60–30–10 hierarchy**: neutral canvas/surfaces, deep readable ink, and **ONE** intentional primary brand accent reserved strictly for primary actions, active indicators, and genuine focal points.
- Let surface layering, clean typography, photography/product craft, and calibrated contrast create atmosphere — never artificial glowing fog.

---

## 2. Buttons, Glows & Interactive Chrome — BANNED

### STRICTLY BANNED
- **Glowing Buttons & Outer Halos:** NEVER put colored outer glows on buttons (`box-shadow: 0 0 20px rgba(99,102,241,0.5)` or `shadow-indigo-500/50`), hover neon aura rings, or glowing text.
- **Gradient CTA Buttons:** No multi-stop gradient backgrounds on standard primary buttons.
- **Animated Shimmer / Rotating Conic Gradient Borders:** No spinning neon laser borders around cards, pricing tiers, or CTA buttons.
- **Pill-Button Everything:** Do not slap `rounded-full` onto every primary button, tab, and input by default. Use disciplined radii (`6px–10px` depending on the design system) and reserve pills for compact badges/chips when genuinely appropriate.
- **Pulsing Status Dots (`animate-ping`):** No endlessly pulsing green/purple/cyan dots next to fake badges like *"AI Active"*, *"System Operational"*, or *"Live Beta"*.
- **Attention-Begging Idle Animations:** No bouncing buttons, wiggling icons, floating levitating cards, or unrequested typewriter text effects on hero headlines.

### REQUIRED CRAFT ALTERNATIVE
- Solid, high-contrast, crisp buttons (or refined hairline secondary/ghost buttons) with subtle, tactile hover/active transitions (`150–200ms` background tone shift, hairline border refinement, subtle `scale(0.985)` press).
- Unmistakable, accessible `:focus-visible` outlines tuned to the theme.

---

## 3. Borders, Shadows, Cards & Glassmorphism — BANNED

### STRICTLY BANNED
- **AI-Slop Heavy/Blurred Drop Shadows:** No oversized blurry shadows (`shadow-lg`, `shadow-xl`, `shadow-2xl`) slapped onto every routine card, feature tile, or metric block.
- **Colored or Glowing Shadows:** Never tint card drop shadows with brand purple/blue/cyan glow.
- **AI-Slop Gradient or High-Contrast Neon Borders:** No glowing borders, gradient stroke borders, or harsh bright borders on dark cards.
- **Decorative Colored Accent Stripes on Cards:** NEVER put a thick colored vertical or top stripe (`border-l-4 border-indigo-500` or `border-t-2 border-purple-500`) on cards or stat boxes.
- **Nested Card Syndrome ("Cardocalypse"):** NEVER wrap cards inside cards inside cards (e.g., bordered section container -> bordered feature card -> bordered icon box -> bordered pill).
- **Bordering Everything:** Do not put a rounded box and border around every paragraph, KPI number, or list row.
- **Gratuitous Glassmorphism:** NEVER slap `backdrop-blur-md bg-white/5 border-white/10` onto content cards over glowing blobs just to look "futuristic". Reserve subtle translucency strictly for genuine floating overlays (sticky navbars, command palettes, OS sheets) where legibility stays razor-sharp.
- **Cliché Background Grid/Dot Patterns:** Do not paste low-opacity CSS wireframe grid or dot matrices behind every section by default.

### REQUIRED CRAFT ALTERNATIVE
- Group information using **whitespace, grid alignment, dividers, and typographic contrast** BEFORE adding a container box.
- When surfaces need separation, use subtle surface tone shifts + calibrated `1px` hairline borders (`rgba` neutral opacity in dark mode, low-contrast neutral hairline in light mode).
- Use tight, physically grounded neutral shadows ONLY for truly elevated floating layers (dropdowns, popovers, modals, toasts).

---

## 4. Layout & Composition Slop — BANNED

### STRICTLY BANNED
- **The Generic AI Hero Formula:** Centered announcement pill (`✨ Introducing v2.0 ->`) + giant centered gradient headline + 2-line corporate subtitle + 2 centered buttons ("Get Started Free" + "Watch Demo") + floating dark-mode fake dashboard/terminal below with red/yellow/green macOS traffic lights.
- **Uniform 3-Column Icon-Card Grids ("Card Fatigue"):** Three identical equal-height cards in a row, each with an icon inside a colored rounded square at top-left, a bold `<h3>`, and exactly two lines of vague copy — repeated section after section.
- **Fluff Bento Grids:** Forced Bento grids where half the tiles are empty decorative filler containing a lone giant icon and 3 generic words because there is no real content.
- **Center-Aligned Everything:** Lazy center-alignment across every section, card, and body block.
- **Fake Terminal / Code Windows:** Never add a decorative dark code snippet or fake CLI window with neon syntax highlighting unless the product is genuinely a developer CLI/SDK showing real usage.

### REQUIRED CRAFT ALTERNATIVE
- Establish an unmistakable visual focal point and deliberate reading order.
- Vary section rhythm across the page (asymmetric splits, editorial typography + product canvas, clean horizontal dividers, structured data views, left-aligned scannable blocks).
- Show authentic domain UI, real workflows, or structured content instead of filler cards.

---

## 5. Typography, Icons & Copywriting Slop — BANNED

### STRICTLY BANNED
- **Lazy Default Fonts:** Never default blindly to `Inter`, `Roboto`, or `Arial` without deliberate brand justification.
- **Fake-Luxury Mixed Headline Trick:** NEVER drop a single random colored italicized serif word inside an otherwise plain geometric sans-serif headline (e.g., *"Build software that **feels** *magical* today"*).
- **Timid Type Hierarchy:** Avoid barely distinguishable size steps (e.g., `16px` body with `18px` subhead and `22px` title).
- **Emojis as UI Icons:** NEVER use emojis (`🚀`, `✨`, `⚡`, `🔥`, `💡`, `🎯`, `🛡️`) as UI icons, nav badges, button prefixes, feature bullets, or section headers.
- **Sparkle Icon Abuse (`✨`):** Do NOT attach sparkle icons to every button, label, or AI feature.
- **Cookie-Cutter Icon-in-Pastel-Squircle:** Avoid slapping uniform 24px default Lucide icons inside identical tinted rounded squares on every list item or card.
- **AI Marketing Copy Slop:**
  - BANNED clichés: *"Supercharge your workflow"*, *"Unlock the power of..."*, *"Elevate your..."*, *"Seamless experience"*, *"Next-generation"*, *"Revolutionize"*, *"It's not just X, it's Y"*, *"Fast. Secure. Scalable."*
  - BANNED punctuation tic: Excessive em-dash (`—`) spam in UI/marketing copy.
  - BANNED fake social proof: Invented metrics (*"99.9% Uptime"*, *"2M+ Active Users"*, *"4.9/5 Stars"*, *"Trusted by 50,000 teams"*), fake company logo walls, or fabricated testimonials (*"Sarah Chen, Head of Growth at NovaFlow"*).

### REQUIRED CRAFT ALTERNATIVE
- Intentional, characterful font pairings with verified Turkish (`latin-ext`) glyph support (`ç ğ ı İ ö ş ü`).
- Consistent icon family with unified stroke weight and optical sizing, used only where icons genuinely improve scannability.
- Direct, specific, grounded domain copy that speaks like a real human product team.

---

## 6. Technical Brutalist Slop / "Template Chrome" (2nd-Gen AI Slop) — BANNED

When purple-blue neon lights, gradients, and soft rounded cards are banned, LLMs (especially Claude, v0, and Cursor) reflexively retreat into an AI-stereotyped parody of **Industrial Brutalism** or **Swiss Technical Minimalism** to fake a *"serious engineering / developer site"* aesthetic. This second-generation AI slop — **Technical Brutalist Slop**, or **"Template Chrome"** — is **STRICTLY FORBIDDEN** unless Alibeg explicitly asks for a brutalist/Swiss editorial direction.

### STRICTLY BANNED
- **Numbered Monospace Section Eyebrows / Index Stamps:** NEVER prefix sections or headings with mechanical monospace index labels like `01 / COLLECTIVE`, `02 / CAPABILITIES`, `03 / WORK`, `[01]`, `// ARCHITECTURE`, or `SEC_01` to perform fake engineering rigor.
- **Sharp `0px` Wireframe Monospace Filter, Tab & Tag Boxes:** NEVER style filter bars, category selectors, tabs, or chips as sharp-cornered (`border-radius: 0`), `1px`-outlined monospace rectangles paired with a harsh solid-white inverted active block (e.g., stark white `[All]` beside dark outlined `[Systems] [Frontend] [Infrastructure] [Design]`) on a flat dark charcoal canvas.
- **Reflex Matte-Charcoal + Stark-White Developer Boilerplate:** Do NOT automatically default to flat dark matte charcoal (`#181818–#242424`) + stark pure-white inverted blocks + `0px` hairline grid cells merely to signal *"serious engineering"* after 1st-gen neon/rounded styles are ruled out.
- **Faux-Blueprint & Telemetry "Template Chrome" Scaffolding:** No decorative `+` crosshair corner marks, fake blueprint grid ticks, meaningless uppercase monospace metadata stamps (`REV 2.4`, `SYS.READY`, `INDEX // 04`, `LAT/LNG`, `BUILD_09`), bracketed monospace CTA buttons (`[ EXPLORE ]`, `[ READ MORE ]`), or gratuitous hairline rules dividing every micro-block.
- **Formulaic "Swiss-Tech" Split Header Cliché:** Avoid the overused dark 2-column band pairing a `01 / LABEL` + stark white 2-line punchy engineering slogan on the left with a brief paragraph + sharp `1px` wireframe monospace filter strip on the right.
- **Cosplay Monospace Typography:** Never sprinkle wide-tracked uppercase monospace labels across navigation, section headers, filter chips, or cards just to look "technical". Reserve monospace strictly for genuine code, CLI commands, identifiers, or tabular numeric readouts.

### REQUIRED CRAFT ALTERNATIVE
- Achieve engineering credibility and modern restraint through **authentic visual hierarchy, calibrated surface layering, refined proportion, disciplined radii, and crisp domain-appropriate sans-serif/editorial typography** — never by pasting boilerplate Template Chrome.
- Design filters, tabs, and category selectors as refined segmented controls, tonal pill/rounded-rect surfaces, or crisp underlined tabs tailored to the product's actual visual language rather than harsh `0px` monochrome wireframe boxes.
- Let clear, direct headings and generous spatial rhythm structure sections without artificial `01 / SECTION` numbering stamps.
- Even if Alibeg explicitly requests an Industrial Brutalist or Swiss Technical direction, craft it authentically from real grid discipline and typographic mastery — never from generic LLM Template Chrome tropes.

---

## 7. Contextless Fallback Slop (3rd+ Gen Escape Hatches) — BANNED AS UNBRIEFED DEFAULTS

Banning 1st- and 2nd-gen slop alone causes LLMs to escape into clean-looking yet generic statistical safe harbors — slapping the exact same visual costume onto every unrelated product. **NEVER fall back to any of the templates below without an explicit, domain-justified Project Art Direction Brief:**

### STRICTLY BANNED AS REFLEX DEFAULTS
- **3rd-Gen — Warm Editorial / "Anthropic / Quiet Luxury" Reflex:** Auto-defaulting to `#FAF8F4` warm cream canvas + giant serif display headline (often with one italicized accent word) + terracotta (`#C45D3A` / `#B8522E`) or forest/sage green accent + thin warm dividers + poetic empty manifesto copy (*"Software that breathes"*) regardless of whether the product is logistics, finance, SaaS, or developer tooling.
- **4th-Gen — Sterile Shadcn / Zinc-Monochrome Dashboard Photocopy:** Blindly repeating the default `#FAFAFA`/`#09090B` + `zinc-200` `rounded-lg` card grid + lone black/white CTA + **4 identical top KPI cards** (`+12.4% from last month`) + left bar/area chart + right *"Recent Activity"* list across every app or admin panel with zero domain identity.
- **4th-Gen Variant — Safe Teal/Emerald-on-White B2B SaaS Clone:** The classic "no-purple" fallback: black `rounded-md` single-letter monogram badge (`V`) + pastel emerald announcement pill (`bg-[#ECFDF5]`) + bold dark slate headline + safe teal primary button (`#0F766E`) + white bordered secondary button + right-side floating miniature cashflow/metric card (`+14.2%`) + identical 3-column bottom feature strip.
- **5th-Gen — Apple-Keynote Bento Slop:** Oversized light-gray (`#F5F5F7`) `rounded-3xl` mosaic tiles padded with giant hollow numbers (`10x`, `0ms`, `256-bit`) and decorative non-interactive mini-widget drawings (fake toggle switches, fake notification cards, ornamental `⌘K` keycaps) to mask thin content.
- **6th-Gen — Unmotivated Neo-Brutalist ("Gumroad") & Retro-OS Costumes:** Pasting bright yellow/pink/mint blocks with thick `2–3px solid #000` borders and `4px 4px 0 #000` hard offset shadows — OR fake OS titlebars, ASCII progress bars (`[████░░]`), and CRT phosphor/scanline tropes — onto unrelated products merely to appear "bold" or "different".

### REQUIRED CRAFT ALTERNATIVE
- **Never substitute one stereotype with another.** Before creating Stage 3 Mockup visuals, lock a concise **Project Art Direction Brief** ([design-philosophy.md](./design-philosophy.md)) grounding the visual system in the actual domain, audience, real content structure, color character, density, and one authentic functional signature element.
- Clean restraint is welcome ONLY when tailored intentionally to the project's brand voice and real workflows — never as a one-size-fits-all SaaS/editorial photocopy.

---

## 8. Mandatory Pre-Delivery Anti-Slop Self-Audit

Before presenting ANY Stage 3 Mockup, Stage 4 Prototype, or Stage 5 Production UI to Alibeg, silently run this **12-point** check. If **ANY** item fails, refactor immediately before showing the output:

1. **Purple/Gradient Check:** Are there ANY violet/indigo/cyan gradients, gradient text fills, glowing orbs, or gradient buttons? → Must be **ZERO**.
2. **Glow & Border Check:** Are there ANY glowing buttons, colored drop shadows, neon/gradient borders, or vertical accent card stripes? → Must be **ZERO**.
3. **Card Nesting Check:** Are there ANY cards nested inside cards, or decorative boxes around items that should use whitespace instead? → Must be **ZERO**.
4. **Glassmorphism Check:** Is `backdrop-blur` used ONLY on legitimate floating overlays with crisp legibility, never as decorative card frosting? → Must be **YES**.
5. **Dual-Theme Check:** Do BOTH Light and Dark modes look intentionally art-directed, perceptually balanced, and WCAG-AA readable (no pitch-black `#000` neon dark mode)? → Must be **YES**.
6. **Typography & Turkish Check:** Are fonts purposeful (not lazy Inter/Roboto default), properly contrasted in scale, free of the fake-luxury mixed-italic trick, and 100% verified for Turkish glyphs (`ç ğ ı İ ö ş ü`)? → Must be **YES**.
7. **Layout Originality Check:** Did we avoid the generic AI centered hero + sparkle badge + 3-col identical icon-card grid + fake terminal? → Must be **YES**.
8. **Technical Brutalist Slop / Template Chrome Check:** Are there ANY 2nd-gen AI slop clichés — `01 / SECTION` numbered monospace eyebrows, sharp `0px` wireframe monospace filter/tab boxes with stark white inverted fills, `[ BRACKET ]` buttons, faux-blueprint crosshairs, decorative telemetry labels, or reflex matte-dark Swiss-tech boilerplate? → Must be **ZERO** (unless explicitly requested).
9. **Contextless Fallback Slop & Art Direction Fidelity Check:** Does the UI faithfully reflect a locked **Project Art Direction Brief** with genuine domain character — free of unbriefed escape templates (Warm Editorial cream+serif+terracotta reflex, sterile Shadcn 4-KPI photocopy, safe teal/emerald-on-white B2B SaaS clone, hollow Apple-Bento filler widgets, or unmotivated Neo-Brutalist/Retro-OS costumes)? → Must be **YES**.
10. **Icon & Emoji Check:** Are there ZERO emojis used as UI chrome, ZERO sparkle spam, and ZERO `animate-ping` pulsing dots? → Must be **YES**.
11. **Copy & Data Realism Check:** Is there ZERO Lorem Ipsum, ZERO corporate AI buzzwords, and ZERO fabricated metrics/testimonials? → Must be **YES**.
12. **UX States & Motion Check:** Are loading/empty/error/focus states handled, and does motion feel refined, fast, and elite without harming UX? → Must be **YES**.

