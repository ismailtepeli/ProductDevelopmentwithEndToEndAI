# Prompt pack format

Every prompt in `05-prompt-pack.md` uses this block. Write the main prompt in the operator's `prompt_language`, then the English version. Fill all `{…}` from the brief, analysis and estimate — never leave a placeholder in a delivered prompt.

```markdown
### Step {n} — {step name}

- **Model:** {Sonnet 5.5 / Opus 5.5 / Haiku 5.5}, effort {low/medium/high} — {one-line reason}
- **Agent:** {agent file name}
- **Inputs:** {files the step reads}
- **Done when:** {objective check}
- **Ask the operator:** {human checkpoint, or "—"}

**Prompt ({language}):**
> …

**English version:**
> …
```

## Standard steps for a website project

| # | Step | Model / effort | Agent |
|---|---|---|---|
| 1 | Repo and project setup | Sonnet / low | web-developer |
| 2 | Design tokens and base layout | Sonnet / medium | ui-ux-designer |
| 3 | Home page | Sonnet / medium | web-developer |
| 4 | Inner pages (one prompt per page group) | Sonnet / medium | web-developer |
| 5 | Copy for all pages | Sonnet / medium | content-writer |
| 6 | Translations (if multi-language) | Haiku / low | content-writer |
| 7 | Forms and integrations | Sonnet / medium | web-developer |
| 8 | Technical + on-page SEO | Sonnet / medium; meta/alt in bulk with Haiku / low | seo-specialist |
| 9 | QA pass | Haiku / low checklist, Sonnet / medium functional | qa-tester |
| 10 | Security review | Opus / high | security-specialist |
| 11 | Launch | Sonnet / medium | web-developer + seo-specialist |
| 12 | Handover document | Sonnet / low | project-manager |

## Example (Turkish operator)

### Step 3 — Home page

- **Model:** Sonnet 5.5, effort medium — page building is the bulk of the work; Sonnet is accurate enough and saves allowance
- **Agent:** web-developer
- **Inputs:** `clients/ornek-dis-klinigi/mockup/v2-approved.html`, `src/styles/tokens.css`, `clients/ornek-dis-klinigi/01-brief.md`
- **Done when:** page matches the mockup at 375 px and 1440 px, Lighthouse mobile ≥ 90 on all four scores, no console errors
- **Ask the operator:** "Ana sayfa canlı önizlemede. İnsan gözüyle nasıl görünüyor — müşteri kendini burada görür mü?"

**Prompt (Türkçe):**
> Onaylı taslaktaki (`mockup/v2-approved.html`) ana sayfayı Astro bileşenleri olarak `src/pages/index.astro` içinde oluştur. Renk, yazı tipi ve boşluklar için yalnızca `tokens.css` değişkenlerini kullan. Bölümler: hero (başlık, alt başlık, "Randevu Al" butonu), hizmetler (6 kart), neden biz (3 madde), hasta yorumları, harita ve iletişim. Görseller `loading="lazy"` ve `alt` metniyle gelsin, hero görseli hariç. Tek bir `<h1>` olsun. Bitince 375 px ve 1440 px'te ekran görüntüsü al, taslakla farkları listele.

**English version:**
> Build the home page from the approved mockup (`mockup/v2-approved.html`) as Astro components in `src/pages/index.astro`. Use only the `tokens.css` variables for color, type and spacing. Sections: hero (headline, subheading, "Book an appointment" button), services (6 cards), why us (3 points), patient testimonials, map and contact. Images get `loading="lazy"` and `alt` text, except the hero image. Exactly one `<h1>`. When done, take screenshots at 375 px and 1440 px and list differences from the mockup.
