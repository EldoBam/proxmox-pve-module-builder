# proxmox-pve-module-builder
This project was born to create a Powershell Module to access the Proxmox PVE Api.
The idea is to render an [OpenAPI v3 schema](https://swagger.io/specification/#schema) which can be used to render modules via the [OpenApi Generator](https://openapi-generator.tech/).

# development
The module builder is still under development. Currently we don't have any modules we can use to access local pve apis.
Once we have a working module, it will be published via [PS Gallery](https://www.powershellgallery.com/).

## coding plan
- get api information from [Proxmox VE Api Documentation](https://pve.proxmox.com/pve-docs/api-viewer/)
- render OpenApi v3 schema object
- create PowerShell modules via OpenAPI Generator

## files
- RenderOpenApiJson.ps1

## dependencies and exensions
- [powershell-yaml](https://github.com/cloudbase/powershell-yaml) - neccessary if you want to copy the generated code into swaggereditor
- [Todo Tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree) - VSCode extension to handle todos via comments

## known issues
- schema info in pve api schema missing for the following paths: 
    * /cluster/notifications/targets/{name}
    * /nodes/{node}/storage/{storage}/file-restore