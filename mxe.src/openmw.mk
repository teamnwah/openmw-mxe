PKG             := openmw
$(PKG)_DESCR    := Fast, flexible and simple GUI.
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.45.0
$(PKG)_SUBDIR   := openmw-openmw-$($(PKG)_VERSION)
$(PKG)_CHECKSUM := b63cf971f406ef5f28019f65e9e2bd9641a227459ede45d147562917f67e1c64
$(PKG)_GH_CONF  := openmw/openmw/releases
$(PKG)_URL_2    := https://github.com/openmw/openmw/archive/openmw-$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := cc bullet qt openscenegraph boost ffmpeg openal sdl2 mygui

define $(PKG)_BUILD
    cd '$(BUILD_DIR)' && $(TARGET)-cmake '$(SOURCE_DIR)' \
      -DMyGUI_LIBRARY=$(PREFIX)/$(TARGET)/lib/Release/libMyGUIEngineStatic.a \
      -DMYGUI_STATIC=ON \
      -DBOOST_STATIC=ON \
      -DSDL2_STATIC=ON \
      -DOSG_STATIC=ON \
      -DOSG_PLUGINS_DIR=$(PREFIX)/$(TARGET)/lib/osgPlugins-${openscenegraph_VERSION}.0 \
      -DQT_STATIC=ON \
      -DRECASTNAVIGATION_STATIC=ON \
      -DBUILD_OPENCS=OFF \
      -DBUILD_NIFTEST=OFF \
      -DBUILD_LAUNCHER=OFF \
      -DBUILD_WIZARD=OFF \
      -DBUILD_MWINIIMPORTER=OFF \
      -DBUILD_ESSIMPORTER=OFF \
      -DBUILD_BSATOOL=OFF \
      -DBUILD_ESMTOOL=OFF \
      -DBUILD_SHARED_LIBS=OFF \
      -DCMAKE_CXX_FLAGS="-static -Wa,-mbig-obj -Wl,-Bstatic -DAL_LIBTYPE_STATIC" \
      -DOPENMW_STATIC=ON \
      -DOPENMW_CXX_FLAGS="-Wl,-Bstatic `$(TARGET)-pkg-config --static --cflags --libs libjpeg openal freetype2 sdl2 gl libavcodec libavdevice libavfilter libavformat libavresample libavutil`"
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)' VERBOSE=1
    $(TARGET)-strip '$(BUILD_DIR)/openmw.exe'
    mkdir -p '$(PREFIX)/$(TARGET)/opt/openmw'
    cp '$(BUILD_DIR)/openmw.exe' '$(PREFIX)/$(TARGET)/opt/openmw'
endef
