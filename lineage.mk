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

# Inherit from p1m device full mk
$(call inherit-product, device/moto/e4/device_e4.mk)

# Inherit some common lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Boot animation
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280
TARGET_BOOTANIMATION_HALF_RES := true

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_DEVICE := p1m
PRODUCT_NAME := lineage_e4
PRODUCT_BRAND := MOTOROLA
PRODUCT_MANUFACTURER := MOTOROLA
PRODUCT_MODEL := MOTO E4
PRODUCT_RELEASE_NAME := woods

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=woods
