# Timeline and cost estimation

The operator sets the price. You give a transparent estimate they can defend.

## 1. Base hours per phase (website, one language)

| Phase | Small brochure (≤5 pages) | Corporate (6–15 pages, CMS, blog) | Small e-commerce |
|---|---|---|---|
| Discovery & analysis | 4–6 | 6–10 | 8–12 |
| Mockup & design system | 6–10 | 12–20 | 16–24 |
| Development (setup + pages) | 10–16 | 24–40 | 40–64 |
| Content entry / copywriting (if ours) | 4–8 | 10–20 | 16–30 |
| SEO (technical + on-page) | 4–6 | 8–12 | 10–16 |
| QA, accessibility, security | 3–5 | 6–10 | 10–16 |
| Launch & handover (domain, hosting, analytics, training) | 3–4 | 4–6 | 6–8 |
| Project management (≈10% of the above) | add | add | add |

AI assistance already shortens development and content; these ranges assume you use it. Do not cut them further — client communication and revisions don't get faster.

## 2. Multipliers (apply to the affected phases)

| Factor | Multiplier |
|---|---|
| Each extra language | +20% on content and SEO, +10% on development |
| Client supplies no copy/photos (we write/source) | content hours × 1.5 |
| Third-party integration (CRM, booking, ERP) | +6–16 h each |
| Payments / member login / personal data | +20% development, Security & DBA reviews (+6–10 h) |
| Migration from an old site | +1 h per 5 pages/posts, plus 301 redirect map (+3 h) |
| More than 2 revision rounds (K2) | +10% design and development per extra round |
| Rush (date earlier than expected timeline) | ×1.25–1.5 total — ask the operator |

## 3. Buffer and totals

```
expected_hours = Σ (phase midpoint × multipliers) + PM 10%
buffer         = 15% (20% if new stack for the operator or many integrations)
total_hours    = expected_hours × (1 + buffer)
cost_main      = total_hours × hourly_rate            (profile currency)
cost_other     = cost_main converted with fx_rate      (TRY ↔ USD, rate + date shown)
```

Show three lines: **Low** (range minimums, no buffer), **Expected** (with buffer — the quote), **High** (range maximums + buffer). Round the quoted price to a clean figure; note rounding.

Add the operator's **running costs** separately (passed to the client, not in labor): domain, hosting, premium plugins/themes, stock photos, email, paid APIs. Mark each monthly/yearly.

## 4. Calendar

```
weeks = total_hours / weekly_hours_available (profile)  + client wait time
```
Client wait time: add 3–5 working days per approval point (K1) and per content hand-off. Present as milestones with dates: Brief approved → Mockup approved → Content received → Development done → QA → Launch.

## 5. Payment schedule (default; profile can override)

40% at signing · 30% at mockup approval · 30% at launch. Maintenance is a separate monthly retainer (J3): estimate hours/month × rate.

## 6. Budget mismatch

If the client's budget (J1) is below **Low**: don't discount silently. Offer the operator a phased plan: Phase 1 = MVP that meets B2, Phase 2 = the rest. Show which items moved.

If the budget is **above Expected**: say so and let the operator choose — quote the cost-based price, price on value inside the client's range (state the effective hourly rate), or keep the cost price and list optional paid add-ons. Never silently raise the price.

## Launch checklist (Phase 8)

- [ ] Lighthouse mobile: Performance ≥ 90, Accessibility ≥ 95, Best Practices ≥ 95, SEO ≥ 95
- [ ] Core Web Vitals: LCP < 2.5 s, CLS < 0.1, INP < 200 ms
- [ ] Unique `<title>` and meta description per page; one `<h1>`; Open Graph tags; favicon
- [ ] `sitemap.xml`, `robots.txt`, canonical URLs, `hreflang` for multi-language, schema.org (LocalBusiness/Organization)
- [ ] 301 redirects from old URLs; no broken links
- [ ] Forms send, spam protection on, confirmation messages work
- [ ] HTTPS, security headers, no secrets in the repo, admin passwords handed over securely (not by email/chat)
- [ ] KVKK/GDPR texts, cookie banner (non-essential cookies off by default)
- [ ] Analytics + Search Console + Google Business Profile connected, sitemap submitted
- [ ] Backups configured; restore tested once
- [ ] Client trained; handover doc delivered; account ownership transferred as agreed
