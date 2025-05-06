import 'dart:io';
import 'package:dui_app_updater/src/apk_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart'; 

class UpdateDialog extends StatelessWidget {
  final String version;
  final String updateUrl;
  final String releaseNotes;
  final bool force;
  final String? iconUrl;

  const UpdateDialog({
    Key? key,
    required this.version,
    required this.updateUrl,
    required this.releaseNotes,
    required this.force,
    this.iconUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          if (iconUrl != null)
            Image.network(iconUrl!, width: 32, height: 32),
          const SizedBox(width: 8),
          const Text("发现新版本"),
        ],
      ),
      content: SizedBox(
        height: 180,
        child: Markdown(data: releaseNotes),
      ),
      actions: [
        if (!force)
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("以后再说"),
          ),
        ElevatedButton(
          onPressed: () async {
            if (Platform.isAndroid && updateUrl.endsWith(".apk")) {
              await downloadAndInstallApk(context, updateUrl);
            } else {
              if (await canLaunchUrl(Uri.parse(updateUrl))) {
                await launchUrl(Uri.parse(updateUrl), mode: LaunchMode.externalApplication);
              }
            }
          },
          child: const Text("立即更新"),
        ),
      ],
    );
  }
}
