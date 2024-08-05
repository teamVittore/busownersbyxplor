class APIEndpoints {
  static const String ticketAppURLIP = "http://13.60.18.138";
  static const String ticketAppURL = "http://testing.goxploronline.net:80";

  // AUTH
  static const String sendOTP = "$ticketAppURL/auth/sendotp/";
  static const String validateOTP = "$ticketAppURL/auth/validateotp";

  //web urls
  static const String privacyPolicy =
      "$ticketAppURL/ticketapp/v1/privacy_policy";
  static const String cancellation =
      "$ticketAppURL/ticketapp/v1/cancellation_and_refund_policy";
  static const String termsAndConditions =
      "$ticketAppURL/ticketapp/v1/terms_and_conditions";
// vehicle api
  static const String vehicles =
      "$ticketAppURL/ownerapp/v1/vehicle/trackingnew";

  // profile
  static const String profile = "$ticketAppURL/ownerapp/v1/profile/fetch";
  // revenue
  static const String revenue = "$ticketAppURL/ownerapp/v1/dashboard/revenue";
  // route
  static const String route = "$ticketAppURL/ownerapp/v1/vehicle/route";
  // trip details
  static const String tripDetails =
      "$ticketAppURL/ownerapp/v1/vehicle/trip-details";
}
