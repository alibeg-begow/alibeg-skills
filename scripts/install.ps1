<#
.SYNOPSIS
    Installs or updates the 'alibeg' cross-platform AI agent skill into a project or globally.

.DESCRIPTION
    Deploys the alibeg Agent Skill (SKILL.md + references + decision log template) across
    Antigravity, Claude Code, Gemini CLI, Codex, and Cursor, and optionally merges
    idempotent always-on bridge blocks into AGENTS.md, CLAUDE.md, and GEMINI.md.

.EXAMPLE
    .\scripts\install.ps1 -Project "C:\Projects\my-app"
    .\scripts\install.ps1 -Project "C:\Projects\my-app" -InitDecisions
    .\scripts\install.ps1 -Project "C:\Projects\my-app" -Targets claude,gemini -NoBridges
    .\scripts\install.ps1 -Global
    .\scripts\install.ps1 -Global -DryRun
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$Project,

    [Parameter(Mandatory = $false)]
    [switch]$Global,

    [Parameter(Mandatory = $false)]
    [ValidateSet("all", "agents", "antigravity", "claude", "gemini")]
    [string[]]$Targets = @("all"),

    [Parameter(Mandatory = $false)]
    [switch]$NoBridges,

    [Parameter(Mandatory = $false)]
    [switch]$InitDecisions,

    [Parameter(Mandatory = $false)]
    [switch]$DryRun
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$Utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$SourceRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$SkillFile = Join-Path $SourceRoot "SKILL.md"
$ReferencesDir = Join-Path $SourceRoot "references"
$TemplatesDir = Join-Path $SourceRoot "templates"

if (-not (Test-Path $SkillFile) -or -not (Test-Path $ReferencesDir)) {
    throw "Invalid alibeg skill source directory: $SourceRoot (missing SKILL.md or references/)."
}

if (-not $Project -and -not $Global) {
    Write-Host "Usage:" -ForegroundColor Yellow
    Write-Host "  Project install : .\scripts\install.ps1 -Project <path> [-Targets all|agents|claude|gemini] [-NoBridges] [-InitDecisions] [-DryRun]"
    Write-Host "  Global install  : .\scripts\install.ps1 -Global [-Targets all|agents|antigravity|claude|gemini] [-DryRun]"
    exit 1
}

function Resolve-TargetSet {
    param([string[]]$InputTargets)
    $set = New-Object 'System.Collections.Generic.HashSet[string]'
    foreach ($t in $InputTargets) {
        if ($t -eq "all") {
            [void]$set.Add("agents")
            [void]$set.Add("antigravity")
            [void]$set.Add("claude")
            [void]$set.Add("gemini")
        }
        else {
            [void]$set.Add($t)
            if ($t -eq "antigravity") {
                [void]$set.Add("agents")
            }
        }
    }
    return $set
}

function Copy-SkillPayload {
    param([string]$Destination)

    if ($DryRun) {
        Write-Host "[DRY-RUN] Sync skill payload -> $Destination" -ForegroundColor Cyan
        return
    }

    if (Test-Path $Destination) {
        Remove-Item -Path $Destination -Recurse -Force
    }
    New-Item -Path $Destination -ItemType Directory -Force | Out-Null
    Copy-Item -Path $SkillFile -Destination (Join-Path $Destination "SKILL.md") -Force
    Copy-Item -Path $ReferencesDir -Destination (Join-Path $Destination "references") -Recurse -Force

    $decisionsTemplate = Join-Path $TemplatesDir "DECISIONS.md"
    if (Test-Path $decisionsTemplate) {
        $destTemplates = Join-Path $Destination "templates"
        New-Item -Path $destTemplates -ItemType Directory -Force | Out-Null
        Copy-Item -Path $decisionsTemplate -Destination (Join-Path $destTemplates "DECISIONS.md") -Force
    }

    Write-Host "[OK] Synced skill -> $Destination" -ForegroundColor Green
}

function Merge-BridgeFile {
    param(
        [string]$TemplatePath,
        [string]$TargetPath
    )

    $block = [System.IO.File]::ReadAllText($TemplatePath, $Utf8NoBom).Trim()
    $startMarker = "<!-- alibeg-skill:start -->"
    $endMarker = "<!-- alibeg-skill:end -->"

    if (-not (Test-Path $TargetPath)) {
        if ($DryRun) {
            Write-Host "[DRY-RUN] Create bridge -> $TargetPath" -ForegroundColor Cyan
            return
        }
        [System.IO.File]::WriteAllText($TargetPath, ($block + "`n"), $Utf8NoBom)
        Write-Host "[OK] Created bridge -> $TargetPath" -ForegroundColor Green
        return
    }

    $existing = [System.IO.File]::ReadAllText($TargetPath, $Utf8NoBom)
    $pattern = "(?s)" + [regex]::Escape($startMarker) + ".*?" + [regex]::Escape($endMarker)

    if ([regex]::IsMatch($existing, $pattern)) {
        $updated = [regex]::Replace($existing, $pattern, { param($m) $block }, 1)
        $action = "Updated"
    }
    else {
        $trimmed = $existing.TrimEnd()
        if ($trimmed.Length -gt 0) {
            $updated = $trimmed + "`n`n" + $block + "`n"
        }
        else {
            $updated = $block + "`n"
        }
        $action = "Appended"
    }

    if ($DryRun) {
        Write-Host "[DRY-RUN] $action bridge -> $TargetPath" -ForegroundColor Cyan
        return
    }

    [System.IO.File]::WriteAllText($TargetPath, $updated, $Utf8NoBom)
    Write-Host "[OK] $action bridge -> $TargetPath" -ForegroundColor Green
}

$selected = Resolve-TargetSet -InputTargets $Targets

if ($Project) {
    if (-not (Test-Path $Project -PathType Container)) {
        throw "Target project path does not exist or is not a directory: $Project"
    }

    $ProjectRoot = (Resolve-Path $Project).Path
    if ($ProjectRoot.TrimEnd('\', '/') -ieq $SourceRoot.TrimEnd('\', '/')) {
        throw "Target project cannot be the alibeg source repository itself."
    }

    Write-Host "Installing 'alibeg' skill into project: $ProjectRoot" -ForegroundColor White

    if ($selected.Contains("agents")) {
        Copy-SkillPayload -Destination (Join-Path $ProjectRoot ".agents\skills\alibeg")
        if (-not $NoBridges) {
            Merge-BridgeFile -TemplatePath (Join-Path $TemplatesDir "AGENTS.md") -TargetPath (Join-Path $ProjectRoot "AGENTS.md")
        }
    }

    if ($selected.Contains("claude")) {
        Copy-SkillPayload -Destination (Join-Path $ProjectRoot ".claude\skills\alibeg")
        if (-not $NoBridges) {
            Merge-BridgeFile -TemplatePath (Join-Path $TemplatesDir "CLAUDE.md") -TargetPath (Join-Path $ProjectRoot "CLAUDE.md")
        }
    }

    if ($selected.Contains("gemini")) {
        Copy-SkillPayload -Destination (Join-Path $ProjectRoot ".gemini\skills\alibeg")
        if (-not $NoBridges) {
            Merge-BridgeFile -TemplatePath (Join-Path $TemplatesDir "GEMINI.md") -TargetPath (Join-Path $ProjectRoot "GEMINI.md")
        }
    }

    if ($InitDecisions) {
        $docsDir = Join-Path $ProjectRoot "docs"
        $decisionsDest = Join-Path $docsDir "DECISIONS.md"
        if (Test-Path $decisionsDest) {
            Write-Host "[SKIP] Decision log already exists -> $decisionsDest" -ForegroundColor Yellow
        }
        elseif ($DryRun) {
            Write-Host "[DRY-RUN] Create decision log -> $decisionsDest" -ForegroundColor Cyan
        }
        else {
            New-Item -Path $docsDir -ItemType Directory -Force | Out-Null
            Copy-Item -Path (Join-Path $TemplatesDir "DECISIONS.md") -Destination $decisionsDest -Force
            Write-Host "[OK] Created decision log -> $decisionsDest" -ForegroundColor Green
        }
    }
}

if ($Global) {
    $HomeDir = $HOME
    if (-not $HomeDir) {
        $HomeDir = [Environment]::GetFolderPath("UserProfile")
    }

    Write-Host "Installing 'alibeg' skill globally under: $HomeDir" -ForegroundColor White

    if ($selected.Contains("agents")) {
        Copy-SkillPayload -Destination (Join-Path $HomeDir ".agents\skills\alibeg")
    }
    if ($selected.Contains("antigravity")) {
        Copy-SkillPayload -Destination (Join-Path $HomeDir ".gemini\config\skills\alibeg")
    }
    if ($selected.Contains("claude")) {
        Copy-SkillPayload -Destination (Join-Path $HomeDir ".claude\skills\alibeg")
    }
    if ($selected.Contains("gemini")) {
        Copy-SkillPayload -Destination (Join-Path $HomeDir ".gemini\skills\alibeg")
    }
}

Write-Host "Done." -ForegroundColor Green

