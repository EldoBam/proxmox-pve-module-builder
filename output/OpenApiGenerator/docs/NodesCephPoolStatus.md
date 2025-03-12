# NodesCephPoolStatus
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**PgAutoscaleMode** | **String** |  | [optional] 
**Size** | **Int32** |  | [optional] 
**TargetSize** | **String** |  | [optional] 
**Nodelete** | **Int32** |  | [optional] 
**Noscrub** | **Int32** |  | [optional] 
**ApplicationList** | [**AnyType[]**](AnyType.md) |  | [optional] 
**NodeepScrub** | **Int32** |  | [optional] 
**Id** | **Int32** |  | [optional] 
**Application** | **String** |  | [optional] 
**CrushRule** | **String** |  | [optional] 
**AutoscaleStatus** | [**SystemCollectionsHashtable**](.md) |  | [optional] 
**TargetSizeRatio** | **Decimal** |  | [optional] 
**UseGmtHitset** | **Int32** |  | [optional] 
**Nopgchange** | **Int32** |  | [optional] 
**PgpNum** | **Int32** |  | [optional] 
**Name** | **String** |  | [optional] 
**PgNum** | **Int32** |  | [optional] 
**Statistics** | [**SystemCollectionsHashtable**](.md) |  | [optional] 
**FastRead** | **Int32** |  | [optional] 
**Hashpspool** | **Int32** |  | [optional] 
**Nosizechange** | **Int32** |  | [optional] 
**MinSize** | **Int32** |  | [optional] 
**WriteFadviseDontneed** | **Int32** |  | [optional] 
**PgNumMin** | **Int32** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesCephPoolStatus = Initialize-PVENodesCephPoolStatus  -PgAutoscaleMode null `
 -Size null `
 -TargetSize null `
 -Nodelete null `
 -Noscrub null `
 -ApplicationList null `
 -NodeepScrub null `
 -Id null `
 -Application null `
 -CrushRule null `
 -AutoscaleStatus null `
 -TargetSizeRatio null `
 -UseGmtHitset null `
 -Nopgchange null `
 -PgpNum null `
 -Name null `
 -PgNum null `
 -Statistics null `
 -FastRead null `
 -Hashpspool null `
 -Nosizechange null `
 -MinSize null `
 -WriteFadviseDontneed null `
 -PgNumMin null
```

- Convert the resource to JSON
```powershell
$NodesCephPoolStatus | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

