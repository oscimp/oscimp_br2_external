################################################################################
#
# adc-lib
#
################################################################################

ADC_LIB_VERSION = v2.5.1
ADC_LIB_SITE = https://ohwr.org/project/adc-lib
ADC_LIB_SITE_METHOD = git

ADC_LIB_INSTALL_STAGING = YES

ADC_LIB_DEPENDENCIES += fmc-adc-100m host-python3 python3

define ADC_LIB_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)
endef

define ADC_LIB_INSTALL_STAGING_CMDS
	$(INSTALL) -m 0755 $(@D)/lib/libadc.so $(STAGING_DIR)/usr/lib
	$(INSTALL) -m 0644 $(@D)/lib/adc-lib.h $(STAGING_DIR)/usr/include
	$(INSTALL) -m 0644 $(@D)/lib/adc-lib-100m14b4cha.h $(STAGING_DIR)/usr/include
endef

define ADC_LIB_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/tools/adc-acq $(@D)/tools/example $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/lib/libadc.so $(TARGET_DIR)/usr/lib
	( \
		cd $(@D)/lib/PyAdcLib; \
		$(HOST_DIR)/bin/python3 setup.py install \
			--prefix=$(TARGET_DIR)/usr \
	)
endef

$(eval $(generic-package))
