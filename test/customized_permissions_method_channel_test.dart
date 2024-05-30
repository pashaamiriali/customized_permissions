import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:customized_permissions/customized_permissions_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelCustomizedPermissions platform = MethodChannelCustomizedPermissions();
  const MethodChannel channel = MethodChannel('customized_permissions');

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
