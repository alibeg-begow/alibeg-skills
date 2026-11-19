# Engineering Standards, Architecture & Safety Guardrails

This module defines the non-negotiable engineering standards for every codebase Alibeg works on (web, SaaS, mobile, backend/API, and AI/agent/CLI systems).

---

## 1. Tech Stack Policy

- **No Rigid Default Stack:** Do not force a fixed technology stack onto new projects.
- **Greenfield Projects:** Analyze project requirements, scale, ecosystem maturity, and maintenance cost; recommend the cleanest modern stack (with brief trade-offs) during the Planning phase and wait for approval.
- **Existing Repositories:** Strictly respect the existing stack, framework versions, package manager, folder architecture, and formatting rules. NEVER introduce parallel state managers, redundant UI libraries, or competing paradigms without explicit approval.

---

## 2. Production-Grade Code Quality (Zero Shortcuts)

Every line of production code shipped MUST meet these rules:
- **Zero Half-Baked Code:** No `TODO`, `FIXME`, `placeholder`, stubbed handlers, or "left as an exercise" shortcuts in delivered code.
- **Zero Fake Data in Production:** Realistic sample data belongs ONLY in Stage 3/4 design artifacts or dedicated test fixtures/seed scripts — NEVER hardcoded silently as production behavior.
- **Zero Suppressed Errors or Type Escapes:**
  - Never leave empty `catch {}` blocks or swallow exceptions silently.
  - Never silence compiler/linter issues with `any`, `@ts-ignore`, `@ts-expect-error`, `eslint-disable`, or `# type: ignore` unless genuinely unavoidable and justified with a concise comment explaining why.
  - Never weaken, skip, or manipulate a test to make a failing check pass — fix the underlying defect.
- **Zero Debug Debris:** Remove temporary `console.log`, `print()`, debug borders, and commented-out dead code before finishing.

---

## 3. Clean, Modular Architecture & Anti-Over-Engineering

- **Single Responsibility & Concise Files:** Keep files, modules, and functions focused, readable, and reasonably sized. Decompose cleanly when a file mixes unrelated concerns.
- **Clean Layer Separation:** Separate UI presentation, domain/business logic, and data/API persistence cleanly so each layer can evolve independently.
- **Strict Typing & Contracts:** Use strict static types and runtime boundary validation (e.g., Zod, Pydantic, Valibot, JSON Schema) at every external boundary (HTTP requests, webhooks, env vars, LLM tool outputs, DB reads).
- **Anti-Over-Engineering (Pragmatism Rule):**
  - Solve the actual problem cleanly with minimal accidental complexity.
  - Do NOT invent speculative abstractions, unnecessary microservices, factory-of-factories patterns, or heavy extra frameworks for straightforward problems.
  - Prefer boring, clear, maintainable code over clever one-liners.
- **Minimal Diff & Scope Fidelity:**
  - Change ONLY the files and symbols required for the approved plan.
  - Never silently refactor, rename, or reformat unrelated code outside scope — if you spot worthwhile technical debt, mention it briefly as a separate optional suggestion.

---

## 4. Code Language, Comments & Documentation

- **English Codebase:** All identifiers (variables, functions, classes, types, DB tables/columns, API routes, env keys), inline comments, commit messages, and technical documentation MUST be in **English**.
- **Self-Documenting Code Over Noisy Comments:**
  - Write clear names and structured logic so code reads cleanly without commentary.
  - Never write redundant comments that restate *what* the code obviously does (`// increment counter`).
  - Write brief comments ONLY to explain non-obvious *why* (invariants, business edge cases, external API quirks, Turkish locale edge cases).

---

## 5. Security & Performance Hygiene (By Default)

### Security Baseline
- **Zero Hardcoded Secrets:** Never commit or hardcode API keys, tokens, passwords, or private credentials. Load via environment variables with fail-fast startup validation and keep `.env.example` synced.
- **Input & Boundary Safety:** Validate and sanitize all untrusted inputs. Use parameterized queries/ORMs (prevent SQL/NoSQL injection), prevent XSS/CSRF/SSRF, enforce authentication AND authorization (ownership/RBAC checks) on every protected action.
- **Least Privilege & Safe Errors:** Never leak stack traces, internal SQL errors, or secrets in client-facing error responses; log structured diagnostics server-side.

### Performance Baseline
- **Backend / Data:** Avoid N+1 query patterns, index frequent lookup/filter columns, paginate unbounded lists, stream large payloads, and set explicit timeouts/retries on external HTTP/LLM calls.
- **Frontend / Mobile:** Avoid unnecessary re-renders, memoize/derive state cleanly, lazy-load heavy routes/bundles, optimize images/fonts, prevent memory leaks (clean up timers, listeners, subscriptions, abort controllers).

---

## 6. Anti-Hallucination & Truthfulness Rule

- **Verify Before Claiming:** Never guess library APIs, method signatures, config schemas, CLI flags, package versions, or file paths. Check the installed codebase, lockfiles, type definitions, or official documentation first.
- **Admit Uncertainty Explicitly:** If something cannot be verified with current tools/access, state clearly in Turkish *"Bunu doğrulamam gerekiyor / şu an kesin doğrulayamadım"* instead of inventing plausible-sounding details.
- **Evidence-Based Claims Only:** Never say *"çalışıyor"* or *"sorunsuz"* without actually running the relevant build/check/command and observing real output.

---

## 7. Maturity-Based Testing Strategy

Do NOT apply one-size-fits-all testing bureaucracy. Agree on testing depth explicitly during **Step 3 (Planning)**:
- **MVP / Rapid Prototype / Early Exploration:** Don't force heavy test suites unless requested; prioritize typecheck, build, lint, and targeted manual/smoke verification of critical flows.
- **Production Systems / Core Business Logic / Payments / Auth / APIs:** Automated unit and integration tests for critical paths and edge cases are **mandatory**.
- Always ensure existing tests continue to pass before declaring completion.

---

## 8. Strict Definition of Done (DoD)

Never mark a task complete until ALL applicable checks have actually run and passed:
1. **Typecheck** passes with zero errors.
2. **Lint / Formatter** passes cleanly (respecting repo config).
3. **Production Build** succeeds cleanly.
4. **Tests** (existing + newly planned tests) pass cleanly.
5. **Runtime / Visual Verification:**
   - Backend/CLI: verified against real execution or curl/smoke check without uncaught runtime errors.
   - UI/Frontend: verified visually in Light + Dark modes and responsive viewports with zero console/hydration errors and Anti-AI-Slop audit passed.
6. **Honest Reporting:** Report exact commands run, outcomes, and any remaining caveats or manual checks clearly.

---

## 9. Hard Safety & Git Boundaries

### Allowed Automatically (When Covered by an Approved Plan)
- Creating, editing, and **deleting planned obsolete files**.
- Installing or updating **planned dependencies**.
- Running local builds, linters, formatters, typecheckers, and local test suites.
- Creating clean local git commits ONLY if requested or explicitly part of the approved plan (use clear Conventional Commits in English, e.g., `feat(auth): add session token rotation`).

### HARD STOP — Always Require Explicit Approval First
Even inside Autonomous Mode ("Otomatik Mod"), **NEVER execute without explicit user confirmation**:
- `git push`, `git push --force`, `git reset --hard`, branch deletion on remotes, or history rewrites.
- Destructive database operations (dropping tables/columns, deleting/truncating data, running migrations against staging/production).
- Production deployments, DNS/cloud/infrastructure mutations, or publishing packages publicly.
- **Unplanned** medium-to-large architectural deviations or major new dependencies outside the approved plan.

