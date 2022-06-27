################################################################################
#
# python-scikitlearn
#
################################################################################

PYTHON_SCIKITLEARN_VERSION = 1.1.1
PYTHON_SCIKITLEARN_SITE = $(call github,scikit-learn,scikit-learn,$(PYTHON_SCIKITLEARN_VERSION))
PYTHON_SCIKITLEARN_LICENSE = BSD-3-Clause
PYTHON_SCIKITLEARN_LICENSE_FILES = COPYING
PYTHON_SCIKITLEARN_SETUP_TYPE = setuptools
PYTHON_SCIKITLEARN_DEPENDENCIES = \
	host-python-cython \
	host-python-scipy \
	host-python-joblib \
	host-python-threadpoolctl

# disable ./test_program when cross compiling
PYTHON_SCIKITLEARN_ENV = PYTHON_CROSSENV=1

$(eval $(python-package))
