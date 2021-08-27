################################################################################
#
# fmc-adc-100m
#
################################################################################

FMC_ADC_100M_VERSION = 0e644a55b276d1a82277be09e711e09a544b8414
FMC_ADC_100M_SITE = https://ohwr.org/project/fmc-adc-100m14b4cha-sw
FMC_ADC_100M_SITE_METHOD = git

FMC_ADC_100M_DEPENDENCIES += fmc-sw zio

FMC_ADC_100M_INSTALL_STAGING = YES

FMC_ADC_100M_MODULE_SUBDIRS = kernel
FMC_ADC_100M_MODULE_MAKE_OPTS = ZIO_ABS=$(ZIO_DIR)
FMC_ADC_100M_MODULE_MAKE_OPTS += FMC_ABS=$(FMC_SW_DIR)
FMC_ADC_100M_MODULE_MAKE_OPTS += ZIO_EXTRA_SYMBOLS-y=$(ZIO_DIR)/drivers/zio/Module.symvers
FMC_ADC_100M_MODULE_MAKE_OPTS += FMC_EXTRA_SYMBOLS-y=$(FMC_SW_DIR)/drivers/fmc/Module.symvers
FMC_ADC_100M_MODULE_MAKE_OPTS += ZIO_VERSION=v1.4.2-0-g14f5bc8
FMC_ADC_100M_MODULE_MAKE_OPTS += GIT_VERSION=v5.0.0.beta3-69-g0e644a5

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

$(eval $(kernel-module))
$(eval $(generic-package))
