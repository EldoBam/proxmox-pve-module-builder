# NodesQemuFirewallOptions
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Macfilter** | **Int32** |  | [optional] 
**Enable** | **Int32** |  | [optional] 
**LogLevelOut** | **String** |  | [optional] 
**LogLevelIn** | **String** |  | [optional] 
**Radv** | **Int32** |  | [optional] 
**PolicyIn** | **String** |  | [optional] 
**Ipfilter** | **Int32** |  | [optional] 
**Dhcp** | **Int32** |  | [optional] 
**PolicyOut** | **String** |  | [optional] 
**Ndp** | **Int32** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesQemuFirewallOptions = Initialize-PVENodesQemuFirewallOptions  -Macfilter null `
 -Enable null `
 -LogLevelOut null `
 -LogLevelIn null `
 -Radv null `
 -PolicyIn null `
 -Ipfilter null `
 -Dhcp null `
 -PolicyOut null `
 -Ndp null
```

- Convert the resource to JSON
```powershell
$NodesQemuFirewallOptions | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

