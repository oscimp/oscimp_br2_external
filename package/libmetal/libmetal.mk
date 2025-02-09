################################################################################
#
# libmetal
#
################################################################################

LIBMETAL_VERSION = 465fcf018c760785fc04fcd90a72b17ab9a8a58d
LIBMETAL_SITE = $(call github,OpenAMP,libmetal,$(LIBMETAL_VERSION))
LIBMETAL_LICENSE = LGPL-2.1+
LIBMETAL_LICENSE_FILES = LICENSE

LIBMETAL_SUPPORTS_IN_SOURCE_BUILD = NO

LIBMETAL_INSTALL_STAGING = YES

$(eval $(cmake-package))
