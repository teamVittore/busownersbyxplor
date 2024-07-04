class RouteDetailModel {
  // final String locationName;
  final double latitude;
  final double longitude;
  // final String time;

  RouteDetailModel({
    // required this.locationName,
    required this.latitude,
    required this.longitude,
    // required this.time,
  });

  factory RouteDetailModel.fromJson(Map<String, dynamic> json) =>
      RouteDetailModel(
        // locationName: json["locationName"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        // time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        // "locationName": locationName,
        "latitude": latitude,
        "longitude": longitude,
        // "time": time,
      };
}
