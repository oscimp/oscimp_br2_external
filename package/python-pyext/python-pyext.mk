################################################################################
#
# python-pyext
#
################################################################################

PYTHON_PYEXT_VERSION = 0.7
PYTHON_PYEXT_SOURCE = pyext-$(PYTHON_PYEXT_VERSION).tar.gz
PYTHON_PYEXT_SITE = https://files.pythonhosted.org/packages/b0/be/9b6005ac644aaef022527ce49617263379e49dbdbd433d1d3dd66d71f570
PYTHON_PYEXT_LICENSE = Unknown (asked clarification to authors)
PYTHON_PYEXT_LICENSE_FILES = LICENSE
PYTHON_PYEXT_SETUP_TYPE = setuptools

$(eval $(python-package))
