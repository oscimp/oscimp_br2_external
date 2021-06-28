################################################################################
#
# wishbone-gen
#
################################################################################

WISHBONE_GEN_VERSION = cbc9b2bcf4d18bca74e558a2dcd20786d47487f6
WISHBONE_GEN_SITE = https://ohwr.org/project/wishbone-gen
WISHBONE_GEN_SITE_METHOD = git

HOST_WISHBONE_GEN_DEPENDENCIES += host-lua

define HOST_WISHBONE_GEN_INSTALL_CMDS
	$(INSTALL) $(@D)/wbgen2 $(HOST_DIR)/bin
	$(SED) 's,^#!/usr/bin/env lua,#!$(HOST_DIR)/bin/lua,g' $(HOST_DIR)/bin/wbgen2
endef

$(eval $(host-generic-package))
