################################################################################
#
# kodi-vfs-rar
#
################################################################################

KODI_VFS_RAR_VERSION = e6b5114ab44665ef19d6e288d9570010170700c9
KODI_VFS_RAR_SITE = $(call github,xbmc,vfs.rar,$(KODI_VFS_RAR_VERSION))
KODI_VFS_RAR_LICENSE = unrar
KODI_VFS_RAR_LICENSE_FILES = lib/UnrarXLib/license.txt
KODI_VFS_RAR_DEPENDENCIES = libplatform kodi-platform

$(eval $(cmake-package))
