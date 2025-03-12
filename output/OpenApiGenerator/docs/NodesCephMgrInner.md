# NodesCephMgrInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Name** | [**AnyType**](.md) |  | [optional] 
**VarHost** | **String** |  | [optional] 
**Addr** | **String** |  | [optional] 
**State** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesCephMgrInner = Initialize-PVENodesCephMgrInner  -Name null `
 -VarHost null `
 -Addr null `
 -State null
```

- Convert the resource to JSON
```powershell
$NodesCephMgrInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

