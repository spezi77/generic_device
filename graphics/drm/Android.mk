LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE:= drm.rc

LOCAL_INIT_RC := $(LOCAL_MODULE)

include $(BUILD_PHONY_PACKAGE)
