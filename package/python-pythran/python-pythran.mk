################################################################################
#
# python-pythran
#
################################################################################

PYTHON_PYTHRAN_VERSION = 0.10.0
PYTHON_PYTHRAN_SITE = $(call github,serge-sans-paille,pythran,$(PYTHON_PYTHRAN_VERSION))
PYTHON_PYTHRAN_LICENSE = BSD-3-Clause
PYTHON_PYTHRAN_LICENSE_FILES = LICENSE.txt
PYTHON_PYTHRAN_SETUP_TYPE = setuptools

PYTHON_PYTHRAN_DEPENDENCIES = host-python-numpy

$(eval $(python-package))
$(eval $(host-python-package))
