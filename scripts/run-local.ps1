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

# Ensure Java is available in this session (works even if PATH wasn't refreshed yet)
if (-not (Get-Command java -ErrorAction SilentlyContinue)) {
  $msDir = 'C:\Program Files\Microsoft'
  if (Test-Path $msDir) {
    $jdk = Get-ChildItem $msDir -Directory -ErrorAction SilentlyContinue |
      Where-Object { $_.Name -match '^jdk-17' } |
      Sort-Object Name -Descending |
      Select-Object -First 1

    if ($jdk) {
      $env:JAVA_HOME = $jdk.FullName
      $env:Path = (Join-Path $env:JAVA_HOME 'bin') + ';' + $env:Path
      Write-Host "JAVA_HOME=$env:JAVA_HOME"
    }
  }
}

Write-Host 'Building & running via Maven Wrapper...'

# Run embedded server from WAR.
# Use a non-8080 port by default to avoid conflicts with external Tomcat.
cmd /c "call .\\mvnw.cmd -DskipTests spring-boot:run -Dspring-boot.run.arguments=--server.port=8090"
