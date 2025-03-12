# ClusterMetricsServerInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Server** | **String** |  | [optional] 
**Type** | **String** |  | [optional] 
**Id** | **String** |  | [optional] 
**Disable** | **Int32** |  | [optional] 
**Port** | **Int32** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$ClusterMetricsServerInner = Initialize-PVEClusterMetricsServerInner  -Server null `
 -Type null `
 -Id null `
 -Disable null `
 -Port null
```

- Convert the resource to JSON
```powershell
$ClusterMetricsServerInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

