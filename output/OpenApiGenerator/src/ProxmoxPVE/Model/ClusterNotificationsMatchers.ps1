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

.PARAMETER InvertMatch
No description available.
.PARAMETER MatchCalendar
No description available.
.PARAMETER MatchSeverity
No description available.
.PARAMETER Target
No description available.
.PARAMETER MatchField
No description available.
.PARAMETER Disable
No description available.
.PARAMETER Digest
No description available.
.PARAMETER Mode
No description available.
.PARAMETER Name
No description available.
.PARAMETER Comment
No description available.
.OUTPUTS

ClusterNotificationsMatchers<PSCustomObject>
#>

function Initialize-PVEClusterNotificationsMatchers {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${InvertMatch},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String[]]
        ${MatchCalendar},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String[]]
        ${MatchSeverity},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String[]]
        ${Target},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String[]]
        ${MatchField},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Disable},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Digest},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [ValidateSet("all", "any")]
        [String]
        ${Mode},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Name},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Comment}
    )

    Process {
        'Creating PSCustomObject: ProxmoxPVE => PVEClusterNotificationsMatchers' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        if ($InvertMatch -and $InvertMatch -gt 1) {
          throw "invalid value for 'InvertMatch', must be smaller than or equal to 1."
        }

        if ($InvertMatch -and $InvertMatch -lt 0) {
          throw "invalid value for 'InvertMatch', must be greater than or equal to 0."
        }

        if ($Disable -and $Disable -gt 1) {
          throw "invalid value for 'Disable', must be smaller than or equal to 1."
        }

        if ($Disable -and $Disable -lt 0) {
          throw "invalid value for 'Disable', must be greater than or equal to 0."
        }

        if (!$Digest -and $Digest.length -gt 64) {
            throw "invalid value for 'Digest', the character length must be smaller than or equal to 64."
        }


		 $DisplayNameMapping =@{
			"InvertMatch"="invert-match"; "MatchCalendar"="match-calendar"; "MatchSeverity"="match-severity"; "Target"="target"; "MatchField"="match-field"; "Disable"="disable"; "Digest"="digest"; "Mode"="mode"; "Name"="name"; "Comment"="comment"
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

Convert from JSON to ClusterNotificationsMatchers<PSCustomObject>

.DESCRIPTION

Convert from JSON to ClusterNotificationsMatchers<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

ClusterNotificationsMatchers<PSCustomObject>
#>
function ConvertFrom-PVEJsonToClusterNotificationsMatchers {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: ProxmoxPVE => PVEClusterNotificationsMatchers' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PVEClusterNotificationsMatchers
        $AllProperties = ("invert-match", "match-calendar", "match-severity", "target", "match-field", "disable", "digest", "mode", "name", "comment")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "invert-match"))) { #optional property not found
            $InvertMatch = $null
        } else {
            $InvertMatch = $JsonParameters.PSobject.Properties["invert-match"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "match-calendar"))) { #optional property not found
            $MatchCalendar = $null
        } else {
            $MatchCalendar = $JsonParameters.PSobject.Properties["match-calendar"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "match-severity"))) { #optional property not found
            $MatchSeverity = $null
        } else {
            $MatchSeverity = $JsonParameters.PSobject.Properties["match-severity"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "target"))) { #optional property not found
            $Target = $null
        } else {
            $Target = $JsonParameters.PSobject.Properties["target"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "match-field"))) { #optional property not found
            $MatchField = $null
        } else {
            $MatchField = $JsonParameters.PSobject.Properties["match-field"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "disable"))) { #optional property not found
            $Disable = $null
        } else {
            $Disable = $JsonParameters.PSobject.Properties["disable"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "digest"))) { #optional property not found
            $Digest = $null
        } else {
            $Digest = $JsonParameters.PSobject.Properties["digest"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "mode"))) { #optional property not found
            $Mode = $null
        } else {
            $Mode = $JsonParameters.PSobject.Properties["mode"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "name"))) { #optional property not found
            $Name = $null
        } else {
            $Name = $JsonParameters.PSobject.Properties["name"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "comment"))) { #optional property not found
            $Comment = $null
        } else {
            $Comment = $JsonParameters.PSobject.Properties["comment"].value
        }

        $PSO = [PSCustomObject]@{
            "invert-match" = ${InvertMatch}
            "match-calendar" = ${MatchCalendar}
            "match-severity" = ${MatchSeverity}
            "target" = ${Target}
            "match-field" = ${MatchField}
            "disable" = ${Disable}
            "digest" = ${Digest}
            "mode" = ${Mode}
            "name" = ${Name}
            "comment" = ${Comment}
        }

        return $PSO
    }

}

