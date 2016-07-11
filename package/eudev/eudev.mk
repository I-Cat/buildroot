################################################################################
#
# eudev
#
################################################################################

EUDEV_VERSION = 3.2.9
EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
EUDEV_LICENSE_FILES = COPYING
EUDEV_INSTALL_STAGING = YES

EUDEV_PROVIDES = libudev

ifeq ($(BR2_PACKAGE_EUDEV_DAEMON),y)

EUDEV_CONF_OPTS = \
	--disable-manpages \
	--sbindir=/sbin \
	--libexecdir=/lib \
	--disable-introspection \
	--enable-kmod \
	--enable-blkid

EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
EUDEV_PROVIDES = udev

ifeq ($(BR2_ROOTFS_MERGED_USR),)
EUDEV_CONF_OPTS += --with-rootlibdir=/lib --enable-split-usr
endif

ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
EUDEV_CONF_OPTS += --enable-rule-generator
else
EUDEV_CONF_OPTS += --disable-rule-generator
endif

ifeq ($(BR2_PACKAGE_EUDEV_ENABLE_HWDB),y)
EUDEV_CONF_OPTS += --enable-hwdb
else
EUDEV_CONF_OPTS += --disable-hwdb
endif

ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
EUDEV_CONF_OPTS += --enable-selinux
EUDEV_DEPENDENCIES += libselinux
else
EUDEV_CONF_OPTS += --disable-selinux
endif

define EUDEV_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
endef

# Avoid installing S10udev with openrc, as the service is started by a unit
# from the udev-gentoo-scripts package.
define EUDEV_INSTALL_INIT_OPENRC
	@:
endef

# Required by default rules for input devices
define EUDEV_USERS
	- - input -1 * - - - Input device group
	- - render -1 * - - - DRI rendering nodes
	- - kvm -1 * - - - kvm nodes
endef

else # BR2_PACKAGE_EUDEV_DAEMON

EUDEV_DEPENDENCIES = host-gperf host-pkgconf

EUDEV_CONF_OPTS = \
	--disable-manpages \
	--disable-introspection \
	--disable-blkid \
	--disable-selinux \
	--disable-kmod \
	--disable-hwdb \
	--disable-rule-generator

# When not installing the daemon, we have to override the build and
# install commands, to just install the library.

define EUDEV_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
		-C $(@D)/src/shared
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
		-C $(@D)/src/libudev
endef

# Symlink udev.pc to libudev.pc for those packages that conflate the two
# and 'Requires: udev' when they should just 'Requires: libudev'. Do the
# symlink, to avoid patching each and all of those packages.
# Note: nothing to install from src/shared, only from src/libudev
define EUDEV_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
		-C $(@D)/src/libudev DESTDIR=$(STAGING_DIR) install
	ln -sf libudev.pc $(STAGING_DIR)/usr/lib/pkgconfig/udev.pc
endef

define EUDEV_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
		-C $(@D)/src/libudev DESTDIR=$(TARGET_DIR) install
endef

endif # BR2_PACKAGE_EUDEV_DAEMON

HOST_EUDEV_DEPENDENCIES = host-gperf host-pkgconf

HOST_EUDEV_SYSCONFDIR = $(if $(BR2_PACKAGE_SYSTEMD),/usr/lib,/etc)
HOST_EUDEV_CONF_OPTS = \
	--prefix=/usr \
	--sbindir=/sbin \
	--libexecdir=/lib \
	--with-rootlibdir=/lib \
	--sysconfdir=$(HOST_EUDEV_SYSCONFDIR) \
	--disable-blkid \
	--disable-introspection \
	--disable-kmod \
	--disable-manpages \
	--disable-rule-generator \
	--disable-selinux \
	--enable-hwdb

define HOST_EUDEV_INSTALL_CMDS
	$(INSTALL) -D -m 0755 $(@D)/src/udev/udevadm \
		$(HOST_DIR)/bin/udevadm
endef

define HOST_EUDEV_BUILD_HWDB
	$(HOST_DIR)/bin/udevadm hwdb --update --root $(TARGET_DIR)
endef
HOST_EUDEV_TARGET_FINALIZE_HOOKS += HOST_EUDEV_BUILD_HWDB

# Note: this will run in the filesystem context, so will use a copy
# of tharget/, not the real one, so the files are still available on
# re-builds (foo-rebuild, etc...)
define HOST_EUDEV_RM_HWDB_SRC
	rm -rf $(TARGET_DIR)/$(HOST_EUDEV_SYSCONFDIR)/udev/hwdb.d/
endef
HOST_EUDEV_ROOTFS_PRE_CMD_HOOKS += HOST_EUDEV_RM_HWDB_SRC

$(eval $(autotools-package))
$(eval $(host-autotools-package))
