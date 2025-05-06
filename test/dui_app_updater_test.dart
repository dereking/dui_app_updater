import 'package:flutter_test/flutter_test.dart';
import 'package:dui_app_updater/dui_app_updater.dart';
import 'package:dui_app_updater/dui_app_updater_platform_interface.dart';
import 'package:dui_app_updater/dui_app_updater_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDuiAppUpdaterPlatform
    with MockPlatformInterfaceMixin
    implements DuiAppUpdaterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DuiAppUpdaterPlatform initialPlatform = DuiAppUpdaterPlatform.instance;

  test('$MethodChannelDuiAppUpdater is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDuiAppUpdater>());
  });

  test('getPlatformVersion', () async {
    DuiAppUpdater duiAppUpdaterPlugin = DuiAppUpdater();
    MockDuiAppUpdaterPlatform fakePlatform = MockDuiAppUpdaterPlatform();
    DuiAppUpdaterPlatform.instance = fakePlatform;

    expect(await duiAppUpdaterPlugin.getPlatformVersion(), '42');
  });
}
