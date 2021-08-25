################################################################################
#
# spec
#
################################################################################

SPEC_VERSION = v1.4.9
SPEC_SITE = https://ohwr.org/project/spec
SPEC_SITE_METHOD = git

SPEC_DEPENDENCIES += fmc-sw general-cores fpga-manager

$(eval $(generic-package))
