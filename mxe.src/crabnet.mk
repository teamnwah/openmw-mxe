PKG             := crabnet
$(PKG)_WEBSITE  := https://github.com/TES3MP/CrabNet
$(PKG)_DESCR    := CrabNet is a cross platform, open source, C++ networking engine for game programmers.
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.001
$(PKG)_SUBDIR		:= CrabNet-feaute-mingw-support
$(PKG)_CHECKSUM := 52dc30b8aaf805482f1703f71b82d6f560df813ec04b858728d70ec9034e43f6
$(PKG)_GH_CONF  := teamnwah/CrabNet/branches/feaute/mingw-support
$(PKG)_URL_2		:= https://github.com/teamnwah/CrabNet/archive/feaute/mingw-support.tar.gz
$(PKG)_DEPS     := cc

define $(PKG)_BUILD
    cd '$(BUILD_DIR)' && $(TARGET)-cmake '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j $(JOBS)
		$(INSTALL) -d '$(PREFIX)/$(TARGET)/include/raknet'
    $(INSTALL) -m644 '$(BUILD_DIR)/include/raknet'/* '$(PREFIX)/$(TARGET)/include/raknet'
		$(INSTALL) -m644 '$(BUILD_DIR)/lib/libRakNetLibStatic.a' '$(PREFIX)/$(TARGET)/lib'
endef
