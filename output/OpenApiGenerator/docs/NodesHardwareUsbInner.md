# NodesHardwareUsbInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Prodid** | **String** |  | [optional] 
**Busnum** | **Int32** |  | [optional] 
**Vendid** | **String** |  | [optional] 
**Level** | **Int32** |  | [optional] 
**Usbpath** | **String** |  | [optional] 
**Product** | **String** |  | [optional] 
**Port** | **Int32** |  | [optional] 
**Serial** | **String** |  | [optional] 
**Class** | **Int32** |  | [optional] 
**Speed** | **String** |  | [optional] 
**Devnum** | **Int32** |  | [optional] 
**Manufacturer** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesHardwareUsbInner = Initialize-PVENodesHardwareUsbInner  -Prodid null `
 -Busnum null `
 -Vendid null `
 -Level null `
 -Usbpath null `
 -Product null `
 -Port null `
 -Serial null `
 -Class null `
 -Speed null `
 -Devnum null `
 -Manufacturer null
```

- Convert the resource to JSON
```powershell
$NodesHardwareUsbInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

