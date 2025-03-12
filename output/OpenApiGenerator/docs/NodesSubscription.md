# NodesSubscription
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Nextduedate** | **String** |  | [optional] 
**Productname** | **String** |  | [optional] 
**Signature** | **String** |  | [optional] 
**Level** | **String** |  | [optional] 
**Message** | **String** |  | [optional] 
**Sockets** | **Int32** |  | [optional] 
**Key** | **String** |  | [optional] 
**Checktime** | **Int32** |  | [optional] 
**Status** | **String** |  | [optional] 
**Regdate** | **String** |  | [optional] 
**Url** | **String** |  | [optional] 
**Serverid** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesSubscription = Initialize-PVENodesSubscription  -Nextduedate null `
 -Productname null `
 -Signature null `
 -Level null `
 -Message null `
 -Sockets null `
 -Key null `
 -Checktime null `
 -Status null `
 -Regdate null `
 -Url null `
 -Serverid null
```

- Convert the resource to JSON
```powershell
$NodesSubscription | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

