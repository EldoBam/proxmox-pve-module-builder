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

.PARAMETER Target
No description available.
.PARAMETER Portal
No description available.
.OUTPUTS

NodesScanIscsiInner<PSCustomObject>
#>

function Initialize-PVENodesScanIscsiInner {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Target},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Portal}
    )

    Process {
        'Creating PSCustomObject: ProxmoxPVE => PVENodesScanIscsiInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug


		 $DisplayNameMapping =@{
			"Target"="target"; "Portal"="portal"
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

Convert from JSON to NodesScanIscsiInner<PSCustomObject>

.DESCRIPTION

Convert from JSON to NodesScanIscsiInner<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

NodesScanIscsiInner<PSCustomObject>
#>
function ConvertFrom-PVEJsonToNodesScanIscsiInner {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: ProxmoxPVE => PVENodesScanIscsiInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PVENodesScanIscsiInner
        $AllProperties = ("target", "portal")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "target"))) { #optional property not found
            $Target = $null
        } else {
            $Target = $JsonParameters.PSobject.Properties["target"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "portal"))) { #optional property not found
            $Portal = $null
        } else {
            $Portal = $JsonParameters.PSobject.Properties["portal"].value
        }

        $PSO = [PSCustomObject]@{
            "target" = ${Target}
            "portal" = ${Portal}
        }

        return $PSO
    }

}

