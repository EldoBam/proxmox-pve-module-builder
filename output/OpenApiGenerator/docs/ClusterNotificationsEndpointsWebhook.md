# ClusterNotificationsEndpointsWebhook
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Secret** | **String[]** |  | [optional] 
**Body** | **String** |  | [optional] 
**Disable** | **Int32** |  | [optional] 
**Comment** | **String** |  | [optional] 
**Digest** | **String** |  | [optional] 
**Method** | **String** |  | [optional] 
**Url** | **String** |  | [optional] 
**Name** | **String** |  | [optional] 
**Header** | **String[]** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$ClusterNotificationsEndpointsWebhook = Initialize-PVEClusterNotificationsEndpointsWebhook  -Secret null `
 -Body null `
 -Disable null `
 -Comment null `
 -Digest null `
 -Method null `
 -Url null `
 -Name null `
 -Header null
```

- Convert the resource to JSON
```powershell
$ClusterNotificationsEndpointsWebhook | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

