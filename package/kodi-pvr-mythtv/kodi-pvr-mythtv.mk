################################################################################
#
# kodi-pvr-mythtv
#
################################################################################

KODI_PVR_MYTHTV_VERSION = 00ec57de53cc04e33f648fba096bacbf484ebc64
KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
KODI_PVR_MYTHTV_LICENSE_FILES = src/client.h
KODI_PVR_MYTHTV_DEPENDENCIES = kodi-platform

$(eval $(cmake-package))
