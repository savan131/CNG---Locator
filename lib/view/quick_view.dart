// ignore_for_file: camel_case_types, depend_on_referenced_packages, must_be_immutable, prefer_const_constructors

import 'dart:async';
import 'package:cng_locator/controller/currentlocation.dart';
import 'package:cng_locator/model/cylinder.dart';
import 'package:cng_locator/view/customwidget/custommarker.dart';
import 'package:cng_locator/view/station_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class quickview extends StatefulWidget {
  Results results;
  quickview({super.key, required this.results});

  @override
  State<quickview> createState() => _quickviewState();
}

class _quickviewState extends State<quickview> {
  @override
  void initState() {
    super.initState();
    getUserLocation();
    imagemarker();
    _onAddMarkerButtonPressed();
  }

  late LatLng? markerPosition = LatLng(
      widget.results.geometry!.location!.lat!.toDouble(),
      widget.results.geometry!.location!.lng!.toDouble());
  Set<Marker> _markers = {};

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers = {};
      _markers.add(Marker(
          markerId: MarkerId('addstation'),
          position: markerPosition!,
         
          icon: markerbitmap!,
          onTap: () {
            Get.to(station_details(
              result: widget.results,
            ));
          }));
    });
  }

  final Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Quick View',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  "images/ic_back.png",
                  height: 20,
                  width: 20,
                ),
              )),
        ),
        body: SafeArea(
            child: Stack(children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            initialCameraPosition:
                CameraPosition(target: initialPosition!, zoom: 10),
            markers: _markers,
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          )
        ])));
  }
}
