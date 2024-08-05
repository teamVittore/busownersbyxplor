class BusWiseDataModel {
  final String vehicleNumber;
  final String vehicleName;
  final String routeName;
  final double revenue;
  final double cashPayment;
  final double upiPayment;
  final double expense;
  final double profit;
  final int vehicleId;

  BusWiseDataModel({
    required this.vehicleNumber,
    required this.vehicleName,
    required this.routeName,
    required this.revenue,
    required this.cashPayment,
    required this.upiPayment,
    required this.expense,
    required this.profit,
    required this.vehicleId,
  });

  factory BusWiseDataModel.fromJson(Map<String, dynamic> json) =>
      BusWiseDataModel(
          vehicleNumber: json["vehicleNumber"],
          vehicleName: json["vehicleName"],
          routeName: json["routeName"],
          revenue: json["revenue"],
          cashPayment: json["cashPayment"],
          upiPayment: json["upiPayment"],
          expense: json["expense"] ?? 0,
          profit: json["profit"] ?? 0,
          vehicleId: json["vehicleid"]);

  Map<String, dynamic> toJson() => {
        "vehicleNumber": vehicleNumber,
        "vehicleName": vehicleName,
        "routeName": routeName,
        "revenue": revenue,
        "cashPayment": cashPayment,
        "upiPayment": upiPayment,
        "expense": expense,
        "profit": profit,
      };
}
