# This script is executed BEFORE a package is created 
# and before its published to nuget.
#
# This script performs some checks to ensure the package can be successfully built 
# and configured correctly
param (
    [String] $versionSuffix,  #e.g. "beta" or ""
    [String] $versionNumber,      #e.g.  "0.5.1"
    [String] $csProjFile,          # bobs-fishing.csproj
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

# ------------------------------
# Validate Published Versions for Conflicts
# ------------------------------
# Check each created package to ensure that the actual file matches the expected version number

$projIdFinder = "$PsScriptRoot\retrievePackageId.ps1"
[string]$packageToCheck =  & "$projIdFinder" -csProjFile  $csProjFile 
if($packageToCheck -eq 1 -or $null -eq $packageToCheck -or "" -eq ($packageToCheck.Trim()) ){
    exit 1
}

# ensure the version that is being built doesn't already exist on nuget.
write-host "Processing Package Id: " -NoNewline
write-host $packageToCheck -ForegroundColor DarkCyan

# ------------------------------
# Check that a nuget file of the correct name exists
# -------------------------------
$fileName = "$packageToCheck.$versionNumber.nupkg"
write-host "Searching Artifact Directory: $artifactDirectory"
write-host "Checking for expected artifact: $fileName ..." -NoNewline
$matchedFiles = get-childitem "$artifactDirectory" -Include $fileName | Select-Object -Expand FullName
if ($null -eq $matchedFiles) {
    write-host "(ERROR!)" -ForegroundColor Red
    write-host "ERROR: Expected File Not Found. Build Terminated." -ForegroundColor Red
    exit 1
}
write-host " (Done)" -ForegroundColor Green

write-host "Post-Package Validation Complete" -ForegroundColor Green
