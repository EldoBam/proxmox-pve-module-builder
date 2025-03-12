# NodesStorageInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Avail** | **Int32** |  | [optional] 
**Used** | **Int32** |  | [optional] 
**Type** | **String** |  | [optional] 
**Enabled** | **Int32** |  | [optional] 
**Total** | **Int32** |  | [optional] 
**Shared** | **Int32** |  | [optional] 
**UsedFraction** | **Decimal** |  | [optional] 
**Content** | **String** |  | [optional] 
**Storage** | **String** |  | [optional] 
**Active** | **Int32** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesStorageInner = Initialize-PVENodesStorageInner  -Avail null `
 -Used null `
 -Type null `
 -Enabled null `
 -Total null `
 -Shared null `
 -UsedFraction null `
 -Content null `
 -Storage null `
 -Active null
```

- Convert the resource to JSON
```powershell
$NodesStorageInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

