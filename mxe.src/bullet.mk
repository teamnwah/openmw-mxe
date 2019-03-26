# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := bullet
$(PKG)_WEBSITE  := https://bulletphysics.org/
$(PKG)_DESCR    := Bullet physics, version 2
$(PKG)_VERSION  := 2.86
$(PKG)_IGNORE   :=
$(PKG)_SUBDIR		:= $(PKG)3-$($(PKG)_VERSION)
$(PKG)_CHECKSUM := e6e8b755280ce2c1a8218529eae5dd78e184f7036854229cea611374ad5a671f
$(PKG)_GH_CONF  := bulletphysics/bullet3/releases
$(PKG)_URL_2		:= https://github.com/bulletphysics/bullet3/archive/$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := cc
$(PKG)_PATCHES  :=

define $(PKG)_BUILD
    cd '$(1)' && '$(TARGET)-cmake' . \
        -DINSTALL_LIBS=ON \
        -DBUILD_CPU_DEMOS=OFF \
        -DBUILD_DEMOS=OFF \
				-DBUILD_BULLET2_DEMOS=OFF \
        -DBUILD_EXTRAS=OFF \
        -DBUILD_MULTITHREADING=OFF \
        -DBUILD_UNIT_TESTS=OFF \
        -DUSE_CUSTOM_VECOR_MATH=OFF \
        -DUSE_DOUBLE_PRECISION=OFF \
        -DUSE_GLUT=OFF \
        -DUSE_GRAPHICAL_BENCHMARK=OFF
    $(MAKE) -C '$(1)' -j '$(JOBS)' install VERBOSE=1

    '$(TARGET)-g++'  \
				-Wall -Wextra -std=gnu++0x \
        '$(TEST_FILE)' -o '$(PREFIX)/$(TARGET)/bin/test-$(PKG).exe' \
        `'$(TARGET)-pkg-config' $(PKG) --cflags --libs`
endef
