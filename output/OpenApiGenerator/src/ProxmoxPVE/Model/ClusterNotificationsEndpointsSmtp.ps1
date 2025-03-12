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

.PARAMETER MailtoUser
No description available.
.PARAMETER Username
No description available.
.PARAMETER Author
No description available.
.PARAMETER Port
No description available.
.PARAMETER Disable
No description available.
.PARAMETER FromAddress
No description available.
.PARAMETER Digest
No description available.
.PARAMETER Mode
No description available.
.PARAMETER Mailto
No description available.
.PARAMETER Server
No description available.
.PARAMETER Name
No description available.
.PARAMETER Comment
No description available.
.OUTPUTS

ClusterNotificationsEndpointsSmtp<PSCustomObject>
#>

function Initialize-PVEClusterNotificationsEndpointsSmtp {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String[]]
        ${MailtoUser},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Username},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Author},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Port},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Disable},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${FromAddress},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Digest},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [ValidateSet("insecure", "starttls", "tls")]
        [String]
        ${Mode},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String[]]
        ${Mailto},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Server},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Name},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Comment}
    )

    Process {
        'Creating PSCustomObject: ProxmoxPVE => PVEClusterNotificationsEndpointsSmtp' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

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
			"MailtoUser"="mailto-user"; "Username"="username"; "Author"="author"; "Port"="port"; "Disable"="disable"; "FromAddress"="from-address"; "Digest"="digest"; "Mode"="mode"; "Mailto"="mailto"; "Server"="server"; "Name"="name"; "Comment"="comment"
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

Convert from JSON to ClusterNotificationsEndpointsSmtp<PSCustomObject>

.DESCRIPTION

Convert from JSON to ClusterNotificationsEndpointsSmtp<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

ClusterNotificationsEndpointsSmtp<PSCustomObject>
#>
function ConvertFrom-PVEJsonToClusterNotificationsEndpointsSmtp {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: ProxmoxPVE => PVEClusterNotificationsEndpointsSmtp' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PVEClusterNotificationsEndpointsSmtp
        $AllProperties = ("mailto-user", "username", "author", "port", "disable", "from-address", "digest", "mode", "mailto", "server", "name", "comment")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "mailto-user"))) { #optional property not found
            $MailtoUser = $null
        } else {
            $MailtoUser = $JsonParameters.PSobject.Properties["mailto-user"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "username"))) { #optional property not found
            $Username = $null
        } else {
            $Username = $JsonParameters.PSobject.Properties["username"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "author"))) { #optional property not found
            $Author = $null
        } else {
            $Author = $JsonParameters.PSobject.Properties["author"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "port"))) { #optional property not found
            $Port = $null
        } else {
            $Port = $JsonParameters.PSobject.Properties["port"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "disable"))) { #optional property not found
            $Disable = $null
        } else {
            $Disable = $JsonParameters.PSobject.Properties["disable"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "from-address"))) { #optional property not found
            $FromAddress = $null
        } else {
            $FromAddress = $JsonParameters.PSobject.Properties["from-address"].value
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

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "mailto"))) { #optional property not found
            $Mailto = $null
        } else {
            $Mailto = $JsonParameters.PSobject.Properties["mailto"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "server"))) { #optional property not found
            $Server = $null
        } else {
            $Server = $JsonParameters.PSobject.Properties["server"].value
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
            "mailto-user" = ${MailtoUser}
            "username" = ${Username}
            "author" = ${Author}
            "port" = ${Port}
            "disable" = ${Disable}
            "from-address" = ${FromAddress}
            "digest" = ${Digest}
            "mode" = ${Mode}
            "mailto" = ${Mailto}
            "server" = ${Server}
            "name" = ${Name}
            "comment" = ${Comment}
        }

        return $PSO
    }

}

