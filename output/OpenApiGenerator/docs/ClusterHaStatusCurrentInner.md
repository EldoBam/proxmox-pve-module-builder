# ClusterHaStatusCurrentInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Status** | **String** |  | [optional] 
**Timestamp** | **Int32** |  | [optional] 
**MaxRelocate** | **Int32** |  | [optional] 
**Sid** | **String** |  | [optional] 
**RequestState** | **String** |  | [optional] 
**Id** | **String** |  | [optional] 
**Type** | **String** |  | [optional] 
**Quorate** | **Int32** |  | [optional] 
**CrmState** | **String** |  | [optional] 
**MaxRestart** | **Int32** |  | [optional] 
**State** | **String** |  | [optional] 
**Node** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$ClusterHaStatusCurrentInner = Initialize-PVEClusterHaStatusCurrentInner  -Status null `
 -Timestamp null `
 -MaxRelocate null `
 -Sid null `
 -RequestState null `
 -Id null `
 -Type null `
 -Quorate null `
 -CrmState null `
 -MaxRestart null `
 -State null `
 -Node null
```

- Convert the resource to JSON
```powershell
$ClusterHaStatusCurrentInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

