################################################################################
#
# kodi-pvr-hdhomerun
#
################################################################################

KODI_PVR_HDHOMERUN_VERSION = dbbf52e07a419257695dcc53249abb65dce447fc
KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
KODI_PVR_HDHOMERUN_LICENSE = GPL-2.0+
KODI_PVR_HDHOMERUN_LICENSE_FILES = src/client.h
KODI_PVR_HDHOMERUN_DEPENDENCIES = jsoncpp kodi-platform libhdhomerun

$(eval $(cmake-package))
