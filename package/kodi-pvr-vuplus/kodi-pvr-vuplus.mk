################################################################################
#
# kodi-pvr-vuplus
#
################################################################################

KODI_PVR_VUPLUS_VERSION = 641db7228689673bf12b7861ea2dadaa318ca6d1
KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
KODI_PVR_VUPLUS_LICENSE_FILES = src/client.h
KODI_PVR_VUPLUS_DEPENDENCIES = json-for-modern-cpp kodi-platform tinyxml

$(eval $(cmake-package))
