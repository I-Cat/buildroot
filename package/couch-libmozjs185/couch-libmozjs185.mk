################################################################################
#
# couch-libmozjs185
#
################################################################################

COUCH_LIBMOZJS185_VERSION = 3c9330beac523e50088c938988fed37206d33e63
COUCH_LIBMOZJS185_SITE = $(call github,apache,couchdb-pkg,$(COUCH_LIBMOZJS185_VERSION))
COUCH_LIBMOZJS185_SUBDIR = js-1.8.5/js/src
COUCH_LIBMOZJS185_LICENSE = MPL-1.1 or GPL-2.0+ or LGPL-2.1+
COUCH_LIBMOZJS185_INSTALL_STAGING = YES
COUCH_LIBMOZJS185_DEPENDENCIES = host-zip libnspr

# Extract the js185 tarball inside the sources
define COUCH_LIBMOZJS185_EXTRACT_JS185
	$(call suitable-extractor,$(@D)/js/src/js185-1.0.0.tar.gz) \
		$(@D)/js/src/js185-1.0.0.tar.gz | \
	$(TAR) --strip-components=0 -C $(@D) $(TAR_OPTIONS) -
endef
COUCH_LIBMOZJS185_POST_EXTRACT_HOOKS += COUCH_LIBMOZJS185_EXTRACT_JS185

# Apply the Debian patches before applying the Buildroot patches
define COUCH_LIBMOZJS185_DEBIAN_PATCH
	$(APPLY_PATCHES) $(@D)/js-1.8.5 $(@D)/js/debian/patches \*
endef
COUCH_LIBMOZJS185_PRE_PATCH_HOOKS += COUCH_LIBMOZJS185_DEBIAN_PATCH

# To detect endianess a host binary is built from jscpucfg.cpp which is
# not cross-compile friendly, so we force endianess.
# HOST_CFLAGS are forced to avoid problems when detecting host gcc
# because configure would pass TARGET_CFLAGS to the host gcc.
COUCH_LIBMOZJS185_CONF_ENV = \
	HOST_CFLAGS="$(HOST_CFLAGS)" \
	HOST_CXXFLAGS="$(HOST_CXXFLAGS) -DFORCE_$(BR2_ENDIAN)_ENDIAN" \
	$(if $(BR2_powerpc)$(BR2_x86_64),ac_cv_va_val_copy=no)

# Mozilla mixes up target, host and build.  See the comment in configure.in
# around line 360.  Also, nanojit fails to build on sparc64 with
# #error "unknown nanojit architecture", so disable the JIT.
# Disable JIT for armv4 because this CPU does not support the asm code
# used in spidermonkey.
COUCH_LIBMOZJS185_CONF_OPTS = \
	--target=$(GNU_TARGET_NAME) \
	--build=$(GNU_TARGET_NAME) \
	--host=$(GNU_HOST_NAME) \
	--disable-methodjit \
	--disable-strip \
	--with-system-nspr \
	--with-nspr-exec-prefix=$(STAGING_DIR)/usr \
	--disable-tests

# the libffi package is not available on thumb2-only platforms
ifeq ($(BR2_ARM_CPU_ARMV7M),y)
COUCH_LIBMOZJS185_CONF_OPTS += --enable-system-ffi
COUCH_LIBMOZJS185_DEPENDENCIES += host-pkgconf libffi
else
COUCH_LIBMOZJS185_CONF_OPTS += --disable-system-ffi
endif

$(eval $(autotools-package))
