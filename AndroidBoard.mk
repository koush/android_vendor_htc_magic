LOCAL_PATH := $(call my-dir)

# kernel binary
#
ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
endif

file := $(INSTALLED_KERNEL_TARGET)
ALL_PREBUILT += $(file)
$(file): $(TARGET_PREBUILT_KERNEL) | $(ACP)
	$(transform-prebuilt-to-target)

# keyboard layouts
#
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/trout-keypad-v3.kl:system/usr/keylayout/trout-keypad-v3.kl \
	$(LOCAL_PATH)/trout-keypad-qwertz.kl:system/usr/keylayout/trout-keypad-qwertz.kl \
	$(LOCAL_PATH)/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

# default apns list
#
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/apns.xml:system/etc/apns-conf.xml

# keyboard maps
#
include $(CLEAR_VARS)
LOCAL_SRC_FILES := trout-keypad-v3.kcm
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := trout-keypad-qwertz.kcm
include $(BUILD_KEY_CHAR_MAP)

# board specific init.rc
#
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.sapphire.rc:root/init.sapphire.rc

# prebuilt wifi driver
#
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/wlan.ko:system/lib/modules/wlan.ko

# vold.conf
#
#
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/vold.conf:system/etc/vold.conf

# htc proprietary code
#
proprietary := $(LOCAL_PATH)/proprietary

PRODUCT_COPY_FILES += \
	$(proprietary)/libhtc_ril.so:system/lib/libhtc_ril.so \
	$(proprietary)/libaudioeq.so:system/lib/libaudioeq.so \
	$(proprietary)/libqcamera.so:system/lib/libqcamera.so \
	$(proprietary)/libgps.so:obj/lib/libgps.so \
	$(proprietary)/libgps.so:system/lib/libgps.so \
	$(proprietary)/libOmxCore.so:obj/lib/libOmxCore.so \
	$(proprietary)/libOmxCore.so:system/lib/libOmxCore.so \
	$(proprietary)/libhgl.so:system/lib/libhgl.so \
	$(proprietary)/libhtc_acoustic.so:system/lib/libhtc_acoustic.so \
	$(proprietary)/libjni_pinyinime.so:system/lib/libjni_pinyinime.so \
	$(proprietary)/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
	$(proprietary)/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
	$(proprietary)/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
	$(proprietary)/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
	$(proprietary)/libopencorehw.so:system/lib/libopencorehw.so \
	$(proprietary)/libpvasf.so:system/lib/libpvasf.so \
	$(proprietary)/libpvasfreg.so:system/lib/libpvasfreg.so \
	$(proprietary)/libspeech.so:system/lib/libspeech.so \
	$(proprietary)/sensors.sapphire.so:system/lib/hw/sensors.sapphire.so \
	$(proprietary)/copybit.msm7k.so:system/lib/hw/copybit.msm7k.so \
	$(proprietary)/brf6300.bin:system/etc/firmware/brf6300.bin \
	$(proprietary)/akmd:system/bin/akmd \
	$(proprietary)/AudioFilter.csv:system/etc/AudioFilter.csv

PRODUCT_COPY_FILES += \
	$(proprietary)/AudioPara4.csv:system/etc/AudioPara4.csv \
	$(proprietary)/gps.conf:system/etc/gps.conf

PRODUCT_COPY_FILES += \
	$(proprietary)/tiwlan.ini:system/etc/wifi/tiwlan.ini \
	$(proprietary)/Fw1251r1c.bin:system/etc/wifi/Fw1251r1c.bin

PRODUCT_COPY_FILES += \
	$(proprietary)/lights.msm7k.so:system/lib/hw/lights.msm7k.so \
	$(proprietary)/AudioPreProcess.csv:system/etc/AudioPreProcess.csv

BOARD_KERNEL_BASE := 0x19200000
