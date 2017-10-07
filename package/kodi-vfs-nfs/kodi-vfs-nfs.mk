################################################################################
#
# kodi-vfs-nfs
#
################################################################################

KODI_VFS_NFS_VERSION = d9ede317f40923d21645ac6fa118127a70b83730
KODI_VFS_NFS_SITE = $(call github,notspiff,vfs.nfs,$(KODI_VFS_NFS_VERSION))
KODI_VFS_NFS_LICENSE = GPL-2.0+
KODI_VFS_NFS_LICENSE_FILES = src/NFSFile.cpp
KODI_VFS_NFS_DEPENDENCIES = libnfs libplatform

$(eval $(cmake-package))
