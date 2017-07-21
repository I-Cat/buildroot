################################################################################
#
# kodi-pvr-vdr-vnsi
#
################################################################################

KODI_PVR_VDR_VNSI_VERSION = 4909f69c089430ab9e151a8641ab316df09f6d90
KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
KODI_PVR_VDR_VNSI_LICENSE = GPL-2.0+
KODI_PVR_VDR_VNSI_LICENSE_FILES = src/client.h
KODI_PVR_VDR_VNSI_DEPENDENCIES = kodi-platform

$(eval $(cmake-package))
