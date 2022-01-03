################################################################################
#
# python3-pygccxml
#
################################################################################

PYTHON3_PYGCCXML_VERSION = 2.2.1
PYTHON3_PYGCCXML_SITE = $(call github,CastXML,pygccxml,v$(PYTHON3_PYGCCXML_VERSION))
PYTHON3_PYGCCXML_DEPENDENCIES =
PYTHON3_PYGCCXML_SETUP_TYPE = setuptools
PYTHON3_PYGCCXML_LICENSE = EUPL-1.1+
PYTHON3_PYGCCXML_LICENSE_FILES = LICENSE.rst

# This host package uses pkg-config to find libffi, so we have to
# provide the proper hints for pkg-config to behave properly for host
# packages.
HOST_PYTHON3_PYGCCXM_ENV = \
        PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
        PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
        PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
        PKG_CONFIG_SYSROOT_DIR="/" \
        PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
HOST_PYTHON3_PYGCCXM_DEPENDENCIES = host-pkgconf
PYTHON3_PYGCCXML_INSTALL_STAGING = YES

$(eval $(python-package))
$(eval $(host-python-package))
