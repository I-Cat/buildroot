################################################################################
#
# libpjsip
#
################################################################################

LIBPJSIP_VERSION = 2.7.2
LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.bz2
LIBPJSIP_SITE = http://www.pjsip.org/release/$(LIBPJSIP_VERSION)
LIBPJSIP_DEPENDENCIES = libsrtp
LIBPJSIP_LICENSE = GPL-2.0+
LIBPJSIP_LICENSE_FILES = COPYING
LIBPJSIP_INSTALL_STAGING = YES
LIBPJSIP_MAKE = $(MAKE1)

# Asterisk patch set
LIBPJSIP_PATCH = \
	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0000-set_apps_initial_log_level.patch \
	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0021-sip_parser-Fix-return-code-in-pjsip_find_msg-and-add.patch \
	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0030-sip_transport-Destroy-transports-not-in-hash.patch \
	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0040-183_without_to_tag.patch \
	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0050-dont_terminate_session_early.patch \
	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0060-sip_msg-Prevent-crash-on-header-without-vptr.patch \
	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0070-os_core_unix-Set-mutex-NULL-in-atomic-destroy-and-ad.patch \
	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0080-timer-Clean-up-usage-of-timer-heap.patch \
	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0090-sip_transaction-In-tsx_timer_callback-check-if-tsx-i.patch \
	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0100-sip_inv-Add-option-to-accept-updated-SDP-on-same-To-.patch

LIBPJSIP_CFLAGS = $(TARGET_CFLAGS) -DPJ_HAS_IPV6=1

# relocation truncated to fit: R_68K_GOT16O
ifeq ($(BR2_m68k_cf),y)
LIBPJSIP_CFLAGS += -mxgot
endif

LIBPJSIP_CONF_ENV = \
	LD="$(TARGET_CC)" \
	CFLAGS="$(LIBPJSIP_CFLAGS)"

LIBPJSIP_CONF_OPTS = \
	--disable-sound \
	--disable-resample \
	--disable-video \
	--disable-opencore-amr \
	--disable-g7221-codec \
	--disable-ilbc-codec \
	--disable-libwebrtc \
	--disable-opus \
	--disable-oss \
	--disable-ext-sound \
	--disable-g711-codec \
	--disable-l16-codec \
	--disable-g722-codec \
	--disable-libsamplerate \
	--disable-sdl \
	--disable-ffmpeg \
	--disable-v4l2 \
	--disable-openh264 \
	--disable-libyuv \
	--disable-ipp \
	--disable-silk \
	--with-external-srtp

# Note: aconfigure.ac is broken: --enable-epoll or --disable-epoll will
# both enable it. But that's OK, epoll is better than the alternative,
# so we want to use it.
LIBPJSIP_CONF_OPTS += --enable-epoll

ifeq ($(BR2_PACKAGE_LIBGSM),y)
LIBPJSIP_CONF_OPTS += \
	--enable-gsm-codec \
	--with-external-gsm
LIBPJSIP_DEPENDENCIES += libgsm
else
LIBPJSIP_CONF_OPTS += \
	--disable-gsm-codec
endif

ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
LIBPJSIP_DEPENDENCIES += libopenssl
LIBPJSIP_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
else
LIBPJSIP_CONF_OPTS += --disable-ssl
endif

ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
LIBPJSIP_CONF_OPTS += \
	--enable-speex-aec \
	--enable-speex-codec \
	--with-external-speex
LIBPJSIP_DEPENDENCIES += speex speexdsp
else
LIBPJSIP_CONF_OPTS += \
	--disable-speex-aec \
	--disable-speex-codec
endif

ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
LIBPJSIP_DEPENDENCIES += util-linux
endif

# disable build of test binaries
LIBPJSIP_MAKE_OPTS = lib

$(eval $(autotools-package))
