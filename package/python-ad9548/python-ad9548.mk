################################################################################
#
# python-ad9548
#
################################################################################

PYTHON_AD9548_VERSION = main 
PYTHON_AD9548_SITE = $(call github,gwbres,adi-ad9548,$(PYTHON_AD9548_VERSION))
PYTHON_AD9548_LICENSE = GPL-v3
PYTHON_AD9548_LICENSE_FILES = LICENSE
PYTHON_AD9548_SETUP_TYPE = setuptools

$(eval $(python-package))
