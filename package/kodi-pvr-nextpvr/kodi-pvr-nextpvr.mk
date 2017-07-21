################################################################################
#
# kodi-pvr-nextpvr
#
################################################################################

KODI_PVR_NEXTPVR_VERSION = d02cc70087ce0680a85c19d2babe7fb7402c09a9
KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
KODI_PVR_NEXTPVR_LICENSE_FILES = src/client.h
KODI_PVR_NEXTPVR_DEPENDENCIES = kodi-platform

$(eval $(cmake-package))
