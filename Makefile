TARGET := iphone:7.1:6.0
ARCHS := armv7 armv7s arm64
include theos/makefiles/common.mk

TWEAK_NAME = YouTubeNoCapture
YouTubeNoCapture_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
