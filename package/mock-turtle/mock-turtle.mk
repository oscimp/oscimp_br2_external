################################################################################
#
# mock-turtle
#
################################################################################

MOCK_TURTLE_VERSION = v4.0.4
MOCK_TURTLE_SITE = https://ohwr.org/project/mock-turtle
MOCK_TURTLE_SITE_METHOD = git

MOCK_TURTLE_INSTALL_STAGING = YES

MOCK_TURTLE_DEPENDENCIES += host-python3 python3

MOCK_TURTLE_MODULE_SUBDIRS = software/kernel
MOCK_TURTLE_MODULE_MAKE_OPTS = DKMS=0

define MOCK_TURTLE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/software/include
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/software/lib
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/software/tools
endef

define MOCK_TURTLE_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/software/include install \
		INCLUDEDESTDIR=$(STAGING_DIR)/usr/include
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/software/lib install \
		DESTLIBDIR=$(STAGING_DIR)/usr/lib
endef

define MOCK_TURTLE_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/software/lib install \
		DESTLIBDIR=$(TARGET_DIR)/usr/lib
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/software/tools install \
	       	BINDESTDIR=$(TARGET_DIR)/usr/bin
	( \
		cd $(@D)/software/lib/PyMockTurtle; \
		$(HOST_DIR)/bin/python3 setup.py install \
			--prefix=$(TARGET_DIR)/usr \
	)	
endef

$(eval $(kernel-module))
$(eval $(generic-package))
