# NodesCertificatesInfoInner
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Fingerprint** | **String** |  | [optional] 
**Pem** | **String** |  | [optional] 
**San** | **String[]** |  | [optional] 
**PublicKeyType** | **String** |  | [optional] 
**Notafter** | **Int32** |  | [optional] 
**Filename** | **String** |  | [optional] 
**PublicKeyBits** | **Int32** |  | [optional] 
**Notbefore** | **Int32** |  | [optional] 
**Subject** | **String** |  | [optional] 
**Issuer** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesCertificatesInfoInner = Initialize-PVENodesCertificatesInfoInner  -Fingerprint null `
 -Pem null `
 -San null `
 -PublicKeyType null `
 -Notafter null `
 -Filename null `
 -PublicKeyBits null `
 -Notbefore null `
 -Subject null `
 -Issuer null
```

- Convert the resource to JSON
```powershell
$NodesCertificatesInfoInner | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

