################################################################################
#
# kodi-pvr-dvbviewer
#
################################################################################

KODI_PVR_DVBVIEWER_VERSION = a34a66ad38da925fde6cf568ffa24e4a078b035a
KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
KODI_PVR_DVBVIEWER_LICENSE = GPL-2.0+
KODI_PVR_DVBVIEWER_LICENSE_FILES = src/client.h
KODI_PVR_DVBVIEWER_DEPENDENCIES = kodi-platform

$(eval $(cmake-package))
