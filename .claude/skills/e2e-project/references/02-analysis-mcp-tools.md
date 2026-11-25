# Analysis: stack and MCP/tool selection

Pick **one** stack and justify it in one line. Ask the operator which stacks they can maintain if the profile doesn't say (`skills` field).

## Stack by project shape

| Project shape (from the brief) | Recommended stack | Why |
|---|---|---|
| Brochure / corporate site, client edits rarely (D3 = no) | Astro (static) + Tailwind, hosted on Netlify/Vercel/Cloudflare Pages | Fastest, cheapest hosting, best Core Web Vitals, little to maintain |
| Corporate site, client edits often, blog (D3 = yes) | WordPress + a block theme (or Astro + headless CMS such as Decap/Sanity if the operator prefers code) | Client-friendly admin; huge plugin ecosystem; SEO plugins |
| Landing page for ads | Astro or a single HTML page | Speed is conversion |
| Small e-commerce (< 500 products, TR market) | WooCommerce or Shopify; iyzico/PayTR for TRY payments | Mature, client can run it, local payment providers |
| Custom features, member area, integrations | Next.js + PostgreSQL (Supabase/Neon) + auth provider | Flexibility; needs DBA + Security agents |
| Multi-language | Add i18n routing + `hreflang`; +15–25% content hours | SEO for every language |

## MCPs and tools — matrix

Mark each line as **required** or **nice to have** in `02-analysis.md`. Say who must authorize it (operator signs in via `/mcp` or the tool's own login — you never take credentials).

| Need | MCP / tool | When required | Notes |
|---|---|---|---|
| Code hosting, issues, PRs | GitHub CLI (`gh`) or GitHub MCP; GitLab CLI (`glab`) for GitLab | Always (Phase 2) | `gh auth login` by the operator |
| Design files / mockups | Figma MCP | Client or designer works in Figma | HTML mockups need nothing extra |
| Graphics, social images, presentations | Canva MCP | Client wants social/brand assets | Optional |
| Live preview & testing | Built-in browser pane / Claude in Chrome | Always for QA and mockup review | Screenshots, console, responsive checks |
| Performance & SEO audit | Lighthouse (`npx lighthouse`), PageSpeed Insights | Always before launch | Targets in `03-estimation.md` launch checklist |
| Accessibility | `design:accessibility-review` skill, axe (`npx @axe-core/cli`) | Always before launch | WCAG 2.1 AA |
| Keyword research | Google Search Console (client account), Keyword Planner; web search | SEO scope | Client grants access to the operator |
| Project tracking | Linear / Asana / Jira (Atlassian) / Notion MCP | Team > 1 person or client wants a board | Optional; a `TASKS.md` in the repo is enough for solo work |
| Team chat | Slack MCP | Operator's team uses Slack | Optional |
| Database | Supabase/Postgres MCP or `psql` | Custom stack with data | DBA agent |
| Error monitoring | Sentry | Custom app | Nice to have |
| Docs for the client | Claude Docs / artifacts, `docx`/`pdf` skills | Proposal, handover | Private by default |

## Analysis output checklist

- [ ] Every requirement traces back to a brief answer (cite the question ID, e.g. *F1*).
- [ ] Stack chosen with one reason; alternatives not listed unless the operator asks.
- [ ] MCP/tool list with required / nice-to-have and who authorizes.
- [ ] Risks: content delays, access to domain/hosting, legal texts, third-party integrations, unrealistic date.
- [ ] Assumptions written down so the proposal can quote them.
