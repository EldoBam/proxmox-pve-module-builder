# ClusterFirewallOptions
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Enable** | **Int32** |  | [optional] 
**PolicyForward** | **String** |  | [optional] 
**LogRatelimit** | **String** |  | [optional] 
**PolicyIn** | **String** |  | [optional] 
**Ebtables** | **Int32** |  | [optional] 
**PolicyOut** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$ClusterFirewallOptions = Initialize-PVEClusterFirewallOptions  -Enable null `
 -PolicyForward null `
 -LogRatelimit null `
 -PolicyIn null `
 -Ebtables null `
 -PolicyOut null
```

- Convert the resource to JSON
```powershell
$ClusterFirewallOptions | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

