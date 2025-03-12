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

.PARAMETER ErrData
No description available.
.PARAMETER Exitcode
No description available.
.PARAMETER Signal
No description available.
.PARAMETER OutData
No description available.
.PARAMETER OutTruncated
No description available.
.PARAMETER Exited
No description available.
.PARAMETER ErrTruncated
No description available.
.OUTPUTS

NodesQemuAgentExecstatus<PSCustomObject>
#>

function Initialize-PVENodesQemuAgentExecstatus {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${ErrData},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Exitcode},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Signal},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${OutData},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${OutTruncated},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Exited},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${ErrTruncated}
    )

    Process {
        'Creating PSCustomObject: ProxmoxPVE => PVENodesQemuAgentExecstatus' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        if ($OutTruncated -and $OutTruncated -gt 1) {
          throw "invalid value for 'OutTruncated', must be smaller than or equal to 1."
        }

        if ($OutTruncated -and $OutTruncated -lt 0) {
          throw "invalid value for 'OutTruncated', must be greater than or equal to 0."
        }

        if ($Exited -and $Exited -gt 1) {
          throw "invalid value for 'Exited', must be smaller than or equal to 1."
        }

        if ($Exited -and $Exited -lt 0) {
          throw "invalid value for 'Exited', must be greater than or equal to 0."
        }

        if ($ErrTruncated -and $ErrTruncated -gt 1) {
          throw "invalid value for 'ErrTruncated', must be smaller than or equal to 1."
        }

        if ($ErrTruncated -and $ErrTruncated -lt 0) {
          throw "invalid value for 'ErrTruncated', must be greater than or equal to 0."
        }


		 $DisplayNameMapping =@{
			"ErrData"="err-data"; "Exitcode"="exitcode"; "Signal"="signal"; "OutData"="out-data"; "OutTruncated"="out-truncated"; "Exited"="exited"; "ErrTruncated"="err-truncated"
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

Convert from JSON to NodesQemuAgentExecstatus<PSCustomObject>

.DESCRIPTION

Convert from JSON to NodesQemuAgentExecstatus<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

NodesQemuAgentExecstatus<PSCustomObject>
#>
function ConvertFrom-PVEJsonToNodesQemuAgentExecstatus {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: ProxmoxPVE => PVENodesQemuAgentExecstatus' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PVENodesQemuAgentExecstatus
        $AllProperties = ("err-data", "exitcode", "signal", "out-data", "out-truncated", "exited", "err-truncated")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "err-data"))) { #optional property not found
            $ErrData = $null
        } else {
            $ErrData = $JsonParameters.PSobject.Properties["err-data"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "exitcode"))) { #optional property not found
            $Exitcode = $null
        } else {
            $Exitcode = $JsonParameters.PSobject.Properties["exitcode"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "signal"))) { #optional property not found
            $Signal = $null
        } else {
            $Signal = $JsonParameters.PSobject.Properties["signal"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "out-data"))) { #optional property not found
            $OutData = $null
        } else {
            $OutData = $JsonParameters.PSobject.Properties["out-data"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "out-truncated"))) { #optional property not found
            $OutTruncated = $null
        } else {
            $OutTruncated = $JsonParameters.PSobject.Properties["out-truncated"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "exited"))) { #optional property not found
            $Exited = $null
        } else {
            $Exited = $JsonParameters.PSobject.Properties["exited"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "err-truncated"))) { #optional property not found
            $ErrTruncated = $null
        } else {
            $ErrTruncated = $JsonParameters.PSobject.Properties["err-truncated"].value
        }

        $PSO = [PSCustomObject]@{
            "err-data" = ${ErrData}
            "exitcode" = ${Exitcode}
            "signal" = ${Signal}
            "out-data" = ${OutData}
            "out-truncated" = ${OutTruncated}
            "exited" = ${Exited}
            "err-truncated" = ${ErrTruncated}
        }

        return $PSO
    }

}

