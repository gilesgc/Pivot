INSTALL_TARGET_PROCESSES = SpringBoard

PACKAGE_VERSION=$(THEOS_PACKAGE_BASE_VERSION)

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Pivot

Pivot_FILES = Tweak.xm
Pivot_CFLAGS = -fobjc-arc
Pivot_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += pivotprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
