################################################################################
#
# python-gast
#
################################################################################

PYTHON_GAST_VERSION = 0.5.2
PYTHON_GAST_SITE = $(call github,serge-sans-paille,gast,$(PYTHON_GAST_VERSION))
PYTHON_GAST_LICENSE = BSD-3-Clause
PYTHON_GAST_LICENSE_FILES = LICENSE.txt
PYTHON_GAST_SETUP_TYPE = setuptools

$(eval $(python-package))
$(eval $(host-python-package))
