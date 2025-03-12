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

.PARAMETER Volname
No description available.
.OUTPUTS

NodesScanGlusterfsInner<PSCustomObject>
#>

function Initialize-PVENodesScanGlusterfsInner {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Volname}
    )

    Process {
        'Creating PSCustomObject: ProxmoxPVE => PVENodesScanGlusterfsInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug


		 $DisplayNameMapping =@{
			"Volname"="volname"
        }
		
		 $OBJ = @{}
		foreach($parameter in   $PSBoundParameters.Keys){
			#If Specifield map the Display name back
			$OBJ.($DisplayNameMapping.($parameter)) = "$PSBoundParameters.$parameter"
		}

		$PSO = [PSCustomObject]$OBJ


        return $PSO
    }
}

<#
.SYNOPSIS

Convert from JSON to NodesScanGlusterfsInner<PSCustomObject>

.DESCRIPTION

Convert from JSON to NodesScanGlusterfsInner<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

NodesScanGlusterfsInner<PSCustomObject>
#>
function ConvertFrom-PVEJsonToNodesScanGlusterfsInner {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: ProxmoxPVE => PVENodesScanGlusterfsInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PVENodesScanGlusterfsInner
        $AllProperties = ("volname")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "volname"))) { #optional property not found
            $Volname = $null
        } else {
            $Volname = $JsonParameters.PSobject.Properties["volname"].value
        }

        $PSO = [PSCustomObject]@{
            "volname" = ${Volname}
        }

        return $PSO
    }

}

