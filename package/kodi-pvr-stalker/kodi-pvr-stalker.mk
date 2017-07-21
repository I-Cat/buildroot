################################################################################
#
# kodi-pvr-stalker
#
################################################################################

KODI_PVR_STALKER_VERSION = 92ab8e85e291e65a44dcfd6fcc12393324b0f97d
KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
KODI_PVR_STALKER_LICENSE = GPL-2.0+
KODI_PVR_STALKER_LICENSE_FILES = src/client.h
KODI_PVR_STALKER_DEPENDENCIES = jsoncpp kodi-platform libxml2

$(eval $(cmake-package))
