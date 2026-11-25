# Agency profile

Copy this file to `agency-profile.md` at the repo root (git-ignored) and fill it in. The e2e-project skill reads it in every phase. Each person using the skill keeps their own.

## Identity (used on proposals only, never on client mockups)
- agency_name: 
- contact_name: 
- contact_email: 
- contact_phone: 
- website: 
- logo_path:            # e.g. assets/my-logo.svg
- brand_colors:         # e.g. primary #0F4C81, accent #F2A900
- brand_fonts:          # e.g. Inter / Merriweather

## Language
- prompt_language: Turkish     # prompts are given in this language, plus English
- client_language: Turkish     # proposal and questionnaire language

## Money
- hourly_rate: 
- rate_currency: TRY           # TRY or USD
- fx_usd_try:                  # e.g. 42.10
- fx_checked_on:               # YYYY-MM-DD — re-ask if older than 7 days
- payment_terms: 40% signing / 30% mockup approval / 30% launch
- vat_note:                    # e.g. "Prices exclude 20% VAT"
- maintenance_hourly_rate:     # optional, if different

## Capacity and skills
- weekly_hours_available: 
- stacks_i_maintain:           # e.g. Astro, WordPress, Next.js
- team:                        # people besides you, with roles, or "solo"

## Defaults
- git_host: GitHub
- git_owner:                   # your user or org
- repo_visibility: private
- ai_plan: Claude Pro          # changes model choices, see references/05-model-guide.md
