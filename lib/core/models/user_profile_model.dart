// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'user_profile_model.g.dart';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 1)
class UserProfileModel {
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String profileImage;
  @HiveField(4)
  final String subtext;

  UserProfileModel({
    required this.id,
    required this.name,
    required this.profileImage,
    required this.subtext,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        id: json["id"],
        name: json["name"],
        profileImage: json["profileImage"],
        subtext: json["subtext"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profileImage": profileImage,
        "subtext": subtext,
      };
}
