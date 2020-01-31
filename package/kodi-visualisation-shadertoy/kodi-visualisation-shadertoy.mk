################################################################################
#
# kodi-visualisation-shadertoy
#
################################################################################

KODI_VISUALISATION_SHADERTOY_VERSION = 2.0.2-Matrix
KODI_VISUALISATION_SHADERTOY_SITE = $(call github,xbmc,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = debian/copyright
KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = glm kodi libplatform

$(eval $(cmake-package))
