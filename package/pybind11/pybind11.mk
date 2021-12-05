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

PYBIND11_CONF_OPTS = \
	-DBUILD_DOCS=OFF \
	-DPYBIND11_TEST=OFF

HOST_PYBIND11_CONF_OPTS = \
	-DBUILD_DOCS=OFF \
	-DPYBIND11_TEST=OFF

# do not search for python,
# we define it ourselves
PYBIND11_CONF_OPTS += \
	-DPYBIND11_NOPYTHON=ON \
	-DPYTHON=$(HOST_DIR)/usr/bin/python

HOST_PYBIND11_CONF_OPTS += \
	-DPYBIND11_NOPYTHON=ON \
	-DPYTHON=$(HOST_DIR)/usr/bin/python

# pybind11 python support activation
ifeq ($(BR2_PACKAGE_PYBIND11_WITH_PYTHON),y)
PYBIND11_DEPENDENCIES += host-python3
HOST_PYBIND11_DEPENDENCIES += host-python3

# building python side of this package
# requires cmake install in $(@D)/pybind11
PYBIND11_CONF_OPTS += \
	-DPYTHON_PREFIX=$(STAGING_DIR)/usr
	#-DCMAKE_INSTALL_PREFIX=$(@D)/pybind11 \

HOST_PYBIND11_CONF_OPTS += \
	-DPYTHON_PREFIX=$(HOST_DIR)/usr

# trick to build python side of this package
define PYBIND11_PYTHON_BUILD
	cd $(@D) && $(HOST_DIR)/usr/bin/python3 setup.py install
endef

PYBIND11_POST_INSTALL_HOOKS += PYBIND11_PYTHON_BUILD
HOST_PYBIND11_POST_INSTALL_HOOKS += PYBIND11_PYTHON_BUILD
endif

$(eval $(cmake-package))
$(eval $(host-cmake-package))
