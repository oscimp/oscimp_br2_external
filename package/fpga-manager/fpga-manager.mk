################################################################################
#
# fpga-manager
#
################################################################################

FPGA_MANAGER_VERSION = 4bfe26e2a451cb104c5a13ac102e52d6240fa432
FPGA_MANAGER_SITE = https://gitlab.cern.ch/coht/fpga-manager
FPGA_MANAGER_SITE_METHOD = git

FPGA_MANAGER_INSTALL_STAGING = YES

FPGA_MANAGER_MODULE_SUBDIRS = drivers/fpga
FPGA_MANAGER_MODULE_MAKE_OPTS = CONFIG_FPGA=m

define FPGA_MANAGER_INSTALL_STAGING_CMDS
	$(INSTALL) -d $(STAGING_DIR)/usr/include/linux/fpga
	$(INSTALL) -m 0644 $(@D)/include/linux/fpga/*.h $(STAGING_DIR)/usr/include/linux/fpga
endef

$(eval $(kernel-module))
$(eval $(generic-package))
