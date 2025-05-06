import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'update_dialog.dart';

class CustomAppUpdater {
  final String checkUrl;
  final String packageName;
  final String? iconUrl;

  CustomAppUpdater({
    required this.checkUrl,
    required this.packageName,
    this.iconUrl,
  });

  Future<void> checkForUpdate(BuildContext context) async {
    try {
      final response = await http.get(Uri.parse(checkUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final String latestVersion = data['version'];
        final String updateUrl = data['url'];
        final bool force = data['force'] ?? false;
        final String notes = data['release_notes'] ?? '';

        showDialog(
          context: context,
          barrierDismissible: !force,
          builder: (_) => UpdateDialog(
            version: latestVersion,
            updateUrl: updateUrl,
            releaseNotes: notes,
            force: force,
            iconUrl: iconUrl,
          ),
        );
      }
    } catch (e) {
      debugPrint("Update check failed: $e");
    }
  }
}
