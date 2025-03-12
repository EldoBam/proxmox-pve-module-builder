# NodesLxcConfig
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Hostname** | **String** |  | [optional] 
**Description** | **String** |  | [optional] 
**Startup** | **String** |  | [optional] 
**Timezone** | **String** |  | [optional] 
**DevN** | **String** |  | [optional] 
**Onboot** | **Int32** |  | [optional] 
**Swap** | **Int32** |  | [optional] 
**Digest** | **String** |  | [optional] 
**Ostype** | **String** |  | [optional] 
**Protection** | **Int32** |  | [optional] 
**Nameserver** | **String** |  | [optional] 
**Cpuunits** | **Int32** |  | [optional] 
**Lock** | **String** |  | [optional] 
**Cpulimit** | **Decimal** |  | [optional] 
**Tags** | **String** |  | [optional] 
**UnusedN** | **String** |  | [optional] 
**Unprivileged** | **Int32** |  | [optional] 
**Rootfs** | **String** |  | [optional] 
**Tty** | **Int32** |  | [optional] 
**NetN** | **String** |  | [optional] 
**Features** | **String** |  | [optional] 
**Cmode** | **String** |  | [optional] 
**MpN** | **String** |  | [optional] 
**Searchdomain** | **String** |  | [optional] 
**Debug** | **Int32** |  | [optional] 
**Hookscript** | **String** |  | [optional] 
**Console** | **Int32** |  | [optional] 
**Lxc** | [**String[][]**](Array.md) |  | [optional] 
**Arch** | **String** |  | [optional] 
**Cores** | **Int32** |  | [optional] 
**Memory** | **Int32** |  | [optional] 
**Template** | **Int32** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesLxcConfig = Initialize-PVENodesLxcConfig  -Hostname null `
 -Description null `
 -Startup null `
 -Timezone null `
 -DevN null `
 -Onboot null `
 -Swap null `
 -Digest null `
 -Ostype null `
 -Protection null `
 -Nameserver null `
 -Cpuunits null `
 -Lock null `
 -Cpulimit null `
 -Tags null `
 -UnusedN null `
 -Unprivileged null `
 -Rootfs null `
 -Tty null `
 -NetN null `
 -Features null `
 -Cmode null `
 -MpN null `
 -Searchdomain null `
 -Debug null `
 -Hookscript null `
 -Console null `
 -Lxc null `
 -Arch null `
 -Cores null `
 -Memory null `
 -Template null
```

- Convert the resource to JSON
```powershell
$NodesLxcConfig | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

