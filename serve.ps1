<#
.SYNOPSIS
    Starts the Jekyll development server locally with live reload.
.EXAMPLE
    .\serve.ps1
#>

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "[SERVER] Starting Jekyll Local Server" -ForegroundColor Cyan
Write-Host "Preview at: http://127.0.0.1:4000" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop the server." -ForegroundColor Yellow
Write-Host "=========================================" -ForegroundColor Cyan

bundle exec jekyll serve --livereload
