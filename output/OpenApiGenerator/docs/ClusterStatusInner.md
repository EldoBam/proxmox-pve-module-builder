# ClusterStatusInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**VarLocal** | **Int32** |  | [optional] 
**Nodes** | **Int32** |  | [optional] 
**Version** | **Int32** |  | [optional] 
**Level** | **String** |  | [optional] 
**Type** | **String** |  | [optional] 
**Nodeid** | **Int32** |  | [optional] 
**Id** | **String** |  | [optional] 
**Quorate** | **Int32** |  | [optional] 
**Online** | **Int32** |  | [optional] 
**Name** | **String** |  | [optional] 
**Ip** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$ClusterStatusInner = Initialize-PVEClusterStatusInner  -VarLocal null `
 -Nodes null `
 -Version null `
 -Level null `
 -Type null `
 -Nodeid null `
 -Id null `
 -Quorate null `
 -Online null `
 -Name null `
 -Ip null
```

- Convert the resource to JSON
```powershell
$ClusterStatusInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

