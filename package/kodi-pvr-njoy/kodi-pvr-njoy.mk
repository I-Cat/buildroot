################################################################################
#
# kodi-pvr-njoy
#
################################################################################

KODI_PVR_NJOY_VERSION = a31e20e5fa9410bdca417f8c70b838048cb68167
KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
KODI_PVR_NJOY_LICENSE = GPL-2.0+
KODI_PVR_NJOY_LICENSE_FILES = src/client.h
KODI_PVR_NJOY_DEPENDENCIES = kodi-platform

$(eval $(cmake-package))
