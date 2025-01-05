export TARGET = iphone:clang:17.5:15.0
export SDK_PATH = $(THEOS)/sdks/iPhoneOS17.5.sdk/
export SYSROOT = $(SDK_PATH)
export ARCHS = arm64

export libFLEX_ARCHS = arm64

ifndef TikTok_VERSION
TikTok_VERSION = 37.8.0
endif
ifndef BHTikTokPlusPlus_VERSION
BHTikTokPlusPlus_VERSION = 1.7.0
endif
PACKAGE_NAME = $(TWEAK_NAME)
PACKAGE_VERSION = $(TikTok_VERSION)-$(BHTikTokPlusPlus_VERSION)

include $(THEOS)/makefiles/common.mk

INSTALL_TARGET_PROCESSES = TikTok
TWEAK_NAME = BHTikTokPlusPlus
DISPLAY_NAME = TikTok
BUNDLE_ID = com.ss.iphone.ugc.Ame

$(TWEAK_NAME)_FILES := Tweak.x $(wildcard *.m JGProgressHUD/*.m Settings/*.m)
$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation CoreGraphics Photos CoreServices SystemConfiguration SafariServices Security QuartzCore
$(TWEAK_NAME)_PRIVATE_FRAMEWORKS = Preferences
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wno-unused-variable -Wno-unused-value -Wno-deprecated-declarations -Wno-nullability-completeness -Wno-unused-function -Wno-incompatible-pointer-types

include $(THEOS_MAKE_PATH)/tweak.mk

REMOVE_EXTENSIONS = 1
CODESIGN_IPA = 0