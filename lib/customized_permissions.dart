
import 'customized_permissions_platform_interface.dart';

class CustomizedPermissions {
  Future<String?> getPlatformVersion() {
    return CustomizedPermissionsPlatform.instance.getPlatformVersion();
  }
}
