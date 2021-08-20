################################################################################
#
# fmc-sw
#
################################################################################

FMC_SW_VERSION = v1.0.4
FMC_SW_SITE = https://ohwr.org/project/fmc-sw
FMC_SW_SITE_METHOD = git

FMC_SW_MODULE_SUBDIRS = drivers/fmc
FMC_SW_MODULE_MAKE_OPTS = CONFIG_FMC=m

$(eval $(kernel-module))
$(eval $(generic-package))
