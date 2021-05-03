################################################################################
#
# faac
#
################################################################################

FAAC_VERSION = 9a8b43fd079b71c647738612b6875a3c767dbf8f
FAAC_SITE = $(call github,knik0,faac,$(FAAC_VERSION))
FAAC_INSTALL_STAGING = YES

ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
FAAC_CONF_OPTS += --disable-thread
endif

#                --cross-prefix="$(TARGET_CROSS)" \

define FAAC_CONFIGURE_CMDS
        (cd $(@D); ./bootstrap && $(TARGET_CONFIGURE_OPTS) $(FAAC_CONF_ENV) ./configure \
                --prefix=/usr \
                --host="$(GNU_TARGET_NAME)" \
                --enable-static --with-pic --disable-shared --without-mp4v2 --enable-drm \
                $(FAAC_CONF_OPTS) \
        )
endef

define FAAC_BUILD_CMDS
    	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
endef

define FAAC_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/include/faaccfg.h $(TARGET_DIR)/usr/include/faaccfg.h
	$(INSTALL) -D -m 0644 $(@D)/include/faac.h $(TARGET_DIR)/usr/include/faac.h
	$(INSTALL) -D -m 0644 $(@D)/libfaac/.libs/libfaac_drm.a $(TARGET_DIR)/usr/lib
endef

define FAAC_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0644 $(@D)/include/faaccfg.h $(STAGING_DIR)/usr/include/faaccfg.h
	$(INSTALL) -D -m 0644 $(@D)/include/faac.h $(STAGING_DIR)/usr/include/faac.h
	$(INSTALL) -D -m 0644 $(@D)/libfaac/.libs/libfaac_drm.a $(STAGING_DIR)/usr/lib
endef

$(eval $(generic-package))


