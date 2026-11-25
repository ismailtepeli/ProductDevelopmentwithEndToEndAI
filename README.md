# Product Development with End-to-End AI

A Claude Code **skill** plus a team of **agents** that run a client project from the first meeting to launch: requirements interview, Git setup, analysis, MCP/tool selection, timeline and cost, mockup, agent team with a model per agent, and a bilingual prompt pack where every prompt says which model to use.

Version 1 covers **websites and SEO**. Mobile apps, social media/ads and games are planned.

> 🇹🇷 Türkçe özet aşağıda.

## What's inside

```
.claude/
  skills/e2e-project/
    SKILL.md                      the workflow (phases 0–8, checkpoints, rules)
    references/
      01-discovery-questions.md   question bank, TR + EN, required vs optional
      02-analysis-mcp-tools.md    stack choice and MCP/tool matrix
      03-estimation.md            hours per phase, multipliers, cost formula, launch checklist
      04-agents-roster.md         agents, roles, handoffs
      05-model-guide.md           which model for what on a Claude Pro plan
      06-prompt-templates.md      prompt format (+ example)
      07-git-setup.md             Git host questions, safe auth, repo creation
    templates/
      agency-profile.example.md   your own name, brand, rate, currency, language
      client-questionnaire.html   form to send to clients (TR/EN, works offline)
      project-brief.md
      proposal.md
  agents/                         project-manager, ui-ux-designer, web-developer,
                                  seo-specialist, content-writer, qa-tester,
                                  security-specialist, dba
scripts/install.ps1               copies skill + agents to ~/.claude
```

## Install

1. Clone this repo.
2. Run the installer (copies to `~/.claude` so it works in every project):
   ```powershell
   powershell -ExecutionPolicy Bypass -File scripts\install.ps1
   ```
3. Open Claude Code and type `/e2e-project`. On first run it asks for your agency profile (name, brand, hourly rate, currency, language). Each user defines their own; nothing is hard-coded.

Working inside this repo also works without installing: the skill and agents load from `.claude/`.

## How a project runs

| Phase | Output | You decide |
|---|---|---|
| 0. Agency profile | `agency-profile.md` | your rate, brand, language |
| 1. Discovery (live, form, or both) | `clients/<slug>/01-brief.md` | nothing moves while required questions are open |
| 2. Git | repo on your host | host, owner, visibility, name |
| 3. Analysis | `02-analysis.md` (scope, stack, MCPs/tools, risks) | scope matches what you sold |
| 4. Estimate | `03-estimate.md`, `proposal.md` (TRY + USD) | the final price |
| 5. Mockup | `mockup/vN.html` | "how does it look from a human perspective?" |
| 6. Team & models | `04-team-plan.md` | plan limits |
| 7. Prompt pack | `05-prompt-pack.md` (your language + English, model per prompt) | go / no-go |
| 8. Build, QA, launch | site + `06-handover.md` | each visual step, launch |

## Models (Claude Pro)

Sonnet 5.5 is the default for building. Opus 5.5 is reserved for analysis, estimates and security reviews. Haiku 5.5 handles bulk work (meta tags, translations, checklists). See `references/05-model-guide.md`.

## Privacy

`clients/`, `agency-profile.md` and `.env` are git-ignored. The skill never asks for tokens or passwords in chat; GitHub access uses `gh auth login`.

---

## 🇹🇷 Türkçe özet

Bu depo, bir müşteri projesini ilk görüşmeden yayına kadar yürüten bir Claude Code **skill**'i ve **ajan** ekibidir: ihtiyaç toplama (canlı veya müşteriye gönderilen form), Git kurulumu, analiz, gerekli MCP/araçlar, süre ve maliyet (saatlik ücret, TL + USD), taslak (mockup), ajan ekibi ve her ajan için model seçimi, ve her istemin hangi modelle çalıştırılacağını yazan Türkçe + İngilizce istem paketi.

**Kurulum:** depoyu klonlayın, `scripts\install.ps1` çalıştırın, Claude Code'da `/e2e-project` yazın. İlk çalıştırmada kendi ajans profilinizi (ad, marka, saatlik ücret, para birimi, dil) tanımlarsınız.

**Kurallar:** gerekli sorular cevaplanmadan geliştirme başlamaz; her aşamanın sonunda size sorulur; token/şifre sohbette istenmez; müşteri verisi (`clients/`) Git'e girmez.
