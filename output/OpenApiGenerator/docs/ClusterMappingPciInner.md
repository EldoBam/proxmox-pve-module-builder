# ClusterMappingPciInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Id** | **String** |  | [optional] 
**Checks** | [**ClusterMappingPciInnerChecksInner[]**](ClusterMappingPciInnerChecksInner.md) |  | [optional] 
**Map** | **String[]** |  | [optional] 
**Description** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$ClusterMappingPciInner = Initialize-PVEClusterMappingPciInner  -Id null `
 -Checks null `
 -Map null `
 -Description null
```

- Convert the resource to JSON
```powershell
$ClusterMappingPciInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

