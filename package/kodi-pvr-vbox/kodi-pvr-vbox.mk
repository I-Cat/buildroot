################################################################################
#
# kodi-pvr-vbox
#
################################################################################

KODI_PVR_VBOX_VERSION = 56d18dc1c6a41e38b54172a17255d2fe3173c9a5
KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
KODI_PVR_VBOX_LICENSE = GPL-2.0+
KODI_PVR_VBOX_LICENSE_FILES = src/client.h
KODI_PVR_VBOX_DEPENDENCIES = kodi-platform

$(eval $(cmake-package))
