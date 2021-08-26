################################################################################
#
# zio
#
################################################################################

ZIO_VERSION = v1.4.2
ZIO_SITE = https://ohwr.org/project/zio
ZIO_SITE_METHOD = git

ifeq ($(BR2_PACKAGE_ZIO_USERSPACE),y)

ZIO_INSTALL_STAGING = YES

define ZIO_CONFIGURE_CMDS
	$(SED) 's/ZIO_MAJOR_VERSION=.*$$/ZIO_MAJOR_VERSION=1/g' $(@D)/tools/Makefile
	$(SED) 's/ZIO_MINOR_VERSION=.*$$/ZIO_MINOR_VERSION=4/g' $(@D)/tools/Makefile
	$(SED) 's/ZIO_PATCH_VERSION=.*$$/ZIO_PATCH_VERSION=2/g' $(@D)/tools/Makefile
endef

define ZIO_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D) tools
endef

define ZIO_INSTALL_STAGING_CMDS
	$(INSTALL) -d $(STAGING_DIR)/usr/include/linux
	$(INSTALL) -m 0644 $(@D)/include/linux/zio-user.h $(STAGING_DIR)/usr/include/linux
endef

define ZIO_INSTALL_TARGET_CMDS
	$(INSTALL) -D \
		$(@D)/tools/zio-dump \
		$(@D)/tools/zio-cat-file \
       		$(@D)/tools/test-dtc \
		$(TARGET_DIR)/usr/bin
endef

endif

$(eval $(generic-package))
