#if androidtv then set to true
SUPPORT_ANDROIDTV := false
ifeq ($(strip $(SUPPORT_ANDROIDTV)), true)
   $(call inherit-product-if-exists, $(BUILD_DIR)/androidtv.mk)
else
   $(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
endif

PRODUCT_NAME := poplar
PRODUCT_DEVICE := poplar
PRODUCT_BRAND := poplar
PRODUCT_MODEL := poplar
PRODUCT_MANUFACTURER := Hisilicon
TARGET_USES_HWC2 := true

DEVICE_PACKAGE_OVERLAYS := device/hisilicon/$(PRODUCT_DEVICE)/overlay

$(call inherit-product, device/hisilicon/poplar/device.mk)
