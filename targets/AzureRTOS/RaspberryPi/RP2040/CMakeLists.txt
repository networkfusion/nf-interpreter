#
# Copyright (c) .NET Foundation and Contributors
# See LICENSE file in the project root for full license information.
#
# RP2040 series


set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)



# The following pico_sdk_init.cmake is included in the top level CMakeLists.txt.
# If it is not included before the project declaration, an error occurs in adding the ELF2UF2.
# include(${PICO_SDK_PATH}/pico_sdk_init.cmake)
#
pico_sdk_init()

include( CMake/RP2040.nfInterpreter.cmake)
include( CMake/RP2040.Azure.Threadx.cmake)

# NOTE: Target link libraries may be a better long term solution
#       as used by typical pico-sdk examples
#       For now, use a list of files.
include( CMake/RP2040.pico-sdk.cmake)

add_executable( nanoCLR
    ${NF_INTERPRETER_SOURCES}
    ${NF_INTERPRETER_GRAPHICS_SOURCES}
    ${THREADX_SOURCES}
    ${PICO_SDK_SOURCES}
)
target_include_directories(nanoCLR PUBLIC
    ${NF_INTERPRETER_INCLUDES}
    ${NF_INTERPRETER_GRAPHICS_INCLUDES}
    ${PICO_SDK_INCLUDES}
    ${AZURE_THREADX_INCLUDES}
)

target_compile_definitions(nanoCLR PUBLIC 
                           DEBUG=1                           
                           DPLATFORM_ARM=1
                           __CM0_CMSIS_VERSION
                           PLATFORM_ARM=1
                           DEBUG=1
                           LIB_PICO_BIT_OPS=1
                           LIB_PICO_BIT_OPS_PICO=1
                           LIB_PICO_DIVIDER=1
                           LIB_PICO_DIVIDER_HARDWARE=1
                           #
                           #  Apparently float/double in RAM is faster
                           #
                           PICO_FLOAT_IN_RAM=1
                           PICO_DOUBLE_IN_RAM=1

                           LIB_PICO_DOUBLE=1
                           LIB_PICO_DOUBLE_PICO=1
                           
                           LIB_PICO_FLOAT=1
                           LIB_PICO_FLOAT_PICO=1
                           
                           LIB_PICO_INT64_OPS=1
                           LIB_PICO_INT64_OPS_PICO=1

                           LIB_PICO_MALLOC=1
                           LIB_PICO_MEM_OPS=1
                           LIB_PICO_MEM_OPS_PICO=1

                           LIB_PICO_PLATFORM=1
                           LIB_PICO_PRINTF=1
                           LIB_PICO_PRINTF_PICO=1
                           LIB_PICO_RUNTIME=1
                           LIB_PICO_STANDARD_LINK=1

                           LIB_PICO_STDIO=1
                           LIB_PICO_STDIO_UART=1

                           LIB_PICO_STDLIB=1

                           LIB_PICO_SYNC=1
                           LIB_PICO_SYNC_CORE=1
                           LIB_PICO_SYNC_CRITICAL_SECTION=1
                           LIB_PICO_SYNC_MUTEX=1
                           LIB_PICO_SYNC_SEM=1

                           LIB_PICO_TIME=1
                           LIB_PICO_UTIL=1
                           PICO_BOARD=\"pico\"
                           PICO_BUILD=1
                           PICO_COPY_TO_RAM=0
                           PICO_CXX_ENABLE_EXCEPTIONS=0
                           PICO_NO_FLASH=0
                           PICO_NO_HARDWARE=0
                           PICO_ON_DEVICE=1
                           PICO_USE_BLOCKED_RAM=0
                           PendSV_Handler=isr_pendsv
                           SysTick_Handler=isr_systick
                           CFG_TUSB_MCU=OPT_MCU_RP2040
 )

 nf_set_pico_sdk_build_options()


# Adds .hex, .bin, .dis, .elf outputs
# If  PICO_NO_UF2 not set, builds ELF2UF2
pico_add_extra_outputs(nanoCLR)



