################################################################################
#
# kodi-skin-confluence
#
################################################################################

KODI_SKIN_CONFLUENCE_VERSION = baaa01cc93d1fa42ebab419b0bdbf02121e6a277
KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
KODI_SKIN_CONFLUENCE_DEPENDENCIES = kodi

define KODI_SKIN_CONFLUENCE_BUILD_CMDS
	$(HOST_DIR)/bin/TexturePacker -input $(@D)/media/ -output $(@D)/media/Textures.xbt -dupecheck -use_none
endef

define KODI_SKIN_CONFLUENCE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence
	cp -dpfr $(@D)/* $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence
	find $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence/media -name *.jpg -delete
	find $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence/media -name *.png -delete
endef

$(eval $(generic-package))
