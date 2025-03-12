# NodesCephPoolInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**PgAutoscaleMode** | **String** |  | [optional] 
**PoolName** | **String** |  | [optional] 
**TargetSize** | **Int32** |  | [optional] 
**ApplicationMetadata** | [**SystemCollectionsHashtable**](.md) |  | [optional] 
**CrushRule** | **Int32** |  | [optional] 
**AutoscaleStatus** | [**SystemCollectionsHashtable**](.md) |  | [optional] 
**CrushRuleName** | **String** |  | [optional] 
**PgNum** | **Int32** |  | [optional] 
**Type** | **String** |  | [optional] 
**TargetSizeRatio** | **Decimal** |  | [optional] 
**MinSize** | **Int32** |  | [optional] 
**BytesUsed** | **Int32** |  | [optional] 
**Size** | **Int32** |  | [optional] 
**PgNumFinal** | **Int32** |  | [optional] 
**Pool** | **Int32** |  | [optional] 
**PercentUsed** | **Decimal** |  | [optional] 
**PgNumMin** | **Int32** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesCephPoolInner = Initialize-PVENodesCephPoolInner  -PgAutoscaleMode null `
 -PoolName null `
 -TargetSize null `
 -ApplicationMetadata null `
 -CrushRule null `
 -AutoscaleStatus null `
 -CrushRuleName null `
 -PgNum null `
 -Type null `
 -TargetSizeRatio null `
 -MinSize null `
 -BytesUsed null `
 -Size null `
 -PgNumFinal null `
 -Pool null `
 -PercentUsed null `
 -PgNumMin null
```

- Convert the resource to JSON
```powershell
$NodesCephPoolInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

