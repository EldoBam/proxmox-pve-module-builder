# NodesStorageContent
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Size** | **Int32** |  | [optional] 
**Used** | **Int32** |  | [optional] 
**Format** | **String** |  | [optional] 
**Path** | **String** |  | [optional] 
**Notes** | **String** |  | [optional] 
**Protected** | **Int32** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesStorageContent = Initialize-PVENodesStorageContent  -Size null `
 -Used null `
 -Format null `
 -Path null `
 -Notes null `
 -Protected null
```

- Convert the resource to JSON
```powershell
$NodesStorageContent | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

