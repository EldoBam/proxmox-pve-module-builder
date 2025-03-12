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

.PARAMETER Port
No description available.
.PARAMETER Socket
No description available.
.OUTPUTS

NodesQemuMtunnelwebsocket<PSCustomObject>
#>

function Initialize-PVENodesQemuMtunnelwebsocket {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Port},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Socket}
    )

    Process {
        'Creating PSCustomObject: ProxmoxPVE => PVENodesQemuMtunnelwebsocket' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug


		 $DisplayNameMapping =@{
			"Port"="port"; "Socket"="socket"
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

Convert from JSON to NodesQemuMtunnelwebsocket<PSCustomObject>

.DESCRIPTION

Convert from JSON to NodesQemuMtunnelwebsocket<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

NodesQemuMtunnelwebsocket<PSCustomObject>
#>
function ConvertFrom-PVEJsonToNodesQemuMtunnelwebsocket {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: ProxmoxPVE => PVENodesQemuMtunnelwebsocket' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PVENodesQemuMtunnelwebsocket
        $AllProperties = ("port", "socket")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "port"))) { #optional property not found
            $Port = $null
        } else {
            $Port = $JsonParameters.PSobject.Properties["port"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "socket"))) { #optional property not found
            $Socket = $null
        } else {
            $Socket = $JsonParameters.PSobject.Properties["socket"].value
        }

        $PSO = [PSCustomObject]@{
            "port" = ${Port}
            "socket" = ${Socket}
        }

        return $PSO
    }

}

