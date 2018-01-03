
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/libGLES_mali.so:system/vendor/lib/egl/libGLES_mali.so

# hwcomposer
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/hwcomposer.poplar.so:system/lib/hw/hwcomposer.poplar.so \
    $(LOCAL_PATH)/proprietary/libhi_gfx2d.so:system/lib/libhi_gfx2d.so \
    $(LOCAL_PATH)/proprietary/liboverlay.so:system/lib/liboverlay.so \

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/proprietary/gralloc.poplar.so:system/vendor/lib/hw/gralloc.poplar.so \
	$(LOCAL_PATH)/proprietary/libion_ext.so:system/vendor/lib/libion_ext.so