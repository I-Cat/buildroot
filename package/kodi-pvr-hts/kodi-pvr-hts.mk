################################################################################
#
# kodi-pvr-hts
#
################################################################################

KODI_PVR_HTS_VERSION = d301b2bc2a35403a9e1c960868cf1acfb2ffcb27
KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
KODI_PVR_HTS_LICENSE = GPL-2.0+
KODI_PVR_HTS_LICENSE_FILES = src/client.h
KODI_PVR_HTS_DEPENDENCIES = kodi-platform

$(eval $(cmake-package))
