param(
  [string]$EnvFile = (Join-Path (Get-Location) '.env')
)

$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

# Load local env vars if a .env exists (ignored by git)
if (Test-Path $EnvFile) {
  & (Join-Path $PSScriptRoot 'load-env.ps1') -EnvFile $EnvFile
}

function Get-JavaMajorVersionFromOutput([string]$firstLine) {
  if (-not $firstLine) { return $null }

  # Examples:
  # openjdk version "21.0.9" 2025-10-21 LTS
  # java version "1.8.0_202" ...
  $m = [regex]::Match($firstLine, 'version\s+"(?<v>[0-9]+)(?:\.(?<minor>[0-9]+))?')
  if (-not $m.Success) { return $null }

  $major = [int]$m.Groups['v'].Value
  if ($major -eq 1 -and $m.Groups['minor'].Success) {
    return [int]$m.Groups['minor'].Value
  }
  return $major
}

function Get-CurrentJavaMajorVersion {
  $cmd = Get-Command java -ErrorAction SilentlyContinue
  if (-not $cmd) { return $null }
  $firstLine = (& java -version 2>&1 | Select-Object -First 1)
  return Get-JavaMajorVersionFromOutput $firstLine
}

function Use-MicrosoftOpenJdk21 {
  $msDir = 'C:\Program Files\Microsoft'
  if (-not (Test-Path $msDir)) {
    throw "Microsoft OpenJDK install directory not found: $msDir"
  }

  $jdk = Get-ChildItem $msDir -Directory -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -match '^jdk-21' } |
    Sort-Object Name -Descending |
    Select-Object -First 1

  if (-not $jdk) {
    throw "Microsoft OpenJDK 21 not found under '$msDir'. Install it with: winget install -e --id Microsoft.OpenJDK.21"
  }

  $env:JAVA_HOME = $jdk.FullName
  $env:Path = (Join-Path $env:JAVA_HOME 'bin') + ';' + $env:Path
  Write-Host "JAVA_HOME=$env:JAVA_HOME"
}

# Ensure Java 21 is used in this session.
$javaHomeBin = if ($env:JAVA_HOME) { Join-Path $env:JAVA_HOME 'bin' } else { $null }
$javaHomeJava = if ($javaHomeBin) { Join-Path $javaHomeBin 'java.exe' } else { $null }
$javaHomeMajor = $null
if ($javaHomeJava -and (Test-Path $javaHomeJava)) {
  $firstLine = (& $javaHomeJava -version 2>&1 | Select-Object -First 1)
  $javaHomeMajor = Get-JavaMajorVersionFromOutput $firstLine
}

$currentMajor = Get-CurrentJavaMajorVersion

if ($javaHomeMajor -ne 21 -and $currentMajor -ne 21) {
  Use-MicrosoftOpenJdk21
}

Write-Host 'Building & running via Maven Wrapper...'

# Run embedded server from WAR.
# Use a non-8080 port by default to avoid conflicts with external Tomcat.
cmd /c "call .\\mvnw.cmd -DskipTests spring-boot:run -Dspring-boot.run.arguments=--server.port=8090"
