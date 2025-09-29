cmake_minimum_required(VERSION 3.28)

project(extrautilitymodules VERSION 1.0 LANGUAGES C ASM)

include(FetchContent)
FetchContent_Declare(
    arkdevsdk
    GIT_REPOSITORY https://github.com/PSP-Arkfive/ark-dev-sdk.git
    GIT_TAG main
    EXCLUDE_FROM_ALL
)
FetchContent_MakeAvailable(arkdevsdk)

set(ARKSDK ${arkdevsdk_SOURCE_DIR})

include_directories(${ARKSDK}/include)
link_directories(${ARKSDK}/libs)

remove_definitions("-D_PSP_FW_VERSION=600")
add_definitions("-D_PSP_FW_VERSION=660")

add_subdirectory(idStorageRegen)
add_subdirectory(IOPrivileged)
add_subdirectory(IPL_Updater)
add_subdirectory(KBootI_Updater)
add_subdirectory(Peops)
add_subdirectory(PSPAV)
add_subdirectory(PSPFTP)
add_subdirectory(PSPIdentHelper)
add_subdirectory(USBDeviceDriver)
