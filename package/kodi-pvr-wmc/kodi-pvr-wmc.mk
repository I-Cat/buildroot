################################################################################
#
# kodi-pvr-wmc
#
################################################################################

KODI_PVR_WMC_VERSION = 3.2.5-Matrix
KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
KODI_PVR_WMC_LICENSE = GPL-2.0+
KODI_PVR_WMC_LICENSE_FILES = LICENSE.md
KODI_PVR_WMC_DEPENDENCIES = kodi-platform

$(eval $(cmake-package))
