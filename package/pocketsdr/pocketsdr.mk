################################################################################
#
# pocketSDR
#
################################################################################
# POCKETSDR_SITE_METHOD=git
POCKETSDR_VERSION = 7c045c28da3631124c8549c76ed4936be3e97579
POCKETSDR_SITE = $(call github,meriac,PocketSDR,$(POCKETSDR_VERSION))

# POCKETSDR_GIT_SUBMODULES = YES
POCKETSDR_INSTALL_STAGING = YES
POCKETSDR_LICENSE = BSD-2
POCKETSDR_LICENSE_FILES = LICENSE.txt
# POCKETSDR_DEPENDENCIES = libfec ldpccodes

define POCKETSDR_BUILD_CMDS
    cd $(@D)/lib
    sh $(@D)/lib/clone_lib.sh
    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib/build
    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib/build install
    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/app
endef

define POCKETSDR_INSTALL_STAGING_CMDS
endef

define POCKETSDR_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/app/pocketconf/pocketconf $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/app/pocketdump/pocketdump $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
