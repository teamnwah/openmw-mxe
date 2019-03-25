PKG             := mygui
$(PKG)_WEBSITE  := https://github.com/TES3MP/CrabNet
$(PKG)_DESCR    := Fast, flexible and simple GUI.
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.2.1
$(PKG)_CHECKSUM := 37232d736159cd7d1a4d0291d714964505b7edc8d65cb0147533259d102f78cc
$(PKG)_GH_CONF  := MyGUI/mygui/releases,MyGUI
$(PKG)_URL_2		:= https://github.com/MyGUI/mygui/archive/MyGUI$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := cc freetype zlib

define $(PKG)_BUILD
    cd '$(BUILD_DIR)' && $(TARGET)-cmake '$(SOURCE_DIR)' \
		  -DMYGUI_RENDERSYSTEM=1 \
			-DMYGUI_BUILD_DEMOS=OFF \
		  -DMYGUI_BUILD_TOOLS=OFF \
			-DMYGUI_BUILD_PLUGINS=OFF \
			-DMYGUI_STATIC=ON \
			-DMYGUI_STANDALONE_BUILD=ON

		$(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)' VERBOSE=1
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install VERBOSE=1
endef
