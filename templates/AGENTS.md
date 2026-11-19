<!-- alibeg-skill:start -->
## Alibeg Operating System (`alibeg` Skill — Mandatory)

Before starting ANY task in this workspace, read and follow the `alibeg` skill:
- Primary path: `.agents/skills/alibeg/SKILL.md`
- Fallback paths: `.claude/skills/alibeg/SKILL.md`, `.gemini/skills/alibeg/SKILL.md`, or global `~/.agents/skills/alibeg/SKILL.md`

Non-negotiable summary (full rules live in `SKILL.md` and `references/`):
1. **Language:** Communicate with Alibeg in clear, direct, technical **Turkish** (explain *why* concisely, zero sycophancy, push back with evidence on weak decisions). Write code, identifiers, minimal comments, and commits in **English**.
2. **Workflow:** Deep analysis -> structured questions -> detailed plan -> **wait for approval** -> Autonomous Mode (minimal questions; stop only on unplanned medium/large deviations or hard safety stops).
3. **UI Design:** Mandatory 5-stage pipeline (`Sitemap -> Wireframe -> Mockup -> Prototype -> Production`) with approval gate after every stage for new products/pages/redesigns; lock a **Project Art Direction Brief** before Stage 3; **Light + Dark mode ALWAYS mandatory**; strictly enforce `references/anti-ai-slop.md`.
4. **Engineering & Safety:** Production-grade code only, minimal diff, strict Definition of Done verification, zero hallucinations. Hard stop before `git push`, destructive DB operations, or prod deploys.
<!-- alibeg-skill:end -->

