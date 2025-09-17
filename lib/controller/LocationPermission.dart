//import 'package:geocoding/geocoding.dart';
// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:geolocator/geolocator.dart';


  
Future<Position> handleLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    print('diable');
    
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print('denied');
      
    }
  }
  if (permission == LocationPermission.deniedForever) {
    print('forever');
   
  }
   // _getCurrentLocation();
  return await Geolocator.getCurrentPosition();
}

