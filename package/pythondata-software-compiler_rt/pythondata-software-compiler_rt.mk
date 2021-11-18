################################################################################
#
# pythondata-software-compiler_rt
#
################################################################################

PYTHONDATA_SOFTWARE_COMPILER_RT_VERSION = 7cfcaed2e726027fd622650b58dd77e47c495ee0
PYTHONDATA_SOFTWARE_COMPILER_RT_SITE = $(call github,litex-hub,pythondata-software-compiler_rt,$(PYTHONDATA_SOFTWARE_COMPILER_RT_VERSION))
PYTHONDATA_SOFTWARE_COMPILER_RT_LICENSE = Apache
PYTHONDATA_SOFTWARE_COMPILER_RT_LICENSE_FILES = LICENSE
PYTHONDATA_SOFTWARE_COMPILER_RT_SETUP_TYPE = setuptools

$(eval $(python-package))
