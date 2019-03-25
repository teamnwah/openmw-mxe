# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := openscenegraph
$(PKG)_WEBSITE  := http://www.openscenegraph.org/
$(PKG)_DESCR    := OpenSceneGraph
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.6
$(PKG)_CHECKSUM := 7f27ad127e768544be8bc81209e9447352089400980fc27c11717c72885cedaa
$(PKG)_GH_CONF  := OpenMW/osg/branches/3.6
$(PKG)_SUBDIR   := osg-$($(PKG)_VERSION)
$(PKG)_URL_2		:= https://github.com/OpenMW/osg/archive/3.6.tar.gz
$(PKG)_DEPS     := cc boost curl dcmtk freetype gdal giflib gstreamer \
                   gta jasper jpeg libpng openal openexr openthreads poppler \
                   tiff zlib

define $(PKG)_BUILD
    cd '$(BUILD_DIR)' && '$(TARGET)-cmake' '$(SOURCE_DIR)' \
        -DCMAKE_CXX_FLAGS='-D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS' \
        -DCMAKE_HAVE_PTHREAD_H=OFF \
        -DOSG_DETERMINE_WIN_VERSION=OFF \
        -DPKG_CONFIG_EXECUTABLE='$(PREFIX)/bin/$(TARGET)-pkg-config' \
        -DDYNAMIC_OPENTHREADS=$(CMAKE_SHARED_BOOL) \
        -DDYNAMIC_OPENSCENEGRAPH=$(CMAKE_SHARED_BOOL) \
        -DBUILD_OSG_APPLICATIONS=OFF \
        -DPOPPLER_HAS_CAIRO_EXITCODE=0 \
        -D_OPENTHREADS_ATOMIC_USE_GCC_BUILTINS_EXITCODE=1 \
        -D_OPENTHREADS_ATOMIC_USE_WIN32_INTERLOCKED=1

    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)' VERBOSE=1
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install VERBOSE=1
endef
