# Platform
TARGET_BOARD_PLATFORM := bengal

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := $(PRODUCT_DEVICE)

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# A/B device flags
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += system system_ext product vbmeta_system

# bootimg configuration
BOARD_BOOT_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_AVB_ENABLE := true

# includes make_f2fs to support userdata partition in f2fs
TARGET_USERIMAGES_USE_F2FS := true

# Creates metadata partition mount point under root for
# the devices with metadata partition
BOARD_USES_METADATA_PARTITION := true

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor

# Adjusted flags for decryption
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# Fix for copying *.ko
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true


##### TWRP Flags #####
TW_THEME := portrait_hdpi

# Include more languages than English
TW_EXTRA_LANGUAGES := true

# Brightness
TW_BRIGHTNESS_PATH := /sys/class/backlight/panel0-backlight/brightness
TW_DEFAULT_BRIGHTNESS := 1800
TW_MAX_BRIGHTNESS := 3514

# Add support of able to wake with touch after sleep
TW_NO_SCREEN_BLANK := true

# Remove vibration support
TW_NO_HAPTICS := true

# Battery
# https://gerrit.twrp.me/c/android_bootable_recovery/+/6945
TW_USE_LEGACY_BATTERY_SERVICES := true

# Time
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Statusbar icons flags
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CLOCK_POS := 50
TW_CUSTOM_CPU_POS := 280
TW_CUSTOM_BATTERY_POS := 790

# Use our own USB config
TW_EXCLUDE_DEFAULT_USB_INIT := true

# For mounting NTFS
TW_INCLUDE_NTFS_3G := true

# Use mke2fs for formatting ext4 partitions
TARGET_USES_MKE2FS := true

# Kernel module loading for touch, battery etc
TW_LOAD_VENDOR_MODULES := $(shell echo \"$(shell ls $(DEVICE_PATH)/recovery/root/vendor/lib/modules/1.1)\")
TW_LOAD_VENDOR_BOOT_MODULES := true

# Include decryption support
TW_INCLUDE_CRYPTO := true
RECOVERY_SDCARD_ON_DATA := true
# include below when enabling decryption
# without these it may stuck on TWRP splash
TARGET_RECOVERY_DEVICE_MODULES += libion
RECOVERY_LIBRARY_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libion.so

# Don't mount apex files (no need for now)
TW_EXCLUDE_APEX := true

# Debuging flags
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_INCLUDE_RESETPROP := true
