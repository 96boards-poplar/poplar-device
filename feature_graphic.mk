# $(hal) = graphic
# it includes all the configure files for $(hal) feature and
# the $(hal) library

# HAL: openGL - copy vendor binary blob
$(call inherit-product, vendor/hisilicon/poplar/device-graphic.mk)

# HAL: gralloc

PRODUCT_PACKAGES += \
    libion \
    android.hardware.graphics.mapper@2.0            \
    android.hardware.graphics.mapper@2.0-impl       \
    android.hardware.graphics.allocator@2.0         \
    android.hardware.graphics.allocator@2.0-impl    \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1          \
    android.hardware.graphics.composer@2.1-impl     \
    android.hardware.graphics.composer@2.1-service

