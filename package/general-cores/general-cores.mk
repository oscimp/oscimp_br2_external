################################################################################
#
# general-cores
#
################################################################################

GENERAL_CORES_VERSION = v1.1.0
GENERAL_CORES_SITE = https://ohwr.org/project/general-cores
GENERAL_CORES_SITE_METHOD = git

GENERAL_CORES_INSTALL_STAGING = YES

GENERAL_CORES_MODULE_SUBDIRS = software/htvic/drivers
GENERAL_CORES_MODULE_SUBDIRS += software/i2c-ocores/drivers/i2c/busses
GENERAL_CORES_MODULE_SUBDIRS += software/spi-ocores/drivers/spi
GENERAL_CORES_MODULE_MAKE_OPTS = CONFIG_I2C_OCORES=m
GENERAL_CORES_MODULE_MAKE_OPTS += CONFIG_SPI_OCORES=m

define GENERAL_CORES_INSTALL_STAGING_CMDS
	$(INSTALL) -d $(STAGING_DIR)/include/linux/platform_data
	$(INSTALL) -m 0644 $(@D)/software/i2c-ocores/include/linux/platform_data/*.h $(STAGING_DIR)/include/linux/platform_data
	$(INSTALL) -m 0644 $(@D)/software/spi-ocores/include/linux/platform_data/*.h $(STAGING_DIR)/include/linux/platform_data
endef

$(eval $(kernel-module))
$(eval $(generic-package))
