################################################################################
#
# kodi-pvr-iptvsimple
#
################################################################################

KODI_PVR_IPTVSIMPLE_VERSION = 66d96807e0a28ce1d62c841ca5157c4779207f90
KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
KODI_PVR_IPTVSIMPLE_LICENSE_FILES = src/client.h
KODI_PVR_IPTVSIMPLE_DEPENDENCIES = kodi-platform rapidxml

$(eval $(cmake-package))
