import 'dart:async';

import 'package:admin_app/UI/presentation/route/models/route_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  final List<RouteDetailModel> locations;

  const MapSample({Key? key, required this.locations}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  CameraPosition? _initialCameraPosition;
  final Set<Polyline> _polylines = {};
  final Set<Marker> _markers = {};
  List<LatLng> _routePoints = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _initialCameraPosition == null
            ? const Center(child: CircularProgressIndicator())
            : GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _initialCameraPosition!,
                polylines: _polylines,
                markers: _markers,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
        floatingActionButton: const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.gps_fixed_outlined,
            color: Color(0xFF4E0BBB),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    _setRoutePoints();
    _setInitialLocation();
  }

  LatLngBounds _calculateBounds(List<LatLng> points) {
    double? x0, x1, y0, y1;
    for (LatLng point in points) {
      if (x0 == null) {
        x0 = x1 = point.latitude;
        y0 = y1 = point.longitude;
      } else {
        if (point.latitude > x1!) x1 = point.latitude;
        if (point.latitude < x0) x0 = point.latitude;
        if (point.longitude > y1!) y1 = point.longitude;
        if (point.longitude < y0!) y0 = point.longitude;
      }
    }
    return LatLngBounds(
      northeast: LatLng(x1!, y1!),
      southwest: LatLng(x0!, y0!),
    );
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();

    setState(() {
      _initialCameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 14.4746,
      );
    });
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
        CameraUpdate.newLatLngBounds(_calculateBounds(_routePoints), 50));
  }

  Future<void> _setInitialLocation() async {
    if (widget.locations.isNotEmpty) {
      final lastLocation = widget.locations.last;
      setState(() {
        _initialCameraPosition = CameraPosition(
          target: LatLng(lastLocation.latitude, lastLocation.longitude),
          zoom: 14.4746,
        );
      });
    } else {
      await _getUserLocation();
    }
  }

  void _setRoutePoints() {
    _routePoints = widget.locations
        .map((location) => LatLng(location.latitude, location.longitude))
        .toList();

    _polylines.add(
      Polyline(
        polylineId: const PolylineId('route'),
        points: _routePoints,
        color: Colors.blue,
        width: 5,
      ),
    );

    if (_routePoints.isNotEmpty) {
      // Add start point marker
      _markers.add(
        Marker(
          markerId: const MarkerId('start'),
          position: _routePoints.first,
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindow:
              const InfoWindow(title: 'Start', snippet: 'Starting Point'),
        ),
      );

      // Add end point marker
      _markers.add(
        Marker(
          markerId: const MarkerId('end'),
          position: _routePoints.last,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          infoWindow: const InfoWindow(title: 'End', snippet: 'Ending Point'),
        ),
      );

      // Add bus markers along the route
      for (int i = 1; i < _routePoints.length - 1; i++) {
        _markers.add(
          Marker(
            markerId: MarkerId('bus_$i'),
            position: _routePoints[i],
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            infoWindow: InfoWindow(title: 'Bus Stop', snippet: 'Stop #$i'),
          ),
        );
      }
    }
  }
}
