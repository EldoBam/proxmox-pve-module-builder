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

.PARAMETER Children
The volumes of the guest with the information if they will be included in backups.
.PARAMETER Id
VMID of the guest.
.PARAMETER Name
Name of the guest
.PARAMETER Type
Type of the guest, VM, CT or unknown for removed but not purged guests.
.OUTPUTS

ClusterBackupIncludedvolumesChildrenInner<PSCustomObject>
#>

function Initialize-PVEClusterBackupIncludedvolumesChildrenInner {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [PSCustomObject[]]
        ${Children},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Id},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Name},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [ValidateSet("qemu", "lxc", "unknown")]
        [String]
        ${Type}
    )

    Process {
        'Creating PSCustomObject: ProxmoxPVE => PVEClusterBackupIncludedvolumesChildrenInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug


		 $DisplayNameMapping =@{
			"Children"="children"; "Id"="id"; "Name"="name"; "Type"="type"
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

Convert from JSON to ClusterBackupIncludedvolumesChildrenInner<PSCustomObject>

.DESCRIPTION

Convert from JSON to ClusterBackupIncludedvolumesChildrenInner<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

ClusterBackupIncludedvolumesChildrenInner<PSCustomObject>
#>
function ConvertFrom-PVEJsonToClusterBackupIncludedvolumesChildrenInner {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: ProxmoxPVE => PVEClusterBackupIncludedvolumesChildrenInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PVEClusterBackupIncludedvolumesChildrenInner
        $AllProperties = ("children", "id", "name", "type")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "children"))) { #optional property not found
            $Children = $null
        } else {
            $Children = $JsonParameters.PSobject.Properties["children"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "id"))) { #optional property not found
            $Id = $null
        } else {
            $Id = $JsonParameters.PSobject.Properties["id"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "name"))) { #optional property not found
            $Name = $null
        } else {
            $Name = $JsonParameters.PSobject.Properties["name"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "type"))) { #optional property not found
            $Type = $null
        } else {
            $Type = $JsonParameters.PSobject.Properties["type"].value
        }

        $PSO = [PSCustomObject]@{
            "children" = ${Children}
            "id" = ${Id}
            "name" = ${Name}
            "type" = ${Type}
        }

        return $PSO
    }

}

