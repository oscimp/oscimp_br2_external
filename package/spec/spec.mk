################################################################################
#
# spec
#
################################################################################

SPEC_VERSION = v1.4.9
SPEC_SITE = https://ohwr.org/project/spec
SPEC_SITE_METHOD = git

SPEC_DEPENDENCIES += fmc-sw general-cores fpga-manager

SPEC_MODULE_SUBDIRS = software/kernel
SPEC_MODULE_MAKE_OPTS = VERSION=v1.4.9-0-g18cdb4b
SPEC_MODULE_MAKE_OPTS += FPGA_MGR_ABS=$(FPGA_MANAGER_DIR)
SPEC_MODULE_MAKE_OPTS += CONFIG_FPGA_MGR_BACKPORT=y
SPEC_MODULE_MAKE_OPTS += FMC_ABS=$(FMC_SW_DIR)
SPEC_MODULE_MAKE_OPTS += I2C_ABS=$(GENERAL_CORES_DIR)/software/i2c-ocores
SPEC_MODULE_MAKE_OPTS += SPI_ABS=$(GENERAL_CORES_DIR)/software/spi-ocores

$(eval $(kernel-module))
$(eval $(generic-package))
