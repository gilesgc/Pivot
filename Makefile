INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Pivot

Pivot_FILES = Tweak.xm
Pivot_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
