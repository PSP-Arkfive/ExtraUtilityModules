PSPSDK=$(shell psp-config --pspsdk-path)
PSPDEV = $(shell psp-config --pspdev-path)
ARKSDK = $(PSPDEV)/share/ark-dev-sdk
PYTHON=$(shell which python3)
BOOTLOADEX = ../../../BootLoadEx

TARGET = reboot.bin.gz

all: $(TARGET)

INCDIR = $(PSPSDK)/include $(PSPSDK)/include/iplsdk
CFLAGS = -std=c99 -Wall -Os -G0 -fno-pic $(addprefix -I, $(INCDIR)) -DREBOOTEX -DMS_IPL -DFAT_DEBUG

CC = psp-gcc
LD = psp-ld
STRIP = psp-strip
OBJCOPY = psp-objcopy
LINKFILE = $(BOOTLOADEX)/linkfile.l

REBOOT_OBJS = \
	main.o \
	pspbtcnf.o \
	scanner.o \


LIBS = -L $(PSPSDK)/lib -lansic -liplsdk

ifdef DEBUG
CFLAGS += -DDEBUG=$(DEBUG)
LIBS += -lcolordebugger
endif

crt0.o : $(BOOTLOADEX)/crt0.S
	$(CC) -I$(PSPSDK)/include -c $< -o crt0.o

$(REBOOT_OBJS) : %.o : $(BOOTLOADEX)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

patches.o: $(BOOTLOADEX)/patches_psp.c
	$(CC) $(CFLAGS) -I$(BOOTLOADEX) -c $< -o $@

main.elf: crt0.o $(REBOOT_OBJS) $(C_OBJS) patches.o

$(TARGET): main.elf
	$(Q)$(STRIP) -s $<
	$(Q)$(OBJCOPY) -O binary $< $(patsubst %.gz,%,$(TARGET))
	$(Q)$(PYTHON) $(ARKSDK)/build-tools/gz/gz.py $(patsubst %.gz,%,$(TARGET)) $@
	$(Q)bin2c $@ payload.h rebootbuffer_ms_psp
	@echo GET $@

clean:
	$(Q)rm -rf *~ *.s *.o *.elf reboot.bin reboot.bin.gz payload.h $(EXTRA_CLEAN)

include $(ARKSDK)/build-tools/beauty_bin.mak
