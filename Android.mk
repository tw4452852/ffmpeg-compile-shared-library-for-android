LOCAL_PATH := $(call my-dir)

define include-lib
include $$(CLEAR_VARS)

LOCAL_MODULE := $$(basename $(1))_ffmpeg
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_MULTILIB := both
LOCAL_SRC_FILES_32 := out/x86/lib/$(1)
LOCAL_SRC_FILES_64 := out/x86_64/lib/$(1)

include $(BUILD_PREBUILT)
endef

FFMPEG_LIBS := \
	libavcodec.so \
	libavdevice.so \
	libavfilter.so \
	libavformat.so \
	libavutil.so \
	libswresample.so \
	libswscale.so


$(foreach a,$(FFMPEG_LIBS),$(eval $(call include-lib,$(a))))
