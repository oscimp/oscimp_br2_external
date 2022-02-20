################################################################################
#
# migen
#
################################################################################

MIGEN_VERSION = 0.9.2
MIGEN_SITE = $(call github,m-labs,migen,$(MIGEN_VERSION))
MIGEN_LICENSE = BSD-3-Clause
MIGEN_LICENSE_FILES = LICENSE
MIGEN_SETUP_TYPE = setuptools

MIGEN_DEPENDENCIES = python-colorama
$(eval $(python-package))
