################################################################################
#
# fpga-manager
#
################################################################################

FPGA_MANAGER_VERSION = 4bfe26e2a451cb104c5a13ac102e52d6240fa432
FPGA_MANAGER_SITE = https://gitlab.cern.ch/coht/fpga-manager
FPGA_MANAGER_SITE_METHOD = git

$(eval $(generic-package))
