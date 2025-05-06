import 'package:flutter/material.dart';
import 'package:dui_app_updater/dui_app_updater.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // checkUrl: 'https://yourserver.com/api/check_update', return:
    // {
    //   "latest_version": "2.3.0",
    //   "force_update": false,
    //   "update_url": "https://yourdomain.com/download",
    //   "release_notes": "1. 修复重要Bug\n2. 优化用户体验\n3. 新增分享功能"
    // }
    final updater = CustomAppUpdater(
      checkUrl: 'https://yourserver.com/api/check_update', //
      packageName: 'com.example.app',
      iconUrl: 'https://yourcdn.com/logo.png',
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("App Updater Example")),
        body: Center(
          child: ElevatedButton(
            onPressed: () => updater.checkForUpdate(context),
            child: const Text("检查更新"),
          ),
        ),
      ),
    );
  }
}
