################################################################################
#
# kodi-pvr-argustv
#
################################################################################

KODI_PVR_ARGUSTV_VERSION = d459cba96083c3670d363d35329369789d2aab77
KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
KODI_PVR_ARGUSTV_LICENSE = GPL-2.0+
KODI_PVR_ARGUSTV_LICENSE_FILES = src/client.h
KODI_PVR_ARGUSTV_DEPENDENCIES = jsoncpp kodi-platform

$(eval $(cmake-package))
