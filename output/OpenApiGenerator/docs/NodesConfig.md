# NodesConfig
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Wakeonlan** | **String** |  | [optional] 
**StartallOnbootDelay** | **Int32** |  | [optional] 
**Digest** | **String** |  | [optional] 
**Description** | **String** |  | [optional] 
**AcmedomainN** | **String** |  | [optional] 
**Acme** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesConfig = Initialize-PVENodesConfig  -Wakeonlan null `
 -StartallOnbootDelay null `
 -Digest null `
 -Description null `
 -AcmedomainN null `
 -Acme null
```

- Convert the resource to JSON
```powershell
$NodesConfig | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

