adb uninstall com.germainleignel.reccomandations_app_v2 && flutter build apk && adb install build\app\outputs\apk\release\app-release.apk && adb shell am start -n com.germainleignel.reccomandations_app_v2/.MainActivity