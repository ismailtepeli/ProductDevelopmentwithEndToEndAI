# Git and code hosting

Always **ask the developer/operator** where the project lives before creating anything. Record the answers in `01-brief.md` → *Repository*.

## Questions (TR / EN)

1. Kod nerede tutulacak? GitHub, GitLab, Bitbucket, Azure DevOps, müşterinin kendi deposu, yoksa yalnızca yerelde mi? / Where will the code live? GitHub, GitLab, Bitbucket, Azure DevOps, the client's own repo, or local only?
2. Depo kimin hesabında olacak: sizin, bir organizasyonun, müşterinin? Teslimde sahiplik devredilecek mi? / Whose account owns the repo: yours, an organization's, the client's? Will ownership transfer on delivery?
3. Gizli mi açık mı? (Müşteri işleri için varsayılan: gizli) / Private or public? (Default for client work: private)
4. Depo adı? / Repository name?
5. Dal stratejisi: `main` + özellik dalları ve PR mı, doğrudan `main` mi? / Branching: `main` + feature branches with PRs, or straight to `main`?

## Access — never take tokens in chat

| Host | Check | If not signed in (operator runs it) |
|---|---|---|
| GitHub | `gh auth status` | `gh auth login` |
| GitLab | `glab auth status` | `glab auth login` |
| Bitbucket / Azure DevOps | `git ls-remote <url>` | Sign in with Git Credential Manager on first push |

If the operator offers to paste a token, decline and point them to the login command above. Deploy keys or CI secrets go into the host's secret settings, set by the operator.

## Create (after the operator confirms)

```powershell
git init -b main
gh repo create <owner>/<name> --private --source . --remote origin
git add -A
git commit -m "Initial project setup"
git push -u origin main
```

## Must be in `.gitignore` of every client repo

```
.env
.env.*
!.env.example
node_modules/
dist/
.DS_Store
```
