ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = FreeFire

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FFMenu

FFMenu_FILES = Tweak.xm
FFMenu_CFLAGS = -fobjc-arc -I./imgui -I./KittyMemory
FFMenu_FRAMEWORKS = UIKit Metal MetalKit QuartzCore
FFMenu_LDFLAGS = -L./imgui -limgui -L./KittyMemory -lKittyMemory

include $(THEOS_MAKE_PATH)/tweak.mk
