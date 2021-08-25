#
# Copyright (c) .NET Foundation and Contributors
# See LICENSE file in the project root for full license information.
#

# native code directory
set(BASE_PATH_FOR_THIS_MODULE ${BASE_PATH_FOR_CLASS_LIBRARIES_MODULES}/System.IO.Ports)


# set include directories
list(APPEND System.IO.Ports_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/CLR/Core)
list(APPEND System.IO.Ports_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/CLR/Include)
list(APPEND System.IO.Ports_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/HAL/Include)
list(APPEND System.IO.Ports_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/PAL/Include)
list(APPEND System.IO.Ports_INCLUDE_DIRS ${BASE_PATH_FOR_THIS_MODULE})
list(APPEND System.IO.Ports_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/System.IO.Ports)
# TODO remove the following when Windows.Devices.SerialCommunications is removed
list(APPEND System.IO.Ports_INCLUDE_DIRS ${BASE_PATH_FOR_CLASS_LIBRARIES_MODULES}/Windows.Devices.SerialCommunications)

# source files

if(RTOS_TI_SIMPLELINK_CHECK)

    # TI SimpleLink is using the new Serial.IO.Ports 

    set(System.IO.Ports_SRCS

        sys_io_ser_native.cpp
        sys_io_ser_native_System_IO_Ports_SerialDevice.cpp

        target_system_io_serial_config.cpp
    )

    foreach(SRC_FILE ${System.IO.Ports_SRCS})
        set(System.IO.Ports_SRC_FILE SRC_FILE-NOTFOUND)
        find_file(System.IO.Ports_SRC_FILE ${SRC_FILE}
            PATHS
                ${BASE_PATH_FOR_THIS_MODULE}
                ${TARGET_BASE_LOCATION}
                ${PROJECT_SOURCE_DIR}/src/System.IO.Ports

            CMAKE_FIND_ROOT_PATH_BOTH
        )
        # message("${SRC_FILE} >> ${System.IO.Ports_SRC_FILE}") # debug helper
        list(APPEND System.IO.Ports_SOURCES ${System.IO.Ports_SRC_FILE})
    endforeach()

else()

    # all the other targets are using the Windows.Devices.SerialCommunication
    
    set(System.IO.Ports_SRCS

        sys_io_ser_native.cpp
        sys_io_ser_native_System_IO_Ports_SerialPort.cpp
        # this will have to be adjusted to the system_device file once Windows.Devices removed
        target_windows_devices_serialcommunication_config.cpp
    )

    foreach(SRC_FILE ${System.IO.Ports_SRCS})
        set(System.IO.Ports_SRC_FILE SRC_FILE-NOTFOUND)
        find_file(System.IO.Ports_SRC_FILE ${SRC_FILE}
            PATHS
                ${BASE_PATH_FOR_THIS_MODULE}
                ${TARGET_BASE_LOCATION}
                ${PROJECT_SOURCE_DIR}/src/System.IO.Ports

            CMAKE_FIND_ROOT_PATH_BOTH
        )
        # message("${SRC_FILE} >> ${System.IO.Ports_SRC_FILE}") # debug helper
        list(APPEND System.IO.Ports_SOURCES ${System.IO.Ports_SRC_FILE})
    endforeach()

endif()

include(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(System.IO.Ports DEFAULT_MSG System.IO.Ports_INCLUDE_DIRS System.IO.Ports_SOURCES)