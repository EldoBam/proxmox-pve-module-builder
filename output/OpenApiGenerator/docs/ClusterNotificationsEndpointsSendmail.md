# ClusterNotificationsEndpointsSendmail
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**MailtoUser** | **String[]** |  | [optional] 
**Author** | **String** |  | [optional] 
**Disable** | **Int32** |  | [optional] 
**FromAddress** | **String** |  | [optional] 
**Digest** | **String** |  | [optional] 
**Mailto** | **String[]** |  | [optional] 
**Name** | **String** |  | [optional] 
**Comment** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$ClusterNotificationsEndpointsSendmail = Initialize-PVEClusterNotificationsEndpointsSendmail  -MailtoUser null `
 -Author null `
 -Disable null `
 -FromAddress null `
 -Digest null `
 -Mailto null `
 -Name null `
 -Comment null
```

- Convert the resource to JSON
```powershell
$ClusterNotificationsEndpointsSendmail | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

