# NodesQemuStatusCurrent
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Maxdisk** | **Int32** |  | [optional] 
**RunningMachine** | **String** |  | [optional] 
**Diskread** | **Int32** |  | [optional] 
**Ha** | [**SystemCollectionsHashtable**](.md) |  | [optional] 
**Netout** | **Int32** |  | [optional] 
**Spice** | **Int32** |  | [optional] 
**Status** | **String** |  | [optional] 
**Cpus** | **Decimal** |  | [optional] 
**Vmid** | **Int32** |  | [optional] 
**Maxmem** | **Int32** |  | [optional] 
**Qmpstatus** | **String** |  | [optional] 
**Clipboard** | **String** |  | [optional] 
**RunningQemu** | **String** |  | [optional] 
**Agent** | **Int32** |  | [optional] 
**Lock** | **String** |  | [optional] 
**Name** | **String** |  | [optional] 
**VarPid** | **Int32** |  | [optional] 
**Template** | **Int32** |  | [optional] 
**Tags** | **String** |  | [optional] 
**Diskwrite** | **Int32** |  | [optional] 
**Uptime** | **Int32** |  | [optional] 
**Netin** | **Int32** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesQemuStatusCurrent = Initialize-PVENodesQemuStatusCurrent  -Maxdisk null `
 -RunningMachine null `
 -Diskread null `
 -Ha null `
 -Netout null `
 -Spice null `
 -Status null `
 -Cpus null `
 -Vmid null `
 -Maxmem null `
 -Qmpstatus null `
 -Clipboard null `
 -RunningQemu null `
 -Agent null `
 -Lock null `
 -Name null `
 -VarPid null `
 -Template null `
 -Tags null `
 -Diskwrite null `
 -Uptime null `
 -Netin null
```

- Convert the resource to JSON
```powershell
$NodesQemuStatusCurrent | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

