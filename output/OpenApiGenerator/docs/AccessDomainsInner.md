# AccessDomainsInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Comment** | **String** |  | [optional] 
**Tfa** | **String** |  | [optional] 
**Realm** | **String** |  | [optional] 
**Type** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$AccessDomainsInner = Initialize-PVEAccessDomainsInner  -Comment null `
 -Tfa null `
 -Realm null `
 -Type null
```

- Convert the resource to JSON
```powershell
$AccessDomainsInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

