# Installs the e2e-project skill and its agents into your user-level Claude Code folder,
# so they work in every project. Re-run after pulling updates.
# Usage:  powershell -ExecutionPolicy Bypass -File scripts\install.ps1

$ErrorActionPreference = 'Stop'
$repo   = Split-Path -Parent $PSScriptRoot
$claude = Join-Path $HOME '.claude'

$skillSrc = Join-Path $repo '.claude\skills\e2e-project'
$skillDst = Join-Path $claude 'skills\e2e-project'
$agentSrc = Join-Path $repo '.claude\agents'
$agentDst = Join-Path $claude 'agents'
$profDir  = Join-Path $claude 'e2e-project'

New-Item -ItemType Directory -Force $skillDst, $agentDst, $profDir | Out-Null
Copy-Item -Recurse -Force (Join-Path $skillSrc '*') $skillDst

foreach ($f in Get-ChildItem $agentSrc -Filter *.md) {
    $target = Join-Path $agentDst $f.Name
    if ((Test-Path $target) -and ((Get-FileHash $target).Hash -ne (Get-FileHash $f.FullName).Hash)) {
        Copy-Item -Force $target "$target.bak"
        Write-Host "Backed up your existing $($f.Name) to $($f.Name).bak"
    }
    Copy-Item -Force $f.FullName $target
}

$profPath = Join-Path $profDir 'agency-profile.md'
if (-not (Test-Path $profPath)) {
    Copy-Item (Join-Path $skillSrc 'templates\agency-profile.example.md') $profPath
    Write-Host "Created $profPath - fill it in, or let the skill interview you on first run."
}

Write-Host "Installed skill to $skillDst and agents to $agentDst."
Write-Host "Start a new Claude Code session and type /e2e-project."
