# Copyright (C) 2013 The Android Open Source Project
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

# LOCAL_PATH doesn't work here
DEV_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

include $(DEV_DIR)/config.mk

ifneq ($(CONFIG_RAMDISK_OFFSET),)
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(CONFIG_RAMDISK_OFFSET)
endif

WITH_DEXPREOPT := $(CONFIG_DEX_PREOPT)

###
TARGET_CPU_ABI := x86_64
TARGET_ARCH := x86_64
TARGET_ARCH_VARIANT := x86_64

TARGET_2ND_CPU_ABI := x86
TARGET_2ND_ARCH := x86
TARGET_2ND_ARCH_VARIANT := x86

# Skip API checks.
WITHOUT_CHECK_API := true

# Don't try to build and run all tests by default.
ANDROID_NO_TEST_CHECK := true
EXCLUDE_SYSTEMUI_TESTS := true

# generic wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
CONFIG_DRIVER_NL80211 := y

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USERDATAIMAGE_PARTITION_SIZE := 576716800
BOARD_CACHEIMAGE_PARTITION_SIZE := 69206016
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 512

BOARD_SEPOLICY_DIRS += \
	build/target/board/generic/sepolicy \
	$(DEV_DIR)/sepolicy

ifeq ($(TARGET_SUPPORTS_32_BIT_APPS),true)
AUDIOSERVER_MULTILIB := 32
else
AUDIOSERVER_MULTILIB := 64
endif
