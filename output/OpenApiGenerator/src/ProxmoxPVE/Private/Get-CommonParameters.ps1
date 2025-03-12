#
# Proxmox VE Module 1.0
# Generated OpenApiDescription to render Modules via OpenapiGenerator
# Version: 0.1
# Contact: 
# Generated by OpenAPI Generator: https://openapi-generator.tech
#

<#
.Synopsis
    Helper function to get common parameters (Verbose, Debug, etc.)
.Example
    Get-CommonParameters
#>
function Get-CommonParameters {
    function tmp {
        [CmdletBinding()]
        Param ()
    }

    (Get-Command -Name tmp -CommandType Function).Parameters.Keys
}

<#
.Synopsis
    Helper function to Convert a PSobject from Get functions in a Flat Object hash for Put 
.Example
    Convertto-PVEHash 
#>
function Convertto-PVEHash {
    Param(
        [PSCustomObject]$Obj
    )
    $probs = ($obj | gm -MemberType NoteProperty).name 
    $res = @{}
    foreach ($prob in $probs){
        if($obj.$prob){
            if($obj.$prob -is [PSCustomObject] -or $obj.$prob -is [Array]){
                if($obj.$prob.id){
                    $res.($prob.replace("_","")) = $obj.$prob.id
                }elseif ($obj.$prob.value) {
                    $res.($prob.replace("_","")) = $obj.$prob.value
                }
            }else{
                ($prob.replace("_",""))  = $obj.$prob
            }
        }
    }
    $res
}
