################################################################################
#
# spec-binaries
#
################################################################################

SPEC_BINARIES_VERSION = v1.4.4
SPEC_BINARIES_SOURCE = spec-binaries-$(SPEC_BINARIES_VERSION).tar.xz
SPEC_BINARIES_SITE = https://ohwr.org/project/spec/wikis/uploads/98d07df245b14b373b11a02ab7358cb2

define SPEC_BINARIES_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/lib/firmware
	$(INSTALL) -m 0644 $(@D)/spec-golden-45T.bin $(TARGET_DIR)/lib/firmware/
	$(INSTALL) -m 0644 $(@D)/spec-golden-150T.bin $(TARGET_DIR)/lib/firmware/
endef

$(eval $(generic-package))
