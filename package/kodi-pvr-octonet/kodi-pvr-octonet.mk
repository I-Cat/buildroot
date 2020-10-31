################################################################################
#
# kodi-pvr-octonet
#
################################################################################

KODI_PVR_OCTONET_VERSION = 4.0.1-Matrix
KODI_PVR_OCTONET_SITE = $(call github,DigitalDevices,pvr.octonet,$(KODI_PVR_OCTONET_VERSION))
KODI_PVR_OCTONET_LICENSE = GPL-2.0+
KODI_PVR_OCTONET_LICENSE_FILES = LICENSE.md
KODI_PVR_OCTONET_DEPENDENCIES = json-for-modern-cpp kodi

$(eval $(cmake-package))
