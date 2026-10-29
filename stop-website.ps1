# Stop Restaurant POS Website
$ErrorActionPreference = "Continue"

Write-Host "Stopping Nodedr Restaurant POS..." -ForegroundColor Yellow

# Stop PostgreSQL
Write-Host "Stopping PostgreSQL database..." -ForegroundColor Cyan
& "E:\pgsql\bin\pg_ctl.exe" stop -D "E:\restaurant-pos\db_data" -m fast

# Stop node processes running from E:\restaurant-pos
Write-Host "Stopping backend and web processes..." -ForegroundColor Cyan
Get-WmiObject Win32_Process | Where-Object { 
    $_.CommandLine -like "*restaurant-pos*" -and $_.Name -like "*node*" 
} | ForEach-Object {
    Stop-Process -Id $_.ProcessId -Force -ErrorAction SilentlyContinue
}

Write-Host "All POS services stopped." -ForegroundColor Green
