################################################################################
#
# pybind11
#
################################################################################

PYBIND11_VERSION = 2.8.1
PYBIND11_SITE = $(call github,pybind,pybind11,v$(PYBIND11_VERSION))
PYBIND11_LICENSE = BSD-3-Clause
PYBIND11_LICENSE_FILES = LICENSE
PYBIND11_INSTALL_STAGING = YES
PYBIND11_SUPPORTS_IN_SOURCE_BUILD = YES

HOST_PYBIND11_CONF_OPTS = \
	-DBUILD_DOCS=OFF \
	-DDOWNLOAD_EIGEN=OFF

# pybind11 python support activation
ifeq ($(BR2_PACKAGE_PYBIND11_WITH_PYTHON),y)
HOST_PYBIND11_DEPENDENCIES += host-python3

# pybind11 with python requires cmake install in $(@D)
HOST_PYBIND11_CONF_OPTS += \
	-DCMAKE_INSTALL_PREFIX=$(@D)/pybind11 \
	-DPYTHON=$(HOST_DIR)/bin/python3 \
	-DPYTHON_PREFIX=$(STAGING_DIR)/usr \
	-DPYBIND_FINDPYTHON=ON \
	-DPYBIND11_NOPYTHON=OFF

define PYBIND11_PYTHON_BUILD
	cd $(@D) && $(HOST_DIR)/bin/python setup.py install
endef

HOST_PYBIND11_POST_INSTALL_HOOKS += PYBIND11_PYTHON_BUILD
else
HOST_PYBIND11_CONF_OPTS += \
	-DPYBIND_FINDPYTHON=OFF \
	-DPYBIND11_NOPYTHON=ON
endif

$(eval $(host-cmake-package))
