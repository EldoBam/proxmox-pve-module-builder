# ClusterNotificationsMatchers
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**InvertMatch** | **Int32** |  | [optional] 
**MatchCalendar** | **String[]** |  | [optional] 
**MatchSeverity** | **String[]** |  | [optional] 
**Target** | **String[]** |  | [optional] 
**MatchField** | **String[]** |  | [optional] 
**Disable** | **Int32** |  | [optional] 
**Digest** | **String** |  | [optional] 
**Mode** | **String** |  | [optional] 
**Name** | **String** |  | [optional] 
**Comment** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$ClusterNotificationsMatchers = Initialize-PVEClusterNotificationsMatchers  -InvertMatch null `
 -MatchCalendar null `
 -MatchSeverity null `
 -Target null `
 -MatchField null `
 -Disable null `
 -Digest null `
 -Mode null `
 -Name null `
 -Comment null
```

- Convert the resource to JSON
```powershell
$ClusterNotificationsMatchers | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

