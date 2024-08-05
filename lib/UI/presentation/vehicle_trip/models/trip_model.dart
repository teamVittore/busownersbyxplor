class TripModel {
  final String vehicleNumber;
  final int tripId;
  final String startTime;
  final String endTime;
  final int totalRevenue;
  final int totalCashPayment;
  final int totalUpiPayments;
  final int totalProfit;

  TripModel({
    required this.vehicleNumber,
    required this.tripId,
    required this.startTime,
    required this.endTime,
    required this.totalRevenue,
    required this.totalCashPayment,
    required this.totalUpiPayments,
    required this.totalProfit,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) => TripModel(
        vehicleNumber: json["vehicleNumber"],
        tripId: json["tripId"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        totalRevenue: json["totalRevenue"],
        totalCashPayment: json["totalCashPayment"],
        totalUpiPayments: json["totalUpiPayments"],
        totalProfit: json["totalProfit"],
      );

  Map<String, dynamic> toJson() => {
        "vehicleNumber": vehicleNumber,
        "tripId": tripId,
        "startTime": startTime,
        "endTime": endTime,
        "totalRevenue": totalRevenue,
        "totalCashPayment": totalCashPayment,
        "totalUpiPayments": totalUpiPayments,
        "totalProfit": totalProfit,
      };
}
