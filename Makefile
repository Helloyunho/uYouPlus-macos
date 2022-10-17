TARGET = iphone:clang:latest:13.0
uYouPlus_USE_FLEX = 0
uYouPlus_USE_FISHHOOK = 0
ARCHS = arm64
MODULES = jailed
FINALPACKAGE = 1
CODESIGN_IPA = 0
PACKAGE_VERSION = 17.40.5_2.1

TWEAK_NAME = uYouPlus
DISPLAY_NAME = YouTube
BUNDLE_ID = com.google.ios.youtube
 
uYouPlus_INJECT_DYLIBS = Tweaks/uYou/Library/MobileSubstrate/DynamicLibraries/uYou.dylib .theos/obj/iSponsorBlock.dylib .theos/obj/YTUHD.dylib .theos/obj/YouPiP.dylib .theos/obj/YouTubeDislikesReturn.dylib .theos/obj/YTABConfig.dylib
uYouPlus_FILES = uYouPlus.xm Settings.xm
uYouPlus_IPA = ./tmp/Payload/YouTube.app
uYouPlus_FRAMEWORKS = UIKit Security
uYouPlus_CFLAGS = -fobjc-arc -DTWEAK_VERSION=$(PACKAGE_VERSION)

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += Tweaks/iSponsorBlock Tweaks/YTUHD Tweaks/YouPiP Tweaks/Return-YouTube-Dislikes Tweaks/YTABConfig
include $(THEOS_MAKE_PATH)/aggregate.mk

before-package::
	@echo -e "==> \033[1mMoving tweak's bundle to Resources/...\033[0m"
	@mkdir -p Resources/
	@cp -R Tweaks/YouPiP/layout/Library/Application\ Support/YouPiP.bundle Resources/
	@cp -R Tweaks/YTUHD/layout/Library/Application\ Support/YTUHD.bundle Resources/
	@cp -R Tweaks/Return-YouTube-Dislikes/layout/Library/Application\ Support/RYD.bundle Resources/
	@cp -R Tweaks/YTABConfig/layout/Library/Application\ Support/YTABC.bundle Resources/
	@cp -R Tweaks/iSponsorBlock/layout/Library/Application\ Support/iSponsorBlock.bundle Resources/
	@cp -R Tweaks/uYou/Library/Application\ Support/uYouBundle.bundle Resources/
	@cp -R lang/uYouPlus.bundle Resources/
