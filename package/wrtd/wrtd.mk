################################################################################
#
# wrtd
#
################################################################################

WRTD_VERSION = 14547314d1b50ce221b62c8289170ec2ddab3c69
WRTD_SITE = https://ohwr.org/project/wrtd
WRTD_SITE_METHOD = git

WRTD_DEPENDENCIES += host-python3 host-python3-setuptools mock-turtle python3 python-decorator python-setuptools python-pyyaml

WRTD_INSTALL_STAGING = YES

WRTD_PYTHON_DIR = python$(PYTHON3_VERSION_MAJOR)

define WRTD_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/software/lib
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/software/lib/python
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/software/tools
endef

define WRTD_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/software/lib install \
		PREFIX=$(STAGING_DIR)/usr
	$(INSTALL) -m 0644 $(@D)/software/include/wrtd-common.h $(STAGING_DIR)/usr/include
	$(INSTALL) -m 0644 $(@D)/software/lib/libwrtd.h $(STAGING_DIR)/usr/include
endef

define WRTD_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/software/lib install \
		PREFIX=$(TARGET_DIR)/usr
	( \
		cd $(@D)/software/lib/python; \
		PYTHONPATH=$(TARGET_DIR)/usr/lib/$(WRTD_PYTHON_DIR)/site-packages \
		$(HOST_DIR)/bin/python3 setup.py install \
			--prefix=$(TARGET_DIR)/usr \
	)
	( \
		cd $(@D)/software/tools; \
		PYTHONPATH=$(TARGET_DIR)/usr/lib/$(WRTD_PYTHON_DIR)/site-packages \
		$(HOST_DIR)/bin/python3 setup.py install \
			--prefix=$(TARGET_DIR)/usr \
	)
endef

$(eval $(generic-package))
