PACKAGE_VERSION=$(THEOS_PACKAGE_BASE_VERSION)

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Pivot

Pivot_FILES = PIVRootListController.m
Pivot_INSTALL_PATH = /Library/PreferenceBundles
Pivot_FRAMEWORKS = UIKit
Pivot_PRIVATE_FRAMEWORKS = Preferences
Pivot_CFLAGS = -fobjc-arc
Pivot_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Pivot.plist$(ECHO_END)
