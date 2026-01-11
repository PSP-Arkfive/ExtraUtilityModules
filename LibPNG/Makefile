TARGET = libpng

C_OBJS = main.o exports.o

OBJS = $(C_OBJS)

PSPSDK=$(shell psp-config --pspsdk-path)

BUILD_PRX = 1
PRX_EXPORTS = exports.exp

INCDIR =
CFLAGS = -std=c99 -O2 -G0
CXXFLAGS = $(CFLAGS)	
ASFLAGS = $(CFLAGS)
LIBDIR = 
LDFLAGS = -nostartfiles
LIBS = -lpng -lz -lm -lpspsysc_user

include $(PSPSDK)/lib/build.mak
