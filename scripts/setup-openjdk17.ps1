param(
  [ValidateSet('User','Machine')]
  [string]$Scope = 'User'
)

$ErrorActionPreference = 'Stop'

function Add-ToPath([string]$binPath) {
  $current = [System.Environment]::GetEnvironmentVariable('Path', $Scope)
  if (-not $current) { $current = '' }

  $parts = $current -split ';' | Where-Object { $_ -and $_.Trim() }
  $exists = $parts | Where-Object { $_.TrimEnd('\\') -ieq $binPath.TrimEnd('\\') }
  if ($exists) {
    Write-Host "PATH already contains: $binPath"
    return
  }

  $new = ($parts + $binPath) -join ';'
  [System.Environment]::SetEnvironmentVariable('Path', $new, $Scope)
  Write-Host "Added to PATH ($Scope): $binPath"
}

Write-Host "Searching for Microsoft OpenJDK 17..."

$jdkCandidates = @()
$msDir = 'C:\Program Files\Microsoft'
if (Test-Path $msDir) {
  $jdkCandidates += Get-ChildItem $msDir -Directory -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -match '^jdk-17' } |
    Select-Object -ExpandProperty FullName
}

if (-not $jdkCandidates -or $jdkCandidates.Count -eq 0) {
  throw "Microsoft OpenJDK 17 not found under '$msDir'. If you haven't installed it yet, run: winget install -e --id Microsoft.OpenJDK.17"
}

# Pick the newest (lexicographically usually works for jdk-17.0.x names)
$jdkHome = ($jdkCandidates | Sort-Object -Descending | Select-Object -First 1)
$bin = Join-Path $jdkHome 'bin'

if (!(Test-Path (Join-Path $bin 'java.exe'))) {
  throw "java.exe not found at: $bin"
}

[System.Environment]::SetEnvironmentVariable('JAVA_HOME', $jdkHome, $Scope)
Write-Host "Set JAVA_HOME ($Scope): $jdkHome"

Add-ToPath $bin

Write-Host "Done. Open a NEW terminal and run: java -version"
