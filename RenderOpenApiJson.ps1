<#
 # Render Proxmox VE OpenApi Description
 # A short PowerShell script to generate OpenApi description for Module creation via OpenApi Generator
 # @autor: Timo Wolf <amna.wolf@gmail.com>
 # @version: 0.1
 #>

# call apidoc.js from proxmox, the apidoc.js contains the schema of the api
# this is the point to start at :)
$ApiDescriptionJs = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/proxmox/pve-docs/refs/heads/master/api-viewer/apidata.js" -ContentType "text/javascript"

# damn dirty things :) let's get the json content from variable declaration
$ApiSchema = $ApiDescriptionJs.Content[18..($ApiDescriptionJs.Content.Length - 4)] -join '' | ConvertFrom-Json

# creating mapping table for operationId, what will be used to render the modules
$OperationsMappingTable = @{
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
        foreach ($Child in $Schema.children) {
            # call the function again to go into recursion for all childs
            $ChildPaths = Get-AllPathsRecursiveFromSchema -Schema $Child
            # add them to the PathList
            [void]$PathList.AddRange([array]$ChildPaths)
        }
    }
    # return the path list
    $PathList
}

# function to create an open api path item object
# https://swagger.io/specification/#path-item-object
function New-OpenApiPathItemObject() {
    param (
        [Object[]]
        $Schema
    )
    # creating path item object with summary
    $PathItemObject = @{
        # setting summary to text
        # TODO: improve summary
        # $Schema.text only contains the last part of the path e.g. hardware, firewall, {vmid} or {name}...
        summary = ($Schema.text -replace "{|}|_", "")
    }

    # creating tag for this path, easily take the first art of the path. e.g.: /cluster/backup/{id}/included_volumes => cluster
    # TODO: improve tag handling
    $Tag = $Schema.path.Split('/')[1]

    # iteratiing through the methods and build the operation objects
    # https://swagger.io/specification/#operation-object
    foreach ($Method in (Get-Member -MemberType NoteProperty -InputObject $Schema.info).Name) {
        # creating parameters object
        $ParameterList = [System.Collections.ArrayList]@()

        if ($Schema.info.($Method).parameters.properties) {
            # iterating through the parameters in current method
            foreach ($Parameter in (Get-Member -MemberType NoteProperty -InputObject $Schema.info.($Method).parameters.properties).Name) {
                # only add the path parameters to schema
                if ($Schema.path.Split("/") -contains "{$Parameter}") {
                    [void]$ParameterList.Add([PSCustomObject]@{
                            name        = $Parameter
                            in          = "path"
                            description = $Schema.info.($Method).parameters.properties.($Parameter).description
                            required    = $true
                        })
                }
            }
        }

        # add the current operation object to the path item object
        $PathItemObject[$Method.ToLower()] = [PSCustomObject]@{
            tags        = @($Tag)
            description = $Schema.info.($Method).description
            summary     = $Schema.info.($Method).description
            operationId = $Schema.info.($Method).name
            parameter   = [array]$ParameterList
            responses   = [PSCustomObject]@{
                200 = [PSCustomObject]@{
                    description = ""
                    content     = [PSCustomObject]@{
                        "application/json" = [PSCustomObject]@{
                            schema = ""
                        }
                    }
                }
            }
        }
    }
    # return the object while typecasting it to a PSCustomObject
    [PSCustomObject]$PathItemObject
}

# function to create an object used for components
# need to handle some type of parameters...
function New-ObjectSchemaFromProperties() {
    param (
        [PSCustomObject]
        $PropertiesSchema,
        [ValidateSet("array", "object")]
        [string]
        $type = "object",
        [switch]
        $NonRecursive = $false
    )

    # loop PropertyName from Get-Member
    foreach ($PropertyName in ($PropertiesSchema | Get-Member -MemberType NoteProperty).Name) {
        # get Property from schema
        $Property = $PropertiesSchema.($PropertyName)
        # create Hashtables
        $properties = @{}
        $AddObj = @{}
        # adding supported JSON schema keywords to openapi model
        # https://swagger.io/docs/specification/v3_0/data-models/keywords/
        ('title', 'pattern', 'required', 'enum', 'minimum', 'maximum', 'exclusiveMinimum', 'exclusiveMaximum',
        'multipleOf', 'minLength', 'maxLength', 'minItems', 'maxItems', 'uniqueItems',
        'minProperties', 'maxProperties').ForEach({
                if ($Property.($_)) {
                    $AddObj[$_] = $Property.($_)
                }
            })
        $AddObj["type"] = $Property.type
        switch ($Property.type) {
            # adding string parameter to object
            { $_ -match "string|number|integer" } {
                $properties[$PropertyName] = ([PSCustomObject]$AddObj)
                break
            }
            { $_ -eq "boolean" } {
                $AddObj["type"] = "integer"
                $AddObj["minimum"] = 0
                $AddObj["maximum"] = 1
                $AddObj["format"] = "int32"
                $properties[$PropertyName] = ([PSCustomObject]$AddObj)
                break
            }
            { $_ -match "array" } {
                if ($Property.items) {
                    $AddObj["items"] = (New-ObjectSchemaFromProperties -PropertiesSchema $Property.items -NonRecursive)
                }
                $properties[$PropertyName] = ([PSCustomObject]$AddObj)
                break
            }
            { $_ -match "object" } {
                if ($Property.properties) {
                    $AddObj["properties"] = $Property.properties
                }
                if ($Property.additionalProperties) {
                    $AddObj["properties"] = $Property.additionalProperties.properties
                }
                $properties[$PropertyName] = ([PSCustomObject]$AddObj)
                break
            }
            # adding boolean parameter to the object
            # we must define it as a integer 
            default {
                Write-Warning ("Unhandled Property Type $($_) didn't add it to component object")
                $tmp.Add($Property)
            }
        }
    }

    switch ($type) {
        { $_ -eq "object" } {
            # return object schema
            [PSCustomObject]@{
                type       = "object"
                properties = [PSCustomObject]$properties
            }
            break
        }
        { $_ -eq "array" } {
            # return object schema
            [PSCustomObject]@{
                type  = "array"
                items = [PSCustomObject]@{
                    type       = "object"
                    properties = [PSCustomObject]$properties
                }
            }
            break
        }
        default {
            # TODO: ¯\_(ツ)_/¯ 
        }
    }
}


# putting all recursive paths into a flat list
$AllSchemaPaths = [System.Collections.ArrayList]@()
# the proxmox apidoc.js contains a list of schemas, so we need to get all paths from each schema
foreach ($DocPath in $ApiSchema) {
    [void]$AllSchemaPaths.AddRange([array](Get-AllPathsRecursiveFromSchema -Schema $DocPath))
}

# and sort them by path
$AllSchemaPaths = $AllSchemaPaths | Sort-Object -Property path

# we need to build the operationId for each path. The proxmox api schema provide some, but they're not 
# very consistent in their naming scheme and the names aren't unique :(
foreach ($Path in $AllSchemaPaths) {

    # creating the operation object name
    $OperationObjectName = ""
    # adding each part of the path, which arent variable names
    foreach ($Part in $Path.path.Split('/').Where({ $_ -and $_ -notmatch "{|}" })) {
        # in TitleCase and without under_scores :)
        $OperationObjectName += (Get-Culture).TextInfo.ToTitleCase(($Part -replace "_|-", ''))
    }

    # for the uniqueness of the operationId I've decided to add every path variable to the OperationName as a "ByAnd"-clause.
    # e.g.:
    # path = /access/users/{userid}/token/{tokenid}
    # --> $OperationObjectName = AccessUsersToken
    # --> ByAnd-clause = ByUseridAndTokenid
    # ==> possible operationIds: getAccessUsersTokenByUseridAndTokenid, setAccessUsersTokenByUseridAndTokenid, 
    #                            removeAccessUsersTokenByUseridAndTokenid, newAccessUsersTokenByUseridAndTokenid
    $ByOrAnd = "By"
    foreach ($Part in $Path.path.Split('/').Where({ $_ -match "{|}" }) ) {
        $OperationObjectName += $ByOrAnd + (Get-Culture).TextInfo.ToTitleCase(($Part -replace "{|}|_|-", ""))
        $ByOrAnd = "And"
    }

    # setting the new operationId into the name field, which will be used later.
    if ($Path.info) {
        foreach ($Method in (Get-Member -MemberType NoteProperty -InputObject $Path.info).Name) {
            $Path.info.($Method).name = "{0}{1}" -f $OperationsMappingTable[$Method], $OperationObjectName
        }
    }
    
}

# create openApi paths object
# https://swagger.io/specification/#paths-object
$OpenApiPathsObject = [PSCustomObject]@{}
# adding all the paths to the object
foreach ($SchemaPath in ($AllSchemaPaths.Where({ $_.info }) | Sort-Object -Property path)) {
    $OpenApiPathsObject | Add-Member -MemberType NoteProperty -Name $SchemaPath.path -Value (New-OpenApiPathItemObject -Schema $SchemaPath)
}
$OpenApiPathsObject = [PSCustomObject]$OpenApiPathsObject

# collectiing all objects and putting them into openapi components...
# https://swagger.io/specification/#components-object
# damn hard stuff :) let's just start putting all methods into a flat list, so we can work better on it
$AllMethods = [System.Collections.ArrayList]@()
foreach ($Path in $AllSchemaPaths) {
    if ($Path.info) {
        foreach ($Method in (Get-Member -MemberType NoteProperty -InputObject $Path.info).Name) {
            [void]$AllMethods.Add([PSCustomObject]@{
                    path       = $Path.path
                    method     = $Method
                    schema     = $Path.info.($Method)
                    objectName = ($Path.info.GET.name -replace "^(get|set|new|remove)").Split("By")[0]
                })
        }
    }
}

# the most trickiest and funniest part in this project ᕕ(⌐■_■)ᕗ ♪♬
# first build all schemas unique, the trick behind is first to collect all object schemas from all 
# GET responses and hopefully can use them for the other methods as considered by the OpenAPI specifications. 
# After that we're able to handle the other methods and responses. The proxmox api desciption doesn't use a proper object description
# so it's also neccessary to check if the object with the properties already exists from another path...
# we also don't have the object names from the api schema so we need to compare by properties

<# just some code to do some research on $allProperties while coding
$allProperties = [System.Collections.ArrayList]@()
foreach ($Method in $AllMethods.Where({ $_.method -eq "GET" -and $_.schema.returns.type -eq "object" -and $_.schema.returns.properties })) {
    foreach($PropertyName in ($Method.schema.returns.properties | gm -MemberType NoteProperty).Name){
        [void]$allProperties.Add([PSCustomObject]@{
            PropertyName = $PropertyName
            Property = $method.schema.returns.properties.($PropertyName)
            Path = $Method.path
            Method = $Method.method
            ObjectName = $Method.objectName
        })
    }
}
#>

# PS> ($AllMethods.schema.returns.type | Select -Unique) -join ", "  
# array, null, string, object, boolean, integer, any
# those are the return types to handle let's start with the objects, which have properties
$AllGetObjects = [System.Collections.ArrayList]@()
foreach ($Method in $AllMethods.Where({ $_.method -eq "GET" -and $_.schema.returns.type -eq "object" -and $_.schema.returns.properties })) {
    # adding new object to collection while calling  
    [void]$AllGetObjects.Add([PSCustomObject]@{
            path         = $Method.path
            method       = $Method.method
            objectSchema = (New-ObjectSchemaFromProperties -PropertiesSchema $Method.schema.returns.properties)
            objectName   = "$($Method.objectName)"
        })
}

# next handle arrays
$AllGetArrays = [System.Collections.ArrayList]@()
foreach ($Method in $AllMethods.Where({ $_.method -eq "GET" -and $_.schema.returns.type -eq "array" -and $_.schema.returns.links.href -ne '{subdir}' -and $_.schema.returns.items.properties })) {
    [void]$AllGetArrays.Add([PSCustomObject]@{
            path         = $Method.path
            method       = $Method.method
            objectSchema = (New-ObjectSchemaFromProperties -PropertiesSchema $Method.schema.returns.items.properties -type "array")
            objectName   = "$($Method.objectName)"
        })
}

$AllComponents = [System.Collections.ArrayList]@()
[void]$AllComponents.AddRange($AllGetObjects)
[void]$AllComponents.AddRange($AllGetArrays)

$ComponentsSchemas = @{}
foreach ($Object in ($AllComponents | Sort-Object -Property path)) {
    $OpenApiPathsObject.($object.path).get.responses."200".description = $allSchemaPaths.Where({ $_.path -eq $object.path }).info.GET.description
    $OpenApiPathsObject.($object.path).get.responses."200".content.'application/json'.schema = [PSCustomObject]@{ '$ref' = "#/components/schemas/$($object.objectName)" }
    $ComponentsSchemas[$object.objectName] = $Object.objectSchema
}


$ComponentsObject = [PSCustomObject]@{
    schemas = [PSCustomObject]$ComponentsSchemas
    #responses = 
    #parameters = 
    #examples =
    #requestBodies =
    #headers =
    #securitySchemes =
    #links =
    #callbacks =
    #pathItems =
}



# building open api schema 3.1.1
# https://swagger.io/specification/#schema-1
$OpenApiSchema = [PSCustomObject]@{
    openapi           = "3.1.1"
    info              = [PSCustomObject]@{
        title          = "Proxmox VE Module 1.0"
        summary        = "Module to access Proxmox VE Api"
        description    = "Generated OpenApiDescription to render Modules via OpenapiGenerator"
        termsOfService = ""
        contact        = [PSCustomObject]@{
            name  = "Timo Wolf"
            url   = ""
            email = ""
        }
        version        = "0.1"
        licence        = [PSCustomObject]@{
            name = "Apache 2.0"
            url  = "http://www.apache.org/licenses/LICENSE-2.0.html"
        }
    }
    jsonSchemaDialect = "https://spec.openapis.org/oas/3.1/dialect/base"
    paths             = $OpenApiPathsObject
    components        = $ComponentsObject
    #tags
    #externalDocs
}







## testing area

# https://github.com/cloudbase/powershell-yaml
# copy schema as yaml to clipboard
# https://editor-next.swagger.io/ <-- insert yaml from clipboard to swagger editor for development and testing :)
$OpenApiSchema | ConvertTo-Yaml | Set-Clipboard
$OpenApiSchema | ConvertTo-Yaml | Out-File -FilePath "$($PSScriptRoot)/proxmox_ve_api_oa_3.1.1.yaml"
