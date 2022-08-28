
# Copy the strict linting file in place of the regular one
# this will enforce build errors on any applicable warnings during development
$strictLintPath = "./build/strict-linting.ruleset"
$developerLintPath = "./src/styles.ruleset"

Write-Host "Configuring Environment for CI Build" -ForegroundColor Yellow

if(-Not (Test-path $developerLintPath)){
    Write-Host "Invalid Path. Unable to locate $developerLintPath" -ForegroundColor Red
    exit 1
}

if(-Not (Test-path $strictLintPath)){
    Write-Host "Invalid Path. Unable to locate $strictLintPath"  -ForegroundColor Red
    exit 1
}

Write-Host "Enforcing Strict Linting (Stylecop)..."
Remove-Item $developerLintPath
Copy-Item  $strictLintPath -Destination $developerLintPath

Write-Host "CI Build Configuration Complete" -ForegroundColor Green
exit 0