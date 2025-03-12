# NodesTasksStatus
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**User** | **String** |  | [optional] 
**VarPid** | **Int32** |  | [optional] 
**Type** | **String** |  | [optional] 
**Exitstatus** | **String** |  | [optional] 
**Id** | **String** |  | [optional] 
**Status** | **String** |  | [optional] 
**Starttime** | **Int32** |  | [optional] 
**Upid** | **String** |  | [optional] 
**Pstart** | **Int32** |  | [optional] 
**Node** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesTasksStatus = Initialize-PVENodesTasksStatus  -User null `
 -VarPid null `
 -Type null `
 -Exitstatus null `
 -Id null `
 -Status null `
 -Starttime null `
 -Upid null `
 -Pstart null `
 -Node null
```

- Convert the resource to JSON
```powershell
$NodesTasksStatus | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

