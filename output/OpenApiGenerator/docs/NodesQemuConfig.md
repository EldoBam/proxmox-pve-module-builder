# NodesQemuConfig
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Vcpus** | **Int32** |  | [optional] 
**MigrateDowntime** | **Decimal** |  | [optional] 
**Lock** | **String** |  | [optional] 
**Vga** | **String** |  | [optional] 
**Affinity** | **String** |  | [optional] 
**Cipassword** | **String** |  | [optional] 
**Ostype** | **String** |  | [optional] 
**Vmgenid** | **String** |  | [optional] 
**Efidisk0** | **String** |  | [optional] 
**Cpuunits** | **Int32** |  | [optional] 
**Keyboard** | **String** |  | [optional] 
**Hotplug** | **String** |  | [optional] 
**Cpulimit** | **Decimal** |  | [optional] 
**Ciuser** | **String** |  | [optional] 
**Startup** | **String** |  | [optional] 
**Agent** | **String** |  | [optional] 
**Kvm** | **Int32** |  | [optional] 
**Rng0** | **String** |  | [optional] 
**Tpmstate0** | **String** |  | [optional] 
**Digest** | **String** |  | [optional] 
**Cicustom** | **String** |  | [optional] 
**AmdSev** | **String** |  | [optional] 
**Smp** | **Int32** |  | [optional] 
**HostpciN** | **String** |  | [optional] 
**Cpu** | **String** |  | [optional] 
**ScsiN** | **String** |  | [optional] 
**Audio0** | **String** |  | [optional] 
**Ciupgrade** | **Int32** |  | [optional] 
**Citype** | **String** |  | [optional] 
**Numa** | **Int32** |  | [optional] 
**Hookscript** | **String** |  | [optional] 
**Localtime** | **Int32** |  | [optional] 
**Boot** | **String** |  | [optional] 
**Freeze** | **Int32** |  | [optional] 
**Tablet** | **Int32** |  | [optional] 
**Keephugepages** | **Int32** |  | [optional] 
**VarArgs** | **String** |  | [optional] 
**Description** | **String** |  | [optional] 
**NumaN** | **String** |  | [optional] 
**Vmstatestorage** | **String** |  | [optional] 
**Scsihw** | **String** |  | [optional] 
**Protection** | **Int32** |  | [optional] 
**SerialN** | **String** |  | [optional] 
**Watchdog** | **String** |  | [optional] 
**Startdate** | **String** |  | [optional] 
**UsbN** | **String** |  | [optional] 
**Reboot** | **Int32** |  | [optional] 
**VirtioN** | **String** |  | [optional] 
**Balloon** | **Int32** |  | [optional] 
**UnusedN** | **String** |  | [optional] 
**MigrateSpeed** | **Int32** |  | [optional] 
**Name** | **String** |  | [optional] 
**Bios** | **String** |  | [optional] 
**Onboot** | **Int32** |  | [optional] 
**Hugepages** | **String** |  | [optional] 
**Bootdisk** | **String** |  | [optional] 
**Smbios1** | **String** |  | [optional] 
**Arch** | **String** |  | [optional] 
**Cores** | **Int32** |  | [optional] 
**Shares** | **Int32** |  | [optional] 
**Sockets** | **Int32** |  | [optional] 
**Autostart** | **Int32** |  | [optional] 
**Acpi** | **Int32** |  | [optional] 
**Searchdomain** | **String** |  | [optional] 
**Sshkeys** | **String** |  | [optional] 
**SataN** | **String** |  | [optional] 
**Template** | **Int32** |  | [optional] 
**Machine** | **String** |  | [optional] 
**SpiceEnhancements** | **String** |  | [optional] 
**IdeN** | **String** |  | [optional] 
**Tags** | **String** |  | [optional] 
**IpconfigN** | **String** |  | [optional] 
**Memory** | **String** |  | [optional] 
**Tdf** | **Int32** |  | [optional] 
**NetN** | **String** |  | [optional] 
**Ivshmem** | **String** |  | [optional] 
**Cdrom** | **String** |  | [optional] 
**ParallelN** | **String** |  | [optional] 
**Nameserver** | **String** |  | [optional] 

## Examples

- Prepare the resource
```powershell
$NodesQemuConfig = Initialize-PVENodesQemuConfig  -Vcpus null `
 -MigrateDowntime null `
 -Lock null `
 -Vga null `
 -Affinity null `
 -Cipassword null `
 -Ostype null `
 -Vmgenid null `
 -Efidisk0 null `
 -Cpuunits null `
 -Keyboard null `
 -Hotplug null `
 -Cpulimit null `
 -Ciuser null `
 -Startup null `
 -Agent null `
 -Kvm null `
 -Rng0 null `
 -Tpmstate0 null `
 -Digest null `
 -Cicustom null `
 -AmdSev null `
 -Smp null `
 -HostpciN null `
 -Cpu null `
 -ScsiN null `
 -Audio0 null `
 -Ciupgrade null `
 -Citype null `
 -Numa null `
 -Hookscript null `
 -Localtime null `
 -Boot null `
 -Freeze null `
 -Tablet null `
 -Keephugepages null `
 -VarArgs null `
 -Description null `
 -NumaN null `
 -Vmstatestorage null `
 -Scsihw null `
 -Protection null `
 -SerialN null `
 -Watchdog null `
 -Startdate null `
 -UsbN null `
 -Reboot null `
 -VirtioN null `
 -Balloon null `
 -UnusedN null `
 -MigrateSpeed null `
 -Name null `
 -Bios null `
 -Onboot null `
 -Hugepages null `
 -Bootdisk null `
 -Smbios1 null `
 -Arch null `
 -Cores null `
 -Shares null `
 -Sockets null `
 -Autostart null `
 -Acpi null `
 -Searchdomain null `
 -Sshkeys null `
 -SataN null `
 -Template null `
 -Machine null `
 -SpiceEnhancements null `
 -IdeN null `
 -Tags null `
 -IpconfigN null `
 -Memory null `
 -Tdf null `
 -NetN null `
 -Ivshmem null `
 -Cdrom null `
 -ParallelN null `
 -Nameserver null
```

- Convert the resource to JSON
```powershell
$NodesQemuConfig | ConvertTo-JSON
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

