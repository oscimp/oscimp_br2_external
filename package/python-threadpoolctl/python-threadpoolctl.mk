################################################################################
#
# python-threadpoolctl
#
################################################################################

PYTHON_THREADPOOLCTL_VERSION = 3.1.0
PYTHON_THREADPOOLCTL_SITE = $(call github,joblib,threadpoolctl,$(PYTHON_THREADPOOLCTL_VERSION),$(PYTHON_THREADPOOLCTL_VERSION).tar.gz)
PYTHON_THREADPOOLCTL_LICENSE = BSD-3-Clause
PYTHON_THREADPOOLCTL_LICENSE_FILES = LICENSE

# threadpoolctl is originally built using 'flit' which
# simply symlinks $(@)/threadpoolctl.py to site-packages
define PYTHON_THREADPOOLCTL_BUILD_CMDS
endef

define PYTHON_THREADPOOLCTL_INSTALL_CMDS
	ln -sf $(@)/threadpoolctl.py \
		$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/threadpoolctl.py
endef

$(eval $(host-generic-package))
