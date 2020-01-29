#
# Copyright (C) 2017 The LineageOS Project
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
WITHOUT_CHECK_API := true
DEVICE_PATH := device/asus/duma

# Variants
TARGET_OTA_ASSERT_DEVICE := duma,K005,ME302KL

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := duma
TARGET_BOOTLOADER_NAME := duma
TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := krait

# Snapdragon LLVM

BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=duma user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += vmalloc=340M androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
TARGET_KERNEL_SOURCE := kernel/asus/Sweet_kernel
TARGET_KERNEL_CONFIG := sweet_defconfig
#KERNEL_TOOLCHAIN := /home/den147/gcc-linaro-4.9.4-2017.01-x86_64_arm-eabi/bin
#KERNEL_TOOLCHAIN_PREFIX := arm-eabi-

# QCOM Hardware
BOARD_USES_QCOM_HARDWARE := true

# Audio
BOARD_USES_ALSA_AUDIO:= true
AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true
#USE_CUSTOM_AUDIO_POLICY := 1

# Binder API version
TARGET_USES_64_BIT_BINDER := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_SUFFIX := _32

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Qualcomm
TARGET_RIL_VARIANT := caf

# DT2W
TARGET_TAP_TO_WAKE_NODE := "/sys/android_touch/doubletap2wake"

# Audio
AUDIO_FEATURE_ENABLED_VORBIS_OFFLOAD := true

BUILD_BROKEN_DUP_RULES := true

# Media HAL
BOARD_GLOBAL_CFLAGS += -DQCOM_BSP_LEGACY
BOARD_GLOBAL_CPPFLAGS += -DQCOM_BSP_LEGACY
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Graphics
SF_START_GRAPHICS_ALLOCATOR_SERVICE := true
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x02000000U

TARGET_USES_HWC2 := true

# Vendor Interface Manifest
DEVICE_MANIFEST_FILE := device/asus/duma/manifest.xml

# FIXME: HOSTAPD-derived wifi driver
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"
TARGET_WLAN_POWER_STAT := "/d/wlan_wcnss/power_stats"

#BOARD_USES_HGL := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
USE_OPENGL_RENDERER := true
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 3200000
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYPASS := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216 # 16 MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216 # 16 MB
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760 # 10 MB
BOARD_PERSISTIMAGE_PARTITION_SIZE := 15360000 # 14.6 MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736 # 1.5 GB
BOARD_CACHEIMAGE_PARTITION_SIZE := 549453824 # 524 MB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27648834560 # 27.6 GB

# Filesystems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

#Reduce space taken by the journal
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false
    endif
  endif
endif

# Native suppor NTFS & EXFAT Filesystems
TARGET_USES_EXFAT := true
KERNEL_EXFAT_MODULE_NAME := "exfat"
TARGET_USES_NTFS := true
KERNEL_NTFS_MODULE_NAME := "ntfs"

BOARD_USES_SECURE_SERVICES := true

USE_CAMERA_STUB := false
BOARD_USES_CAMERA_FAST_AUTOFOCUS := false

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
TARGET_NO_RPC := true

TARGET_USES_POST_PROCESSING := true
TARGET_CUSTOM_DISPLAY_TUNING := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

USE_DEVICE_SPECIFIC_QCOM_PROPRIETARY := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /system/bin/mediaserver=22 \
    /system/vendor/bin/mm-qcamera-daemon=22

USE_DEVICE_SPECIFIC_CAMERA:= true

HAVE_ADRENO_SOURCE:= false

# SELinux
SELINUX_IGNORE_NEVERALLOWS := true
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy
#include device/qcom/sepolicy/sepolicy.mk

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Fonts
EXCLUDE_SERIF_FONTS := true
SMALLER_FONT_FOOTPRINT := true

# Recovery
TARGET_RECOVERY_DENSITY := hdpi
TARGET_RECOVERY_FSTAB = $(DEVICE_PATH)/rootdir/etc/fstab.duma

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)/releasetools

# Properties
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# Device Manifest
DEVICE_MANIFEST_FILE := device/asus/duma/manifest.xml
DEVICE_MATRIX_FILE := device/asus/duma/compatibility_matrix.xml

# Inherit from the proprietary version
-include vendor/asus/duma/BoardConfigVendor.mk
