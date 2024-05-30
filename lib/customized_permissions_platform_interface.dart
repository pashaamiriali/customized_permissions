import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'customized_permissions_method_channel.dart';

abstract class CustomizedPermissionsPlatform extends PlatformInterface {
  /// Constructs a CustomizedPermissionsPlatform.
  CustomizedPermissionsPlatform() : super(token: _token);

  static final Object _token = Object();

  static CustomizedPermissionsPlatform _instance = MethodChannelCustomizedPermissions();

  /// The default instance of [CustomizedPermissionsPlatform] to use.
  ///
  /// Defaults to [MethodChannelCustomizedPermissions].
  static CustomizedPermissionsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CustomizedPermissionsPlatform] when
  /// they register themselves.
  static set instance(CustomizedPermissionsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
