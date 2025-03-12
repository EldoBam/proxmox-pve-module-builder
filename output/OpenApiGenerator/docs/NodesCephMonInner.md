# NodesCephMonInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**CephVersionShort** | **String** |  | [optional] 
**CephVersion** | **String** |  | [optional] 
**Addr** | **String** |  | [optional] 
**State** | **String** |  | [optional] 
**Service** | **Int32** |  | [optional] 
**VarHost** | **Int32** |  | [optional] 
**Rank** | **Int32** |  | [optional] 
**Quorum** | **Int32** |  | [optional] 
**Direxists** | **String** |  | [optional] 
**Name** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesCephMonInner = Initialize-PVENodesCephMonInner  -CephVersionShort null `
 -CephVersion null `
 -Addr null `
 -State null `
 -Service null `
 -VarHost null `
 -Rank null `
 -Quorum null `
 -Direxists null `
 -Name null
```

- Convert the resource to JSON
```powershell
$NodesCephMonInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

