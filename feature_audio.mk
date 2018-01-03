# it includes all the configure files for audio feature and
# the audio hal library

# config files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf

# hardware features
PRODUCT_COPY_FILES += \
	 frameworks/native/data/etc/android.hardware.audio.output.xml:system/etc/permissions/android.hardware.audio.output.xml \
	 frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

# audio hal implementation see device/audio
PRODUCT_PACKAGES += \
	audio.primary.poplar \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	android.hardware.audio@2.0-impl \
	android.hardware.audio@2.0-service \
	android.hardware.audio.effect@2.0-impl

# for audio debug tools
PRODUCT_PACKAGES += \
	tinyplay stagefright