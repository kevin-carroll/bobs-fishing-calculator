# This script is executed BEFORE a package is created 
# and before its published to nuget.
#
# This script performs some checks to ensure the package can be successfully built 
# and configured correctly
param (
    [String] $versionSuffix,  #e.g. "beta" or ""
    [String] $versionNumber,      #e.g.  "0.5.1"
    [String] $packageId,          # Bobs.Fishing|Bobs.Fishing.Other
    [String] $artifactDirectory   # ./output
)

# ------------------------------
# Validate the Version Number
# -------------------------------
# when version number validation fails fail the release
write-host "Validating Version Number: " -NoNewline
if ( ($versionNumber -eq "") -or ($null -eq $versionNumber)) {
    write-host "(ERROR!)." -ForegroundColor Red
    write-host "No Version Number was supplied to the release. Package Deployment Halted."  -ForegroundColor Red
    exit 1
}

## concat in the suffix (optional)
# with suffix:     1.0.0-beta
# without suffix:  1.0.0
if ( ($versionSuffix -ne "") -and ($null -ne $versionSuffix) ) {
    $versionNumber = "$versionNumber-$versionSuffix"
}

write-host  "$versionNumber (Done)." -ForegroundColor Green

$packagesToCheck = $packageId.Split("|", [System.StringSplitOptions]::None)
foreach ($packageToCheck in $packagesToCheck) {
    # ------------------------------
    # Validate the Package Id
    # -------------------------------
    # package Id must be supplied, and will be checked against the nupkg file name(s)
    write-host "Validating Package Id: " -NoNewline
    if ( ($packageToCheck -eq "") -or ($null -eq $packageToCheck)) {
        write-host "(ERROR!)"  -ForegroundColor Red
        write-host "No Package Id was supplied to the release. Package Deployment Halted."  -ForegroundColor Red
        exit 1
    }
    write-host "$packageToCheck (Done)" -ForegroundColor Green

    # ------------------------------
    # Check that a nuget file of the correct name exists
    # -------------------------------
    $fileName = "$packageToCheck.$versionNumber.nupkg"
    write-host "Checking for expected artifact: " -NoNewline
    write-host $fileName -ForegroundColor Green -NoNewline
    $matchedFiles = get-childitem "$artifactDirectory" -Recurse -Include $fileName | Select-Object -Expand FullName
    if ($null -eq $matchedFiles) {
        write-host " (ERROR!)" -ForegroundColor Red
        write-host "Expected File Not Found. Build Terminated." -ForegroundColor Red
        exit 1
    }
    write-host " (Done)" -ForegroundColor Green
}