import 'package:admin_app/core/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

Future<bool> checkAndRequestLocationPermissions() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    showToast('Location services are disabled');
    return false;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      showToast('Location permissions are denied');
      return false;
    }
  }

  // Permissions are granted
  return true;
}

Future<bool> isLocationEnabled() async {
  LocationPermission serviceEnabled = await Geolocator.checkPermission();
  if (serviceEnabled == LocationPermission.denied ||
      serviceEnabled == LocationPermission.deniedForever) {
    return false;
  } else {
    return true;
  }
}

requestLocationPermissionAlert(BuildContext context) async {
  // Location services are disabled, show alert dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Location Services Disabled'),
        content: const Text(
            'Please enable location services to continue using the app.'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Enable'),
            onPressed: () {
              Future(() => Geolocator.openAppSettings());
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
