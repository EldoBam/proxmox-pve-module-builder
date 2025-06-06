﻿$apiinput = "$($PSScriptRoot)\output\proxmox_ve_api_oa_3.1.1.json"
$apioutput = "$($PSScriptRoot)\..\pve-powershell-module"
$jarpath = "$($PSScriptRoot)\bin\openapi-generator-cli-7.9.0.jar"
$jdkPath = "$($PSScriptRoot)\bin\jdk-23.0.2\bin\java.exe"
$templatepath = "$($PSScriptRoot)\templates\Powershell"

# Clear output folder
Get-ChildItem $apioutput -Exclude .git | Remove-Item -Recurse -Force

Start-Process -FilePath $jdkPath -ArgumentList "-jar $jarpath  generate -g powershell -i $apiinput -o $apioutput -t $templatepath --package-name ProxmoxPVE --additional-properties=debugOperations=true,discardReadOnly=true,apiNamePrefix=PVE,useCmdletParams=true --skip-validate-spec" -wait
# for debugging, open a CMD and insert the following command. Neccessary, if you need to see the output. --> Start-Process closes the window when finished
"Command:"
"$jdkPath -jar $jarpath generate -g powershell -i $apiinput -o $apioutput -t $templatepath --package-name ProxmoxPVE --additional-properties=debugOperations=true,discardReadOnly=true,apiNamePrefix=PVE,useCmdletParams=true --skip-validate-spec" | Set-Clipboard
"$jdkPath -jar $jarpath generate -g powershell -i $apiinput -o $apioutput -t $templatepath --package-name ProxmoxPVE --additional-properties=debugOperations=true,discardReadOnly=true,apiNamePrefix=PVE,useCmdletParams=true --skip-validate-spec"
"copied to clipboard"
"---"

# copy license to directory
Copy-Item "$($PSScriptRoot)\LICENSE" $apioutput
Copy-Item "$($PSScriptRoot)\CONTRIBUTING.md" $apioutput
Copy-Item "$($PSScriptRoot)\CODE_OF_CONDUCT.md" $apioutput
Copy-Item "$($PSScriptRoot)\.github" $apioutput -Recurse
New-Item -Path $apioutput -Name "examples" -ItemType Directory
Copy-Item "$($PSScriptRoot)\output\examples\*" "$($apioutput)\examples\"