# AccessUsersToken
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Comment** | **String** |  | [optional] 
**Privsep** | **Int32** |  | [optional] 
**Expire** | **Int32** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$AccessUsersToken = Initialize-PVEAccessUsersToken  -Comment null `
 -Privsep null `
 -Expire null
```

- Convert the resource to JSON
```powershell
$AccessUsersToken | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

