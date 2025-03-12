# NodesQemuInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Maxdisk** | **Int32** |  | [optional] 
**RunningMachine** | **String** |  | [optional] 
**Diskread** | **Int32** |  | [optional] 
**Netout** | **Int32** |  | [optional] 
**Cpus** | **Decimal** |  | [optional] 
**Vmid** | **Int32** |  | [optional] 
**Maxmem** | **Int32** |  | [optional] 
**Qmpstatus** | **String** |  | [optional] 
**Status** | **String** |  | [optional] 
**RunningQemu** | **String** |  | [optional] 
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
$NodesQemuInner = Initialize-PVENodesQemuInner  -Maxdisk null `
 -RunningMachine null `
 -Diskread null `
 -Netout null `
 -Cpus null `
 -Vmid null `
 -Maxmem null `
 -Qmpstatus null `
 -Status null `
 -RunningQemu null `
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
$NodesQemuInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

