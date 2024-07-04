class RevenueDataModel {
  final String date;
  final double value;

  RevenueDataModel({
    required this.date,
    required this.value,
  });

  factory RevenueDataModel.fromJson(Map<String, dynamic> json) =>
      RevenueDataModel(
        date: json["date"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "value": value,
      };
}
