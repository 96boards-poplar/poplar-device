
#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ifndef PRODUCT_TARGET
PRODUCT_TARGET := aosp
endif

# Must be of same value as in the ro.hardware, and/or
# androidboot.hardware cmdline
HW := poplar

# Kernel
LOCAL_KERNEL := device/hisilicon/poplar-kernel/Image
PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel

# use this a hack to place dtb in to the boot.img
LOCAL_DTB := device/hisilicon/poplar-kernel/hi3798cv200-poplar.dtb
PRODUCT_COPY_FILES += $(LOCAL_DTB):2ndbootloader

# rootfs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootfs/init.poplar.rc:root/init.$(HW).rc \
    $(LOCAL_PATH)/rootfs/init.poplar.usb.rc:root/init.$(HW).usb.rc \
    $(LOCAL_PATH)/rootfs/ueventd.poplar.rc:root/ueventd.$(HW).rc \
    $(LOCAL_PATH)/rootfs/fstab.poplar:root/fstab.$(HW)

include $(LOCAL_PATH)/properties.mk

PRODUCT_PACKAGES += \
	android.hardware.keymaster@3.0-impl \
	android.hardware.keymaster@3.0-service


# include the feature .mk file here
include ${LOCAL_PATH}/feature_graphic.mk
include $(LOCAL_PATH)/feature_audio.mk
#include $(LOCAL_PATH)/feature_bluetooth.mk
#include $(LOCAL_PATH)/feature_wifi.mk

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/manifest.xml:system/vendor/manifest.xml

# hardware features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/android.hardware.screen.landscape.xml:system/etc/permissions/android.hardware.screen.landscape.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.print.xml:system/etc/permissions/android.software.print.xml \
    frameworks/native/data/etc/android.software.webview.xml:system/etc/permissions/android.software.webview.xml \
    frameworks/native/data/etc/android.software.backup.xml:system/etc/permissions/android.software.backup.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \

# codec
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/media_codecs.xml:/system/etc/media_codecs.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=96m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=2m

$(call inherit-product, vendor/hisilicon/poplar/device-vendor.mk)
