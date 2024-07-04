// To parse this JSON data, do
//
//     final revenueModel = revenueModelFromJson(jsonString);

import 'dart:convert';

import 'package:admin_app/UI/presentation/dashboard/models/bus_wise_data_model.dart';
import 'package:admin_app/UI/presentation/dashboard/models/revenue_data_model.dart';

RevenueModel revenueModelFromJson(String str) =>
    RevenueModel.fromJson(json.decode(str));

String revenueModelToJson(RevenueModel data) => json.encode(data.toJson());

class RevenueModel {
  final double totalRevenue;
  final double totalCashPayment;
  final double totalUpiPayments;
  final double totalExpense;
  final double totalProfit;
  final List<RevenueDataModel> revenueData;
  final List<BusWiseDataModel> busWiseData;

  RevenueModel({
    required this.totalRevenue,
    required this.totalCashPayment,
    required this.totalUpiPayments,
    required this.totalExpense,
    required this.totalProfit,
    required this.revenueData,
    required this.busWiseData,
  });

  factory RevenueModel.fromJson(Map<String, dynamic> json) => RevenueModel(
        totalRevenue: json["totalRevenue"],
        totalCashPayment: json["totalCashPayment"] ?? 0,
        totalUpiPayments: json["totalUpiPayments"] ?? 0,
        totalExpense: json["totalExpense"],
        totalProfit: json["totalProfit"],
        revenueData: List<RevenueDataModel>.from(
            json["revenueData"].map((x) => RevenueDataModel.fromJson(x))),
        busWiseData: List<BusWiseDataModel>.from(
            json["busWiseData"].map((x) => BusWiseDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalRevenue": totalRevenue,
        "totalCashPayment": totalCashPayment,
        "totalUpiPayments": totalUpiPayments,
        "totalExpense": totalExpense,
        "totalProfit": totalProfit,
        "revenueData": List<dynamic>.from(revenueData.map((x) => x.toJson())),
        "busWiseData": List<dynamic>.from(busWiseData.map((x) => x.toJson())),
      };
}
