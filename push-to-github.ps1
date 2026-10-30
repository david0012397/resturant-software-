# Push local repository to your GitHub account
param (
    [string]$RepoUrl
)

$git = "E:\git\cmd\git.exe"
$repo = "E:\restaurant-pos"

if (-not $RepoUrl) {
    $RepoUrl = Read-Host "Enter your GitHub repository URL (e.g. https://github.com/YourUsername/your-pos-repo.git)"
}

if (-not $RepoUrl) {
    Write-Host "No repository URL provided. Aborted." -ForegroundColor Red
    exit 1
}

Write-Host "Setting remote origin to: $RepoUrl" -ForegroundColor Cyan
& $git -C $repo remote remove origin 2>$null
& $git -C $repo remote add origin $RepoUrl
& $git -C $repo branch -M main

Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
& $git -C $repo push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "Successfully pushed to GitHub!" -ForegroundColor Green
} else {
    Write-Host "Push failed. Please ensure you are logged into GitHub and have permission to push." -ForegroundColor Red
}
