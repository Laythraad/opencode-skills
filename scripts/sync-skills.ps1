# نسخ مكتبة المهارات إلى المسار العالمي لتصبح متاحة في كل مشاريع OpenCode.
# الاستخدام:  powershell -ExecutionPolicy Bypass -File scripts\sync-skills.ps1
#            أضف -WhatIf لمعاينة ما سيحدث دون كتابة.

[CmdletBinding(SupportsShouldProcess)]
param(
    [string]$Source,
    [string]$Destination
)

$ErrorActionPreference = "Stop"

if (-not $Source) {
    $scriptRoot = if ($PSScriptRoot) { $PSScriptRoot } else { Split-Path -Parent $MyInvocation.MyCommand.Path }
    $Source = Join-Path $scriptRoot "..\.opencode\skills"
}
if (-not $Destination) {
    $Destination = Join-Path $env:USERPROFILE ".config\opencode\skills"
}

if (-not (Test-Path $Source)) { throw "Source not found: $Source" }

$sourceDirs = Get-ChildItem $Source -Directory | Where-Object { Test-Path (Join-Path $_.FullName "SKILL.md") }
if ($sourceDirs.Count -eq 0) { throw "No skills (SKILL.md) found in $Source" }

if ($PSCmdlet.ShouldProcess($Destination, "Create directory")) {
    New-Item -ItemType Directory -Force -Path $Destination | Out-Null
}

$copied = 0
foreach ($dir in $sourceDirs) {
    $target = Join-Path $Destination $dir.Name
    if ($PSCmdlet.ShouldProcess($target, "Copy skill")) {
        Copy-Item -Path $dir.FullName -Destination $Destination -Recurse -Force
        $copied++
    }
}

Write-Host "Synced $copied skill(s) -> $Destination"
