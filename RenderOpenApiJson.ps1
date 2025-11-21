<#
 # Render Proxmox VE OpenApi Description
 # A short PowerShell script to generate OpenApi description for Module creation via OpenApi Generator
 # @autor: Timo Wolf <mail@timo-wolf.de>
 # @version: 0.7
 #>

# call apidoc.js from proxmox, the apidoc.js contains the schema of the api
# this is the point to start at :)
$ApiDescriptionJs = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/proxmox/pve-docs/refs/heads/master/api-viewer/apidata.js" -ContentType "text/javascript"

# call the changelog for the PVE version the docs have been created for
$ApiChangeLog = Invoke-WebRequest -Uri "https://github.com/proxmox/pve-docs/raw/refs/heads/master/debian/changelog"
# get the pve version from the first line starting with "pve-docs" an split the hell out out of the rest of the sting to get the version
# pve-docs (8.4.0) bookworm; urgency=medium

$PVEVersion = $ApiChangeLog.Content.Split("`n`n").Where({ $_.StartsWith('pve-docs') })[0].Split("(")[1].Split(")")[0]

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

    # creating tag for this path, easily take the first two parts of the path. e.g.: /cluster/backup/{id}/included_volumes => cluster,backup
    # update on tags: tried to add a second tag, but nested grouping isn't supported for swagger
    $Tag = @($Schema.path.Split('/')[1])

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
                            schema      = ($Schema.info.($Method).parameters.properties.($Parameter) | Select-Object -Property type,format)
                        })
                }
            }
        }

        # create the current operation object to the path item object
        $PathAddObj = @{
            tags        = [array]$Tag
            description = $Schema.info.($Method).description
            summary     = $Schema.info.($Method).description
            operationId = $Schema.info.($Method).name
            responses   = ""
        }

        # add parameter if there are some
        if ($ParameterList) {
            $PathAddObj["parameters"] = [array]$ParameterList
        }

        # add empty requestBody if parametercount is greater than path parameters, will fill them later on
        if ($Schema.info.($Method).parameters.properties -and (Get-Member -MemberType NoteProperty -InputObject $Schema.info.($Method).parameters.properties).Count -gt $ParameterList.Count) {
            $PathAddObj["requestBody"] = ""
        }

        $PathItemObject[$Method.ToLower()] = [PSCustomObject]$PathAddObj
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
        [array]
        $SkipProperties = @(),
        [ValidateSet("array", "object")]
        [string]
        $type = "object"
    )

    # create properties hashtable
    $properties = @{}
    # loop PropertyName from Get-Member
    foreach ($PropertyName in ($PropertiesSchema | Get-Member -MemberType NoteProperty).Name) {
        if($PropertyName -in $SkipProperties){
            continue
        }
        # get Property from schema
        $Property = $PropertiesSchema.($PropertyName)
        # creating a hashtable which we will add to the properties hashtable
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
        # fixing lost types :)
        if (!$Property.type) {
            if ($Property.enum) {
                $Property | Add-Member -MemberType NoteProperty -Name "type" -Value "string"
            }
            # TODO: dirty hack, need to fix this
            if ($Property.description -eq "A list of errors when 'check_node' is given.") {
                $Property | Add-Member -MemberType NoteProperty -Name "type" -Value "array"
            }
            # TODO: dirty hack, need to fix this
            if ($Property.description -match "The name \(ID\) for the M(DS|GR)") {
                $Property | Add-Member -MemberType NoteProperty -Name "type" -Value "string"
            }
        }
        switch ($Property.type) {
            # adding string parameter to object
            { $_ -eq "string" } {
                if ($Property.enum) {
                    $AddObj["enum"] = $Property.enum
                }
                $properties[$PropertyName] = ([PSCustomObject]$AddObj)
                break
            }
            # adding numbers and integer
            { $_ -match "number|integer" } {
                $properties[$PropertyName] = ([PSCustomObject]$AddObj)
                break
            }
            # we need to transform the pve boolean into an integer,
            # because proxmox boolean returns 1 or 0
            # https://swagger.io/docs/specification/v3_0/data-models/data-types/#boolean
            # "type: boolean represents two values: true and false. Note that truthy and 
            # falsy values such as “true”, "", 0 or null are not considered boolean values."
            { $_ -eq "boolean" } {
                $AddObj["type"] = "boolean"
                #$AddObj["minimum"] = 0
                #$AddObj["maximum"] = 1
                #$AddObj["format"] = "int32"
                $properties[$PropertyName] = ([PSCustomObject]$AddObj)
                break
            }
            { $_ -match "array" } {
                $AddObj["items"] = $Property.items
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
                Write-Warning ("Unhandled Property Type $($_) didn't add it to component object - $($NonRecursive)")
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

# short function to extract the path parameters
function Get-ParameterFromPath(){
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]
        $Path
    )
    return ([regex]"\{([A-Za-z]{0,40})\}").Matches($Path).Groups.Value.Where({ $_ -notlike "{*" })
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
                    objectName = ($Path.info.($Method).name -replace "^(get|set|new|remove)").Split("By")[0]
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
$AllProperties = [System.Collections.ArrayList]@()
foreach ($Method in $AllMethods.Where({ $_.method -eq "GET" -and $_.schema.returns.type -eq "object" -and $_.schema.returns.properties })) {
    foreach($PropertyName in ($Method.schema.returns.properties | gm -MemberType NoteProperty).Name){
        [void]$AllProperties.Add([PSCustomObject]@{
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
# putting all components into one collection
$AllComponents = [System.Collections.ArrayList]@()

foreach ($Method in $AllMethods.Where({ $_.schema.returns.type -eq "object" -and $_.schema.returns.properties })) {
    if ($AllComponents.Where({ $_.objectName -eq $Method.objectName }).Count) {
        $ObjectName = "$($Method.ObjectName)-$($Method.method)"
    }
    else {
        $ObjectName = $Method.objectName
    }
    # need to remove the path parameter from the object in a DELETE request
    # create var SkipParameter
    $SkipProperties = @()
    if($Method.method -eq "DELETE"){
        $SkipProperties = Get-ParameterFromPath -Path $Method.path
    }

    # adding new object to collection while calling  
    [void]$AllComponents.Add([PSCustomObject]@{
            path         = $Method.path
            method       = $Method.method
            objectSchema = (New-ObjectSchemaFromProperties -PropertiesSchema $Method.schema.returns.properties -SkipProperties $SkipProperties)
            objectName   = $ObjectName
        })
}

# next handle arrays
foreach ($Method in $AllMethods.Where({ $_.schema.returns.type -eq "array" -and $_.schema.returns.links.href -ne '{subdir}' -and $_.schema.returns.items.properties })) {
    if ($AllComponents.Where({ $_.objectName -eq $Method.objectName }).Count) {
        $ObjectName = "$($Method.ObjectName)-$($Method.method)"
    }
    else {
        $ObjectName = $Method.objectName
    }
    # need to remove the path parameter from the object in a DELETE request
    # create var SkipParameter
    $SkipProperties = @()
    if($Method.method -eq "DELETE"){
        $SkipProperties = Get-ParameterFromPath -Path $Method.path
    }
    [void]$AllComponents.Add([PSCustomObject]@{
            path         = $Method.path
            method       = $Method.method
            objectSchema = (New-ObjectSchemaFromProperties -PropertiesSchema $Method.schema.returns.items.properties -type "array" -SkipProperties $SkipProperties)
            objectName   = "$($ObjectName)"
        })
}

# strings
foreach ($Method in $AllMethods.Where({ $_.schema.returns.type -eq "string" })) {
    if ($AllComponents.Where({ $_.objectName -eq $Method.objectName }).Count) {
        $ObjectName = "$($Method.ObjectName)-$($Method.method)"
    }
    else {
        $ObjectName = $Method.objectName
    }

    $ObjectSchema = @{
        type = "string"
    }
    if ($Method.schema.returns.desciption) {
        $ObjectSchema["description"] = $Method.schema.returns.desciption
    }
    [void]$AllComponents.Add([PSCustomObject]@{
            path         = $Method.path
            method       = $Method.method
            objectSchema = [PSCustomObject]$description
            objectName   = $ObjectName
        })
}

# booleans
foreach ($Method in $AllMethods.Where({ $_.schema.returns.type -eq "boolean" })) {
    if ($AllComponents.Where({ $_.objectName -eq $Method.objectName }).Count) {
        $ObjectName = "$($Method.ObjectName)-$($Method.method)"
    }
    else {
        $ObjectName = $Method.objectName
    }

    [void]$AllComponents.Add([PSCustomObject]@{
            path         = $Method.path
            method       = $Method.method
            objectSchema = [PSCustomObject]@{
                type        = "integer"
                minimum     = 0
                maximum     = 1
                description = $Method.schema.returns.desciption
            }
            objectName   = $ObjectName
        })
}

# integer
foreach ($Method in $AllMethods.Where({ $_.schema.returns.type -eq "integer" })) {
    if ($AllComponents.Where({ $_.objectName -eq $Method.objectName }).Count) {
        $ObjectName = "$($Method.ObjectName)-$($Method.method)"
    }
    else {
        $ObjectName = $Method.objectName
    }

    $objectSchema = @{
        type       = "integer"
        desciption = $Method.schema.returns.desciption
    }

    if ($Method.schema.returns.minimum) {
        $objectSchema["minimum"] = $objectSchema
    }

    if ($Method.schema.returns.maximum) {
        $objectSchema["maximum"] = $objectSchema
    }

    [void]$AllComponents.Add([PSCustomObject]@{
            path         = $Method.path
            method       = $Method.method
            objectSchema = [PSCustomObject]$objectSchema
            objectName   = "$($ObjectName)"
        })
}

# any :) there is exact one endpoint returning any.
# The description says "Extract a file or directory (as zip archive) from a PBS backup."
# Hopefully it will work as a string Ook!
# https://swagger.io/docs/specification/v3_0/data-models/data-types/#files  <-- I'm not joking.
foreach ($Method in $AllMethods.Where({ $_.schema.returns.type -eq "any" })) {
    if ($AllComponents.Where({ $_.objectName -eq $Method.objectName }).Count) {
        $ObjectName = "$($Method.ObjectName)-$($Method.method)"
    }
    else {
        $ObjectName = $Method.objectName
    }

    [void]$AllComponents.Add([PSCustomObject]@{
            path         = $Method.path
            method       = $Method.method
            objectSchema = [PSCustomObject]@{
                type   = "string"
                format = "binary"
            }
            objectName   = "$($ObjectName)"
        })
}

# creating OpenApi component schema
# and adding $ref to reponses to the according path objects
$ComponentsSchemas = @{}
foreach ($Object in ($AllComponents | Sort-Object -Property path)) {
    switch ($Object.objectSchema.type) {
        { $_ -match "object|string|integer" } {
            $OpenApiPathsObject.($Object.path).($Object.method).responses = [PSCustomObject]@{
                200 = [PSCustomObject]@{
                    description = "OK"
                    content     = [PSCustomObject]@{
                        "application/json" = [PSCustomObject]@{
                            schema = [PSCustomObject]@{ '$ref' = "#/components/schemas/$($Object.objectName)" }
                        }
                    }
                }
            }
            $ComponentsSchemas[$Object.objectName] = $Object.objectSchema
            break
        }
        { $_ -eq "array" } {
            if ($ComponentsSchemas[$object.objectName]) {
                $ObjectName = "$($Object.objectName)-AV" # AV = array view
            }
            else {
                $ObjectName = $Object.objectName
            }
            $OpenApiPathsObject.($Object.path).($Object.method).responses = [PSCustomObject]@{
                200 = [PSCustomObject]@{
                    description = "OK"
                    content     = [PSCustomObject]@{
                        "application/json" = [PSCustomObject]@{
                            schema = [PSCustomObject]@{ '$ref' = "#/components/schemas/$($ObjectName)" }
                        }
                    }
                }
            }
            $ComponentsSchemas[$ObjectName] = $Object.objectSchema
            break
        }
    }
}

# handling return null
foreach ($Method in $AllMethods.Where({ $_.schema.returns.type -eq "null" })) {
    $OpenApiPathsObject.($Method.path).($Method.method).responses = [PSCustomObject]@{ 
        200 = [PSCustomObject]@{
            description = "OK"
        }
    }
}

# now creating the requestbodies and add them to components and paths object
foreach ($Method in $AllMethods.Where({ $_.schema.parameters.properties })) {
    # skip if there are only path parameters
    if (([regex]"\{").Matches($Method.path).Count -ge (Get-Member -InputObject $Method.schema.parameters.properties -MemberType NoteProperty).Count) {
        continue
    }

    # a bit messy :) let's look afterwards if we can remove dpulicates
    $ObjectName = "$($Method.method)-$($Method.objectName)-RB"
    if ($AllComponents.Where({ $_.objectName -eq $ObjectName }).Count) {
        $ComponentsSchemas[$ObjectName] = "$($Method.method)-$ObjectName"
    }
    $ComponentsSchemas[$ObjectName] = New-ObjectSchemaFromProperties -PropertiesSchema $Method.schema.parameters.properties -SkipProperties (Get-ParameterFromPath -Path $Method.path)
    
    $requestBodySchema = @{
        content = [PSCustomObject]@{
            "application/json" = [PSCustomObject]@{
                schema = [PSCustomObject]@{ '$ref' = "#/components/schemas/$($ObjectName)" }
            }
        }
    }
    if ($Method.schema.description) {
        $requestBodySchema["description"] = $Method.schema.description
    }
    $OpenApiPathsObject.($Method.path).($Method.method).requestBody = [PSCustomObject]$requestBodySchema
    # TODO: check the required property
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
        title          = "Proxmox PowerShell VE"
        summary        = "Module to manage proxmox instances via api"
        description    = "Generated module to access all Proxmox VE Api Endpoints. This module has been generated from the proxmox api description v. $PVEVersion"
        termsOfService = ""
        contact        = [PSCustomObject]@{
            name  = "Timo Wolf"
            url   = "https://timo-wolf.de"
            email = "mail@timo-wolf.de"
        }
        version        = $PVEVersion
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


# damn it, need to do some cleanup afterwards until the generator is finished.
$OpenApiSchema.components.schemas.AccessUsers.properties.tokens.properties.expire.PSObject.Properties.Remove("default")
$OpenApiSchema.components.schemas.'AccessUsers-GET'.items.properties.tokens.items.properties.expire.PSObject.Properties.Remove("default")
$OpenApiSchema.components.schemas.'AccessUsersToken-POST'.properties.info.properties.expire.PSObject.Properties.Remove("default")

$OpenApiSchema | ConvertTo-Json -Depth 20 | Out-File -FilePath "$($PSScriptRoot)\output\proxmox_ve_api_oa_3.1.1.json" -Encoding utf8
## testing area

# https://github.com/cloudbase/powershell-yaml
# copy schema as yaml to clipboard
# https://editor-next.swagger.io/ <-- insert yaml from clipboard to swagger editor for development and testing :)
$OpenApiSchema | ConvertTo-Yaml | Set-Clipboard
$OpenApiSchema | ConvertTo-Yaml | Out-File -FilePath "$($PSScriptRoot)\output\proxmox_ve_api_oa_3.1.1.yaml" -Encoding utf8

