################################################################################
#
# wrpc_sw
#
################################################################################

WRPC_SW_VERSION = wrpc-v4.2
WRPC_SW_SITE = https://ohwr.org/project/wrpc-sw
WRPC_SW_SITE_METHOD = git

define WRPC_SW_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/liblinux
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/liblinux/extest
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/tools wrpc-vuart wrpc-diags wr-streamers
endef

define WRPC_SW_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/tools/wrpc-vuart $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/tools/wrpc-diags $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/tools/wr-streamers $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
