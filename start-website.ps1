# Start Restaurant POS Website
$ErrorActionPreference = "Continue"

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host " Starting Nodedr OrderRestro POS Website " -ForegroundColor Green
Write-Host " Stored strictly on E: drive " -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Cyan

$env:PATH = "E:\pgsql\bin;E:\npm-global;$env:PATH"
$env:TEMP = "E:\restaurant-pos\temp"
$env:TMP = "E:\restaurant-pos\temp"
$env:npm_config_cache = "E:\npm-cache"

# 1. Start PostgreSQL
Write-Host "[1/3] Checking PostgreSQL..." -ForegroundColor Cyan
$pgRunning = & "E:\pgsql\bin\pg_isready.exe" -U postgres -h 127.0.0.1 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Starting PostgreSQL database server..." -ForegroundColor Yellow
    & "E:\pgsql\bin\pg_ctl.exe" start -D "E:\restaurant-pos\db_data" -l "E:\restaurant-pos\logs\postgres.log"
    Start-Sleep -Seconds 2
} else {
    Write-Host "PostgreSQL is already running." -ForegroundColor Green
}

# 2. Start Backend
Write-Host "[2/3] Checking Backend API (:4001)..." -ForegroundColor Cyan
$backendOk = $false
try {
    $r = Invoke-WebRequest -Uri "http://localhost:4001/api/docs" -UseBasicParsing -TimeoutSec 2 -ErrorAction SilentlyContinue
    if ($r.StatusCode -eq 200) { $backendOk = $true }
} catch {}

if (-not $backendOk) {
    Write-Host "Starting NestJS backend on :4001..." -ForegroundColor Yellow
    Start-Process -FilePath "node.exe" -ArgumentList "dist/src/main.js" -WorkingDirectory "E:\restaurant-pos\apps\backend" -WindowStyle Hidden
    Start-Sleep -Seconds 3
} else {
    Write-Host "Backend API is already running." -ForegroundColor Green
}

# 3. Start Frontend
Write-Host "[3/3] Checking Web Frontend (:1995)..." -ForegroundColor Cyan
$webOk = $false
try {
    $r = Invoke-WebRequest -Uri "http://localhost:1995" -UseBasicParsing -TimeoutSec 2 -ErrorAction SilentlyContinue
    if ($r.StatusCode -eq 200) { $webOk = $true }
} catch {}

if (-not $webOk) {
    Write-Host "Starting Next.js frontend on :1995..." -ForegroundColor Yellow
    Start-Process -FilePath "npx.cmd" -ArgumentList "next start -p 1995" -WorkingDirectory "E:\restaurant-pos\apps\web" -WindowStyle Hidden
    Start-Sleep -Seconds 3
} else {
    Write-Host "Web frontend is already running." -ForegroundColor Green
}

Write-Host "==========================================" -ForegroundColor Green
Write-Host " Restaurant POS Website is LIVE!          " -ForegroundColor Green
Write-Host " URL: http://localhost:1995               " -ForegroundColor Yellow
Write-Host " Login: owner@demo.local / Password123!   " -ForegroundColor Yellow
Write-Host " Opening browser now...                   " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Green

Start-Process "http://localhost:1995"
