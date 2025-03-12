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

.PARAMETER Pos
No description available.
.OUTPUTS

ClusterFirewallGroupsAVInner<PSCustomObject>
#>

function Initialize-PVEClusterFirewallGroupsAVInner {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Pos}
    )

    Process {
        'Creating PSCustomObject: ProxmoxPVE => PVEClusterFirewallGroupsAVInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug


		 $DisplayNameMapping =@{
			"Pos"="pos"
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

Convert from JSON to ClusterFirewallGroupsAVInner<PSCustomObject>

.DESCRIPTION

Convert from JSON to ClusterFirewallGroupsAVInner<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

ClusterFirewallGroupsAVInner<PSCustomObject>
#>
function ConvertFrom-PVEJsonToClusterFirewallGroupsAVInner {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: ProxmoxPVE => PVEClusterFirewallGroupsAVInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PVEClusterFirewallGroupsAVInner
        $AllProperties = ("pos")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "pos"))) { #optional property not found
            $Pos = $null
        } else {
            $Pos = $JsonParameters.PSobject.Properties["pos"].value
        }

        $PSO = [PSCustomObject]@{
            "pos" = ${Pos}
        }

        return $PSO
    }

}

