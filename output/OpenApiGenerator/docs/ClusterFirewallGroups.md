# ClusterFirewallGroups
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Log** | **String** |  | [optional] 
**Pos** | **Int32** |  | [optional] 
**Ipversion** | **Int32** |  | [optional] 
**Type** | **String** |  | [optional] 
**Macro** | **String** |  | [optional] 
**IcmpType** | **String** |  | [optional] 
**Sport** | **String** |  | [optional] 
**Iface** | **String** |  | [optional] 
**Source** | **String** |  | [optional] 
**Dport** | **String** |  | [optional] 
**Dest** | **String** |  | [optional] 
**Enable** | **Int32** |  | [optional] 
**Comment** | **String** |  | [optional] 
**Proto** | **String** |  | [optional] 
**Action** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$ClusterFirewallGroups = Initialize-PVEClusterFirewallGroups  -Log null `
 -Pos null `
 -Ipversion null `
 -Type null `
 -Macro null `
 -IcmpType null `
 -Sport null `
 -Iface null `
 -Source null `
 -Dport null `
 -Dest null `
 -Enable null `
 -Comment null `
 -Proto null `
 -Action null
```

- Convert the resource to JSON
```powershell
$ClusterFirewallGroups | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

