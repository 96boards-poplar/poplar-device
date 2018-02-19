# kerenl and dtb - bootimage
LOCAL_KERNEL := device/hisilicon/poplar-kernel/Image
PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel
LOCAL_DTB := device/hisilicon/poplar-kernel/hi3798cv200-poplar.dtb
# TODO: fix the dest dtb name, normal it is some varient of product.dtb
PRODUCT_COPY_FILES += $(LOCAL_KERNEL):dtb
PRODUCT_COPY_FILES += $(LOCAL_DTB):2ndbootloader

# rootfs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootfs/ueventd.poplar.rc:root/ueventd.poplar.rc \
    $(LOCAL_PATH)/rootfs/fstab.poplar:root/fstab.poplar

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootfs/init.poplar.rc:root/init.poplar.rc \
    $(LOCAL_PATH)/rootfs/init.poplar.usb.rc:root/init.poplar.usb.rc \



# feature declaration
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/android.hardware.screen.landscape.xml:system/etc/permissions/android.hardware.screen.landscape.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.print.xml:system/etc/permissions/android.software.print.xml \
    frameworks/native/data/etc/android.software.webview.xml:system/etc/permissions/android.software.webview.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \

# framework properties
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=96m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=2m \
    ro.sf.lcd_density=160 \
    ro.opengles.version=196609 \


# feature keymaster


## build packages
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service \

 


# feature graphics


## build packages
PRODUCT_PACKAGES += \
    libion \
    android.hardware.graphics.mapper@2.0 \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.allocator@2.0 \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1 \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \

 
# raw instructions - do I have a better place to go?
$(call inherit-product, vendor/hisilicon/poplar/device-graphic.mk)


# feature audio
# feature declaration
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.output.xml:system/etc/permissions/android.hardware.audio.output.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
## runtime configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \


## build packages
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.poplar \

 


# feature media.codec
## runtime configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \

 


# feature bluetooth

 

 



# manifest.xml
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/manifest.xml:system/vendor/manifest.xml


# vendor raw instructions - does it has a better place to go?
$(call inherit-product, vendor/hisilicon/poplar/device-vendor.mk)
