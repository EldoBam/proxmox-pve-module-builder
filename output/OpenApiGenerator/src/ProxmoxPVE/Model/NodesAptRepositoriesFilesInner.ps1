#
# Proxmox VE Module 1.0
# Generated OpenApiDescription to render Modules via OpenapiGenerator
# Version: 0.1
# Contact: 
# Generated by OpenAPI Generator: https://openapi-generator.tech
#

<#
.SYNOPSIS

No summary available.

.DESCRIPTION

No description available.

.PARAMETER Digest
Digest of the file as bytes.
.PARAMETER FileType
Format of the file.
.PARAMETER Path
Path to the problematic file.
.PARAMETER Repositories
The parsed repositories.
.OUTPUTS

NodesAptRepositoriesFilesInner<PSCustomObject>
#>

function Initialize-PVENodesAptRepositoriesFilesInner {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [Int32[]]
        ${Digest},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [ValidateSet("list", "sources")]
        [String]
        ${FileType},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Path},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [PSCustomObject[]]
        ${Repositories}
    )

    Process {
        'Creating PSCustomObject: ProxmoxPVE => PVENodesAptRepositoriesFilesInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug


		 $DisplayNameMapping =@{
			"Digest"="digest"; "FileType"="file-type"; "Path"="path"; "Repositories"="repositories"
        }
		
		 $OBJ = @{}
		foreach($parameter in   $PSBoundParameters.Keys){
			#If Specifield map the Display name back
			$OBJ.($DisplayNameMapping.($parameter)) = $PSBoundParameters.$parameter
		}

		$PSO = [PSCustomObject]$OBJ


        return $PSO
    }
}

<#
.SYNOPSIS

Convert from JSON to NodesAptRepositoriesFilesInner<PSCustomObject>

.DESCRIPTION

Convert from JSON to NodesAptRepositoriesFilesInner<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

NodesAptRepositoriesFilesInner<PSCustomObject>
#>
function ConvertFrom-PVEJsonToNodesAptRepositoriesFilesInner {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: ProxmoxPVE => PVENodesAptRepositoriesFilesInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PVENodesAptRepositoriesFilesInner
        $AllProperties = ("digest", "file-type", "path", "repositories")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "digest"))) { #optional property not found
            $Digest = $null
        } else {
            $Digest = $JsonParameters.PSobject.Properties["digest"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "file-type"))) { #optional property not found
            $FileType = $null
        } else {
            $FileType = $JsonParameters.PSobject.Properties["file-type"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "path"))) { #optional property not found
            $Path = $null
        } else {
            $Path = $JsonParameters.PSobject.Properties["path"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "repositories"))) { #optional property not found
            $Repositories = $null
        } else {
            $Repositories = $JsonParameters.PSobject.Properties["repositories"].value
        }

        $PSO = [PSCustomObject]@{
            "digest" = ${Digest}
            "file-type" = ${FileType}
            "path" = ${Path}
            "repositories" = ${Repositories}
        }

        return $PSO
    }

}

