# NodesQemuAgentExecstatus
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**ErrData** | **String** |  | [optional] 
**Exitcode** | **Int32** |  | [optional] 
**Signal** | **Int32** |  | [optional] 
**OutData** | **String** |  | [optional] 
**OutTruncated** | **Int32** |  | [optional] 
**Exited** | **Int32** |  | [optional] 
**ErrTruncated** | **Int32** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesQemuAgentExecstatus = Initialize-PVENodesQemuAgentExecstatus  -ErrData null `
 -Exitcode null `
 -Signal null `
 -OutData null `
 -OutTruncated null `
 -Exited null `
 -ErrTruncated null
```

- Convert the resource to JSON
```powershell
$NodesQemuAgentExecstatus | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

