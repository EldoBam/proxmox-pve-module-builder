# NodesVzdumpDefaults
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Mailnotification** | **String** |  | [optional] 
**Storage** | **String** |  | [optional] 
**Fleecing** | **String** |  | [optional] 
**PruneBackups** | **String** |  | [optional] 
**Zstd** | **Int32** |  | [optional] 
**Bwlimit** | **Int32** |  | [optional] 
**Quiet** | **Int32** |  | [optional] 
**Stop** | **Int32** |  | [optional] 
**Mode** | **String** |  | [optional] 
**NotificationMode** | **String** |  | [optional] 
**Mailto** | **String** |  | [optional] 
**Stopwait** | **Int32** |  | [optional] 
**NotificationTarget** | **String** |  | [optional] 
**Protected** | **Int32** |  | [optional] 
**Vmid** | **String** |  | [optional] 
**Script** | **String** |  | [optional] 
**All** | **Int32** |  | [optional] 
**Maxfiles** | **Int32** |  | [optional] 
**Performance** | **String** |  | [optional] 
**Dumpdir** | **String** |  | [optional] 
**Pigz** | **Int32** |  | [optional] 
**NotesTemplate** | **String** |  | [optional] 
**ExcludePath** | **String[]** |  | [optional] 
**Pool** | **String** |  | [optional] 
**Compress** | **String** |  | [optional] 
**Lockwait** | **Int32** |  | [optional] 
**NotificationPolicy** | **String** |  | [optional] 
**Remove** | **Int32** |  | [optional] 
**Ionice** | **Int32** |  | [optional] 
**PbsChangeDetectionMode** | **String** |  | [optional] 
**Tmpdir** | **String** |  | [optional] 
**Node** | **String** |  | [optional] 
**Stdexcludes** | **Int32** |  | [optional] 
**Exclude** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesVzdumpDefaults = Initialize-PVENodesVzdumpDefaults  -Mailnotification null `
 -Storage null `
 -Fleecing null `
 -PruneBackups null `
 -Zstd null `
 -Bwlimit null `
 -Quiet null `
 -Stop null `
 -Mode null `
 -NotificationMode null `
 -Mailto null `
 -Stopwait null `
 -NotificationTarget null `
 -Protected null `
 -Vmid null `
 -Script null `
 -All null `
 -Maxfiles null `
 -Performance null `
 -Dumpdir null `
 -Pigz null `
 -NotesTemplate null `
 -ExcludePath null `
 -Pool null `
 -Compress null `
 -Lockwait null `
 -NotificationPolicy null `
 -Remove null `
 -Ionice null `
 -PbsChangeDetectionMode null `
 -Tmpdir null `
 -Node null `
 -Stdexcludes null `
 -Exclude null
```

- Convert the resource to JSON
```powershell
$NodesVzdumpDefaults | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

