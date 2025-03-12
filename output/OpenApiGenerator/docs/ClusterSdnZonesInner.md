# ClusterSdnZonesInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Dns** | **String** |  | [optional] 
**Nodes** | **String** |  | [optional] 
**Reversedns** | **String** |  | [optional] 
**Zone** | **String** |  | [optional] 
**State** | **String** |  | [optional] 
**Ipam** | **String** |  | [optional] 
**Dnszone** | **String** |  | [optional] 
**Type** | **String** |  | [optional] 
**Pending** | **Int32** |  | [optional] 
**Dhcp** | **String** |  | [optional] 
**Mtu** | **Int32** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$ClusterSdnZonesInner = Initialize-PVEClusterSdnZonesInner  -Dns null `
 -Nodes null `
 -Reversedns null `
 -Zone null `
 -State null `
 -Ipam null `
 -Dnszone null `
 -Type null `
 -Pending null `
 -Dhcp null `
 -Mtu null
```

- Convert the resource to JSON
```powershell
$ClusterSdnZonesInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

