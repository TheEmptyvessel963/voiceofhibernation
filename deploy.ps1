<#
.SYNOPSIS
    Automated workflow script: Stage, Commit, Push to GitHub & Deploy on Netlify.
.EXAMPLE
    .\deploy.ps1 "feat: update blog post title"
#>

param (
    [Parameter(Mandatory=$false)]
    [string]$Message = "update: site content and configuration"
)

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "[DEPLOY] Starting Deployment Workflow" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

# Step 1: Check Git Status
Write-Host "`n1. Checking local git status..." -ForegroundColor Yellow
git status

# Step 2: Stage all changes
Write-Host "`n2. Staging modified and new files..." -ForegroundColor Yellow
git add .

# Step 3: Commit changes
Write-Host "`n3. Committing changes with message: '$Message'..." -ForegroundColor Yellow
git commit -m "$Message"

if ($LASTEXITCODE -ne 0) {
    Write-Host "No changes to commit, proceeding to push check..." -ForegroundColor Gray
}

# Step 4: Push to GitHub (Triggers Netlify Auto-Deploy)
Write-Host "`n4. Pushing to GitHub (origin/main)..." -ForegroundColor Yellow
git push origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n=========================================" -ForegroundColor Green
    Write-Host "[SUCCESS] Pushed to GitHub." -ForegroundColor Green
    Write-Host "Netlify is now automatically building and deploying your site!" -ForegroundColor Green
    Write-Host "=========================================" -ForegroundColor Green
} else {
    Write-Host "`n[ERROR] Failed to push to GitHub. Please check network/permissions." -ForegroundColor Red
}
