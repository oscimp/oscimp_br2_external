################################################################################
#
# litex
#
################################################################################

LITEX_VERSION = 2021.08
LITEX_SITE = $(call github,enjoy-digital,litex,$(LITEX_VERSION))
LITEX_LICENSE = BSD-3-Clause
LITEX_LICENSE_FILES = LICENSE
LITEX_SETUP_TYPE = setuptools

LITEX_DEPENDENCIES += pythondata-software-compiler_rt migen

$(eval $(python-package))
