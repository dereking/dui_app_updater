import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:install_plugin/install_plugin.dart';

Future<void> downloadAndInstallApk(BuildContext context, String apkUrl) async {
  if (!Platform.isAndroid) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("仅支持 Android 系统安装 APK")),
    );
    return;
  }

  var status = await Permission.storage.request();
  if (!status.isGranted) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("存储权限未授权")),
    );
    return;
  }

  final dir = await getExternalStorageDirectory();
  final savePath = '${dir!.path}/update.apk';

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const Center(child: CircularProgressIndicator()),
  );

  try {
    await Dio().download(apkUrl, savePath);
    Navigator.of(context).pop();
    await InstallPlugin.install(savePath,appId: "your.package.name");
  } catch (e) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("安装失败：$e")),
    );
  }
}
