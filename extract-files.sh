#!/bin/sh

mkdir -p proprietary
adb pull /system/etc/AudioFilter.csv proprietary/AudioFilter.csv
adb pull /system/etc/AudioPara4.csv proprietary/AudioPara4.csv
adb pull /system/etc/gps.conf proprietary/gps.conf
adb pull /system/etc/firmware/brf6300.bin proprietary/brf6300.bin
adb pull /system/bin/akmd proprietary/akmd
adb pull /system/lib/libhtc_ril.so proprietary/libhtc_ril.so
adb pull /system/lib/libaudioeq.so proprietary/libaudioeq.so
adb pull /system/lib/libqcamera.so proprietary/libqcamera.so
adb pull /system/lib/libgps.so proprietary/libgps.so
adb pull /system/lib/libhgl.so proprietary/libhgl.so
adb pull /system/lib/libOmxCore.so proprietary/libOmxCore.so
chmod 755 proprietary/akmd

adb pull /system/lib/libhtc_acoustic.so proprietary/libhtc_acoustic.so
adb pull /system/lib/libjni_pinyinime.so proprietary/libjni_pinyinime.so
adb pull /system/lib/libmm-adspsvc.so proprietary/libmm-adspsvc.so
adb pull /system/lib/libOmxH264Dec.so proprietary/libOmxH264Dec.so
adb pull /system/lib/libOmxMpeg4Dec.so proprietary/libOmxMpeg4Dec.so
adb pull /system/lib/libOmxVidEnc.so proprietary/libOmxVidEnc.so
adb pull /system/lib/libopencorehw.so proprietary/libopencorehw.so
adb pull /system/lib/libpvasf.so proprietary/libpvasf.so
adb pull /system/lib/libpvasfreg.so proprietary/libpvasfreg.so
adb pull /system/lib/libspeech.so proprietary/libspeech.so

adb pull /system/lib/hw/sensors.sapphire.so proprietary/sensors.sapphire.so
adb pull /system/lib/hw/copybit.msm7k.so proprietary/copybit.msm7k.so

adb pull /system/etc/wifi/Fw1251r1c.bin proprietary/Fw1251r1c.bin
adb pull /system/etc/wifi/tiwlan.ini proprietary/tiwlan.ini

adb pull /system/lib/hw/lights.msm7k.so proprietary/lights.msm7k.so
adb pull /system/etc/AudioPreProcess.csv proprietary/AudioPreProcess.csv
