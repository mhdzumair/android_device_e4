# inherit from the proprietary version
-include vendor/moto/e4/BoardConfigVendor.mk

LOCAL_PATH := device/moto/e4

ALLOW_MISSING_DEPENDENCIES := true

# Architecture
FORCE_32_BIT := true

# Platform
TARGET_BOARD_PLATFORM := mt6737m
MTK_BOARD_PLATFORMS += mt6737m
TARGET_NO_BOOTLOADER := true
TARGET_NO_FACTORYIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := mt6737m

# Architecture
ifeq ($(FORCE_32_BIT),true)
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
else
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_CPU_ABI_LIST_64_BIT := $(TARGET_CPU_ABI)
TARGET_CPU_ABI_LIST_32_BIT := $(TARGET_2ND_CPU_ABI),$(TARGET_2ND_CPU_ABI2)
TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI_LIST_64_BIT),$(TARGET_CPU_ABI_LIST_32_BIT)
endif

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_KERNEL_HAVE_EXFAT := true
TARGET_KERNEL_HAVE_NTFS := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/recovery.fstab

# Kernel
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_SOURCE := kernel/moto/e4
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_TAGS_OFFSET := 0xE000000
ifeq ($(FORCE_32_BIT),true)
ARCH := arm
TARGET_ARCH := arm
KERNEL_ARCH := arm
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_CONFIG := woods_defconfig
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,32N2 androidboot.selinux=permissive androidboot.selinux=disabled 
BOARD_KERNEL_OFFSET := 0x00008000
else
TARGET_KERNEL_ARCH := arm64
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive androidboot.selinux=disabled 
BOARD_KERNEL_OFFSET = 0x00080000
TARGET_USES_64_BIT_BINDER := true
endif
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET)

# make_ext4fs requires numbers in dec format
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216 
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216 
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2432696320
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4698144768
BOARD_CACHEIMAGE_PARTITION_SIZE := 419430400
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_KMODULES := true

# Assert
TARGET_OTA_ASSERT_DEVICE := Moto_E4,Moto E4,e4,e4

# Device board elements
include device/moto/e4/board/*.mk

# Kernel
TARGET_KMODULES := true
BOARD_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# Dont build seperate vendor img
TARGET_COPY_OUT_VENDOR := system/vendor

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

#######################################################################

BOARD_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# Flags
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
BOARD_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# Charger
WITH_LINEAGE_CHARGER := false

# SensorHAL
TARGET_SENSORS_DEVICE_API_VERSION := SENSORS_DEVICE_API_VERSION_1_1

# Graphics
BOARD_EGL_CFG := /vendor/moto/e4/vendor/lib/egl/egl.cfg
USE_OPENGL_RENDERER:=true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0
MTK_HWC_SUPPORT := yes
MTK_HWC_VERSION := 1.4.1
MTK_GPU_VERSION := mali midgard r12p1
OVERRIDE_RS_DRIVER := libRSDriver_mtk.so

# Mediatek support
BOARD_USES_MTK_HARDWARE:=true
#DISABLE_ASHMEM_TRACKING := true

# Camera
USE_CAMERA_STUB := true

# Boot animation
TARGET_BOOTANIMATION_MULTITHREAD_DECODE := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Audio
BOARD_USES_MTK_AUDIO := true

# Lineage Hardware
BOARD_HARDWARE_CLASS += device/moto/e4/lineagehw

# Fix video autoscaling on old OMX decoders
#TARGET_OMX_LEGACY_RESCALING := true

# Charger
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness

# RIL
BOARD_RIL_CLASS := ../../../device/moto/e4/ril/

# GPS
BOARD_GPS_LIBRARIES :=true
BOARD_CONNECTIVITY_MODULE := MT6625
BOARD_MEDIATEK_USES_GPS := true

# Wireless
BOARD_WLAN_DEVICE := MediaTek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := /dev/wmtWifi
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_P2P := P2P
WIFI_DRIVER_STATE_CTRL_PARAM := /dev/wmtWifi
WIFI_DRIVER_STATE_ON := 1
WIFI_DRIVER_STATE_OFF := 0

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true
#MALLOC_IMPL := dlmalloc

# LDPRELOAD
TARGET_LDPRELOAD += libmtk_symbols.so

# EGL
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# Flags
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
#BOARD_HAVE_BLUETOOTH_MTK := true
#BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_HCILP_INCLUDED := 0
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/moto/e4/bluetooth

TARGET_LDPRELOAD += mtk_symbols.so

# CWM
BOARD_HAS_NO_SELECT_BUTTON := true

# TWRP stuff
TW_THEME := portrait_hdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_SUPPRESS_SECURE_ERASE := true
TW_INCLUDE_CRYPTO := true
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 80
TW_NO_REBOOT_BOOTLOADER := true
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TARGET_DISABLE_TRIPLE_BUFFERING := false
BOARD_USE_FRAMEBUFFER_ALPHA_CHANNEL := true
TW_FLASH_FROM_STORAGE := true
TWHAVE_SELINUX := true
TW_EXTRA_LANGUAGES := true
TW_EXCLUDE_SUPERSU := true
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"

TW_INCLUDE_FB2PNG := true
TW_NO_CPU_TEMP := true
TW_REBOOT_BOOTLOADER := true
TW_REBOOT_RECOVERY := true
TW_HAS_DOWNLOAD_MODE := true
TW_EXCLUDE_SUPERSU := true
TW_USE_TOOLBOX := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

TARGET_SPECIFIC_HEADER_PATH := device/moto/e4/include
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file

# TWRP.fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/twrp.fstab:recovery/root/etc/recovery.fstab

# Time Zone data for Recovery
PRODUCT_COPY_FILES += \
    bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata


BOARD_SEPOLICY_DIRS := \
       device/moto/e4/sepolicy

# Seccomp filter
BOARD_SECCOMP_POLICY += device/moto/e4/seccomp

#HIDL
DEVICE_MANIFEST_FILE := device/moto/e4/hidl/manifest.xml


# Platform
TARGET_BOARD_PLATFORM := mt6735m
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := mt6735m

# Legacy blobs
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Images
TARGET_NO_BOOTLOADER := true

# HIDL
DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/manifest.xml

# System.prop
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Shims
TARGET_LD_SHIM_LIBS := /system/lib/libgui.so|/system/vendor/lib/libmtkshim_gui.so:/system/lib64/libgui.so|/system/vendor/lib64/libmtkshim_gui.so:/system/vendor/lib/hw/audio.primary.mt6735m.so|/system/vendor/lib/libmtkshim_audio.so:/system/vendor/lib64/hw/audio.primary.mt6735m.so|/system/vendor/lib64/libmtkshim_audio.so:/system/vendor/lib/libcam.camadapter.so|/system/vendor/lib/libmtkshim_camera.so:/system/vendor/lib64/libcam.camadapter.so|/system/vendor/lib64/libmtkshim_camera.so

# SELinux
SELINUX_IGNORE_NEVERALLOWS := true
BOARD_SEPOLICY_DIRS := $(LOCAL_PATH)/sepolicy

# Block based ota
# see http://review.cyanogenmod.org/#/c/78849/1/core/Makefile
BLOCK_BASED_OTA := false
