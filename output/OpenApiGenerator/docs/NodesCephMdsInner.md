# NodesCephMdsInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Addr** | **String** |  | [optional] 
**State** | **String** |  | [optional] 
**VarHost** | **String** |  | [optional] 
**Rank** | **Int32** |  | [optional] 
**Name** | [**AnyType**](.md) |  | [optional] 
**StandbyReplay** | **Int32** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesCephMdsInner = Initialize-PVENodesCephMdsInner  -Addr null `
 -State null `
 -VarHost null `
 -Rank null `
 -Name null `
 -StandbyReplay null
```

- Convert the resource to JSON
```powershell
$NodesCephMdsInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

