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

# Inherit from duma device configuration
$(call inherit-product, device/asus/duma/full_duma.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_mini_tablet_wifionly.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/lineage/config/telephony.mk)

PRODUCT_NAME := lineage_duma
BOARD_VENDOR := Asus

PRODUCT_GMS_CLIENTID_BASE := android-asus


PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="WW_epad-user 4.2.2 JDQ39 WW_epad-10.10.3.39-20131220 release-keys"

BUILD_FINGERPRINT := "asus/WW_epad/EeePad:4.2.2/JDQ39/WW_epad-10.10.3.39-20131220:user/release-keys"

