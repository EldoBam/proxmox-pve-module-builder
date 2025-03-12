# ClusterHaResources
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**MaxRelocate** | **Int32** |  | [optional] 
**Sid** | **String** |  | [optional] 
**State** | **String** |  | [optional] 
**Digest** | **String** |  | [optional] 
**Type** | **String** |  | [optional] 
**Group** | **String** |  | [optional] 
**MaxRestart** | **Int32** |  | [optional] 
**Comment** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$ClusterHaResources = Initialize-PVEClusterHaResources  -MaxRelocate null `
 -Sid null `
 -State null `
 -Digest null `
 -Type null `
 -Group null `
 -MaxRestart null `
 -Comment null
```

- Convert the resource to JSON
```powershell
$ClusterHaResources | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

