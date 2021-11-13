################################################################################
#
# python-beniget
#
################################################################################

PYTHON_BENIGET_VERSION = 0.4.1
PYTHON_BENIGET_SITE = $(call github,serge-sans-paille,beniget,$(PYTHON_BENIGET_VERSION))
PYTHON_BENIGET_LICENSE = BSD-3-Clause
PYTHON_BENIGET_LICENSE_FILES = LICENSE.txt
PYTHON_BENIGET_SETUP_TYPE = setuptools

$(eval $(python-package))
$(eval $(host-python-package))
