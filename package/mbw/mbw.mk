################################################################################
#
# mbw
#
################################################################################

MBW_VERSION = 1.4
MBW_SITE = $(call github,raas,mbw,v$(MBW_VERSION))
MBW_LICENSE = LGPL-2.1
MBW_LICENSE_FILES = mbw.spec

define MBW_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
endef

define MBW_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/mbw $(TARGET_DIR)/usr/sbin
endef

$(eval $(generic-package))
