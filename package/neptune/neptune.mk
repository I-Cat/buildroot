################################################################################
#
# neptune
#
################################################################################

NEPTUNE_VERSION = da409293e2e075df17b4ae2f2afcc03631615b55
NEPTUNE_SITE = $(call github,lrusak,Neptune,$(NEPTUNE_VERSION))
NEPTUNE_LICENSE = BSD-3-Clause
NEPTUNE_LICENSE_FILES = LICENSE
NEPTUNE_INSTALL_STAGING = YES

NEPTUNE_CONF_OPTS += \
	-DCMAKE_CXX_FLAGS="-std=c++11"

$(eval $(cmake-package))
