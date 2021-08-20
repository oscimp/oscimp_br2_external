################################################################################
#
# cheby
#
################################################################################

CHEBY_VERSION = 6a01f32be5deba0f885cccbdd56258d003bd8ae5
CHEBY_SITE = https://gitlab.cern.ch/cohtdrivers/cheby
CHEBY_SITE_METHOD = git

HOST_CHEBY_DEPENDENCIES += host-python3 host-python3-setuptools host-python3-pyyaml

define HOST_CHEBY_INSTALL_CMDS
	( \
		cd $(@D); \
		$(HOST_DIR)/bin/python3 setup.py install \
			--prefix=$(HOST_DIR)/usr \
	)	
endef

$(eval $(host-generic-package))
