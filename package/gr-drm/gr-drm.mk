################################################################################
#
# gr-drm
#
################################################################################
GR_DRM_VERSION = cea51e7d2eb647ef735bf801afae1bdcd14f1162
GR_DRM_SITE = $(call github,kit-cel,gr-drm,$(GR_DRM_VERSION))
GR_DRM_INSTALL_STAGING = NO
GR_DRM_LICENSE = GPL-3.0
GR_DRM_LICENSE_FILES = LICENSE
GR_DRM_DEPENDENCIES = boost faac cppunit

$(eval $(cmake-package))

