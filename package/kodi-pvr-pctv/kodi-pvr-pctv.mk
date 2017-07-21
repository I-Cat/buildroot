################################################################################
#
# kodi-pvr-pctv
#
################################################################################

KODI_PVR_PCTV_VERSION = 09e6f7be3e18c227faa23da71da1cdfc3d38d40a
KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
KODI_PVR_PCTV_LICENSE = GPL-2.0+
KODI_PVR_PCTV_LICENSE_FILES = src/client.h
KODI_PVR_PCTV_DEPENDENCIES = jsoncpp kodi-platform

$(eval $(cmake-package))
