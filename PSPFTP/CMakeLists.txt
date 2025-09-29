project(pspftp VERSION 1.0 LANGUAGES C ASM)

add_prx_module(pspftp exports.exp)

target_sources(pspftp PRIVATE 
   main.c
)

target_compile_options(pspftp PRIVATE -std=c99 -O2 -Os -G0 -Wall -fshort-wchar -fno-pic -mno-check-zero-division)
target_include_directories(pspftp PRIVATE ${ARKSDK}/include)
target_link_directories(pspftp PRIVATE ${ARKSDK}/libs)
target_link_libraries(pspftp PRIVATE
   -nostartfiles
   -lpspftp
   pspnet_apctl
   pspsystemctrl_user
   pspsysc_user
   pspctrl
)