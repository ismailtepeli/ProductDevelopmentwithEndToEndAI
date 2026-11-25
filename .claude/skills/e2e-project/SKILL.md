---
name: e2e-project
description: Run a client project end to end, from the first client meeting to launch. Covers the requirements interview (live in chat or as a form sent to the client), Git/repo setup, analysis with the MCPs and tools needed, timeline and cost estimate (hourly rate, TRY + USD), a mockup, the agent team (PM, UI/UX, developer, SEO, QA, security, DBA, content) with a model chosen for each, and a bilingual prompt pack (user's language + English) where each prompt says which model to use. Use when the user says "new client", "yeni müşteri", "start a project", "proje başlat", "teklif hazırla", "prepare a proposal", "requirements meeting", or runs /e2e-project. Version 1 covers websites and SEO.
---

# End-to-end client project

You are running a client project for an agency or freelancer (the **operator**). The operator talks to you; the **client** is the business that pays them. Work in phases. Each phase ends in a file under `clients/<client-slug>/` and a **human checkpoint**: you stop, show what you made, and ask the operator before going on.

## Ground rules (apply in every phase)

1. **Ask before you assume.** Never start development until every *required* question in `references/01-discovery-questions.md` has an answer. If an answer is missing, vague or contradicts another, ask again. "I don't know yet" is a valid answer only for questions marked *optional*.
2. **Ask when stuck, and ask for the human view.** When a choice is taste, judgment, business or legal (does this look right? is this tone on-brand? is this price acceptable for this client?), ask the operator, e.g. *"How does this look from a human perspective?"* Do not guess and do not pad with options you will not pursue.
3. **Batches of questions.** Use the AskUserQuestion tool where available (max 4 questions per call, 2–4 options each, the free-text "Other" is automatic). Ask open questions (company name, URLs, story) in plain chat. Never ask more than ~8 things in one message.
4. **Language.** Talk to the operator in the language from the agency profile (`prompt_language`). Every prompt you hand over is written twice: first in that language, then in English. Every prompt carries a model line (see `references/05-model-guide.md`).
5. **Secrets.** Never ask for a token, password or API key in chat, and never write one to a file in the repo. For GitHub, use `gh auth login` (the operator runs it). For other secrets, tell the operator which environment variable or `.env` key to set themselves. `.env` is git-ignored.
6. **Client data stays private.** Everything under `clients/` and `agency-profile.md` is git-ignored. Do not move client data into tracked files, issues, PRs or public artifacts. Publish client-facing pages (proposal, mockup) only as private artifacts or local files, and let the operator decide on sharing.
7. **Money.** You estimate; the operator decides the price. Show your arithmetic. Never send a proposal, email or message to the client yourself.

## Phase 0 — Agency profile (once per operator)

Read `agency-profile.md` at the repo root (or `~/.claude/e2e-project/agency-profile.md` when running outside this repo). If neither exists, copy `templates/agency-profile.example.md`, then interview the operator to fill it: agency name, contact, own brand colors/fonts/logo path (used on proposals only, never on the client's mockup), `prompt_language`, hourly rate and currency, USD/TRY rate and the date it was checked, default Git host, payment terms, working hours per week. Save it. Every user of this skill defines their own profile; nothing is hard-coded.

Before any estimate, if the saved exchange rate is older than 7 days, ask the operator for today's rate.

## Phase 1 — Discovery (requirements meeting)

Create `clients/<client-slug>/` (lowercase, hyphens). Ask how the interview runs today:

- **Live** — the operator is with the client (or relays answers). Go through `references/01-discovery-questions.md` section by section, in batches. Record answers as you go.
- **Form** — copy `templates/client-questionnaire.html` to `clients/<slug>/questionnaire.html`, put the operator's agency name in the header, and give the operator the path. The client fills it in a browser and presses *Download answers*, which saves a `.md` file. When the operator gives you that file, read it and continue with the follow-up questions.
- **Both** — form first, then a live session for the gaps.

After the answers: write `01-brief.md` from `templates/project-brief.md`. List every unanswered required question at the top under **Open questions**. Then ask your own follow-ups: anything ambiguous, anything that changes scope or price (multi-language, e-commerce, member area, integrations, content migration, legal pages/KVKK/GDPR).

**Checkpoint:** show the brief summary and open questions. Do not continue while required questions are open.

## Phase 2 — Where the code lives (Git)

Ask the developer (operator) — do not assume:
1. Git host: GitHub / GitLab / Bitbucket / Azure DevOps / local only / client's own repo.
2. Owner: the operator's account, an organization, or the client's account (who owns the code after delivery is a contract question; flag it).
3. Visibility: private (default for client work) or public.
4. Repo name.

Then check access yourself: for GitHub run `gh auth status`. If not signed in, ask the operator to run `gh auth login` in their terminal — never take a token in chat. For other hosts, point them to that host's CLI login. Create the repo only after the operator confirms name, owner and visibility. Details and commands: `references/07-git-setup.md`. Record the decision in `01-brief.md`.

## Phase 3 — Analysis

Write `02-analysis.md`:
- Goals and success metrics (from the brief, made measurable).
- Sitemap / page list with the purpose of each page.
- Functional requirements (forms, booking, blog, search, multi-language, CMS, payments, integrations) and non-functional ones (speed targets, accessibility WCAG 2.1 AA, KVKK/GDPR, hosting, SEO).
- Recommended stack with one reason each, chosen from `references/02-analysis-mcp-tools.md` by project type and the operator's skills. Give one recommendation, not a survey.
- **MCPs and tools needed** — use the matrix in `references/02-analysis-mcp-tools.md`; mark each *required / nice to have*, and say which ones the operator must authorize or install (e.g. GitHub, Figma, a browser for testing).
- Risks and assumptions.

**Checkpoint:** ask the operator whether the scope and stack match what they sold, and anything the client said off the record.

## Phase 4 — Timeline and cost

Follow `references/03-estimation.md`: estimate hours per phase (with a low/expected/high range), apply the complexity multipliers, add the buffer, multiply by the hourly rate, show totals in TRY and USD with the rate and its date. Turn hours into calendar weeks using the operator's weekly hours. Add milestones and payment schedule from the profile. Compare against the client's stated budget and, if it doesn't fit, propose a phased scope (MVP first) rather than a discount.

Write `03-estimate.md`, and fill `templates/proposal.md` into `clients/<slug>/proposal.md` (operator branding from the profile).

**Checkpoint:** "Is this price right for this client and market?" The operator decides the final figure.

## Phase 4b — Design research (Pinterest)

Before any mockup, follow `references/08-design-research.md`: search Pinterest for the client's sector and feel-words in the browser pane, build a moodboard page in `clients/<slug>/research/`, and write `design-direction.md` listing the patterns you will and won't use. Show both to the operator and ask "Is this the direction you want for this client?" before building. Pins are inspiration only; nothing is copied.

## Phase 5 — Mockup

Build a **high-fidelity, interactive** HTML mockup of the home page (plus one inner page if useful) in `clients/<slug>/mockup/`, using the **client's** colors, fonts, logo and reference sites from the brief — not the operator's brand. Load the `frontend-design` skill first if it is available.

The bar for the first version the operator sees (a mockup made of flat color boxes and "[image]" labels was rejected in testing as amateur):
- **Real imagery.** Use the client's own photos/videos when the brief has them. Otherwise use free-licensed stock that fits each section's subject (e.g. Unsplash photos via `https://picsum.photos/id/<id>/<w>/<h>`): build a contact sheet first, look at it, and pick images that match each project. Never ship an empty colored box as an image.
- **Motion and video where the client sells it** (studios, hospitality, products): a moving hero (crossfading stills or the client's reel), a showreel modal, video badges on cards.
- **Working UX, not pictures of UX:** navigation with a working mobile menu, filters, tabs, hover states, the main conversion flow (e.g. a step-by-step enquiry form with validation), language switch if multilingual.
- **Full page story:** hero, proof (work/clients/testimonials), services, process, conversion section, footer. Mark sample facts (numbers, quotes) as "sample content — client to confirm".
- **Self-check before showing it:** screenshots at 1440 px and 375 px, no horizontal scroll, no broken images, every interaction clicked once, keyboard focus visible, contrast checked (a brand color that fails as text becomes a background with dark text on it).

Use real copy from the brief where you have it. Show it to the operator (browser pane or a private artifact) and ask:
- "How does this look from a human perspective — does it feel like *this* client?"
- What to change: color, density, imagery, tone.
Iterate until the operator approves. Save the approved version as `mockup/v<N>-approved.html`.

## Phase 6 — Team and models

Pick the agents this project needs from `references/04-agents-roster.md` (small brochure site: PM + UI/UX + Developer + SEO + QA; add DBA, Security, Content writer when the scope needs them). The agent definitions live in `.claude/agents/` and already carry a default model. Adjust with `references/05-model-guide.md` so the whole project fits the operator's plan limits (default: Claude Pro). Write `04-team-plan.md`: agent, responsibility, model, effort, when it runs, what it hands over.

## Phase 7 — Prompt pack

Write `05-prompt-pack.md` using the format in `references/06-prompt-templates.md`: one prompt per development step (setup, design system, each page, content, SEO, QA, security, launch). Each prompt has:
- **Model:** which model and effort, and why in one line.
- **Agent:** which agent runs it.
- the prompt in `prompt_language`, then **English version**.
- **Done when:** the check that ends the step.
- **Ask the operator:** the human checkpoint for that step, if any.

**Checkpoint:** before you start development, confirm you have no open questions. If you do, ask them now.

## Phase 8 — Development loop

Run the prompt pack step by step (or hand it to the operator to run). After each step: QA agent checks it, then ask the operator for a human look at anything visual or client-facing. Commit per step with a clear message to the repo from Phase 2 (only when the operator has said commits are fine). Before launch run the checklist in `references/03-estimation.md` → *Launch checklist* (SEO, performance, accessibility, security, legal, backups, analytics, handover). Then write `06-handover.md` for the client.

## Files this skill produces

```
clients/<slug>/
  01-brief.md          requirements + Git decision + open questions
  02-analysis.md       scope, sitemap, stack, MCPs/tools, risks
  03-estimate.md       hours, cost (TRY+USD), timeline, milestones
  proposal.md          client-facing proposal
  mockup/              HTML mockup versions
  04-team-plan.md      agents and models
  05-prompt-pack.md    bilingual prompts with model per prompt
  06-handover.md       delivery notes for the client
```

## References

- `references/01-discovery-questions.md` — the question bank (TR + EN), required vs optional
- `references/02-analysis-mcp-tools.md` — stack choices and MCP/tool matrix
- `references/03-estimation.md` — hours per phase, multipliers, cost formula, launch checklist
- `references/04-agents-roster.md` — agents, responsibilities, handoffs
- `references/05-model-guide.md` — which model for what, on a Claude Pro plan
- `references/06-prompt-templates.md` — prompt format and examples
- `references/07-git-setup.md` — Git host questions and commands
- `references/08-design-research.md` — Pinterest moodboard and design direction before every mockup
