################################################################################
#
# kodi-visualisation-spectrum
#
################################################################################

KODI_VISUALISATION_SPECTRUM_VERSION = 3.1.3-Matrix
KODI_VISUALISATION_SPECTRUM_SITE = $(call github,xbmc,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
KODI_VISUALISATION_SPECTRUM_LICENSE = GPL-2.0+
KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = COPYING
KODI_VISUALISATION_SPECTRUM_DEPENDENCIES = kodi

$(eval $(cmake-package))
