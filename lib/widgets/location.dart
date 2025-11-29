import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentLocation() async {
  // Check permission
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error("Location services are disabled.");
  }

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("Location permission denied");

    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error("Location permissions are permanently denied.");
  }

  // Get current position
  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
}
void fetchLocation() async {
  try {
    Position pos = await getCurrentLocation();
    debugPrint("Latitude: ${pos.latitude}");
    debugPrint("Longitude: ${pos.longitude}");
  } catch (e) {
    debugPrint("Fetch Location Error $e");
  }
}

