# NodesLxcStatusCurrent
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Maxdisk** | **Int32** |  | [optional] 
**Diskread** | **Int32** |  | [optional] 
**Ha** | [**SystemCollectionsHashtable**](.md) |  | [optional] 
**Netout** | **Int32** |  | [optional] 
**Cpus** | **Decimal** |  | [optional] 
**Vmid** | **Int32** |  | [optional] 
**Maxmem** | **Int32** |  | [optional] 
**Tags** | **String** |  | [optional] 
**Status** | **String** |  | [optional] 
**Lock** | **String** |  | [optional] 
**Name** | **String** |  | [optional] 
**Template** | **Int32** |  | [optional] 
**Maxswap** | **Int32** |  | [optional] 
**Disk** | **Int32** |  | [optional] 
**Diskwrite** | **Int32** |  | [optional] 
**Uptime** | **Int32** |  | [optional] 
**Netin** | **Int32** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesLxcStatusCurrent = Initialize-PVENodesLxcStatusCurrent  -Maxdisk null `
 -Diskread null `
 -Ha null `
 -Netout null `
 -Cpus null `
 -Vmid null `
 -Maxmem null `
 -Tags null `
 -Status null `
 -Lock null `
 -Name null `
 -Template null `
 -Maxswap null `
 -Disk null `
 -Diskwrite null `
 -Uptime null `
 -Netin null
```

- Convert the resource to JSON
```powershell
$NodesLxcStatusCurrent | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

