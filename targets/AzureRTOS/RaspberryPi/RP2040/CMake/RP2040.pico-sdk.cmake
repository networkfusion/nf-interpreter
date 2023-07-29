#
# Copyright (c) .NET Foundation and Contributors
# See LICENSE file in the project root for full license information.
#
# RP2040 series

# All libraries within the SDK are INTERFACE libraries. (Note this does not include the C/C++ standard libraries provided by
# the compiler). Conceptually, a CMake INTERFACE library is a collection of:
# - Source files
# - Include paths
# - Compiler definitions (visible to code as #defines)
# - Compile and link options
# - Dependencies (on other INTERFACE libraries)


#list(APPEND PICO_SDK_LIBRARIES 
#            pico_stdlib
#
#            hardware_irq 
#            hardware_claim
#            hardware_divider
#            hardware_divider_headers
#            hardware_dma
#            hardware_exception
#            hardware_flash
#            hardware_interp
#            hardware_pll
#            hardware_regs
#            hardware_resets
#            hardware_rtc
#            hardware_sync
#            hardware_timer
#            hardware_vreg
#            hardware_watchdog
#            hardware_xosc
#            pico_bit_ops 
#            pico_divider
#            pico_double
#            pico_float
#            pico_int64_ops
#           # pico_mems_op         # follow up, provides optimised machine code versions of memset, memcpy
#            pico_standard_link
#            pico_async_context_base
#            pico_async_context_poll
#            pico_async_context_threadsafe_background
#            pico_binary_info
#            pico_bootrom
#            pico_bootsel_via_double_reset
#            pico_fix_rp2040_usb_device_enumeration
#            pico_rand
#            pico_runtime
#            pico_stdio_semihosting
#            pico_stdio_uart
#            pico_unique_id
#            pico_multicore
#            #lwip
#
#            #header
#            hardware_base
#            hardware_base_headers
#
#
#            hardware_clocks
#
#            #IO
#            hardware_adc
#            hardware_gpio
#            hardware_i2c
#            hardware_pio
#            hardware_pwm
#            hardware_spi
#            hardware_structs
#            hardware_uart
#            pico_usb_reset_interface
#            tinyusb_board
#            tinyusb_common_base
#            tinyusb_device
#)

 list(APPEND PICO_SDK_INCLUDES 
             ${pico_sdk_SOURCE_DIR}
             ${pico_sdk_SOURCE_DIR}/src/boards/include
             ${pico_sdk_SOURCE_DIR}/src/common/pico_base/include
             ${pico_sdk_SOURCE_DIR}/src/common/pico_binary_info/include
             ${pico_sdk_SOURCE_DIR}/src/common/pico_binary_info/include/pico
             ${pico_sdk_SOURCE_DIR}/src/common/pico_binary_info/include/pico/binary_info
             ${pico_sdk_SOURCE_DIR}/src/common/pico_bit_ops/include
             ${pico_sdk_SOURCE_DIR}/src/common/pico_divider/include
             ${pico_sdk_SOURCE_DIR}/src/common/pico_stdlib/include
             ${pico_sdk_SOURCE_DIR}/src/common/pico_sync/include
             ${pico_sdk_SOURCE_DIR}/src/common/pico_time/include
             ${pico_sdk_SOURCE_DIR}/src/common/pico_usb_reset_interface/include
             ${pico_sdk_SOURCE_DIR}/src/common/pico_util/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/boot_stage2/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/cmsis/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_adc/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_base/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_claim/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_clocks/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_divider/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_dma/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_exception/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_flash/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_gpio/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_i2c/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_interp/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_irq/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_pio/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_pll/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_pwm/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_resets/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_rtc/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_spi/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_sync/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_timer/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_uart/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_vreg/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_watchdog/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_xosc/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_bootrom/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_double/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_fix/rp2040_usb_device_enumeration/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_float/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_int64_ops/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_malloc/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_multicore/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_platform/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_printf/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_runtime/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_stdio
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_stdio/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_stdio_uart/include
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_unique_id/include
             ${pico_sdk_SOURCE_DIR}/src/rp2040/hardware_regs/include
             ${pico_sdk_SOURCE_DIR}/src/rp2040/hardware_structs/include

             ${pico_sdk_SOURCE_DIR}/lib/tinyusb/src
             ${pico_sdk_SOURCE_DIR}/lib/tinyusb/src/class/cdc
             ${pico_sdk_SOURCE_DIR}/lib/tinyusb/src/common
             ${pico_sdk_SOURCE_DIR}/lib/tinyusb/src/device
             ${pico_sdk_SOURCE_DIR}/lib/tinyusb/src/portable/raspberrypi/rp2040

 )
 list(APPEND PICO_SDK_SOURCES
             ${CMAKE_SOURCE_DIR}/targets/AzureRTOS/RaspberryPi/RP2040/nanoCLR/Startup/bs2_default_padded_checksummed.s

             ${pico_sdk_SOURCE_DIR}/src/common/pico_sync/critical_section.c
             ${pico_sdk_SOURCE_DIR}/src/common/pico_sync/lock_core.c
             ${pico_sdk_SOURCE_DIR}/src/common/pico_sync/mutex.c
             ${pico_sdk_SOURCE_DIR}/src/common/pico_sync/sem.c
             ${pico_sdk_SOURCE_DIR}/src/common/pico_time/time.c
             ${pico_sdk_SOURCE_DIR}/src/common/pico_time/timeout_helper.c
             ${pico_sdk_SOURCE_DIR}/src/common/pico_util/datetime.c
             ${pico_sdk_SOURCE_DIR}/src/common/pico_util/pheap.c
             ${pico_sdk_SOURCE_DIR}/src/common/pico_util/queue.c

             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_adc/adc.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_claim/claim.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_clocks/clocks.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_dma/dma.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_exception/exception.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_flash/flash.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_gpio/gpio.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_i2c/i2c.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_interp/interp.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_irq/irq.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_irq/irq_handler_chain.S
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_pio/pio.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_pll/pll.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_rtc/rtc.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_spi/spi.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_sync/sync.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_timer/timer.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_uart/uart.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_vreg/vreg.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_watchdog/watchdog.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/hardware_xosc/xosc.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_bit_ops/bit_ops_aeabi.S
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_bootrom/bootrom.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_divider/divider.S
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_double/double_aeabi.S
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_double/double_init_rom.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_double/double_math.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_double/double_v1_rom_shim.S
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_fix/rp2040_usb_device_enumeration/rp2040_usb_device_enumeration.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_float/float_aeabi.S
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_float/float_init_rom.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_float/float_math.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_float/float_v1_rom_shim.S
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_int64_ops/pico_int64_ops_aeabi.S
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_malloc/pico_malloc.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_mem_ops/mem_ops_aeabi.S
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_multicore/multicore.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_platform/platform.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_printf/printf.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_runtime/runtime.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_standard_link/binary_info.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_standard_link/crt0.S
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_standard_link/new_delete.cpp
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_stdio/stdio.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_stdio_uart/stdio_uart.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_stdlib/stdlib.c
             ${pico_sdk_SOURCE_DIR}/src/rp2_common/pico_unique_id/unique_id.c

             ${pico_sdk_SOURCE_DIR}/lib/tinyusb/src/tusb.c
             ${pico_sdk_SOURCE_DIR}/lib/tinyusb/src/class/cdc/cdc_device.c
             ${pico_sdk_SOURCE_DIR}/lib/tinyusb/src/common/tusb_fifo.c
             ${pico_sdk_SOURCE_DIR}/lib/tinyusb/src/device/usbd.c
             ${pico_sdk_SOURCE_DIR}/lib/tinyusb/src/device/usbd_control.c
             ${pico_sdk_SOURCE_DIR}/lib/tinyusb/src/portable/raspberrypi/rp2040/dcd_rp2040.c
             ${pico_sdk_SOURCE_DIR}/lib/tinyusb/src/portable/raspberrypi/rp2040/rp2040_usb.c
 )

macro(nf_set_pico_sdk_build_options)

    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__ctzsi2")               # gcc
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__ctzdi2")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__popcountdi2")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__popcountsi2")

    # armclang
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__clz")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__clzl")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__clzsi2")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__clzll")

    # Double
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_cdcmpeq")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_cdcmple")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_cdrcmple")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_dadd")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_dcmpeq")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_dcmpge")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_dcmpgt")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_dcmple")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_dcmplt")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_dcmpun")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_ddiv")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_dmul")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_drsub")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_dsub")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_i2d")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_l2d")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_ui2d")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_ul2f")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=acos")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=acosh")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=asin")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=asinh")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=atan")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=atan2")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=atanh")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=cbrt")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=ceil")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=copysign")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=cos")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=cosh")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=drem")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=exp")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=exp10")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=exp2")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=floor")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=fmod")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=hypot")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=ldexpf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=log")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=log10")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=log2")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=pow")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=powint")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=remainder")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=remquo")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=round")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=sin")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=sincos") # gnu
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=sqrt")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=tan")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=tanh")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=trunc")

    # Divider
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_idiv")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_idivmod")
     target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_ldivmod")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_uidiv")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_uidivmod")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=expm1")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=log1p")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=fma")

    #float
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_cfcmpeq")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_cfcmple")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_cfrcmple")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_d2f")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_d2iz")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_d2lz")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_d2uiz")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_d2ulz")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_f2d")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_f2iz")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_f2lz")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_f2uiz")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_f2ulz")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_fadd")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_fcmpeq")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_fcmpge")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_fcmpgt")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_fcmple")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_fcmplt")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_fcmpun")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_fdiv")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_fmul")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_frsub")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_fsub")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_i2f")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_ui2f")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_ul2d")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_uldivmod")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=acosf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=acoshf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=asinf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=asinhf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=atan2f")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=atanf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=atanhf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=cbrtf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=ceilf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=copysignf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=cosf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=coshf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=dremf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=exp10f")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=exp2f")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=expf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=expm1f")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=floorf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=fmaf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=fmodf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=hypotf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=ldexp")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=log10f")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=log1pf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=log2f")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=logf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=powf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=powintf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=remainderf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=remquof")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=roundf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=sincosf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=sinf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=sinhf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=sqrtf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=tanf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=tanhf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=truncf")

    #int 64
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_lmul")

    #malloc
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=calloc")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=free")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=malloc")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=realloc")

    #memory operations
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_memcpy")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_memcpy4")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_memcpy8")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_memset")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_memset4")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=__aeabi_memset8")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=memcpy")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=memset")

    #printf
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=snprintf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=vsnprintf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=sprintf")


    #stdio
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=getchar")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=printf")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=putchar")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=puts")
    target_link_options(nanoCLR PUBLIC "LINKER:--wrap=vprintf")


    target_link_options(nanoCLR PUBLIC "LINKER:-gc-sections")
    target_link_options(nanoCLR PUBLIC "LINKER:--no-warn-rwx-segments")

    target_link_options(nanoCLR PUBLIC "-T${CMAKE_SOURCE_DIR}/targets/AzureRTOS/RaspberryPi/RP2040/nanoCLR/Memory/RaspberryPiPico.ld")


endmacro()


                    