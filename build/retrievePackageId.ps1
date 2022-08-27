# Inspects the XML of any CS project file 
# and returns the first found instance of <PackageId>
param(
    [String] $csProjFile 
)

write-host "Determining PackageId"
write-host "Inspecting: $csProjFile"

if(!(Test-Path $csProjFile)){
    write-host 'Unable to Determine Package Id' -ForegroundColor Red
    write-host 'Missing Project File' -ForegroundColor Red
    return 1
}


[xml]$fileData =  Get-Content -Path $csProjFile
[string]$packageId = $fileData.Project.PropertyGroup.PackageId

if($null -eq $packageId){
    write-host 'Unable to Determine Package Id' -ForegroundColor Red
    write-host "<PackageId> element not found"  -ForegroundColor Red
    return 1
}

$packageId = $packageId.Trim()
if("" -eq $packageId){
    write-host 'Unable to Determine Package Id' -ForegroundColor Red
    write-host "<PackageId> element is blank"  -ForegroundColor Red
    return 1
}

write-host "Package Id Found: $packageId" -ForegroundColor Green

return $packageId