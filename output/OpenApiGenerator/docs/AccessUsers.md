# AccessUsers
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Email** | **String** |  | [optional] 
**Firstname** | **String** |  | [optional] 
**Groups** | **String[]** |  | [optional] 
**Tokens** | [**AccessUsersTokens**](AccessUsersTokens.md) |  | [optional] 
**Keys** | **String** |  | [optional] 
**Lastname** | **String** |  | [optional] 
**Enable** | **Int32** |  | [optional] 
**Expire** | **Int32** |  | [optional] 
**Comment** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$AccessUsers = Initialize-PVEAccessUsers  -Email null `
 -Firstname null `
 -Groups null `
 -Tokens null `
 -Keys null `
 -Lastname null `
 -Enable null `
 -Expire null `
 -Comment null
```

- Convert the resource to JSON
```powershell
$AccessUsers | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

