################################################################################
#
# kodi-screensaver-rsxs
#
################################################################################

KODI_SCREENSAVER_RSXS_VERSION = 1.3.0
KODI_SCREENSAVER_RSXS_SITE = $(call github,notspiff,screensavers.rsxs,v$(KODI_SCREENSAVER_RSXS_VERSION))
KODI_SCREENSAVER_RSXS_LICENSE = GPL-3.0
KODI_SCREENSAVER_RSXS_DEPENDENCIES = bzip2 gli glm kodi xlib_libXmu

$(eval $(cmake-package))
