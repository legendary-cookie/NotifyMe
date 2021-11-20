ARCHS := arm64 arm64e
TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NotifyMe

NotifyMe_FILES = Tweak.x udp.m
NotifyMe_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
