// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  final String profilePicture;
  final String name;
  final String number;
  final String email;
  final String companyName;
  final String companyPan;

  ProfileModel({
    required this.profilePicture,
    required this.name,
    required this.number,
    required this.email,
    required this.companyName,
    required this.companyPan,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        profilePicture: json["profile_picture"] ?? '',
        name: json["name"],
        number: json["number"],
        email: json["email"],
        companyName: json["companyName"],
        companyPan: json["companyPAN"],
      );

  Map<String, dynamic> toJson() => {
        "profile_picture": profilePicture,
        "name": name,
        "number": number,
        "email": email,
        "companyName": companyName,
        "companyPAN": companyPan,
      };
}
