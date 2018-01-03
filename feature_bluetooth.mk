# $(hal) = bluetooth
# it includes all the configure files for $(hal) feature and
# the $(hal) library

# config files

# hardware features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_PACKAGES += \
	libbt-vendor \
	android.hardware.bluetooth@1.0-service \
	android.hardware.bluetooth@1.0-service.rc \
	android.hardware.bluetooth@1.0-impl

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/bluetooth/bcm/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# bt hal blob copy from vendor
$(call inherit-product, vendor/broadcom/poplar/bt-hal-blob.mk)
