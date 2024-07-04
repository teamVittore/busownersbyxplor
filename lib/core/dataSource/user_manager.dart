import 'package:admin_app/core/dataSource/db_const.dart';
import 'package:admin_app/core/models/user_profile_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserProfileManager {
  final Box<UserProfileModel> _userProfileBox =
      Hive.box<UserProfileModel>(user);

  Future<void> addUserProfile(UserProfileModel userProfile) async {
    await _userProfileBox.add(userProfile);
  }

  Future<void> closeBox() async {
    await _userProfileBox.close();
  }

  Future<void> deleteUserProfile() async {
    await _userProfileBox.clear();
  }

  List<UserProfileModel> getAllUserProfiles() {
    return _userProfileBox.values.toList();
  }
}
