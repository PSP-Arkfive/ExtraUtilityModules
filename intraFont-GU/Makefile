TARGET = intraFont-gu
OBJS = \
	main.o \
	exports.o \


CFLAGS = -O2 -Os -G0 -Wall -fshort-wchar -fno-pic -mno-check-zero-division
CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)
LDFLAGS = -nostartfiles

BUILD_PRX = 1
PRX_EXPORTS = exports.exp

INCDIR = 
LIBDIR =

USE_PSPSDK_LIBS = 1
USE_PSPSDK_LIBC = 1

LIBS = -lintrafont -lm -lansic -lguglue

PSPSDK = $(shell psp-config --pspsdk-path)
include $(PSPSDK)/lib/build_prx.mak
