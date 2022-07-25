print('계정 초기화 시작')

headCmd = "cd ../../ADB && "
adbCmd = "adb -s "..device_name.." shell /system/xbin/bstk/su -c rm -rf /data/data/com.kakaogames.umamusume/shared_prefs"
appCmd = headCmd..adbCmd

local f = io.popen(appCmd)
f:close()

print('계정 초기화 완료!')