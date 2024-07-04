import 'dart:convert';

CommonModel commonModelFromJson(String str) =>
    CommonModel.fromJson(json.decode(str));

String commonModelToJson(CommonModel data) => json.encode(data.toJson());

class CommonModel<T> {
  final String message;
  final T? data; // Using generic type parameter T

  CommonModel({
    required this.message,
    required this.data,
  });

  factory CommonModel.fromJson(Map<String, dynamic> json) => CommonModel<T>(
        message: json["message"],
        data: json["data"] as T, // Casting to type T
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data,
      };
}
