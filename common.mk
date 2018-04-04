#
# Copyright (C) 2012 The Android Open-Source Project
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
COMMON_PATH := device/samsung/galaxys2-common

DEVICE_PACKAGE_OVERLAYS := $(COMMON_PATH)/overlay

# Rootdir
PRODUCT_COPY_FILES := \
    $(COMMON_PATH)/rootdir/fstab.smdk4210:root/fstab.smdk4210 \
    $(COMMON_PATH)/rootdir/init.smdk4210.usb.rc:root/init.smdk4210.usb.rc \
    $(COMMON_PATH)/rootdir/init.smdk4210.rc:root/init.smdk4210.rc \
    $(COMMON_PATH)/rootdir/ueventd.smdk4210.rc:root/ueventd.smdk4210.rc

# Recovery rootdir
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/init.recovery.smdk4210.rc:root/init.recovery.smdk4210.rc

# Netflix hack
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/98netflix:system/etc/init.d/98netflix

# Audio
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/tinyalsa-audio.xml:system/etc/tinyalsa-audio.xml \
    $(COMMON_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Wifi
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(COMMON_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(COMMON_PATH)/configs/bcmdhd.cal:system/etc/wifi/bcmdhd.cal

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=30 \
    net.tethering.noprovisioning=true

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

# Gps
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(COMMON_PATH)/configs/sirfgps.conf:system/etc/sirfgps.conf

# Packages
PRODUCT_PACKAGES := \
    com.android.future.usb.accessory

# Legacy RIL
PRODUCT_PACKAGES += \
    libsamsung_symbols \
    libsecril-shim

# Legacy GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl

# SamsungPowerHAL
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl \
    android.hardware.power@1.0-service \
    power.smdk4210

# Audio Packages
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    audio.primary.exynos4 \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    libaudiohw_legacy

# Browser
PRODUCT_PACKAGES += \
	Jelly

# HAL
PRODUCT_PACKAGES += \
    AdvancedDisplay \
    android.hardware.graphics.allocator@2.0-impl-exynos4 \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.keymaster@3.0-impl \
    android.hardware.bluetooth@1.0-impl \
    libbt-vendor \
    gralloc.exynos4 \
    hwcomposer.exynos4 \
    libnetcmdiface \
    android.hardware.light@2.0-impl \
    lights.smdk4210 \
    libhwconverter \
    libs5pjpeg \
    libfimg \
    libsecion

#Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl

#Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl-legacy \
    camera.device@1.0-impl-legacy \
    camera.smdk4210 \
    Camera2 \
    libstagefright_shim

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/mediaserver.rc:system/etc/init/mediaserver.rc


PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true


# HIDL manifest
PRODUCT_COPY_FILES += \
    device/samsung/galaxys2-common/manifest.xml:system/vendor/manifest.xml

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# MFC API
PRODUCT_PACKAGES += \
    libsecmfcapi

# OMX
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libseccscapi \
    libsecbasecomponent \
    libsecosal \
    libSEC_OMX_Resourcemanager \
    libSEC_OMX_Core \
    libSEC_OMX_Vdec \
    libOMX.SEC.AVC.Decoder \
    libOMX.SEC.M4V.Decoder \
    libOMX.SEC.WMV.Decoder \
    libOMX.SEC.AVC.Encoder \
    libSEC_OMX_Venc \
    libOMX.SEC.M4V.Encoder

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(COMMON_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    ro.zygote.disable_gl_preload=true \
    ro.bq.gpu_to_cpu_unsupported=1 \
    debug.hwui.render_dirty_regions=false

# Widevine
PRODUCT_PACKAGES += \
    libwvm_shim

PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SamsungExynos4RIL \
    mobiledata.interfaces=pdp0,gprs,ppp0,rmnet0,rmnet1 \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.call_ring.delay=3000

# Services
PRODUCT_PROPERTY_OVERRIDES += \
    config.disable_atlas=true

#PRODUCT_PACKAGES += \
#    SamsungDoze

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    resize2fs_static \
    setup_fs

# F2FS Filesystem
PRODUCT_PACKAGES += \
    fsck.f2fs \
    mkfs.f2fs

# Live Wallpapers
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam \
    VisualizationWallpapers \
    librs_jni

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    wificond \
    hostapd \
    libwpa_client \
    macloader \
    wpa_supplicant \
    wpa_supplicant.conf

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Feature live wallpaper
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/excluded-input-devices.xml:system/etc/excluded-input-devices.xml

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Include exynos4 platform specific parts
TARGET_HAL_PATH := hardware/samsung/exynos4/hal
TARGET_OMX_PATH := hardware/samsung/exynos/multimedia/openmax
$(call inherit-product, hardware/samsung/exynos4210.mk)

# Include non-open-source parts
$(call inherit-product, vendor/samsung/galaxys2-common/common-vendor.mk)

# Build GO
$(call inherit-product, build/target/product/go_defaults_512.mk)

# Include debugging props
$(call inherit-product, device/samsung/galaxys2-common/system_prop_debug.mk)
