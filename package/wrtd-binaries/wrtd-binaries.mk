################################################################################
#
# wrtd-binaries
#
################################################################################

WRTD_BINARIES_VERSION = v1.0.0
WRTD_BINARIES_SOURCE = wrtd-binaries-$(WRTD_BINARIES_VERSION).tar.gz
WRTD_BINARIES_SITE = https://ohwr.org/project/wrtd/wikis/uploads/8c95166b306cf12b6d75c6e0b27f142d

define WRTD_BINARIES_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/lib/firmware
	$(INSTALL) -m 0644 $(@D)/wrtd_ref_spec150t_adc/gateware/wrtd_ref_spec150t_adc.bin $(TARGET_DIR)/lib/firmware/
endef

$(eval $(generic-package))
