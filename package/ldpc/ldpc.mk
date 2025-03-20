################################################################################
#
# ldpc
#
################################################################################
LDPC_VERSION = 74a8e283be8259dbff7a6bab38ad7e9327825cbf 
LDPC_SITE = $(call github,radfordneal,LDPC-codes/$(LDPC_VERSION))

LDPC_INSTALL_STAGING = YES
LDPC_LICENSE = BSD-2
LDPC_LICENSE_FILES = LICENSE.txt

define LDPC_BUILD_CMDS
    $(@D)/configure
    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/
endef

define LDPC_INSTALL_STAGING_CMDS
endef

define LDPC_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/libfec.so $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
