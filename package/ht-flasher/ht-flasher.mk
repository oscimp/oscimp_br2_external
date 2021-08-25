################################################################################
#
# ht-flasher
#
################################################################################

HT_FLASHER_VERSION = 8fc29043dfe745cab205852f96081916478b40ac
HT_FLASHER_SITE = https://gitlab.cern.ch/coht/ht-flasher
HT_FLASHER_SITE_METHOD = git

HT_FLASHER_DEPENDENCIES += ual

define HT_FLASHER_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/src
endef

define HT_FLASHER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/src/ht-flasher $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
