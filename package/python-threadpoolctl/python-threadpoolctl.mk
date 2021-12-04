################################################################################
#
# python-threadpoolctl
#
################################################################################

PYTHON_THREADPOOLCTL_VERSION = 2.1.0
PYTHON_THREADPOOLCTL_SITE = $(call github,joblib,threadpoolctl,$(PYTHON_THREADPOOLCTL_VERSION))
PYTHON_THREADPOOLCTL_LICENSE = BSD-3-Clause
PYTHON_THREADPOOLCTL_LICENSE_FILES = LICENSE
PYTHON_THREADPOOLCTL_SETUP_TYPE = distutils

$(eval $(python-package))
$(eval $(host-python-package))
