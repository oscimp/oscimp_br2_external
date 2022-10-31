################################################################################
#
# python-joblib
#
################################################################################

PYTHON_JOBLIB_VERSION = 1.1.1
PYTHON_JOBLIB_SITE = $(call github,joblib,joblib,$(PYTHON_JOBLIB_VERSION))
PYTHON_JOBLIB_LICENSE = BSD-3-Clause
PYTHON_JOBLIB_LICENSE_FILES = LICENSE.txt
PYTHON_JOBLIB_SETUP_TYPE = setuptools

define REMOVE_TESTS_FOR_CHINESE_SPECIAL_CHARACTERS
	rm -f $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/joblib/test/test_func_inspect_special_encoding.py
endef
PYTHON_JOBLIB_POST_INSTALL_TARGET_HOOKS += REMOVE_TESTS_FOR_CHINESE_SPECIAL_CHARACTERS

$(eval $(python-package))
$(eval $(host-python-package))
