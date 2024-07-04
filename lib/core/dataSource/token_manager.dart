import 'package:admin_app/core/dataSource/db_const.dart';
import 'package:admin_app/core/dataSource/user_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TokenManager {
  static const _tokenKey = 'accessToken';

  /// Retrieves the access token from the provided Hive box.
  Future<String?> getToken() async {
    return await Hive.box(token).get(_tokenKey) as String?;
  }

  /// Removes the access token from the provided Hive box.
  Future<void> removeToken() async {
    await Hive.box(token).delete(_tokenKey);
    await UserProfileManager().deleteUserProfile();
  }

  /// Stores the access token in the provided Hive box.
  Future<void> storeToken(String accessToken) async {
    await Hive.box(token).put(_tokenKey, accessToken);
  }
}
