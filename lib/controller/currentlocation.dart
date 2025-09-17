// ignore_for_file: depend_on_referenced_packages

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

late Position currentLocation;
late LatLng? initialPosition ;
Future<Position> locateUser() async {
  return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}

getUserLocation() async {
  currentLocation = await locateUser();
  initialPosition =  LatLng(currentLocation.latitude, currentLocation.longitude);
}
