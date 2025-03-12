# proxmox-pve-module-builder
This project was born to create a Powershell Module to access the Proxmox PVE Api.
The idea is to render an [OpenAPI v3 schema](https://swagger.io/specification/#schema) which can be used to render modules via the [OpenApi Generator](https://openapi-generator.tech/).

# pve-powershell-module
You can find the rendered Powershell Module and it's documentation here: [PVE PowerShell Module](https://github.com/EldoBam/pve-powershell-module)

# development
The module builder is still under development. The first module has been successfully rendered and the first beta release will be published soon.
Once we have a working module, it will be published via [PS Gallery](https://www.powershellgallery.com/).

## coding plan
- get api information from [Proxmox VE Api Documentation](https://pve.proxmox.com/pve-docs/api-viewer/)
- render OpenApi v3 schema object
- create PowerShell modules via OpenAPI Generator

## files
- RenderOpenApiJson.ps1 - *Script to generate an OpenApi description*
- GeneratePowershellCmdlets.ps1 - *Script to generate the PVE Powershell module using OpenAPI Generator and the rendered OpenApi description*
- ./templates/Powershell/*.mustache - Template files for OpenAPI Generator

## dependencies and exensions
- [powershell-yaml](https://github.com/cloudbase/powershell-yaml) - neccessary if you want to copy the generated code into swaggereditor
- [Todo Tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree) - VSCode extension to handle todos via comments
- [openapi-generator-cli.jar](https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/) OpenApi Generator as Java CLI
- [Java JDK](https://www.oracle.com/de/java/technologies/downloads/) - needed to run openapi-generator-cli - need to test it with OpenJDK

## known issues
- schema info in pve api schema missing for the following paths: 
    * /cluster/notifications/targets/{name}
    * /nodes/{node}/storage/{storage}/file-restore