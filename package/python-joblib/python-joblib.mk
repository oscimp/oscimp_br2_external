################################################################################
#
# python-joblib
#
################################################################################

PYTHON_JOBLIB_VERSION = 1.1.0
PYTHON_JOBLIB_SITE = $(call github,joblib,joblib,$(PYTHON_JOBLIB_VERSION))
PYTHON_JOBLIB_LICENSE = BSD-3-Clause
PYTHON_JOBLIB_LICENSE_FILES = LICENSE.txt
PYTHON_JOBLIB_SETUP_TYPE = setuptools

$(eval $(host-python-package))
