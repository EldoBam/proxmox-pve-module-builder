# NodesTasksInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**VarPid** | **Int32** |  | [optional] 
**Node** | **String** |  | [optional] 
**Type** | **String** |  | [optional] 
**User** | **String** |  | [optional] 
**Id** | **String** |  | [optional] 
**Status** | **String** |  | [optional] 
**Starttime** | **Int32** |  | [optional] 
**Upid** | **String** |  | [optional] 
**Pstart** | **Int32** |  | [optional] 
**Endtime** | **Int32** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesTasksInner = Initialize-PVENodesTasksInner  -VarPid null `
 -Node null `
 -Type null `
 -User null `
 -Id null `
 -Status null `
 -Starttime null `
 -Upid null `
 -Pstart null `
 -Endtime null
```

- Convert the resource to JSON
```powershell
$NodesTasksInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

