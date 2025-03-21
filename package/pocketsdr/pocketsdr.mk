################################################################################
#
# pocketSDR
#
################################################################################
# POCKETSDR_SITE_METHOD=git
POCKETSDR_VERSION = 82e339325f3af5e8f6852ad4b80d37effc7eec72
POCKETSDR_SITE = $(call github,tomojitakasu,PocketSDR,$(POCKETSDR_VERSION))

# POCKETSDR_GIT_SUBMODULES = YES
POCKETSDR_INSTALL_TARGET = YES
POCKETSDR_LICENSE = BSD-2
POCKETSDR_LICENSE_FILES = LICENSE.txt
POCKETSDR_DEPENDENCIES = libfec ldpc libusb fftw-single

define POCKETSDR_BUILD_CMDS
    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib/build -f librtk.mk
    $(INSTALL) -D -m 0644 $(@D)/lib/build/librtk.a  $(STAGING_DIR)/usr/lib/
    $(INSTALL) -D -m 0644 $(@D)/lib/build/librtk.so $(STAGING_DIR)/usr/lib/
    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib/build -f libsdr.mk
    $(INSTALL) -D -m 0644 $(@D)/lib/build/libsdr.a  $(STAGING_DIR)/usr/lib/
    $(INSTALL) -D -m 0644 $(@D)/lib/build/libsdr.so  $(STAGING_DIR)/usr/lib/
    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/app
endef

define POCKETSDR_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/app/pocket_conf/pocket_conf $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/app/pocket_dump/pocket_dump $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/app/pocket_acq/pocket_acq $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/app/pocket_dump/pocket_dump $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/app/pocket_trk/pocket_trk $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/app/pocket_scan/pocket_scan $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/app/pocket_snap/pocket_snap $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0644 $(@D)/lib/build/librtk.so $(TARGET_DIR)/usr/lib
	$(INSTALL) -D -m 0644 $(@D)/lib/build/libsdr.so $(TARGET_DIR)/usr/lib
endef

$(eval $(generic-package))
