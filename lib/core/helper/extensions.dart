extension VehicleFormatter on String {
  List<String> splitVehicleNumber() {
    final regex = RegExp("([A-Z]{2})([0-9]{1,2})([A-Z0-9]{1,2})([0-9]{3,4})");
    final match = regex.firstMatch(this);

    if (match != null) {
      final stateCode = match.group(1)!;
      final districtCode = match.group(2)!;
      final alphaCode = match.group(3)!;
      final number = match.group(4)!;
      return [
        "$stateCode $districtCode $alphaCode",
        number,
      ];
    } else {
      return [this, ""];
    }
  }
}
