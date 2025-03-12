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

.PARAMETER PreferredNode
No description available.
.PARAMETER ConfigDigest
No description available.
.PARAMETER Nodelist
No description available.
.PARAMETER Totem
No description available.
.OUTPUTS

ClusterConfigJoin<PSCustomObject>
#>

function Initialize-PVEClusterConfigJoin {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${PreferredNode},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${ConfigDigest},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [PSCustomObject[]]
        ${Nodelist},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [PSCustomObject]
        ${Totem}
    )

    Process {
        'Creating PSCustomObject: ProxmoxPVE => PVEClusterConfigJoin' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug


		 $DisplayNameMapping =@{
			"PreferredNode"="preferred_node"; "ConfigDigest"="config_digest"; "Nodelist"="nodelist"; "Totem"="totem"
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

Convert from JSON to ClusterConfigJoin<PSCustomObject>

.DESCRIPTION

Convert from JSON to ClusterConfigJoin<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

ClusterConfigJoin<PSCustomObject>
#>
function ConvertFrom-PVEJsonToClusterConfigJoin {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: ProxmoxPVE => PVEClusterConfigJoin' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PVEClusterConfigJoin
        $AllProperties = ("preferred_node", "config_digest", "nodelist", "totem")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "preferred_node"))) { #optional property not found
            $PreferredNode = $null
        } else {
            $PreferredNode = $JsonParameters.PSobject.Properties["preferred_node"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "config_digest"))) { #optional property not found
            $ConfigDigest = $null
        } else {
            $ConfigDigest = $JsonParameters.PSobject.Properties["config_digest"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "nodelist"))) { #optional property not found
            $Nodelist = $null
        } else {
            $Nodelist = $JsonParameters.PSobject.Properties["nodelist"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "totem"))) { #optional property not found
            $Totem = $null
        } else {
            $Totem = $JsonParameters.PSobject.Properties["totem"].value
        }

        $PSO = [PSCustomObject]@{
            "preferred_node" = ${PreferredNode}
            "config_digest" = ${ConfigDigest}
            "nodelist" = ${Nodelist}
            "totem" = ${Totem}
        }

        return $PSO
    }

}

