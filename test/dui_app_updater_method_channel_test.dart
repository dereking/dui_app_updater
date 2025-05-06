import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dui_app_updater/dui_app_updater_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelDuiAppUpdater platform = MethodChannelDuiAppUpdater();
  const MethodChannel channel = MethodChannel('dui_app_updater');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
