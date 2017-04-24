################################################################################
#
# kodi-vfs-sftp
#
################################################################################

KODI_VFS_SFTP_VERSION = 3ab3969b6d7d273743594a4f3a90d1350fc9bc54
KODI_VFS_SFTP_SITE = $(call github,xbmc,vfs.sftp,$(KODI_VFS_SFTP_VERSION))
KODI_VFS_SFTP_LICENSE = GPL-2.0
KODI_VFS_SFTP_LICENSE_FILES = src/SFTPFile.cpp
KODI_VFS_SFTP_DEPENDENCIES = kodi-platform libplatform libssh

$(eval $(cmake-package))
