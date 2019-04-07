################################################################################
#
# libva
#
################################################################################

LIBVA_VERSION = 2.4.1
LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
LIBVA_LICENSE = MIT
LIBVA_LICENSE_FILES = COPYING
LIBVA_INSTALL_STAGING = YES
LIBVA_DEPENDENCIES = host-pkgconf libdrm

# libdrm is a hard-dependency
LIBVA_CONF_OPTS = \
	--enable-drm \
	--disable-glx \
	--with-drivers-path="/usr/lib/va"

ifeq ($(BR2_PACKAGE_XORG7),y)
LIBVA_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
LIBVA_CONF_OPTS += --enable-x11
else
LIBVA_CONF_OPTS += --disable-x11
endif

ifeq ($(BR2_PACKAGE_WAYLAND),y)
LIBVA_DEPENDENCIES += wayland
LIBVA_CONF_ENV += ac_cv_path_WAYLAND_SCANNER=$(HOST_DIR)/usr/bin/wayland-scanner
LIBVA_CONF_OPTS += --enable-wayland
else
LIBVA_CONF_OPTS += --disable-wayland
endif

$(eval $(autotools-package))
