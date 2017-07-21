################################################################################
#
# kodi-pvr-dvblink
#
################################################################################

KODI_PVR_DVBLINK_VERSION = 71c6e42efaf8b426f0f10130720e1b7c8a0ed49b
KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
KODI_PVR_DVBLINK_LICENSE = GPL-2.0+
KODI_PVR_DVBLINK_LICENSE_FILES = src/client.h
KODI_PVR_DVBLINK_DEPENDENCIES = kodi-platform tinyxml2

$(eval $(cmake-package))
