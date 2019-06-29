################################################################################
#
# giflib
#
################################################################################

GIFLIB_VERSION = 5.2.1
GIFLIB_SITE = http://downloads.sourceforge.net/project/giflib
GIFLIB_INSTALL_STAGING = YES
GIFLIB_LICENSE = MIT
GIFLIB_LICENSE_FILES = COPYING

GIFLIB_BINS = \
	gif2epsn gif2ps gif2rgb gif2x11 gifasm gifbg gifbuild gifburst gifclip \
	gifclrmp gifcolor gifcomb gifcompose gifecho giffiltr giffix gifflip \
	gifhisto gifinfo gifinter gifinto gifovly gifpos gifrotat \
	gifrsize gifspnge giftext giftool gifwedge icon2gif raw2gif rgb2gif \
	text2gif

define GIFLIB_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define HOST_GIFLIB_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
endef

define GIFLIB_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr install
endef

define GIFLIB_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr install
endef

define GIFLIB_BINS_CLEANUP
	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(GIFLIB_BINS))
endef

GIFLIB_POST_INSTALL_TARGET_HOOKS += GIFLIB_BINS_CLEANUP

define HOST_GIFLIB_INSTALL_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) PREFIX=/ install
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
