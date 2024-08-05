// To parse this JSON data, do
//
//     final tripsListModel = tripsListModelFromJson(jsonString);

import 'dart:convert';

import 'package:admin_app/UI/presentation/vehicle_trip/models/trip_model.dart';

TripsListModel tripsListModelFromJson(String str) =>
    TripsListModel.fromJson(json.decode(str));

String tripsListModelToJson(TripsListModel data) => json.encode(data.toJson());

class TripsListModel {
  final String message;
  final List<TripModel> data;

  TripsListModel({
    required this.message,
    required this.data,
  });

  factory TripsListModel.fromJson(Map<String, dynamic> json) => TripsListModel(
        message: json["message"],
        data: List<TripModel>.from(
            json["data"].map((x) => TripModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
