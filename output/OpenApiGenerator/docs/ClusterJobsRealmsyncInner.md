# ClusterJobsRealmsyncInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Schedule** | **String** |  | [optional] 
**LastRun** | **Int32** |  | [optional] 
**Id** | **String** |  | [optional] 
**Scope** | **String** |  | [optional] 
**Enabled** | **Int32** |  | [optional] 
**Realm** | **String** |  | [optional] 
**NextRun** | **Int32** |  | [optional] 
**Comment** | **String** |  | [optional] 
**RemoveVanished** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$ClusterJobsRealmsyncInner = Initialize-PVEClusterJobsRealmsyncInner  -Schedule null `
 -LastRun null `
 -Id null `
 -Scope null `
 -Enabled null `
 -Realm null `
 -NextRun null `
 -Comment null `
 -RemoveVanished null
```

- Convert the resource to JSON
```powershell
$ClusterJobsRealmsyncInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

