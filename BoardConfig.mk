#
# Copyright (C) 2018 The Android Open-Source Project
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

# Platform
TARGET_BOARD_PLATFORM := $(PRODUCT_PLATFORM)

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
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 1800

# Fix can't able to wake with touch after sleep
TW_NO_SCREEN_BLANK := true

# Remove vibration support
TW_NO_HAPTICS := true

# Time
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Battery
TW_CUSTOM_BATTERY_PATH := "/sys/class/power_supply/mmi_battery"

# Statusbar icons flags
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CLOCK_POS := 50
TW_CUSTOM_CPU_POS := 280
TW_CUSTOM_BATTERY_POS := 790

# USB
TW_EXCLUDE_DEFAULT_USB_INIT := true

# For mounting NTFS
TW_INCLUDE_NTFS_3G := true

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# Include magiskboot for repacking bootimg
TW_INCLUDE_REPACKTOOLS := true

# Kernel module loading for touch, battery etc
TW_LOAD_VENDOR_MODULES := "adapter_class.ko bq2589x_charger.ko bq2597x_mmi_iio.ko cw2217b_fg_mmi.ko focaltech_v3.ko \
            goodix_brl_mmi.ko mmi_annotate.ko mmi_charger.ko mmi_discrete_charger_class.ko mmi_discrete_charger.ko \
            mmi_discrete_turbo_charger.ko mmi_info.ko mmi_qc3p_wt6670f.ko mmi_relay.ko qpnp_adaptive_charge.ko \
            rt_pd_manager.ko sensors_class.ko sgm4154x_charger.ko synaptics_v2_mmi.ko tcpc_class.ko tcpc_sgm7220.ko \
            touchscreen_mmi.ko"

# Include decryption support
TW_INCLUDE_CRYPTO := true
BOARD_USES_QCOM_FBE_DECRYPTION := true
RECOVERY_SDCARD_ON_DATA := true
# include below when enabling decryption
# without these it may stuck on TWRP splash
TARGET_RECOVERY_DEVICE_MODULES += libion
RECOVERY_LIBRARY_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libion.so

# Debuging flags
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_INCLUDE_RESETPROP := true
