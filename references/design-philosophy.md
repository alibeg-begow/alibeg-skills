# Design Philosophy & Visual Craft Standards

This module governs visual identity, theming, typography, layout craft, motion, and UX completeness across web apps, SaaS dashboards, landing pages, and mobile apps.

Always pair this document with [anti-ai-slop.md](./anti-ai-slop.md) and [design-pipeline.md](./design-pipeline.md).

---

## 1. Adaptive Art Direction & Mandatory Project Art Direction Brief

Negative rules alone cannot produce originality — blocking one AI cliché simply pushes an unbriefed model into the next safe fallback template (Warm Editorial cream+serif, Sterile Shadcn 4-KPI dashboard, Safe Teal-on-White SaaS, etc.). Therefore, **every new product, page, or major redesign MUST establish positive visual intent before Stage 3 Mockup visuals are created.**

### 1.1 Mandatory Project Art Direction Brief (Lock Before Stage 3)
When Alibeg has not already specified a visual style, **do NOT jump straight to a generic default aesthetic.** Propose 2 distinct, domain-authentic art directions (with a clear recommendation) and lock these **5 concise commitments** before generating Stage 3 Mockup visuals:

1. **Domain & Real-World Reference World:** What tangible craft or visual heritage genuinely fits this product's industry and users (e.g., architectural monograph, precision cockpit/instrument cluster, tactile consumer hardware, editorial print, industrial logistics ledger, warm specialty retail) — never a blind photocopy of generic SaaS templates.
2. **Brand Tone & Explicit Anti-Trait:** 2–3 crisp adjectives defining how the interface must feel + 1 explicit *"NOT X"* guardrail (e.g., *"Authoritative, calm, dense — NOT playful, NOT dreamy boutique luxury"*).
3. **Color Character & Temperature (Light + Dark):** Intentional neutral temperature (mineral, cool slate, warm stone, ink) + ONE domain-motivated primary accent with brief rationale — actively avoiding unbriefed reflex palettes (purple neon, matte brutalist black/white, cream+terracotta, safe teal/emerald-on-white).
4. **Density & Layout Rhythm:** Information density calibrated to actual user tasks + deliberate section/screen variety (avoiding default 4-KPI-card + bar-chart + right-list or symmetric 3-column feature-strip boilerplate).
5. **One Authentic Signature Element:** One memorable, functional craft detail rooted in the product's core workflow or content (e.g., bespoke interactive canvas, custom typographic/editorial anchor, purposeful navigation surface, or real domain visualization) — never decorative template chrome.

### 1.2 Baseline Craft Principles ("Modern Craft & Minimalist Premium")
Treat **Modern Craft & Minimalist Premium** as a **quality standard (discipline, clarity, proportion, tactile polish)** — NOT as a single rigid visual template to clone across every project:
- Architectural whitespace, unmistakable focal hierarchy, and zero decorative clutter.
- Calibrated surface separation and alignment instead of muddy shadows or box-inside-box noise.
- **Anti-Drift Guard:** Never misinterpret restraint or precision as permission to fall into *Technical Brutalist Slop / Template Chrome*, *Warm Editorial cream-serif-terracotta*, or *Sterile Shadcn / Safe Teal SaaS* boilerplate (see [anti-ai-slop.md](./anti-ai-slop.md)).
- **SaaS / Dashboards / Apps:** Functional density shaped around the domain's real workflow, fast scannability, tabular numbers, unmistakable active/selected states, zero decorative noise.
- **Landing Pages / Brand Showcases:** High editorial impact, asymmetric rhythm, strong display typography, authentic product visuals, and memorable focal moments rooted in the brief.
- **Mobile Apps:** Native ergonomic polish, generous touch targets (`>= 44×44pt`), thumb-zone awareness, crisp hierarchy, fluid transitions.

---

## 2. Mandatory Light & Dark Mode (Non-Negotiable)

**EVERY UI project MUST be designed and implemented with BOTH refined Light AND Dark themes by default.** Never ask whether dark mode is needed — treat dual-theme excellence as a baseline engineering and design requirement.

### Dual-Theme Craft Rules
- **Semantic Token Architecture:** Define all colors through semantic CSS variables / design tokens (never scatter raw hex values across components):
  - Surface tiers: `--bg-canvas`, `--bg-surface`, `--bg-elevated`, `--bg-subtle`, `--bg-hover`
  - Foreground tiers: `--fg-primary`, `--fg-secondary`, `--fg-muted`, `--fg-disabled`
  - Borders: `--border-subtle`, `--border-default`, `--border-strong`
  - Accents & Semantics: `--accent-primary`, `--accent-hover`, `--accent-fg`, `--status-success`, `--status-warning`, `--status-danger`, `--status-info`
- **Perceptual Calibration (Prefer OKLCH or Tinted Neutrals):**
  - **Light Mode:** Avoid clinical sterile glare when warmth/craft fits; use subtly tinted off-white/stone/cool-gray canvases paired with crisp pure or elevated card surfaces and deep charcoal ink (`#111215` / `#18181B`) rather than harsh `#000000`.
  - **Dark Mode:** NEVER use flat pitch-black `#000000` with blinding `#FFFFFF` text and neon borders. Build layered obsidian/charcoal/graphite surfaces (e.g., canvas `#0B0C0F`, surface `#121419`, elevated `#191C23`) with subtle top-edge or hairline border separation and softened high-contrast off-white ink (`#F2F4F7` / `#A1A7B3`).
- **Elevation Inversion:** In Light mode, elevation uses subtle neutral shadow + hairline border; in Dark mode, elevation shifts progressively lighter on the surface ramp with crisp subtle hairline borders (heavy dark shadows are invisible on dark backgrounds).
- **Accent Adaptation:** Recalibrate accent lightness and chroma separately for Light and Dark modes to maintain WCAG AA (`>= 4.5:1` body, `>= 3:1` large text & UI controls) in BOTH modes.
- **System-Aware + Instant Switching:** Respect `prefers-color-scheme` on first visit, persist explicit user choice, prevent flash of unstyled/wrong theme (FOUT) on load, and include a refined theme toggle.

---

## 3. Typography & Turkish Locale Hygiene

- **Intentional Type Selection:** Never lazily default to bare `Inter`, `Roboto`, or `Arial` for everything. Select typefaces with voice appropriate to the brand (e.g., `Geist`, `Plus Jakarta Sans`, `IBM Plex Sans`, `Manrope`, `DM Sans`, `Satoshi`, `Bricolage Grotesque`, `Instrument Serif`, `Newsreader`, `Fraunces`, `JetBrains Mono`, `IBM Plex Mono`). Reserve monospace fonts strictly for genuine code, CLI commands, identifiers, or tabular numeric readouts — never as decorative `01 / SECTION` eyebrow stamps or wireframe UI chrome.
- **MANDATORY Turkish Glyph Verification (`latin-ext`):** Every font chosen for a project MUST completely and cleanly support all Turkish characters (`ç, Ç, ğ, Ğ, ı, İ, ö, Ö, ş, Ş, ü, Ü`) across every weight used (regular, medium, semibold, bold, italic). Verify `latin-ext` subsetting before adopting a font — never ship fallback-font Frankenstein letters!
- **Turkish String & Slug Rules:** Handle Turkish case conversion (`tr-TR`: `i -> İ`, `I -> ı`) and URL slugification properly when building Turkish-facing features.
- **Disciplined Type Scale:** Restrict to 4–5 intentional scale stops with decisive contrast between display headings, section headings, body (`15–16px`, `line-height: 1.55–1.65`), and metadata.
- **Micro-Typography Details:**
  - Tighter negative tracking on large display headings (`-0.02em` to `-0.035em`), optical balance with `text-wrap: balance` on headings and `text-wrap: pretty` on paragraphs.
  - `font-variant-numeric: tabular-nums` on all prices, KPIs, counters, timestamps, and table columns.
  - Keep reading measure comfortable (`55–72ch`) for long-form copy.

---

## 4. Spatial Rhythm, Layout & Visual Hierarchy

- **Whitespace Over Boxes:** Group related content through proximity, alignment, and typographic contrast first — only add borders or card containers when structural containment truly improves comprehension.
- **Consistent Spacing System:** Use an intentional spatial scale (4px / 8px base rhythm) with clear separation between intra-component spacing (tight), inter-component spacing (medium), and section rhythm (generous).
- **Varied Section Composition:** Avoid stacking identical multi-column card grids back-to-back. Alternate full-bleed focal moments, asymmetric splits, editorial text-plus-visual blocks, and dense functional tables/lists.
- **Responsive Precision:** Every layout must work cleanly across Mobile (`375px`), Tablet (`768px`), Laptop (`1280px`), and Wide Desktop (`1440px+`) with zero horizontal overflow, broken wrapping, or clipped controls.

---

## 5. Motion & Micro-Interactions (Premium, Elite, UX-First)

- **Core Principle:** Motion MUST NEVER slow down workflows, obscure content, cause motion sickness, or degrade UX. Instead, it should elevate tactile quality so the interface feels **deliberate, fluid, premium, and elite**.
- **Adaptive Motion Scale:**
  - **Default (Modern Craft & Minimalist Premium):** Restrained, physically grounded transitions (`150ms–260ms` micro-interactions, `300ms–450ms` layout/modal reveals, custom ease-out curves like `cubic-bezier(0.22, 1, 0.36, 1)`). Crisp button press feedback (`scale(0.98)` or subtle tactile shift), smooth tab indicator glides, subtle staggered initial entrance on hero/key lists, graceful modal/drawer spring/ease transitions.
  - **Custom Art Direction:** When Alibeg specifies a distinct design style (e.g., editorial luxury, interactive creative showcase, ultra-minimalist brutalist, high-density trading terminal), intentionally scale motion intensity **up or down** to fit that direction.
- **Performance & Accessibility:**
  - Animate GPU-composited properties (`transform`, `opacity`, `clip-path`) — avoid animating `width`, `height`, `top`, `left`, or heavy box-shadows.
  - Always honor `@media (prefers-reduced-motion: reduce)`.

---

## 6. UX Completeness & Real Content Standards

- **Zero Placeholder Garbage:** Never use Lorem Ipsum, fake user names like "John Doe", fabricated stats ("99.99% Uptime", "10M+ Users"), or synthetic generic praise. Write domain-authentic realistic copy and realistic datasets (including long strings, multi-line items, and realistic edge numbers).
- **All States Designed & Built:** Every interactive view/component must handle:
  1. `default`
  2. `hover` / `active` / `focus-visible` (accessible keyboard navigation!)
  3. `disabled`
  4. `loading` (calm skeletons matching layout geometry, never jarring layout jumps)
  5. `empty` (helpful guidance + primary action, never a blank white box)
  6. `error` (clear explanation + actionable recovery)
  7. `overflow / truncation` (long titles, names, and Turkish words handled cleanly without breaking layout)

