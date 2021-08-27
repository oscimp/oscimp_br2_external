################################################################################
#
# fmc-adc-100m
#
################################################################################

FMC_ADC_100M_VERSION = 0e644a55b276d1a82277be09e711e09a544b8414
FMC_ADC_100M_SITE = https://ohwr.org/project/fmc-adc-100m14b4cha-sw
FMC_ADC_100M_SITE_METHOD = git

FMC_ADC_100M_DEPENDENCIES += zio

FMC_ADC_100M_INSTALL_STAGING = YES

define FMC_ADC_100M_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/tools
endef

define FMC_ADC_100M_INSTALL_STAGING_CMDS
	$(INSTALL) -m 0644 $(@D)/kernel/fmc-adc-100m14b4cha.h $(STAGING_DIR)/usr/include
endef

define FMC_ADC_100M_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/tools install \
		DESTDIR=$(TARGET_DIR)/usr
endef

$(eval $(generic-package))
