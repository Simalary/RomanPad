ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = RomanPadPrefs
RomanPadPrefs_FILES = RPADRootListController.m
RomanPadPrefs_INSTALL_PATH = /Library/PreferenceBundles
RomanPadPrefs_FRAMEWORKS = UIKit
RomanPadPrefs_PRIVATE_FRAMEWORKS = Preferences
RomanPadPrefs_LDFLAGS += -F../Frameworks/

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/RomanPadPrefs.plist$(ECHO_END)
