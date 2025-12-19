BOOTLOADEX ?= $(CURDIR)/../BootLoadEx

all:
	$(Q)mkdir -p dist
	$(Q)cp pre-built/*.prx dist/
	$(Q)$(MAKE) -C idStorageRegen
	$(Q)cp idStorageRegen/*.prx dist/
	$(Q)$(MAKE) -C IOPrivileged
	$(Q)cp IOPrivileged/*.prx dist/
	$(Q)$(MAKE) -C IPL_Updater
	$(Q)cp IPL_Updater/*.prx dist/
	$(Q)$(MAKE) -C KBooti_Updater
	$(Q)cp KBooti_Updater/*.prx dist/
	$(Q)$(MAKE) -C Peops
	$(Q)cp Peops/*.prx dist/
	$(Q)$(MAKE) -C PSPAV
	$(Q)cp PSPAV/*.prx dist/
	$(Q)$(MAKE) -C PSPFTP
	$(Q)cp PSPFTP/*.prx dist/
	$(Q)$(MAKE) -C PSPIdentHelper
	$(Q)cp PSPIdentHelper/*.prx dist/
	$(Q)$(MAKE) -C USBDeviceDriver
	$(Q)cp USBDeviceDriver/*.prx dist/
	$(Q)$(MAKE) BOOTLOADEX=$(BOOTLOADEX) -C TimeMachine/TMCtrl660/rebootex
	$(Q)$(MAKE) -C TimeMachine/TMCtrl660
	$(Q)cp TimeMachine/TMCtrl660/*.prx dist/
	$(Q)$(MAKE) -C TimeMachine/TMCtrl150
	$(Q)cp TimeMachine/TMCtrl150/*.prx dist/


clean:
	$(Q)$(MAKE) -C idStorageRegen clean
	$(Q)$(MAKE) -C IOPrivileged clean
	$(Q)$(MAKE) -C IPL_Updater clean
	$(Q)$(MAKE) -C KBooti_Updater clean
	$(Q)$(MAKE) -C Peops clean
	$(Q)$(MAKE) -C PSPAV clean
	$(Q)$(MAKE) -C PSPFTP clean
	$(Q)$(MAKE) -C PSPIdentHelper clean
	$(Q)$(MAKE) -C USBDeviceDriver clean
	$(Q)$(MAKE) BOOTLOADEX=$(BOOTLOADEX) -C TimeMachine/TMCtrl660/rebootex clean
	$(Q)$(MAKE) -C TimeMachine/TMCtrl660 clean
	$(Q)$(MAKE) -C TimeMachine/TMCtrl150 clean
	$(Q)rm -rf dist
