################################################################################
#
# libfec
#
################################################################################
LIBFEC_VERSION = 9750ca0a6d0a786b506e44692776b541f90daa91 
LIBFEC_SITE = $(call github,quiet,libfec,$(LIBFEC_VERSION))

LIBFEC_INSTALL_STAGING = YES
LIBFEC_INSTALL_TARGET = YES
LIBFEC_LICENSE = BSD-2
LIBFEC_LICENSE_FILES = LICENSE.txt
LIBFEC_INSTALL_TARGET = NO

define LIBFEC_BUILD_CMDS
    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/
endef

define LIBFEC_INSTALL_STAGING_CMDS
    $(INSTALL) -D -m 0755 $(@D)/libfec.so $(STAGING_DIR)/usr/lib/
    $(INSTALL) -D -m 0755 $(@D)/libfec.a $(STAGING_DIR)/usr/lib/
endef
    
define LIBFEC_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/libfec.so $(TARGET_DIR)/usr/lib
    $(INSTALL) -D -m 0755 $(@D)/libfec.a $(TARGET_DIR)/usr/lib
endef

$(eval $(autotools-package))
