# Model guide — staying inside a Claude Pro plan

Claude Pro (about $20/month + tax) shares one usage allowance across the claude.ai apps and Claude Code. The allowance resets in rolling windows, plus a weekly cap. Bigger models use it up much faster. **The plan pays for usage limits, not per-token bills.** So the rule is: run the cheapest model that does the job well, and spend the expensive model only where a wrong answer costs hours.

Plans and limits change. If the operator's plan differs (Max, Team, API), ask and adjust this table.

## The models (Claude 5 family, late 2026)

| Model | Alias in Claude Code | Relative cost of the allowance* | Use it for |
|---|---|---|---|
| Claude Haiku 5.5 | `haiku` | lowest (~1/20 of Sonnet) | High-volume, well-specified work: meta descriptions, alt text, translations of finished copy, checklists, file renames, simple QA passes, summarizing |
| Claude Sonnet 5.5 | `sonnet` | baseline | **The default.** Coding, page building, copywriting, SEO, most QA, most PM work |
| Claude Opus 5.5 | `opus` | ~2× Sonnet | Judgment-heavy, low-volume work: requirements analysis, architecture/stack decisions, estimates, security review, hard bugs |
| Claude Fable 5.2 | `fable` (if your plan offers it) | ~4× Sonnet, long turns | **Avoid on Pro.** Only for a single, very hard problem the operator explicitly approves |

*Ratios follow the public API price ratios (Haiku $0.10/$0.50, Sonnet $2/$10, Opus $4/$20, Fable $8/$40 per million input/output tokens) and are a planning guide, not the exact Pro accounting.

## Effort

Claude Code lets you set effort (`/effort` or the model picker). Lower effort = fewer tokens.
- `low` — Haiku tasks, simple edits, chat.
- `medium` — default for Sonnet building work and Opus reviews.
- `high` — Opus analysis, estimates, security review, tricky debugging.
- `xhigh`/`max` — not on Pro unless the operator asks.

## Per-agent defaults

| Agent | Model | Effort | Why |
|---|---|---|---|
| Project Manager (analysis, estimate, plan) | Opus | high | Few calls; mistakes here cost the most money |
| Project Manager (status updates, task lists) | Sonnet → Haiku | low | Routine |
| UI/UX Designer | Sonnet | medium | Good visual/code taste at sensible cost |
| Developer | Sonnet | medium | Bulk of the work; Opus only for a bug stuck > 30 min |
| SEO Specialist | Sonnet (strategy), Haiku (meta tags, alt text at scale) | medium / low | |
| Content Writer | Sonnet (drafts), Haiku (translation of approved copy) | medium / low | |
| QA / Tester | Haiku (checklists, link checks), Sonnet (functional tests) | low / medium | |
| Security Specialist | Opus | high | Few, high-stakes reviews |
| DBA | Sonnet (schema, queries), Opus (data model for complex apps) | medium / high | |

## Budget habits on Pro

1. One task per session; `/clear` between unrelated steps — long histories burn allowance.
2. Do discovery, analysis and estimate with Opus in **one** session, save the files, then switch to Sonnet for building.
3. Run subagents only when the step has parallel, independent pieces; each one starts cold.
4. Batch Haiku work (all meta descriptions in one go, not page by page).
5. If you hit the limit mid-project: stop at a committed step, note the next prompt in `05-prompt-pack.md`, resume after reset.
6. Track how much of the weekly allowance each project uses (Settings → Usage) and write it in `04-team-plan.md` afterwards. After two or three projects you will know your real capacity per project size; until then, treat large projects as a reason to ask the operator about a bigger plan before starting.
