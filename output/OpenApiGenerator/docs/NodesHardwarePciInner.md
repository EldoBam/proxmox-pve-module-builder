# NodesHardwarePciInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Iommugroup** | **Int32** |  | [optional] 
**SubsystemVendorName** | **String** |  | [optional] 
**SubsystemDeviceName** | **String** |  | [optional] 
**Device** | **String** |  | [optional] 
**SubsystemDevice** | **String** |  | [optional] 
**Vendor** | **String** |  | [optional] 
**Id** | **String** |  | [optional] 
**Class** | **String** |  | [optional] 
**SubsystemVendor** | **String** |  | [optional] 
**VendorName** | **String** |  | [optional] 
**Mdev** | **Int32** |  | [optional] 
**DeviceName** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesHardwarePciInner = Initialize-PVENodesHardwarePciInner  -Iommugroup null `
 -SubsystemVendorName null `
 -SubsystemDeviceName null `
 -Device null `
 -SubsystemDevice null `
 -Vendor null `
 -Id null `
 -Class null `
 -SubsystemVendor null `
 -VendorName null `
 -Mdev null `
 -DeviceName null
```

- Convert the resource to JSON
```powershell
$NodesHardwarePciInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

