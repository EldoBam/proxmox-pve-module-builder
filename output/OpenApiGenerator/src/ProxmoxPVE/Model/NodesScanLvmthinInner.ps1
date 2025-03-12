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

.PARAMETER Lv
No description available.
.OUTPUTS

NodesScanLvmthinInner<PSCustomObject>
#>

function Initialize-PVENodesScanLvmthinInner {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Lv}
    )

    Process {
        'Creating PSCustomObject: ProxmoxPVE => PVENodesScanLvmthinInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug


		 $DisplayNameMapping =@{
			"Lv"="lv"
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

Convert from JSON to NodesScanLvmthinInner<PSCustomObject>

.DESCRIPTION

Convert from JSON to NodesScanLvmthinInner<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

NodesScanLvmthinInner<PSCustomObject>
#>
function ConvertFrom-PVEJsonToNodesScanLvmthinInner {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: ProxmoxPVE => PVENodesScanLvmthinInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PVENodesScanLvmthinInner
        $AllProperties = ("lv")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "lv"))) { #optional property not found
            $Lv = $null
        } else {
            $Lv = $JsonParameters.PSobject.Properties["lv"].value
        }

        $PSO = [PSCustomObject]@{
            "lv" = ${Lv}
        }

        return $PSO
    }

}

