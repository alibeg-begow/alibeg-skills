# Mandatory 5-Stage Progressive Design Pipeline

For every **new product, new page, new major screen, or major UI redesign**, NEVER jump straight into production frontend code. Follow this 5-stage progressive pipeline in exact order, stopping for Alibeg's explicit approval after EVERY stage.

---

## Trigger & Bypass Policy

| Task Scope | Pipeline Rule |
| :--- | :--- |
| New web app / SaaS / landing page / mobile app | **Mandatory — all 5 stages** |
| New page, dashboard view, or multi-step flow in an existing app | **Mandatory — all 5 stages** |
| Major visual redesign or layout overhaul | **Mandatory — all 5 stages** |
| Small UI fix, bugfix, copy change, minor padding/state tweak | **Bypass** — apply directly in production code while respecting design tokens & Anti-AI-Slop rules |
| Explicit override by Alibeg (e.g., *"direkt mockup'a geç"*) | Follow Alibeg's explicit instruction for that task |

---

## Workspace Artifact Location (`_design/`)

Store Stages 1–4 in a clean, isolated `_design/` folder at the project root so production code stays completely unpolluted until Stage 5:

```text
_design/
├── 01-sitemap.md        # Stage 1: Information architecture, routes, user flows
├── 02-wireframe.html    # Stage 2: Low-fi grayscale interactive/scrollable layout preview
├── 03-mockup.html       # Stage 3: High-fi visual design + Design System tokens (Light & Dark!)
└── 04-prototype.html    # Stage 4: Clickable interactive flow, states, micro-interactions (Light & Dark!)
```

- Every HTML artifact (`02`, `03`, `04`) must be **self-contained and immediately openable directly in any browser** (single-file HTML/CSS/JS or cleanly bundled relative assets, zero build step required to inspect).
- When the project completes Stage 5, offer to keep `_design/` as living design reference or add `_design/` to `.gitignore` depending on Alibeg's preference.

---

## Stage-by-Stage Specifications & Approval Gates

### Stage 1 — Sitemap (`_design/01-sitemap.md`)
**Goal:** Lock down information architecture, scope, navigation, and user journeys before drawing a single box.

**Deliverable must include:**
- Page / screen inventory with exact purpose of each screen.
- Hierarchical navigation map (Markdown tree + Mermaid diagram).
- Primary user journeys (entry points, key actions, edge/error flows).
- Component & content inventory per screen (what real information belongs on each screen).

**Gate 1:** Present the sitemap concisely, explain key IA decisions (*why*), and **WAIT for Alibeg's explicit approval** before starting Stage 2.

---

### Stage 2 — Wireframe (`_design/02-wireframe.html`)
**Goal:** Validate spatial hierarchy, information density, layout proportions, responsive flow, and UX structure WITHOUT visual distraction.

**Deliverable rules:**
- Strictly **low-fi grayscale** (neutral grays, clean geometric wireframes, crisp box hierarchy, real structural labels — NO brand colors, NO shadows, NO gradients, NO decorative styling).
- Include all key screens/sections from the approved Sitemap (use a clean top stage-switcher bar if there are multiple pages/views, plus mobile/desktop viewport awareness).
- Use realistic structural labels and realistic content lengths (no "Lorem ipsum").
- Annotate any subtle UX/layout reasoning briefly in your summary.

**Gate 2:** Provide the clickable file link to `_design/02-wireframe.html`, explain key layout decisions (*why*), and **WAIT for Alibeg's explicit approval** before starting Stage 3.
- **Art Direction Pre-Gate (When No Visual Style Was Specified Yet):** Alongside Gate 2 (or immediately upon Gate 2 approval, BEFORE building `_design/03-mockup.html`), present **2 distinct, domain-tailored Project Art Direction Brief options** (covering Reference World, Brand Tone + Anti-Trait, Color Character for Light & Dark, Density/Rhythm, and One Authentic Signature Element — see [design-philosophy.md](./design-philosophy.md)) with 1 clear recommendation. Lock Alibeg's choice so Stage 3 never defaults to a generic fallback template.

---

### Stage 3 — Mockup (`_design/03-mockup.html`)
**Goal:** Establish full visual identity rooted in the approved **Project Art Direction Brief** — typography, color system (BOTH Light & Dark), spacing craft, and zero-slop aesthetic polish.

**Deliverable rules:**
- Implement the approved **Project Art Direction Brief** faithfully (and record the brief summary inside the mockup's Design System tab + `docs/DECISIONS.md` if used).
- Define explicit **Design System tokens** (CSS custom properties for BOTH Light and Dark themes, typography scale, spacing, border radii, elevation).
- Include a built-in **Light / Dark theme toggle** right in the preview toolbar (and respect system preference) so Alibeg can inspect BOTH themes immediately.
- Include a dedicated **Design Tokens & Components Reference** tab/panel inside the mockup file (showing the locked Art Direction Brief, palette swatches, typography hierarchy with Turkish test pangram `Pijamalı hasta yağız şoföre çabucak güvendi — ÇĞİÖŞÜ`, buttons, inputs, surfaces).
- Populate with **100% realistic domain data and human copy** (zero Lorem Ipsum, zero fake stats).
- Pass the full **12-point Pre-Delivery Anti-AI-Slop Audit** ([anti-ai-slop.md](./anti-ai-slop.md)).

**Gate 3:** Provide the link to `_design/03-mockup.html`, briefly explain how the visuals execute the approved Art Direction Brief (*why*), and confirm the 12-point Anti-AI-Slop audit passed. **WAIT for Alibeg's explicit approval** before starting Stage 4.

---

### Stage 4 — Prototype (`_design/04-prototype.html`)
**Goal:** Validate real interactivity, user flows, transitions, micro-interactions, responsive behavior, and non-happy-path UI states before writing production code.

**Deliverable rules:**
- Turn the approved Mockup into a **clickable, working interactive prototype**:
  - Real navigation between screens/tabs/views.
  - Working interactive controls (modals, drawers, dropdowns, filters, search, form validation feedback, toasts).
  - Working Light / Dark theme toggle with smooth token transition.
  - Built-in **State Inspector toolbar** (discrete, collapsible) letting Alibeg preview `Default`, `Loading (Skeleton)`, `Empty`, and `Error` states on demand!
  - Purposeful, premium micro-interactions and transitions tuned to the design direction (honoring `prefers-reduced-motion`).
  - Full responsive fidelity from `375px` mobile to `1440px+` desktop.

**Gate 4:** Provide the link to `_design/04-prototype.html`, summarize interactive behaviors & motion choices (*why*), and **WAIT for Alibeg's explicit approval** before starting Stage 5.

---

### Stage 5 — Production Design (Real Codebase)
**Goal:** Translate the approved Prototype and Design System into clean, modular, accessible, production-grade code inside the actual project repository.

**Execution rules:**
- Implement semantic Light + Dark tokens cleanly in the project's real styling system (CSS variables / Tailwind theme / NativeWind / Flutter ThemeData, matching the approved repo stack).
- Break UI into clean, reusable, well-typed components (no giant monolithic page files).
- Wire real state, real data/APIs, accessible keyboard navigation, ARIA attributes, loading/empty/error handling, and responsive layouts.
- Re-run the **Anti-AI-Slop Audit** and **Definition of Done verification** (build, typecheck, lint, live visual inspection across Light + Dark + Mobile/Desktop) before declaring completion.

