################################################################################
#
# platinum
#
################################################################################

PLATINUM_VERSION = fa47fdde5e00e599161dc53464e0e0e8feb9cb32
PLATINUM_SITE = $(call github,lrusak,Platinum,$(PLATINUM_VERSION))
PLATINUM_LICENSE = GPL-2.0+
PLATINUM_LICENSE_FILES = LICENSE.txt
PLATINUM_INSTALL_STAGING = YES
PLATINUM_DEPENDENCIES = host-pkgconf neptune

$(eval $(cmake-package))
