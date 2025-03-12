# ClusterResourcesInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Storage** | **String** |  | [optional] 
**Content** | **String** |  | [optional] 
**Cpu** | **Decimal** |  | [optional] 
**Type** | **String** |  | [optional] 
**Diskread** | **Int32** |  | [optional] 
**CgroupMode** | **Int32** |  | [optional] 
**Hastate** | **String** |  | [optional] 
**Disk** | **Int32** |  | [optional] 
**Vmid** | **Int32** |  | [optional] 
**Lock** | **String** |  | [optional] 
**Netout** | **Int32** |  | [optional] 
**Tags** | **String** |  | [optional] 
**Id** | **String** |  | [optional] 
**Level** | **String** |  | [optional] 
**Name** | **String** |  | [optional] 
**Pool** | **String** |  | [optional] 
**Maxcpu** | **Decimal** |  | [optional] 
**Mem** | **Int32** |  | [optional] 
**Maxdisk** | **Int32** |  | [optional] 
**Plugintype** | **String** |  | [optional] 
**Template** | **Int32** |  | [optional] 
**Diskwrite** | **Int32** |  | [optional] 
**Maxmem** | **Int32** |  | [optional] 
**Status** | **String** |  | [optional] 
**Uptime** | **Int32** |  | [optional] 
**Netin** | **Int32** |  | [optional] 
**Node** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$ClusterResourcesInner = Initialize-PVEClusterResourcesInner  -Storage null `
 -Content null `
 -Cpu null `
 -Type null `
 -Diskread null `
 -CgroupMode null `
 -Hastate null `
 -Disk null `
 -Vmid null `
 -Lock null `
 -Netout null `
 -Tags null `
 -Id null `
 -Level null `
 -Name null `
 -Pool null `
 -Maxcpu null `
 -Mem null `
 -Maxdisk null `
 -Plugintype null `
 -Template null `
 -Diskwrite null `
 -Maxmem null `
 -Status null `
 -Uptime null `
 -Netin null `
 -Node null
```

- Convert the resource to JSON
```powershell
$ClusterResourcesInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

