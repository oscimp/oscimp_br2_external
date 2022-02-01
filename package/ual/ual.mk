################################################################################
#
# ual
#
################################################################################

UAL_VERSION = 8825a2d2c4e2caa42014a64fdf3868414a410138
UAL_SITE = https://gitlab.cern.ch/cohtdrivers/ual
UAL_SITE_METHOD = git

UAL_INSTALL_STAGING = YES

UAL_PYTHON_DIR = python$(PYTHON3_VERSION_MAJOR)

define UAL_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/lib
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/tools
endef

define UAL_INSTALL_STAGING_CMDS
	$(INSTALL) -m 0755 $(@D)/lib/libual.a $(STAGING_DIR)/usr/lib
	$(INSTALL) -m 0644 $(@D)/lib/ual.h $(STAGING_DIR)/usr/include
endef

define UAL_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/lib/libual.a $(TARGET_DIR)/usr/lib
	$(INSTALL) -m 0755 $(@D)/tools/ualmem $(TARGET_DIR)/usr/bin
	( \
		cd $(@D)/PyUAL; \
		$(HOST_DIR)/bin/python3 setup.py install \
			--prefix=$(TARGET_DIR)/usr \
	)
endef

$(eval $(generic-package))
