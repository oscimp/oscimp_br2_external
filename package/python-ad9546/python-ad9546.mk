################################################################################
#
# python-ad9546
#
################################################################################

PYTHON_AD9546_VERSION = main
PYTHON_AD9546_SITE = $(call github,gwbres,adi-ad9546,$(PYTHON_AD9546_VERSION))
PYTHON_AD9546_LICENSE = GPL-v3
PYTHON_AD9546_LICENSE_FILES = LICENSE
PYTHON_AD9546_SETUP_TYPE = setuptools

$(eval $(python-package))
