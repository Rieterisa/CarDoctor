# Auto-commit + push dirty work (Windows fallback for Cursor hooks).
$ErrorActionPreference = 'SilentlyContinue'
try { $null = [Console]::In.ReadToEnd() } catch {}

function Write-HookOk { Write-Output '{}'; exit 0 }

$root = (git rev-parse --show-toplevel 2>$null)
if (-not $root) { Write-HookOk }
Set-Location $root

$env:Path = [System.Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' +
            [System.Environment]::GetEnvironmentVariable('Path', 'User')

$stateDir = Join-Path $root '.cursor\hooks\state'
New-Item -ItemType Directory -Force -Path $stateDir | Out-Null
$lockFile = Join-Path $stateDir 'auto-push.lock'
$lastFile = Join-Path $stateDir 'last-push.txt'

if (Test-Path $lockFile) {
  $age = [int]((Get-Date) - (Get-Item $lockFile).LastWriteTime).TotalSeconds
  if ($age -lt 120) { Write-HookOk }
  Remove-Item $lockFile -Force
}
New-Item -ItemType File -Force -Path $lockFile | Out-Null

try {
  $now = [DateTimeOffset]::UtcNow.ToUnixTimeSeconds()
  if (Test-Path $lastFile) {
    $last = [int](Get-Content $lastFile -Raw)
    if (($now - $last) -lt 20) { Write-HookOk }
  }

  $porcelain = git status --porcelain
  if (-not $porcelain) { Write-HookOk }

  git add -A
  git reset HEAD -- `
    'GoogleService-Info.plist' `
    'CarDoctor/GoogleService-Info.plist' `
    '.env' `
    '.env.*' `
    '*.p8' `
    '*.p12' `
    'AuthKey_*.p8' 2>$null

  $staged = git diff --cached --name-only
  if (-not $staged) { Write-HookOk }

  $summary = ($staged | Select-Object -First 3) -join ' '
  $msg = "chore: auto-sync - $summary"
  if ($msg.Length -gt 90) { $msg = "chore: auto-sync $(Get-Date -Format 'yyyy-MM-ddTHH:mmZ')" }

  git -c user.name='Rieterisa' -c user.email='160856540+Rieterisa@users.noreply.github.com' `
    commit -m $msg --quiet

  $branch = (git rev-parse --abbrev-ref HEAD)
  git push -u origin $branch --quiet
  if ($LASTEXITCODE -ne 0) { git push --quiet }

  Set-Content -Path $lastFile -Value $now -NoNewline
}
finally {
  Remove-Item $lockFile -Force -ErrorAction SilentlyContinue
}

Write-HookOk
