#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6115-common
$(call inherit-product, device/xiaomi/sm6115-common/bengal.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/xiaomi/lime/lime-vendor.mk)

# Camera
PRODUCT_PACKAGES += \
    libpiex_shim

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# NFC
$(call inherit-product, hardware/st/nfc/nfc_vendor_product.mk)
ODM_MANIFEST_SKUS += $(TARGET_NFC_SKU)
ODM_MANIFEST_LEMON_FILES := hardware/st/nfc/aidl/nfc-service-default.xml
TARGET_USES_ST_AIDL_NFC := true
TARGET_NFC_SKU := lemon

PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    libchrome.vendor \
    NfcNci \
    SecureElement \
    Tag

# NFC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-hal-st.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st.conf

# IFAAService
PRODUCT_PACKAGES += \
    IFAAService
