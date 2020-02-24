################################################################################
#
# kodi-inputstream-ffmpegdirect
#
################################################################################

KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 1.7.1-Matrix
KODI_INPUTSTREAM_FFMPEGDIRECT_SITE = $(call github,xbmc,inputstream.ffmpegdirect,$(KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION))
KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE = GPL-2.0+
KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE_FILES = debian/copyright
KODI_INPUTSTREAM_FFMPEGDIRECT_DEPENDENCIES = bzip2 ffmpeg libplatform kodi
KODI_INPUTSTREAM_FFMPEGDIRECT_CONF_OPTS = \
	-DFFMPEG_PATH=$(STAGING_DIR)/usr

$(eval $(cmake-package))
