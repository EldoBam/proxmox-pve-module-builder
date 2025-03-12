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

.PARAMETER Prodid
No description available.
.PARAMETER Busnum
No description available.
.PARAMETER Vendid
No description available.
.PARAMETER Level
No description available.
.PARAMETER Usbpath
No description available.
.PARAMETER Product
No description available.
.PARAMETER Port
No description available.
.PARAMETER Serial
No description available.
.PARAMETER Class
No description available.
.PARAMETER Speed
No description available.
.PARAMETER Devnum
No description available.
.PARAMETER Manufacturer
No description available.
.OUTPUTS

NodesHardwareUsbInner<PSCustomObject>
#>

function Initialize-PVENodesHardwareUsbInner {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Prodid},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Busnum},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Vendid},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Level},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Usbpath},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Product},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Port},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Serial},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Class},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Speed},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Int32]]
        ${Devnum},
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Manufacturer}
    )

    Process {
        'Creating PSCustomObject: ProxmoxPVE => PVENodesHardwareUsbInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug


		 $DisplayNameMapping =@{
			"Prodid"="prodid"; "Busnum"="busnum"; "Vendid"="vendid"; "Level"="level"; "Usbpath"="usbpath"; "Product"="product"; "Port"="port"; "Serial"="serial"; "Class"="class"; "Speed"="speed"; "Devnum"="devnum"; "Manufacturer"="manufacturer"
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

Convert from JSON to NodesHardwareUsbInner<PSCustomObject>

.DESCRIPTION

Convert from JSON to NodesHardwareUsbInner<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

NodesHardwareUsbInner<PSCustomObject>
#>
function ConvertFrom-PVEJsonToNodesHardwareUsbInner {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: ProxmoxPVE => PVENodesHardwareUsbInner' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PVENodesHardwareUsbInner
        $AllProperties = ("prodid", "busnum", "vendid", "level", "usbpath", "product", "port", "serial", "class", "speed", "devnum", "manufacturer")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "prodid"))) { #optional property not found
            $Prodid = $null
        } else {
            $Prodid = $JsonParameters.PSobject.Properties["prodid"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "busnum"))) { #optional property not found
            $Busnum = $null
        } else {
            $Busnum = $JsonParameters.PSobject.Properties["busnum"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "vendid"))) { #optional property not found
            $Vendid = $null
        } else {
            $Vendid = $JsonParameters.PSobject.Properties["vendid"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "level"))) { #optional property not found
            $Level = $null
        } else {
            $Level = $JsonParameters.PSobject.Properties["level"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "usbpath"))) { #optional property not found
            $Usbpath = $null
        } else {
            $Usbpath = $JsonParameters.PSobject.Properties["usbpath"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "product"))) { #optional property not found
            $Product = $null
        } else {
            $Product = $JsonParameters.PSobject.Properties["product"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "port"))) { #optional property not found
            $Port = $null
        } else {
            $Port = $JsonParameters.PSobject.Properties["port"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "serial"))) { #optional property not found
            $Serial = $null
        } else {
            $Serial = $JsonParameters.PSobject.Properties["serial"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "class"))) { #optional property not found
            $Class = $null
        } else {
            $Class = $JsonParameters.PSobject.Properties["class"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "speed"))) { #optional property not found
            $Speed = $null
        } else {
            $Speed = $JsonParameters.PSobject.Properties["speed"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "devnum"))) { #optional property not found
            $Devnum = $null
        } else {
            $Devnum = $JsonParameters.PSobject.Properties["devnum"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "manufacturer"))) { #optional property not found
            $Manufacturer = $null
        } else {
            $Manufacturer = $JsonParameters.PSobject.Properties["manufacturer"].value
        }

        $PSO = [PSCustomObject]@{
            "prodid" = ${Prodid}
            "busnum" = ${Busnum}
            "vendid" = ${Vendid}
            "level" = ${Level}
            "usbpath" = ${Usbpath}
            "product" = ${Product}
            "port" = ${Port}
            "serial" = ${Serial}
            "class" = ${Class}
            "speed" = ${Speed}
            "devnum" = ${Devnum}
            "manufacturer" = ${Manufacturer}
        }

        return $PSO
    }

}

