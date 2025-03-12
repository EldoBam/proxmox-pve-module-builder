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

.PARAMETER Comment
No description available.
.PARAMETER Field
No description available.
.PARAMETER Value
No description available.
.OUTPUTS

ClusterNotificationsMatcherfieldvaluesInner<PSCustomObject>
#>

function Initialize-PVEClusterNotificationsMatcherfieldvaluesInner {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Comment},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Field},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Value}
    )

    Process {
        'Creating PSCustomObject: ProxmoxPVE => PVEClusterNotificationsMatcherfieldvaluesInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug


		 $DisplayNameMapping =@{
			"Comment"="comment"; "Field"="field"; "Value"="value"
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

Convert from JSON to ClusterNotificationsMatcherfieldvaluesInner<PSCustomObject>

.DESCRIPTION

Convert from JSON to ClusterNotificationsMatcherfieldvaluesInner<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

ClusterNotificationsMatcherfieldvaluesInner<PSCustomObject>
#>
function ConvertFrom-PVEJsonToClusterNotificationsMatcherfieldvaluesInner {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: ProxmoxPVE => PVEClusterNotificationsMatcherfieldvaluesInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PVEClusterNotificationsMatcherfieldvaluesInner
        $AllProperties = ("comment", "field", "value")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "comment"))) { #optional property not found
            $Comment = $null
        } else {
            $Comment = $JsonParameters.PSobject.Properties["comment"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "field"))) { #optional property not found
            $Field = $null
        } else {
            $Field = $JsonParameters.PSobject.Properties["field"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "value"))) { #optional property not found
            $Value = $null
        } else {
            $Value = $JsonParameters.PSobject.Properties["value"].value
        }

        $PSO = [PSCustomObject]@{
            "comment" = ${Comment}
            "field" = ${Field}
            "value" = ${Value}
        }

        return $PSO
    }

}

