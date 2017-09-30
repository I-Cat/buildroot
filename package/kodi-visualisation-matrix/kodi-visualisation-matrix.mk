################################################################################
#
# kodi-visualisation-matrix
#
################################################################################

KODI_VISUALISATION_MATRIX_VERSION = 0.4.2
KODI_VISUALISATION_MATRIX_SITE = $(call github,xbmc,visualization.matrix,v$(KODI_VISUALISATION_MATRIX_VERSION))
KODI_VISUALISATION_MATRIX_LICENSE = GPL-2.0+
KODI_VISUALISATION_MATRIX_LICENSE_FILES = debian/copyright
KODI_VISUALISATION_MATRIX_DEPENDENCIES = glm kodi

$(eval $(cmake-package))