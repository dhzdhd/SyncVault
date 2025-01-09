package com.example.syncvault

import android.os.Bundle
import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import androidx.core.content.FileProvider
import android.net.Uri
import android.webkit.MimeTypeMap
import android.content.Intent

import java.io.File

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
            } else if (call.method == "getContentUri") {
                try {
                    val filePath = call.argument<String>("filePath")
                    val file = File(filePath)
                    val contentUri = FileProvider.getUriForFile(
                        applicationContext,
                        "${applicationContext.packageName}.fileprovider",
                        file
                    )
                    println("File path: $filePath")

                    println("uri path: $contentUri")


                    // Create intent for viewing text files
                    val intent = Intent(Intent.ACTION_EDIT).apply {
                        setDataAndType(contentUri, "text/plain")
                        addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                        addFlags(Intent.FLAG_GRANT_WRITE_URI_PERMISSION)
                        addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    }

                    // Check if there's an activity to handle this intent
                    val packageManager = applicationContext.packageManager
                    val activities = packageManager.queryIntentActivities(intent, PackageManager.MATCH_DEFAULT_ONLY)

                    if (activities.isNotEmpty()) {
                        startActivity(intent)
                        result.success(contentUri.toString())
                    } else {
                        // Try with ACTION_VIEW if EDIT doesn't work
                        val viewIntent = Intent(Intent.ACTION_VIEW).apply {
                            setDataAndType(contentUri, "text/plain")
                            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                        }

                        val viewActivities = packageManager.queryIntentActivities(viewIntent, PackageManager.MATCH_DEFAULT_ONLY)
                        if (viewActivities.isNotEmpty()) {
                            startActivity(viewIntent)
                            result.success(contentUri.toString())
                        } else {
                            result.error("NO_HANDLER", "No app found to handle this file type. Please install a text editor.", null)
                        }
                    }
                } catch (e: Exception) {
                    result.error("ERROR", e.message ?: "Unknown error", null)
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

    private fun getContentUriForFile(filePath: String?): Uri {
        val file = File(filePath)
        return FileProvider.getUriForFile(this, "$packageName.fileprovider", file)
    }
}