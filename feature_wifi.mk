# $(hal) = wifi
# it includes all the configure files for $(hal) feature and
# the $(hal) library

# config files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# hardware features
PRODUCT_COPY_FILES += \
	 frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml
#  TODO:enable p2p/wifi-direct
#    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \

# wifi hal implementation see device/wifi
# include firmware
PRODUCT_PACKAGES += \
		android.hardware.wifi@1.0-service \
		libwifi-hal \
		wificond \
		wificond.rc \
		libwpa_client \
		wpa_supplicant \
		hostapd	\
		wpa_cli

# copy the wifi.rc file needed by the wpa_supplicant
# could have used LOCAL_INIT_RC but this approach seems easier
PRODUCT_COPY_FILES += \
		$(LOCAL_PATH)/wifi/wpa_supplicant.rc:system/etc/init/wpa_supplicant.rc

# wifi firmware: - copy vendor binary blob
$(call inherit-product, vendor/broadcom/poplar/wifi-firmware.mk)

# property overrides
PRODUCT_PROPERTY_OVERRIDES += wifi.interface=wlan0 \
                              wifi.supplicant_scan_interval=15
