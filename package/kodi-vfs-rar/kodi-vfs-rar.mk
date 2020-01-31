################################################################################
#
# kodi-vfs-rar
#
################################################################################

KODI_VFS_RAR_VERSION = 3.1.4-Matrix
KODI_VFS_RAR_SITE = $(call github,xbmc,vfs.rar,$(KODI_VFS_RAR_VERSION))
KODI_VFS_RAR_LICENSE = unrar, GPL-2.0+
KODI_VFS_RAR_LICENSE_FILES = debian/copyright lib/UnrarXLib/license.txt
KODI_VFS_RAR_DEPENDENCIES = libplatform kodi

$(eval $(cmake-package))
