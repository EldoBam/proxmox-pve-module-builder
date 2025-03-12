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

.PARAMETER Nextduedate
No description available.
.PARAMETER Productname
No description available.
.PARAMETER Signature
No description available.
.PARAMETER Level
No description available.
.PARAMETER Message
No description available.
.PARAMETER Sockets
No description available.
.PARAMETER Key
No description available.
.PARAMETER Checktime
No description available.
.PARAMETER Status
No description available.
.PARAMETER Regdate
No description available.
.PARAMETER Url
No description available.
.PARAMETER Serverid
No description available.
.OUTPUTS

NodesSubscription<PSCustomObject>
#>

function Initialize-PVENodesSubscription {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Nextduedate},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Productname},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Signature},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Level},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Message},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Sockets},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Key},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Checktime},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [ValidateSet("new", "notfound", "active", "invalid", "expired", "suspended")]
        [String]
        ${Status},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Regdate},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Url},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Serverid}
    )

    Process {
        'Creating PSCustomObject: ProxmoxPVE => PVENodesSubscription' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug


		 $DisplayNameMapping =@{
			"Nextduedate"="nextduedate"; "Productname"="productname"; "Signature"="signature"; "Level"="level"; "Message"="message"; "Sockets"="sockets"; "Key"="key"; "Checktime"="checktime"; "Status"="status"; "Regdate"="regdate"; "Url"="url"; "Serverid"="serverid"
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

Convert from JSON to NodesSubscription<PSCustomObject>

.DESCRIPTION

Convert from JSON to NodesSubscription<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

NodesSubscription<PSCustomObject>
#>
function ConvertFrom-PVEJsonToNodesSubscription {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: ProxmoxPVE => PVENodesSubscription' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PVENodesSubscription
        $AllProperties = ("nextduedate", "productname", "signature", "level", "message", "sockets", "key", "checktime", "status", "regdate", "url", "serverid")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "nextduedate"))) { #optional property not found
            $Nextduedate = $null
        } else {
            $Nextduedate = $JsonParameters.PSobject.Properties["nextduedate"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "productname"))) { #optional property not found
            $Productname = $null
        } else {
            $Productname = $JsonParameters.PSobject.Properties["productname"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "signature"))) { #optional property not found
            $Signature = $null
        } else {
            $Signature = $JsonParameters.PSobject.Properties["signature"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "level"))) { #optional property not found
            $Level = $null
        } else {
            $Level = $JsonParameters.PSobject.Properties["level"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "message"))) { #optional property not found
            $Message = $null
        } else {
            $Message = $JsonParameters.PSobject.Properties["message"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "sockets"))) { #optional property not found
            $Sockets = $null
        } else {
            $Sockets = $JsonParameters.PSobject.Properties["sockets"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "key"))) { #optional property not found
            $Key = $null
        } else {
            $Key = $JsonParameters.PSobject.Properties["key"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "checktime"))) { #optional property not found
            $Checktime = $null
        } else {
            $Checktime = $JsonParameters.PSobject.Properties["checktime"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "status"))) { #optional property not found
            $Status = $null
        } else {
            $Status = $JsonParameters.PSobject.Properties["status"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "regdate"))) { #optional property not found
            $Regdate = $null
        } else {
            $Regdate = $JsonParameters.PSobject.Properties["regdate"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "url"))) { #optional property not found
            $Url = $null
        } else {
            $Url = $JsonParameters.PSobject.Properties["url"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "serverid"))) { #optional property not found
            $Serverid = $null
        } else {
            $Serverid = $JsonParameters.PSobject.Properties["serverid"].value
        }

        $PSO = [PSCustomObject]@{
            "nextduedate" = ${Nextduedate}
            "productname" = ${Productname}
            "signature" = ${Signature}
            "level" = ${Level}
            "message" = ${Message}
            "sockets" = ${Sockets}
            "key" = ${Key}
            "checktime" = ${Checktime}
            "status" = ${Status}
            "regdate" = ${Regdate}
            "url" = ${Url}
            "serverid" = ${Serverid}
        }

        return $PSO
    }

}

