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

.PARAMETER Enable
No description available.
.PARAMETER PolicyForward
No description available.
.PARAMETER LogRatelimit
No description available.
.PARAMETER PolicyIn
No description available.
.PARAMETER Ebtables
No description available.
.PARAMETER PolicyOut
No description available.
.OUTPUTS

ClusterFirewallOptions<PSCustomObject>
#>

function Initialize-PVEClusterFirewallOptions {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Enable},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [ValidateSet("ACCEPT", "DROP")]
        [String]
        ${PolicyForward},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${LogRatelimit},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [ValidateSet("ACCEPT", "REJECT", "DROP")]
        [String]
        ${PolicyIn},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Ebtables},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [ValidateSet("ACCEPT", "REJECT", "DROP")]
        [String]
        ${PolicyOut}
    )

    Process {
        'Creating PSCustomObject: ProxmoxPVE => PVEClusterFirewallOptions' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        if ($Ebtables -and $Ebtables -gt 1) {
          throw "invalid value for 'Ebtables', must be smaller than or equal to 1."
        }

        if ($Ebtables -and $Ebtables -lt 0) {
          throw "invalid value for 'Ebtables', must be greater than or equal to 0."
        }


		 $DisplayNameMapping =@{
			"Enable"="enable"; "PolicyForward"="policy_forward"; "LogRatelimit"="log_ratelimit"; "PolicyIn"="policy_in"; "Ebtables"="ebtables"; "PolicyOut"="policy_out"
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

Convert from JSON to ClusterFirewallOptions<PSCustomObject>

.DESCRIPTION

Convert from JSON to ClusterFirewallOptions<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

ClusterFirewallOptions<PSCustomObject>
#>
function ConvertFrom-PVEJsonToClusterFirewallOptions {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: ProxmoxPVE => PVEClusterFirewallOptions' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PVEClusterFirewallOptions
        $AllProperties = ("enable", "policy_forward", "log_ratelimit", "policy_in", "ebtables", "policy_out")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "enable"))) { #optional property not found
            $Enable = $null
        } else {
            $Enable = $JsonParameters.PSobject.Properties["enable"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "policy_forward"))) { #optional property not found
            $PolicyForward = $null
        } else {
            $PolicyForward = $JsonParameters.PSobject.Properties["policy_forward"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "log_ratelimit"))) { #optional property not found
            $LogRatelimit = $null
        } else {
            $LogRatelimit = $JsonParameters.PSobject.Properties["log_ratelimit"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "policy_in"))) { #optional property not found
            $PolicyIn = $null
        } else {
            $PolicyIn = $JsonParameters.PSobject.Properties["policy_in"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "ebtables"))) { #optional property not found
            $Ebtables = $null
        } else {
            $Ebtables = $JsonParameters.PSobject.Properties["ebtables"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "policy_out"))) { #optional property not found
            $PolicyOut = $null
        } else {
            $PolicyOut = $JsonParameters.PSobject.Properties["policy_out"].value
        }

        $PSO = [PSCustomObject]@{
            "enable" = ${Enable}
            "policy_forward" = ${PolicyForward}
            "log_ratelimit" = ${LogRatelimit}
            "policy_in" = ${PolicyIn}
            "ebtables" = ${Ebtables}
            "policy_out" = ${PolicyOut}
        }

        return $PSO
    }

}

