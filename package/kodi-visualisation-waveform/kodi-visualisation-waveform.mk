################################################################################
#
# kodi-visualisation-waveform
#
################################################################################

KODI_VISUALISATION_WAVEFORM_VERSION = 4.1.1-Matrix
KODI_VISUALISATION_WAVEFORM_SITE = $(call github,xbmc,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
KODI_VISUALISATION_WAVEFORM_LICENSE = GPL-2.0+
KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = COPYING
KODI_VISUALISATION_WAVEFORM_DEPENDENCIES = kodi

$(eval $(cmake-package))
