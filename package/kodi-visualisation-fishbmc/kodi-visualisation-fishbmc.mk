################################################################################
#
# kodi-visualisation-fishbmc
#
################################################################################

KODI_VISUALISATION_FISHBMC_VERSION = 6.0.1-Matrix
KODI_VISUALISATION_FISHBMC_SITE = $(call github,xbmc,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
KODI_VISUALISATION_FISHBMC_LICENSE_FILES = visualization.fishbmc/LICENSE
KODI_VISUALISATION_FISHBMC_DEPENDENCIES = kodi

$(eval $(cmake-package))
