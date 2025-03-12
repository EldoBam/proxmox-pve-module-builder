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

.PARAMETER Ugid
No description available.
.PARAMETER Type
No description available.
.PARAMETER Roleid
No description available.
.PARAMETER Path
No description available.
.PARAMETER Propagate
No description available.
.OUTPUTS

AccessAclInner<PSCustomObject>
#>

function Initialize-PVEAccessAclInner {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Ugid},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [ValidateSet("user", "group", "token")]
        [String]
        ${Type},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Roleid},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Path},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Propagate}
    )

    Process {
        'Creating PSCustomObject: ProxmoxPVE => PVEAccessAclInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        if ($Propagate -and $Propagate -gt 1) {
          throw "invalid value for 'Propagate', must be smaller than or equal to 1."
        }

        if ($Propagate -and $Propagate -lt 0) {
          throw "invalid value for 'Propagate', must be greater than or equal to 0."
        }


		 $DisplayNameMapping =@{
			"Ugid"="ugid"; "Type"="type"; "Roleid"="roleid"; "Path"="path"; "Propagate"="propagate"
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

Convert from JSON to AccessAclInner<PSCustomObject>

.DESCRIPTION

Convert from JSON to AccessAclInner<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

AccessAclInner<PSCustomObject>
#>
function ConvertFrom-PVEJsonToAccessAclInner {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: ProxmoxPVE => PVEAccessAclInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PVEAccessAclInner
        $AllProperties = ("ugid", "type", "roleid", "path", "propagate")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "ugid"))) { #optional property not found
            $Ugid = $null
        } else {
            $Ugid = $JsonParameters.PSobject.Properties["ugid"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "type"))) { #optional property not found
            $Type = $null
        } else {
            $Type = $JsonParameters.PSobject.Properties["type"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "roleid"))) { #optional property not found
            $Roleid = $null
        } else {
            $Roleid = $JsonParameters.PSobject.Properties["roleid"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "path"))) { #optional property not found
            $Path = $null
        } else {
            $Path = $JsonParameters.PSobject.Properties["path"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "propagate"))) { #optional property not found
            $Propagate = $null
        } else {
            $Propagate = $JsonParameters.PSobject.Properties["propagate"].value
        }

        $PSO = [PSCustomObject]@{
            "ugid" = ${Ugid}
            "type" = ${Type}
            "roleid" = ${Roleid}
            "path" = ${Path}
            "propagate" = ${Propagate}
        }

        return $PSO
    }

}

