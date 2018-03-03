################################################################################
#
# kodi-peripheral-steamcontroller
#
################################################################################

KODI_PERIPHERAL_STEAMCONTROLLER_VERSION = 884d5f0c1be70b379631d55779fdcc21e1ca2ec9
KODI_PERIPHERAL_STEAMCONTROLLER_SITE = $(call github,kodi-game,peripheral.steamcontroller,$(KODI_PERIPHERAL_STEAMCONTROLLER_VERSION))
KODI_PERIPHERAL_STEAMCONTROLLER_LICENSE = GPL-2.0+
KODI_PERIPHERAL_STEAMCONTROLLER_LICENSE_FILES = src/addon.cpp
KODI_PERIPHERAL_STEAMCONTROLLER_DEPENDENCIES = kodi-platform libusb

$(eval $(cmake-package))
