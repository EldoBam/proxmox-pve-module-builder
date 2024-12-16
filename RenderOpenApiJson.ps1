<#
 # Render Proxmox VE OpenApi Description
 # A short PowerShell script to generate OpenApi description for Module creation via OpenApi Generator
 # @autor: Timo Wolf <amna.wolf@gmail.com>
 # @version: 0.1
 #>

# call apidoc.js from proxmox, the apidoc.js contains the schema of the api
# this is the point to start at :)
$apiDescriptionJs = Invoke-WebRequest -Uri "https://pve.proxmox.com/pve-docs/api-viewer/apidoc.js" -ContentType "text/javascript"
# damn dirty things :) let's get the json content from variable declaration, I hope proxmox won't change this.
$apiSchema = $apiDescriptionJs.Content[18..($apiDescriptionJs.Content.IndexOf("let method2cmd = {") - 4)] -join '' | ConvertFrom-Json

# creating mapping table for operationId, what will be used to render the modules
$operationsMappingTable = @{
    GET    = "get"
    PUT    = "set"
    POST   = "new"
    DELETE = "remove"
}

# recursive function to get all paths from ProxMox api schema
function Get-AllPathsRecursiveFromSchema {
    param (
        [Object[]]
        $Schema
    )

    # creating an ArrayList where all the paths are stored flat
    $PathList = [System.Collections.ArrayList]@()
    # put the object into the pathlist and exclude the children property
    [void]$PathList.Add(($Schema | Select-Object -ExcludeProperty children))

    # check if there are children
    if ($Schema.children) {
        # iterate through them
        foreach ($child in $Schema.children) {
            # call the function again to go into recursion for all childs
            $childPaths = Get-AllPathsRecursiveFromSchema -Schema $child
            # add them to the PathList
            [void]$PathList.AddRange([array]$childPaths)
        }
    }
    # return the path list
    $PathList
}

# function to create a openApi path object
# https://swagger.io/specification/#path-item-object
function Get-PathObjectFromSchema {
    param (
        [Object[]]
        $Schema
    )
    # creating PSCustomObject
    $PathObject = [PSCustomObject]@{}

    # create the path object foreach
    # iterate through the note properties
    foreach ($info in ($Schema.info | Get-Member -MemberType NoteProperty).Name) {
        $OperationObject = [PSCustomObject]@{
            tags         = $Schema.path.Split('/')[0]
            description  = $Schema.info.($info).description
            externalDocs = "#TODO: implement"
            operationId  = $Schema.info.($info).name
        }
        $PathObject | Add-Member -MemberType NoteProperty -Name 
    }
}

# function to create an open api path item object
# https://swagger.io/specification/#path-item-object
function New-OpenApiPathItemObject() {
    param (
        [Object[]]
        $Schema
    )
    $PathItemObject = [PSCustomObject]@{
        summary = ($Schema.text  -replace "{|}|_","")
    }
    foreach ($method in (Get-Member -MemberType NoteProperty -InputObject $Schema.info).Name) {
        $AddObject = [PSCustomObject]@{
            description = $Schema.info.($method).description
            operationId = $Schema.info.($method).name
        }
        $PathItemObject | Add-Member -MemberType NoteProperty -Name $method.ToLower() -Value $AddObject
    }
    $PathItemObject
}

# putting all recursive paths into a flat list
$AllSchemaPaths = [System.Collections.ArrayList]@()
foreach ($DocPath in $ApiSchema) {
    [void]$AllSchemaPaths.AddRange([array](Get-AllPathsRecursiveFromSchema -Schema $DocPath))
}

# and sort them by path
$AllSchemaPaths = $AllSchemaPaths | Sort-Object -Property path

# the most trickiest and funniest part in this project :)
# we need to build the operationId for each path. The proxmox api schema provide some, but they're not 
# very consistent in their naming scheme and the names aren't unique :(
foreach ($Path in $AllSchemaPaths) {

    # creating the operation object name
    $OperationObjectName = ""
    foreach($Part in $Path.path.Split('/').Where({ $_ -and $_ -notmatch "{|}" })){
        $OperationObjectName += (Get-Culture).TextInfo.ToTitleCase($Part.Replace('_',''))
    }

    $ByOrAnd = "By"
    foreach($Part in $Path.path.Split('/').Where({ $_ -match "{|}" }) ){
        $OperationObjectName += $ByOrAnd + (Get-Culture).TextInfo.ToTitleCase(($Part -replace "{|}|_",""))
        $ByOrAnd = "And"
    }

    foreach($Method in (Get-Member -MemberType NoteProperty -InputObject $Path.info).Name){
        $Path.info.($Method).name = "{0}{1}" -f $operationsMappingTable[$Method],$OperationObjectName
    }
    
}

# create openApi paths object
# https://swagger.io/specification/#paths-object
$OpenApiPathsObject = [PSCustomObject]@{}
foreach ($SchemaPath in ($AllSchemaPaths | Sort-Object -Property path)) {
    $OpenApiPathsObject | Add-Member -MemberType NoteProperty -Name $SchemaPath.path -Value (New-OpenApiPathItemObject -Schema $SchemaPath)
}

$OpenApiSchema = [PSCustomObject]@{
    openapi = "3.1.1"
    info    = [PSCustomObject]@{
        title          = "Proxmox VE Module 1.0"
        summary        = "Module to access Proxmox VE Api"
        description    = "Generated OpenApiDescription to render Modules via OpenapiGenerator"
        termsOfService = ""
        contact        = [PSCustomObject]@{
            name  = ""
            url   = ""
            email = ""
        }
        version = "0.1"
        #licence        = [PSCustomObject]@{
        #    name       = ""
        #    identifier = ""
        #}
    }
    paths          = $openApiPathsObject
    #components     = 
    #tags
    #externalDocs
}







## testing area

# https://github.com/cloudbase/powershell-yaml
# copy schema as yaml to clipboard
# https://editor-next.swagger.io/ <-- insert yaml from clipboard to swagger editor for development and testing :)
$openApiSchema | ConvertTo-Yaml | Set-Clipboard

