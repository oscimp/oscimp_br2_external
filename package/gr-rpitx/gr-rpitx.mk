################################################################################
#
# gr-rpitx
#
################################################################################
GR_RPITX_VERSION = a62972691f7a72172fce7efdaec1cd1b0a37d652
GR_RPITX_SITE = $(call github,jmfriedt,gr-rpitx,$(GR_RPITX_VERSION))
GR_RPITX_INSTALL_STAGING = NO
GR_RPITX_LICENSE = GPL-3.0
GR_RPITX_LICENSE_FILES = LICENSE
GR_RPITX_DEPENDENCIES = librpitx gnuradio

$(eval $(cmake-package))

