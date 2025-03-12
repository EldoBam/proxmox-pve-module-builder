# AccessTfa
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Created** | **Int32** |  | [optional] 
**Enable** | **Int32** |  | [optional] 
**Id** | **String** |  | [optional] 
**Type** | **String** |  | [optional] 
**Description** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$AccessTfa = Initialize-PVEAccessTfa  -Created null `
 -Enable null `
 -Id null `
 -Type null `
 -Description null
```

- Convert the resource to JSON
```powershell
$AccessTfa | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

