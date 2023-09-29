//
// Copyright (c) .NET Foundation and Contributors
// See LICENSE file in the project root for full license information.
//

#include <nanoHAL.h>
#include <nanoHAL_v2.h>
#include <nanoWeak.h>
#include <Target_BlockStorage_STM32FlashDriver.h>

// address for device unique ID
// valid for STM32F7 series
#define DEVICE_ID1_ADDR (0x1FF0F420uL)
#define DEVICE_ID2_ADDR (0x1FF0F424uL)
#define DEVICE_ID3_ADDR (0x1FF0F428uL)

// Default initialisation for Network interface config blocks
// strong implementation replacing ChibiOS 'weak' one
bool InitialiseNetworkDefaultConfig(HAL_Configuration_NetworkInterface *pconfig, uint32_t configurationIndex)
{
    (void)configurationIndex;

    // zero memory
    memset(pconfig, 0, sizeof(HAL_Configuration_NetworkInterface));

    // make sure the config block marker is set
    memcpy(pconfig->Marker, c_MARKER_CONFIGURATION_NETWORK_V1, sizeof(c_MARKER_CONFIGURATION_NETWORK_V1));

    pconfig->InterfaceType = NetworkInterfaceType_Ethernet;
    pconfig->StartupAddressMode = AddressMode_DHCP;
    pconfig->AutomaticDNS = 1;
    pconfig->SpecificConfigId = UINT32_MAX;

#ifdef USE_ST_DEV_MAC
    // set MAC address with ST provided MAC for development boards
    // 00:80:E1:01:35:D1
    pconfig->MacAddress[0] = 0x00;
    pconfig->MacAddress[1] = 0x80;
    pconfig->MacAddress[2] = 0xE1;
    pconfig->MacAddress[3] = 0x01;
    pconfig->MacAddress[4] = 0x35;
    pconfig->MacAddress[5] = 0xD1;
#else
    // Set a locally administered MAC
    pconfig->MacAddress[0] = *(uint32_t*)DEVICE_ID1_ADDR >> 16 & 0x02; // second byte must be 2,6,A,E
    pconfig->MacAddress[1] = *(uint32_t*)DEVICE_ID1_ADDR & 0x0000FFFFuL;
    pconfig->MacAddress[2] = *(uint32_t*)DEVICE_ID2_ADDR >> 16;
    pconfig->MacAddress[3] = *(uint32_t*)DEVICE_ID2_ADDR & 0x0000FFFFuL;
    pconfig->MacAddress[4] = *(uint32_t*)DEVICE_ID3_ADDR >> 16;
    pconfig->MacAddress[5] = *(uint32_t*)DEVICE_ID3_ADDR & 0x0000FFFFuL;
#endif
    return true;
}
