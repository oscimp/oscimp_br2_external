################################################################################
#
# python-scipy
#
################################################################################

PYTHON_SCIPY_VERSION = 1.7.2
PYTHON_SCIPY_SOURCE = v$(PYTHON_SCIPY_VERSION).tar.gz
PYTHON_SCIPY_SITE = https://github.com/scipy/scipy/archive
PYTHON_SCIPY_LICENSE = BSD-3-Clause
PYTHON_SCIPY_LICENSE_FILES = LICENSE.txt doc/sphinxext/LICENSE.txt \
			doc/scipy-sphinx-theme/LICENSE.txt
PYTHON_SCIPY_SETUP_TYPE = setuptools

PYTHON_SCIPY_DEPENDENCIES = host-python-numpy \
	host-pybind11 \
	boost \
	host-python-pythran \
	host-python-gast \
	host-python-beniget \
	host-python-ply

# blas support may be provided by lapack (libblas.a) or openblas (libopenblas.a)
ifeq ($(BR2_PACKAGE_PYTHON_SCIPY_OPENBLAS),y)
PYTHON_SCIPY_DEPENDENCIES += openblas
else
PYTHON_SCIPY_DEPENDENCIES += lapack
endif

PYTHON_SCIPY_CFLAGS = "$(TARGET_CFLAGS)"
#TODO@GBR
# checker les optimization fpu
#ifeq ($(BR2_ARM_CPU_HAS_NEON):$(BR2_ARM_SOFT_FLOAT),y:)
#PYTHON_SCIPY_CFLAGS += -mfpu=neon
#else
#PYTHON_SCIPY_CONF_OPTS += --disable-neon
#endif

PYTHON_SCIPY_LDFLAGS = "$(TARGET_LDFLAGS) -shared -L$(PYTHON3_PATH)/site-packages/numpy/core/lib"

PYTHON_SCIPY_ENV += CFLAGS=$(PYTHON_SCIPY_CFLAGS)
PYTHON_SCIPY_ENV += LDFLAGS=$(PYTHON_SCIPY_LDFLAGS)

# must be used to locate 'gfortran'
PYTHON_SCIPY_ENV += F90="$(TARGET_FC)"

# trick to locate 'lapack' and 'blas'
define PYTHON_SCIPY_LOCATE_LAPACK_BLAS_LIBS
	rm -f $(@D)/site.cfg
	echo "[DEFAULT]" >> $(@D)/site.cfg
	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
endef

PYTHON_SCIPY_PRE_CONFIGURE_HOOKS += PYTHON_SCIPY_LOCATE_LAPACK_BLAS_LIBS
HOST_PYTHON_SCIPY_PRE_CONFIGURE_HOOKS += PYTHON_SCIPY_LOCATE_LAPACK_BLAS_LIBS

$(eval $(python-package))
$(eval $(host-python-package))
