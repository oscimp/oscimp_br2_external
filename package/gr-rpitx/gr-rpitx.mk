################################################################################
#
# gr-rpitx
#
################################################################################
GR_RPITX_VERSION = fea63e7f411c4b6565bf6bcc8fc4c6ecd84b277e
GR_RPITX_SITE = $(call github,jmfriedt,gr-rpitx,$(GR_RPITX_VERSION))
GR_RPITX_INSTALL_STAGING = NO
GR_RPITX_LICENSE = GPL-3.0
GR_RPITX_LICENSE_FILES = LICENSE
GR_RPITX_DEPENDENCIES = librpitx gnuradio

$(eval $(cmake-package))

