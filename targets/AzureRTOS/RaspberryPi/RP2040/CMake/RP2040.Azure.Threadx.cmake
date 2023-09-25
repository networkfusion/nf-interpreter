#
# Copyright (c) .NET Foundation and Contributors
# See LICENSE file in the project root for full license information.
#
include(FetchContent)
set(THREADX_ARCH "cortex_m0")
set(THREADX_TOOLCHAIN "gnu")

if(EXISTS "${AZURERTOS_SOURCE_FOLDER}/")
    message(STATUS "RTOS is: AzureRTOS ${RTOS_VERSION} (source from: ${AZURERTOS_SOURCE_FOLDER})")
    FetchContent_Declare(
        azure_rtos
        SOURCE_DIR ${AZURERTOS_SOURCE_FOLDER}
    )
else()
    message(STATUS "RTOS is: AzureRTOS ${RTOS_VERSION} from GitHub repo")
    FetchContent_Declare(
        azure_rtos
        GIT_REPOSITORY https://github.com/azure-rtos/threadx.git
        GIT_TAG ${RTOS_VERSION}
    )
endif()
FetchContent_Populate(azure_rtos)

#set(TARGET_AZURERTOS_COMMON_SOURCES ${TARGET_AZURERTOS_COMMON_SOURCES} CACHE INTERNAL "make global")

list(APPEND AZURE_THREADX_INCLUDES 
            ${azure_rtos_SOURCE_DIR}/common/inc
            ${azure_rtos_SOURCE_DIR}/ports/cortex_m0/gnu/inc
)
  
list(APPEND THREADX_SOURCES
            ${CMAKE_SOURCE_DIR}/targets/AzureRTOS/RaspberryPi/RP2040/nanoCLR/Startup/tx_initialize_low_level.S

            ${azure_rtos_SOURCE_DIR}/ports/cortex_m0/gnu/src/tx_thread_context_restore.S
            ${azure_rtos_SOURCE_DIR}/ports/cortex_m0/gnu/src/tx_thread_context_save.S
            ${azure_rtos_SOURCE_DIR}/ports/cortex_m0/gnu/src/tx_thread_interrupt_control.S
            ${azure_rtos_SOURCE_DIR}/ports/cortex_m0/gnu/src/tx_thread_interrupt_disable.S
            ${azure_rtos_SOURCE_DIR}/ports/cortex_m0/gnu/src/tx_thread_interrupt_restore.S
            ${azure_rtos_SOURCE_DIR}/ports/cortex_m0/gnu/src/tx_thread_schedule.S
            ${azure_rtos_SOURCE_DIR}/ports/cortex_m0/gnu/src/tx_thread_stack_build.S
            ${azure_rtos_SOURCE_DIR}/ports/cortex_m0/gnu/src/tx_thread_system_return.S
            ${azure_rtos_SOURCE_DIR}/ports/cortex_m0/gnu/src/tx_timer_interrupt.S

            ${azure_rtos_SOURCE_DIR}/common/src/tx_block_allocate.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_block_pool_cleanup.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_block_pool_create.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_block_pool_delete.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_block_pool_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_block_pool_initialize.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_block_pool_performance_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_block_pool_performance_system_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_block_pool_prioritize.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_block_release.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_byte_allocate.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_byte_pool_cleanup.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_byte_pool_create.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_byte_pool_delete.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_byte_pool_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_byte_pool_initialize.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_byte_pool_performance_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_byte_pool_performance_system_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_byte_pool_prioritize.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_byte_pool_search.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_byte_release.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_event_flags_cleanup.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_event_flags_create.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_event_flags_delete.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_event_flags_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_event_flags_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_event_flags_initialize.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_event_flags_performance_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_event_flags_performance_system_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_event_flags_set.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_event_flags_set_notify.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_initialize_high_level.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_initialize_kernel_enter.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_initialize_kernel_setup.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_misra.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_mutex_cleanup.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_mutex_create.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_mutex_delete.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_mutex_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_mutex_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_mutex_initialize.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_mutex_performance_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_mutex_performance_system_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_mutex_prioritize.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_mutex_priority_change.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_mutex_put.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_queue_cleanup.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_queue_create.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_queue_delete.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_queue_flush.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_queue_front_send.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_queue_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_queue_initialize.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_queue_performance_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_queue_performance_system_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_queue_prioritize.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_queue_receive.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_queue_send.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_queue_send_notify.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_semaphore_ceiling_put.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_semaphore_cleanup.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_semaphore_create.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_semaphore_delete.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_semaphore_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_semaphore_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_semaphore_initialize.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_semaphore_performance_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_semaphore_performance_system_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_semaphore_prioritize.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_semaphore_put.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_semaphore_put_notify.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_create.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_delete.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_entry_exit_notify.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_identify.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_initialize.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_performance_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_performance_system_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_preemption_change.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_priority_change.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_relinquish.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_reset.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_resume.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_shell_entry.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_sleep.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_stack_analyze.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_stack_error_handler.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_stack_error_notify.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_suspend.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_system_preempt_check.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_system_resume.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_system_suspend.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_terminate.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_time_slice.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_time_slice_change.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_timeout.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_thread_wait_abort.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_time_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_time_set.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_timer_activate.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_timer_change.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_timer_create.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_timer_deactivate.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_timer_delete.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_timer_expiration_process.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_timer_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_timer_initialize.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_timer_performance_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_timer_performance_system_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_timer_system_activate.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_timer_system_deactivate.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_timer_thread_entry.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_trace_buffer_full_notify.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_trace_disable.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_trace_enable.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_trace_event_filter.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_trace_event_unfilter.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_trace_initialize.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_trace_interrupt_control.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_trace_isr_enter_insert.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_trace_isr_exit_insert.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_trace_object_register.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_trace_object_unregister.c
            ${azure_rtos_SOURCE_DIR}/common/src/tx_trace_user_event_insert.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_block_allocate.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_block_pool_create.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_block_pool_delete.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_block_pool_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_block_pool_prioritize.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_block_release.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_byte_allocate.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_byte_pool_create.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_byte_pool_delete.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_byte_pool_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_byte_pool_prioritize.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_byte_release.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_event_flags_create.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_event_flags_delete.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_event_flags_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_event_flags_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_event_flags_set.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_event_flags_set_notify.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_mutex_create.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_mutex_delete.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_mutex_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_mutex_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_mutex_prioritize.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_mutex_put.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_queue_create.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_queue_delete.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_queue_flush.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_queue_front_send.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_queue_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_queue_prioritize.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_queue_receive.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_queue_send.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_queue_send_notify.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_semaphore_ceiling_put.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_semaphore_create.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_semaphore_delete.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_semaphore_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_semaphore_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_semaphore_prioritize.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_semaphore_put.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_semaphore_put_notify.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_thread_create.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_thread_delete.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_thread_entry_exit_notify.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_thread_info_get.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_thread_preemption_change.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_thread_priority_change.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_thread_relinquish.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_thread_reset.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_thread_resume.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_thread_suspend.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_thread_terminate.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_thread_time_slice_change.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_thread_wait_abort.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_timer_activate.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_timer_change.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_timer_create.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_timer_deactivate.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_timer_delete.c
            ${azure_rtos_SOURCE_DIR}/common/src/txe_timer_info_get.c
)



    
                                 