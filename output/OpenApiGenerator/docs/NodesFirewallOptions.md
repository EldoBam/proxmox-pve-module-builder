# NodesFirewallOptions
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**ProtectionSynfloodBurst** | **Int32** |  | [optional] 
**NfConntrackAllowInvalid** | **Int32** |  | [optional] 
**Nftables** | **Int32** |  | [optional] 
**LogLevelOut** | **String** |  | [optional] 
**Ndp** | **Int32** |  | [optional] 
**NfConntrackTcpTimeoutEstablished** | **Int32** |  | [optional] 
**Tcpflags** | **Int32** |  | [optional] 
**NfConntrackMax** | **Int32** |  | [optional] 
**ProtectionSynflood** | **Int32** |  | [optional] 
**LogNfConntrack** | **Int32** |  | [optional] 
**LogLevelIn** | **String** |  | [optional] 
**TcpFlagsLogLevel** | **String** |  | [optional] 
**NfConntrackHelpers** | **String** |  | [optional] 
**LogLevelForward** | **String** |  | [optional] 
**Nosmurfs** | **Int32** |  | [optional] 
**NfConntrackTcpTimeoutSynRecv** | **Int32** |  | [optional] 
**SmurfLogLevel** | **String** |  | [optional] 
**ProtectionSynfloodRate** | **Int32** |  | [optional] 
**Enable** | **Int32** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesFirewallOptions = Initialize-PVENodesFirewallOptions  -ProtectionSynfloodBurst null `
 -NfConntrackAllowInvalid null `
 -Nftables null `
 -LogLevelOut null `
 -Ndp null `
 -NfConntrackTcpTimeoutEstablished null `
 -Tcpflags null `
 -NfConntrackMax null `
 -ProtectionSynflood null `
 -LogNfConntrack null `
 -LogLevelIn null `
 -TcpFlagsLogLevel null `
 -NfConntrackHelpers null `
 -LogLevelForward null `
 -Nosmurfs null `
 -NfConntrackTcpTimeoutSynRecv null `
 -SmurfLogLevel null `
 -ProtectionSynfloodRate null `
 -Enable null
```

- Convert the resource to JSON
```powershell
$NodesFirewallOptions | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

