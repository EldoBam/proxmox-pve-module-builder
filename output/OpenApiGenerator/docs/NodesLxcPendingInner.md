# NodesLxcPendingInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Pending** | **String** |  | [optional] 
**Value** | **String** |  | [optional] 
**Delete** | **Int32** |  | [optional] 
**Key** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesLxcPendingInner = Initialize-PVENodesLxcPendingInner  -Pending null `
 -Value null `
 -Delete null `
 -Key null
```

- Convert the resource to JSON
```powershell
$NodesLxcPendingInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

