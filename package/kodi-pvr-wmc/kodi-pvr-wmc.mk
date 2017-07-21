################################################################################
#
# kodi-pvr-wmc
#
################################################################################

KODI_PVR_WMC_VERSION = 306f2d80b29b1c9abb759c6c74339c4a7793994d
KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
KODI_PVR_WMC_LICENSE = GPL-2.0+
KODI_PVR_WMC_LICENSE_FILES = src/client.h
KODI_PVR_WMC_DEPENDENCIES = kodi-platform

$(eval $(cmake-package))
