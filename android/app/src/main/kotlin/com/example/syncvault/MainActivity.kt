package com.example.syncvault

import android.os.Bundle
import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.syncvault/native_lib"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "getNativeLibraryPath") {
                val path = getNativeLibraryPath()
                if (path != null) {
                    result.success(path)
                } else {
                    result.error("UNAVAILABLE", "Native library path not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getNativeLibraryPath(): String? {
        val appInfo: ApplicationInfo = applicationContext.packageManager.getApplicationInfo(applicationContext.packageName, 0)
        return appInfo.nativeLibraryDir
    }
}