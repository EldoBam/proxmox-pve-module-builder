#
# Proxmox VE Module 1.0
# Generated OpenApiDescription to render Modules via OpenapiGenerator
# Version: 0.1
# Contact: 
# Generated by OpenAPI Generator: https://openapi-generator.tech
#

Describe -tag 'ProxmoxPVE' -name 'PVEClusterResourcesInner' {
    Context 'PVEClusterResourcesInner' {
        It 'Initialize-PVEClusterResourcesInner' {
            # a simple test to create an object
            #$NewObject = Initialize-PVEClusterResourcesInner -Storage "TEST_VALUE" -Content "TEST_VALUE" -Cpu "TEST_VALUE" -Type "TEST_VALUE" -Diskread "TEST_VALUE" -CgroupMode "TEST_VALUE" -Hastate "TEST_VALUE" -Disk "TEST_VALUE" -Vmid "TEST_VALUE" -Lock "TEST_VALUE" -Netout "TEST_VALUE" -Tags "TEST_VALUE" -Id "TEST_VALUE" -Level "TEST_VALUE" -Name "TEST_VALUE" -Pool "TEST_VALUE" -Maxcpu "TEST_VALUE" -Mem "TEST_VALUE" -Maxdisk "TEST_VALUE" -Plugintype "TEST_VALUE" -Template "TEST_VALUE" -Diskwrite "TEST_VALUE" -Maxmem "TEST_VALUE" -Status "TEST_VALUE" -Uptime "TEST_VALUE" -Netin "TEST_VALUE" -Node "TEST_VALUE"
            #$NewObject | Should -BeOfType ClusterResourcesInner
            #$NewObject.property | Should -Be 0
        }
    }
}
