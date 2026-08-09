@echo off
set ADB="C:\Users\Muzakkir\Desktop\bypass srcs\ZED\BYPASS\adb.exe"

echo [*] Starting ADB server...
%ADB% kill-server
%ADB% start-server
echo [+] ADB server started.

set RAND=%RANDOM%%RANDOM%
echo [i] Generated random seed: %RAND%

echo.
echo === RESETTING DEVICE PROPS ===
%ADB% shell am force-stop com.tencent.ig
echo [+] Stopped com.tencent.ig

%ADB% shell setprop ro.product.device %RAND%6b1a77f674510efbe5216b1b1b41
echo [+] Reset ro.product.device

echo.
echo === RESETTING REGISTRY ===
reg add "HKEY_CURRENT_USER\Software\Tencent\MobileGamePC" /v VMDeviceManufacturer /t REG_SZ /d %RAND%6b1a77f674510efbe5216b1b1b41 /f
echo [+] Reset VMDeviceManufacturer

reg add "HKEY_CURRENT_USER\Software\Tencent\MobileGamePC" /v VMDeviceModel /t REG_SZ /d %RAND%6b1a77f674510efbe5216b1b1b41 /f
echo [+] Reset VMDeviceModel

echo.
echo === RESETTING ANDROID ID ===
%ADB% shell content insert --uri content://settings/secure --bind name:s:android_id --bind value:s:%RAND%6b1a77f674510efbe5216b1b1b41
echo [+] Inserted new android_id

%ADB% shell settings put secure android_id %RAND%6b1a77f674510efbe5216b1b1b41
echo [+] Updated android_id

%ADB% shell rm -rf /sdcard/Android/.system_android_l2
echo [+] Deleted .system_android_l2

echo.
echo === RESETTING SYSTEM PROPERTIES ===
%ADB% shell setprop ro.product.device %RAND%6b1a77f674510efbe5216b1b1b41
echo [+] ro.product.device

%ADB% shell setprop ro.product.brand %RAND%6b1a77f674510efbe5216b1b1b41
echo [+] ro.product.brand

%ADB% shell setprop ro.product.model %RAND%6b1a77f674510efbe5216b1b1b41
echo [+] ro.product.model

%ADB% shell setprop ro.product.name %RAND%6b1a77f674510efbe5216b1b1b41
echo [+] ro.product.name

%ADB% shell setprop ro.product.manufacturer %RAND%6b1a77f674510efbe5216b1b1b41
echo [+] ro.product.manufacturer

%ADB% shell setprop ro.android_id %RAND%6b1a77f674510efbe5216b1b1b41
echo [+] ro.android_id

%ADB% shell setprop net.hostname %RAND%6b1a77f674510efbe5216b1b1b41
echo [+] net.hostname

%ADB% shell setprop gaid %RAND%6b1a77f674510efbe5216b1b1b41
echo [+] gaid

%ADB% shell setprop android.device.id %RAND%6b1a77f674510efbe5216b1b1b41
echo [+] android.device.id

%ADB% shell setprop ro.serialno %RAND%6b1a77f674510efbe5216b1b1b41
echo [+] ro.serialno

%ADB% shell setprop ro.runtime.firstboot %RAND%6b1a77f674510efbe5216b1b1b41
echo [+] ro.runtime.firstboot

%ADB% shell setprop ro.mac_address %RAND%6b1a77f674510efbe5216b1b1b41
echo [+] ro.mac_address

echo.
echo === CLEARING APP DATA ===
%ADB% shell rm -rf /data/data/com.tencent.ig/cache/*
echo [+] Cleared app cache

%ADB% shell rm -rf /data/data/com.tencent.ig/code_cache/*
echo [+] Cleared code_cache

%ADB% shell rm -rf /data/data/com.tencent.ig/shared_prefs/*
echo [+] Cleared shared_prefs

%ADB% shell rm -rf /data/data/com.tencent.ig/databases/*
echo [+] Cleared databases

%ADB% shell rm -rf /data/data/com.tencent.ig/files/.system_android_l2
echo [+] Deleted internal .system_android_l2

echo.
echo === CLEARING SD CARD DATA ===
%ADB% shell rm -rf /sdcard/Android/data/com.tencent.ig/cache/*
echo [+] Cleared sdcard cache

%ADB% shell rm -rf /sdcard/Android/data/com.tencent.ig/files/.system_android_l2
echo [+] Deleted sdcard .system_android_l2

%ADB% shell rm -rf /sdcard/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/*.json
echo [+] Deleted save games

%ADB% shell rm -rf /sdcard/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/MMKV
echo [+] Deleted MMKV

%ADB% shell rm -rf /sdcard/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/RoleInfo
echo [+] Deleted RoleInfo

echo.
echo === LOCKING SYSTEM FILES ===
%ADB% shell chmod 000 /proc/cpuinfo
echo [+] Locked /proc/cpuinfo

%ADB% shell chmod 000 /proc/meminfo
echo [+] Locked /proc/meminfo

%ADB% shell chmod 000 /system/build.prop
echo [+] Locked /system/build.prop

%ADB% shell chmod 000 /sys/class/power_supply/battery/capacity
echo [+] Locked battery capacity

echo.
echo === FINAL CLEANUP ===
%ADB% shell rm -rf /sdcard/Android/data/com.tencent.ig/cache
echo [+] Deleted sdcard cache folder

%ADB% shell rm -rf /sdcard/Android/data/com.tencent.ig/files/.fff
echo [+] Deleted .fff

%ADB% shell rm -rf /sdcard/Android/data/com.tencent.ig/files/ca-bundle.pem
echo [+] Deleted ca-bundle.pem

%ADB% shell rm -rf /sdcard/Android/data/com.tencent.ig/files/login-identifier.txt
echo [+] Deleted login-identifier.txt

%ADB% shell rm -rf /sdcard/Android/data/com.tencent.ig/files/.system_android_l2
echo [+] Deleted final .system_android_l2

%ADB% shell rm -rf /sdcard/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/Epic Games
echo [+] Deleted Epic Games folder

%ADB% shell rm -rf /sdcard/Android/data/com.tencent.ig/files/TGPA
echo [+] Deleted TGPA folder

%ADB% shell rm -rf /sdcard/Android/.system_android_12
echo [+] Deleted .system_android_12

%ADB% shell rm -rf /sdcard/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Intermediate
echo [+] Deleted Intermediate

%ADB% shell touch /sdcard/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Intermediate
echo [+] Created placeholder Intermediate

echo.
echo ================================
echo [*] ALL DONE - Device fully reset!
echo ================================
pause
