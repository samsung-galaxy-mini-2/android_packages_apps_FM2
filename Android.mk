ifeq ($(BOARD_HAVE_QCOM_MR1_FM),true)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(call all-java-files-under, src/com/caf/fmradio) \
	src/com/caf/fmradio/IFMRadioServiceCallbacks.aidl \
	src/com/caf/fmradio/IFMRadioService.aidl \
	src/com/caf/fmradio/IFMTransmitterServiceCallbacks.aidl \
	src/com/caf/fmradio/IFMTransmitterService.aidl \


ifeq ($(call is-platform-sdk-version-at-least,16),true)
LOCAL_SRC_FILES +=  $(call all-java-files-under, src/com/caf/hc_utils)
else
LOCAL_SRC_FILES +=  $(call all-java-files-under, src/com/caf/utils)
endif
LOCAL_PACKAGE_NAME := FM2
LOCAL_CERTIFICATE := platform
LOCAL_JNI_SHARED_LIBRARIES := libqcomfm_jni
LOCAL_JAVA_LIBRARIES := qcom.fmradio

include $(BUILD_PACKAGE)

endif
