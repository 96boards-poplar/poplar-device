#
# BoardConfig.mk
# Product-specific compile-time definitions.
#

ifndef TARGET_KERNEL_USE
TARGET_KERNEL_USE=4.9
endif

#The size of Poplar flash is 7296MB (14942208 512-byte sectors)
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741312
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5456789504
BOARD_CACHEIMAGE_PARTITION_SIZE := 1073741312
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
# Private image secure store, and backup image are not used by Poplar
BOARD_PRIVATEIMAGE_PARTITION_SIZE := 52428800
BOARD_SECURESTORE_PARTITION_SIZE:= 8388608
BOARD_BACKUPIMAGE_PARTITION_SIZE := 838860800
BOARD_FLASH_BLOCK_SIZE := 512

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

################################################################################
##  Stable configuration definitions
################################################################################

# The generic product target doesn't have any hardware-specific pieces.
TARGET_NO_BOOTLOADER := false
TARGET_BOOTLOADER_IS_2ND = true
TARGET_NO_KERNEL := false

BOARD_KERNEL_CMDLINE := androidboot.hardware=poplar androidboot.selinux=permissive mmz=ddr,0,0,60M firmware_class.path=/system/etc/firmware

TARGET_NO_RECOVERY := true
TARGET_NO_RADIOIMAGE := true

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

TARGET_USES_64_BIT_BINDER := true

ARCH_ARM_HAVE_TLS_REGISTER := true

BOARD_USES_GENERIC_AUDIO := true

# no hardware camera
USE_CAMERA_STUB := true

# Build and enable the OpenGL ES View renderer. When running on the emulator,
# the GLES renderer disables itself if host GL acceleration isn't available.
USE_OPENGL_RENDERER := true

#
#  Hisilicon Platform
# moved to Hisi.mk - 2

# wpa_supplicant and hostapd build configuration
# wpa_supplicant is used for WiFi STA, hostapd is used for WiFi SoftAP
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd


TARGET_BOARD_PLATFORM := poplar
TARGET_BOOTLOADER_BOARD_NAME := poplar

BOARD_SEPOLICY_DIRS := device/hisilicon/poplar/sepolicy
