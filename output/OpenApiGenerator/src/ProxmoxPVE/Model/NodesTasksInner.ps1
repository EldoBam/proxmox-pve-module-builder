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

.PARAMETER VarPid
No description available.
.PARAMETER Node
No description available.
.PARAMETER Type
No description available.
.PARAMETER User
No description available.
.PARAMETER Id
No description available.
.PARAMETER Status
No description available.
.PARAMETER Starttime
No description available.
.PARAMETER Upid
No description available.
.PARAMETER Pstart
No description available.
.PARAMETER Endtime
No description available.
.OUTPUTS

NodesTasksInner<PSCustomObject>
#>

function Initialize-PVENodesTasksInner {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${VarPid},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Node},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Type},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${User},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Id},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Status},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Starttime},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Upid},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Pstart},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Endtime}
    )

    Process {
        'Creating PSCustomObject: ProxmoxPVE => PVENodesTasksInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug


		 $DisplayNameMapping =@{
			"VarPid"="pid"; "Node"="node"; "Type"="type"; "User"="user"; "Id"="id"; "Status"="status"; "Starttime"="starttime"; "Upid"="upid"; "Pstart"="pstart"; "Endtime"="endtime"
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

Convert from JSON to NodesTasksInner<PSCustomObject>

.DESCRIPTION

Convert from JSON to NodesTasksInner<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

NodesTasksInner<PSCustomObject>
#>
function ConvertFrom-PVEJsonToNodesTasksInner {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: ProxmoxPVE => PVENodesTasksInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PVENodesTasksInner
        $AllProperties = ("pid", "node", "type", "user", "id", "status", "starttime", "upid", "pstart", "endtime")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "pid"))) { #optional property not found
            $VarPid = $null
        } else {
            $VarPid = $JsonParameters.PSobject.Properties["pid"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "node"))) { #optional property not found
            $Node = $null
        } else {
            $Node = $JsonParameters.PSobject.Properties["node"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "type"))) { #optional property not found
            $Type = $null
        } else {
            $Type = $JsonParameters.PSobject.Properties["type"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "user"))) { #optional property not found
            $User = $null
        } else {
            $User = $JsonParameters.PSobject.Properties["user"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "id"))) { #optional property not found
            $Id = $null
        } else {
            $Id = $JsonParameters.PSobject.Properties["id"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "status"))) { #optional property not found
            $Status = $null
        } else {
            $Status = $JsonParameters.PSobject.Properties["status"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "starttime"))) { #optional property not found
            $Starttime = $null
        } else {
            $Starttime = $JsonParameters.PSobject.Properties["starttime"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "upid"))) { #optional property not found
            $Upid = $null
        } else {
            $Upid = $JsonParameters.PSobject.Properties["upid"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "pstart"))) { #optional property not found
            $Pstart = $null
        } else {
            $Pstart = $JsonParameters.PSobject.Properties["pstart"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "endtime"))) { #optional property not found
            $Endtime = $null
        } else {
            $Endtime = $JsonParameters.PSobject.Properties["endtime"].value
        }

        $PSO = [PSCustomObject]@{
            "pid" = ${VarPid}
            "node" = ${Node}
            "type" = ${Type}
            "user" = ${User}
            "id" = ${Id}
            "status" = ${Status}
            "starttime" = ${Starttime}
            "upid" = ${Upid}
            "pstart" = ${Pstart}
            "endtime" = ${Endtime}
        }

        return $PSO
    }

}

