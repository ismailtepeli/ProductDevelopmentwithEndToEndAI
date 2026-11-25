# Agent roster

Each agent is a Claude Code subagent defined in `.claude/agents/<name>.md` (installed to `~/.claude/agents/` by `scripts/install.ps1`). The `model:` line in each file is the default from `05-model-guide.md`; change it there if the operator's plan differs.

Invoke an agent by asking for it by name ("use the qa-tester agent to check the contact page") or let the PM route work.

| Agent file | Role | Joins when | Receives | Hands over |
|---|---|---|---|---|
| `project-manager` | Runs phases, keeps the brief/estimate/plan, asks the operator at checkpoints | Always | Brief answers | `02-analysis.md`, `03-estimate.md`, `04-team-plan.md`, task list |
| `ui-ux-designer` | Sitemap, wireframes, HTML mockup, design tokens (colors, type, spacing) | Always | Brief E-section, analysis | `mockup/`, `design-tokens` |
| `web-developer` | Builds the site from approved mockup and tokens | Always | Mockup, tokens, prompt pack | Working site in the repo, per-step commits |
| `seo-specialist` | Keywords, site structure, meta, schema, technical SEO, launch SEO | Always for website + SEO | Brief G-section, pages | Keyword map, meta per page, SEO checklist results |
| `content-writer` | Page copy, blog posts, translations, microcopy | Client doesn't supply copy (D2) or multi-language | Brief, keyword map | Copy per page in the repo |
| `qa-tester` | Functional, responsive, cross-browser, accessibility, Lighthouse | Always, after each step | Built pages | Bug list with steps to reproduce; pass/fail per checklist item |
| `security-specialist` | Forms, auth, payments, headers, secrets, dependencies, KVKK/GDPR data flows | Forms with personal data, payments, login, custom backend | Code, hosting setup | Findings by severity, fixes or required actions |
| `dba` | Data model, migrations, indexes, backups | Custom backend / e-commerce / member area | Requirements | Schema, migration files, backup plan |

## Handoff rules

1. The PM owns the files in `clients/<slug>/`; other agents write in the code repo.
2. Every handoff names the file(s) produced and what "done" means.
3. Designer → Developer only after the operator approves the mockup.
4. Developer → QA after every step, not only at the end.
5. Security and SEO sign off before launch; the operator makes the launch call.
