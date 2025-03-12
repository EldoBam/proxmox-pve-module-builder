# NodesDisksZfs
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**State** | **String** |  | [optional] 
**Children** | [**NodesDisksZfsChildrenInner[]**](NodesDisksZfsChildrenInner.md) |  | [optional] 
**Scan** | **String** |  | [optional] 
**Status** | **String** |  | [optional] 
**Action** | **String** |  | [optional] 
**Name** | **String** |  | [optional] 
**Errors** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesDisksZfs = Initialize-PVENodesDisksZfs  -State null `
 -Children null `
 -Scan null `
 -Status null `
 -Action null `
 -Name null `
 -Errors null
```

- Convert the resource to JSON
```powershell
$NodesDisksZfs | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

