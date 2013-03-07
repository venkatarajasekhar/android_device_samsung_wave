# Copyright (C) 2010 The Android Open Source Project
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


# This file is the device-specific product definition file for
# crespo. It lists all the overlays, files, modules and properties
# that are specific to this hardware: i.e. those are device-specific
# drivers, configuration files, settings, etc...

# Note that crespo is not a fully open device. Some of the drivers
# aren't publicly available in all circumstances, which means that some
# of the hardware capabilities aren't present in builds where those
# drivers aren't available. Such cases are handled by having this file
# separated into two halves: this half here contains the parts that
# are available to everyone, while another half in the vendor/ hierarchy
# augments that set with the parts that are only relevant when all the
# associated drivers are available. Aspects that are irrelevant but
# harmless in no-driver builds should be kept here for simplicity and
# transparency. There are two variants of the half that deals with
# the unavailable drivers: one is directly checked into the unreleased
# vendor tree and is used by engineers who have access to it. The other
# is generated by setup-makefile.sh in the same directory as this files,
# and is used by people who have access to binary versions of the drivers
# but not to the original vendor tree. Be sure to update both.

# These are the hardware-specific configuration files
DEVICE_PACKAGE_OVERLAYS += \
	device/samsung/wave/overlay

# We have FFC
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml

DEVICE_PACKAGE_OVERLAYS := device/samsung/wave/overlay

TARGET_RECOVERY_FSTAB := device/samsung/wave/recovery.fstab

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES := \
	device/samsung/wave/prebuilt/asound.conf:system/etc/asound.conf \
	device/samsung/wave/prebuilt/vold.fstab:system/etc/vold.fstab \
	device/samsung/wave/prebuilt/egl.cfg:system/lib/egl/egl.cfg \
    device/samsung/wave/prebuilt/nvram_net_s8500.txt:system/vendor/firmware/nvram_net_s8500.txt \
    device/samsung/wave/prebuilt/nvram_net_s8530.txt:system/vendor/firmware/nvram_net_s8530.txt \
	device/samsung/wave/prebuilt/setmodel.sh:system/bin/setmodel.sh \
	device/samsung/wave/prebuilt/main.conf:system/etc/bluetooth/main.conf

# Init files
PRODUCT_COPY_FILES += \
	device/samsung/wave/init.wave.rc:root/init.wave.rc \
	device/samsung/wave/init.wave2.rc:root/init.wave2.rc \
	device/samsung/wave/init.wave.usb.rc:root/init.wave.usb.rc \
	device/samsung/wave/init.wave.usb.rc:recovery/root/usb.rc \
	device/samsung/wave/ueventd.wave.rc:root/ueventd.wave.rc \
	device/samsung/wave/ueventd.wave.rc:root/ueventd.wave2.rc

# Keylayout and Keychars
PRODUCT_COPY_FILES += \
	device/samsung/wave/prebuilt/usr/idc/mxt224_ts_input.idc:system/usr/idc/mxt224_ts_input.idc \
	device/samsung/wave/prebuilt/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
	device/samsung/wave/prebuilt/usr/keylayout/s5pv210-keypad.kl:system/usr/keylayout/s5pv210-keypad.kl \
	device/samsung/wave/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	device/samsung/wave/prebuilt/usr/keychars/s5pv210-keypad.kcm:system/usr/keychars/s5pv210-keypad.kcm \
	device/samsung/wave/prebuilt/usr/keychars/sec_jack.kcm:system/usr/keychars/sec_jack.kcm \
	device/samsung/wave/prebuilt/usr/keychars/gpio-keys.kcm:system/usr/keychars/gpio-keys.kcm

# SHP Modem interfaces
PRODUCT_PACKAGES := \
	libmocha-ril

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs \
	bml_over_mtd

# Usb accessory
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# These are the OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	hardware/samsung/exynos3/s5pc110/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry \
	device/samsung/wave/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
	device/samsung/wave/prebuilt/media_codecs.xml:system/etc/media_codecs.xml

# These are the OpenMAX IL modules
PRODUCT_PACKAGES += \
	libSEC_OMX_Core \
	libOMX.SEC.AVC.Decoder \
	libOMX.SEC.M4V.Decoder \
	libOMX.SEC.M4V.Encoder \
	libOMX.SEC.AVC.Encoder

# Misc other modules
PRODUCT_PACKAGES += \
	lights.wave \
	sensors.wave \
	power.s5pc110 \
	hwcomposer.s5pc110 \
	camera.wave \
	audio.primary.wave \
	audio_policy.wave \
	audio.a2dp.default \
	audio.usb.default \
	libaudio-ril-interface \
	libs3cjpeg

PRODUCT_COPY_FILES += \
	device/samsung/wave/libaudio/audio_policy.conf:system/etc/audio_policy.conf

# Libs
PRODUCT_PACKAGES += \
	libstagefrighthw

# Bluetooth MAC Address
PRODUCT_PACKAGES += \
	bdaddr_read

# Device-specific packages
PRODUCT_PACKAGES += \
	SamsungServiceMode \
	WaveParts \
	tvouthack \
	Torch

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opengles.version=131072

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
       wifi.interface=wlan0 \
       mobiledata.interfaces=pdp0,eth0,gprs,ppp0 \
       ro.vold.switchablepair=/storage/sdcard0,/storage/sdcard1 \
	   rild.libpath=/system/lib/libmocha-ril.so \
	   ro.sf.lcd_density=240

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
        ro.com.google.locationfeatures=1 \
        ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# We have sacrificed /cache for a larger /system, so it's not large enough for dalvik cache
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1

# Set default USB interface and default to internal SD as /sdcard
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mass_storage

include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise


$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/wave/wave-vendor.mk)
