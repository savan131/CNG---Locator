import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
 BitmapDescriptor? markerbitmap;
imagemarker() async {
 
  markerbitmap = await BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(),
    "images/ic_fuel_station_mark.png",
  );
}
