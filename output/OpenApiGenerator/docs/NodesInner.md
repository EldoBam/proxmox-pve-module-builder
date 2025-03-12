# NodesInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**SslFingerprint** | **String** |  | [optional] 
**Cpu** | **Decimal** |  | [optional] 
**Maxmem** | **Int32** |  | [optional] 
**Level** | **String** |  | [optional] 
**Uptime** | **Int32** |  | [optional] 
**Mem** | **Int32** |  | [optional] 
**Maxcpu** | **Int32** |  | [optional] 
**Status** | **String** |  | [optional] 
**Node** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesInner = Initialize-PVENodesInner  -SslFingerprint null `
 -Cpu null `
 -Maxmem null `
 -Level null `
 -Uptime null `
 -Mem null `
 -Maxcpu null `
 -Status null `
 -Node null
```

- Convert the resource to JSON
```powershell
$NodesInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

