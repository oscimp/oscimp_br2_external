################################################################################
#
# python-scikitlearn
#
################################################################################

PYTHON_SCIKITLEARN_VERSION = 0.23.1
PYTHON_SCIKITLEARN_SITE = $(call github,scikit-learn,scikit-learn,$(PYTHON_SCIKITLEARN_VERSION))
PYTHON_SCIKITLEARN_LICENSE = BSD-3-Clause
PYTHON_SCIKITLEARN_LICENSE_FILES = COPYING
PYTHON_SCIKITLEARN_SETUP_TYPE = setuptools
PYTHON_SCIKITLEARN_DEPENDENCIES = host-python-cython \
	host-python-joblib \
	host-python-scipy \
	openblas \
	lapack

#https://github.com/scikit-learn/scikit-learn/archive/0.23.1.tar.gz
# must be used to locate 'gfortran'
#PYTHON_SCIKITLEARN_ENV += F90="$(TARGET_FC)"

# trick to locate 'lapack' and 'blas'
define PYTHON_SCIKITLEARN_FIND_LAPACK_BLAS
	rm -f $(@D)/site.cfg
	echo "[DEFAULT]" >> $(@D)/site.cfg
	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
endef

PYTHON_SCIKITLEARN_PRECONFIGURE_HOOKS += PYTHON_SCIKITLEARN_FIND_LAPACK_BLAS

$(eval $(python-package))
