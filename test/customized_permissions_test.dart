import 'package:flutter_test/flutter_test.dart';
import 'package:customized_permissions/customized_permissions.dart';
import 'package:customized_permissions/customized_permissions_platform_interface.dart';
import 'package:customized_permissions/customized_permissions_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCustomizedPermissionsPlatform
    with MockPlatformInterfaceMixin
    implements CustomizedPermissionsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CustomizedPermissionsPlatform initialPlatform = CustomizedPermissionsPlatform.instance;

  test('$MethodChannelCustomizedPermissions is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCustomizedPermissions>());
  });

  test('getPlatformVersion', () async {
    CustomizedPermissions customizedPermissionsPlugin = CustomizedPermissions();
    MockCustomizedPermissionsPlatform fakePlatform = MockCustomizedPermissionsPlatform();
    CustomizedPermissionsPlatform.instance = fakePlatform;

    expect(await customizedPermissionsPlugin.getPlatformVersion(), '42');
  });
}
