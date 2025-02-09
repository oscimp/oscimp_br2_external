################################################################################
#
# openamp
#
################################################################################

OPENAMP_VERSION = b2f6099fe50f5453ff5453ba3711a833f6f4be53
OPENAMP_SITE = $(call github,OpenAMP,open-amp,$(OPENAMP_VERSION))
OPENAMP_LICENSE = LGPL-2.1+
OPENAMP_LICENSE_FILES = LICENSE

OPENAMP_SUPPORTS_IN_SOURCE_BUILD = NO

OPENAMP_INSTALL_STAGING = YES

$(eval $(cmake-package))
