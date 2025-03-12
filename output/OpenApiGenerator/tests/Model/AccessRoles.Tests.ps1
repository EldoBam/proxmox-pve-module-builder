#
# Proxmox VE Module 1.0
# Generated OpenApiDescription to render Modules via OpenapiGenerator
# Version: 0.1
# Contact: 
# Generated by OpenAPI Generator: https://openapi-generator.tech
#

Describe -tag 'ProxmoxPVE' -name 'PVEAccessRoles' {
    Context 'PVEAccessRoles' {
        It 'Initialize-PVEAccessRoles' {
            # a simple test to create an object
            #$NewObject = Initialize-PVEAccessRoles -VMConfigDisk "TEST_VALUE" -VMPowerMgmt "TEST_VALUE" -VMMigrate "TEST_VALUE" -MappingModify "TEST_VALUE" -VMConfigHWType "TEST_VALUE" -VMSnapshotRollback "TEST_VALUE" -MappingAudit "TEST_VALUE" -RealmAllocate "TEST_VALUE" -SysPowerMgmt "TEST_VALUE" -SysConsole "TEST_VALUE" -SysSyslog "TEST_VALUE" -MappingUse "TEST_VALUE" -VMAudit "TEST_VALUE" -SDNUse "TEST_VALUE" -SysIncoming "TEST_VALUE" -VMConsole "TEST_VALUE" -UserModify "TEST_VALUE" -VMAllocate "TEST_VALUE" -DatastoreAllocateSpace "TEST_VALUE" -SysAccessNetwork "TEST_VALUE" -VMBackup "TEST_VALUE" -PoolAudit "TEST_VALUE" -DatastoreAllocate "TEST_VALUE" -SDNAudit "TEST_VALUE" -SysAudit "TEST_VALUE" -VMConfigMemory "TEST_VALUE" -VMConfigCloudinit "TEST_VALUE" -PoolAllocate "TEST_VALUE" -DatastoreAllocateTemplate "TEST_VALUE" -RealmAllocateUser "TEST_VALUE" -VMSnapshot "TEST_VALUE" -DatastoreAudit "TEST_VALUE" -VMConfigNetwork "TEST_VALUE" -VMClone "TEST_VALUE" -VMConfigCPU "TEST_VALUE" -VMConfigCDROM "TEST_VALUE" -VMMonitor "TEST_VALUE" -SysModify "TEST_VALUE" -VMConfigOptions "TEST_VALUE" -SDNAllocate "TEST_VALUE" -PermissionsModify "TEST_VALUE" -GroupAllocate "TEST_VALUE"
            #$NewObject | Should -BeOfType AccessRoles
            #$NewObject.property | Should -Be 0
        }
    }
}
