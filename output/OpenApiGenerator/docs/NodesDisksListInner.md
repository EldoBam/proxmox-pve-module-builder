# NodesDisksListInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Vendor** | **String** |  | [optional] 
**Size** | **Int32** |  | [optional] 
**Mounted** | **Int32** |  | [optional] 
**Health** | **String** |  | [optional] 
**Used** | **String** |  | [optional] 
**Model** | **String** |  | [optional] 
**Osdid** | **Int32** |  | [optional] 
**Devpath** | **String** |  | [optional] 
**Gpt** | **Int32** |  | [optional] 
**Parent** | **String** |  | [optional] 
**Wwn** | **String** |  | [optional] 
**OsdidList** | **Int32[]** |  | [optional] 
**Serial** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesDisksListInner = Initialize-PVENodesDisksListInner  -Vendor null `
 -Size null `
 -Mounted null `
 -Health null `
 -Used null `
 -Model null `
 -Osdid null `
 -Devpath null `
 -Gpt null `
 -Parent null `
 -Wwn null `
 -OsdidList null `
 -Serial null
```

- Convert the resource to JSON
```powershell
$NodesDisksListInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

