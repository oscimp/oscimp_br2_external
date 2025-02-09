################################################################################
#
# xtrx_linux_pcie_drv
#
################################################################################

XTRX_LINUX_PCIE_DRV_VERSION = d218d3e8be3f723000bdfff6b6235a85f7b10e42
XTRX_LINUX_PCIE_DRV_SITE = $(call github,xtrx-sdr,xtrx_linux_pcie_drv,$(XTRX_LINUX_PCIE_DRV_VERSION))
XTRX_LINUX_PCIE_DRV_LICENSE = GPL-2.0
XTRX_LINUX_PCIE_DRV_LICENSE_FILES = xtrx.c

$(eval $(generic-package))
