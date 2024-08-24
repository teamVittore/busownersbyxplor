// To parse this JSON data, do
//
//     final vehicleModel = vehicleModelFromJson(jsonString);

import 'dart:convert';

VehicleModel vehicleModelFromJson(String str) =>
    VehicleModel.fromJson(json.decode(str));

String vehicleModelToJson(VehicleModel data) => json.encode(data.toJson());

class VehicleModel {
  final int vehicleId;
  final int tripId;
  final String vehicleNumber;
  final String statusText;
  final String fromLocation;
  final String toLocation;
  final String startTime;
  final String endTime;
  final String driverName;
  final String driverNumber;
  final double totalRevenue;
  final double totalExpense;
  final int livePassengerCount;
  final double profit;

  VehicleModel({
    required this.vehicleId,
    required this.vehicleNumber,
    required this.statusText,
    required this.fromLocation,
    required this.toLocation,
    required this.startTime,
    required this.endTime,
    required this.driverName,
    required this.driverNumber,
    required this.totalRevenue,
    required this.totalExpense,
    required this.profit,
    required this.livePassengerCount,
    required this.tripId,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
      vehicleId: json["vehicleId"],
      vehicleNumber: json["vehicleNumber"],
      statusText: json["statusText"],
      fromLocation: json["fromLocation"],
      toLocation: json["toLocation"],
      startTime: json["startTime"],
      endTime: json["endTime"],
      driverName: json["driverName"],
      livePassengerCount: json["livePassengerCount"] ?? 0,
      driverNumber: json["driverNumber"],
      totalRevenue: json["totalRevenue"],
      totalExpense: json["totalExpense"],
      profit: json["profit"] ?? 0,
      tripId: json["tripId"]);

  Map<String, dynamic> toJson() => {
        "vehicleId": vehicleId,
        "vehicleNumber": vehicleNumber,
        "statusText": statusText,
        "fromLocation": fromLocation,
        "toLocation": toLocation,
        "startTime": startTime,
        "endTime": endTime,
        "driverName": driverName,
        "driverNumber": driverNumber,
        "totalRevenue": totalRevenue,
        "totalExpense": totalExpense,
        "profit": profit,
        "livePassengerCount": livePassengerCount,
      };
}
