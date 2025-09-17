// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, camel_case_types, depend_on_referenced_packages, avoid_unnecessary_containers

import 'dart:convert';
import 'package:cng_locator/controller/currentlocation.dart';
import 'package:cng_locator/view/customwidget/custommarker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:cng_locator/view/station_details.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class search_route extends StatefulWidget {
  const search_route({super.key});

  @override
  State<search_route> createState() => _search_routeState();
}

class _search_routeState extends State<search_route> {
  bool visible = true;
  bool value = true;
  bool sourceadressvalue = false;
  bool searchplacevalue = true;
  LatLng? sorceAddress =
      LatLng(currentLocation.latitude, currentLocation.longitude);
  GoogleMapController? googleMapController;
  String destinationplace = 'Select Destination';
  String sourceplace = 'Your Location';
  LatLng? deastinationAddress;

  Set<Polyline> _polylines = <Polyline>{};
  Set<Marker> _markers = {};
  late List<Location> destinationlocation;
  late List<Location> sourcelocation;

  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints = PolylinePoints();
  TextEditingController searchplace = TextEditingController();
  PolylineResult? result;

  @override
  void initState() {
    super.initState();
    searchplace.addListener(() {
      //_onChanged();
      getSuggestion(searchplace.text);
    });
    getUserLocation();
    imagemarker();
  }

  List<dynamic> placeList = [];

  void getSuggestion(String input) async {
    String kPLACES_API_KEY = "AIzaSyBQdEh3aocXi-dkH-661f1XP6YdsS_II2A";
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$kPLACES_API_KEY&components=country:in&types=%28cities%29';
    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      setState(() {
        placeList = json.decode(response.body)['predictions'];
      });
    } else {
      throw Exception('Failed to load predictions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: searchplacevalue == true
          ? Scaffold(
              body: Stack(children: [
                GoogleMap(
                  myLocationButtonEnabled: false,
                  markers: _markers,
                  polylines: _polylines,
                  initialCameraPosition:
                      CameraPosition(target: initialPosition!, zoom: 10),
                  mapType: value == true ? MapType.normal : MapType.satellite,
                  zoomControlsEnabled: false,
                  myLocationEnabled: true,
                  onMapCreated: (GoogleMapController controller) async {
                    googleMapController = controller;
                    // _controller.complete(controller);
                    // controller = await _controller.future;
                    // controller.animateCamera(CameraUpdate.newCameraPosition(
                    //   CameraPosition(target: initialPosition!, zoom: 10),
                    // ));
                  },
                ),
                Column(
                  children: [
                    Visibility(
                        visible: visible,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 4.0,
                                  offset: Offset(0, 3),
                                )
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    child: Image.asset(
                                      'images/search_route.png',
                                      height: 90,
                                      width: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              searchplacevalue = false;
                                              sourceadressvalue = true;
                                              searchplace.clear();
                                              sourcelocation = [];
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(left: 10),
                                            height: 50,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black
                                                        .withOpacity(0.2)),
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    searchplacevalue == false
                                                        ? 'Your Location'
                                                        : sourceplace)),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              searchplacevalue = false;
                                              searchplace.clear();
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(left: 10),
                                            height: 50,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black
                                                        .withOpacity(0.2)),
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    searchplacevalue == false
                                                        ? 'Select destinatons'
                                                        : destinationplace)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onDoubleTap: () {
                                      _polylines = {};
                                      polylineCoordinates = [];
                                    },
                                    onTap: () async {
                                      setPolylines();
                                      showPinsOnMap();
                                      setState(() {
                                        _polylines = {};
                                        polylineCoordinates = [];
                                        _polylines.add(Polyline(
                                            width: 3,
                                            polylineId: PolylineId('polyLine'),
                                            color: Colors.red,
                                            points: polylineCoordinates));
                                      });
                                       googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: deastinationAddress!,
                          zoom: 10),
                    ));
                                      // final GoogleMapController controller =
                                      //     await _controller.future;
                                      // controller.animateCamera(
                                      //     CameraUpdate.newCameraPosition(
                                      //   CameraPosition(
                                      //       target: deastinationAddress!,
                                      //       zoom: 10),
                                      // ));
                                    },
                                    child: Container(
                                      child: Image.asset(
                                        'images/search_route2.png',
                                        height: 25,
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ]),
                          ),
                        )),
                    visible == true
                        ? Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width - 80),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
                              child: Image.asset(
                                'images/map/ic_full_screen.png',
                                height: 60,
                                width: 60,
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                                top: 10,
                                left: MediaQuery.of(context).size.width - 75),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
                              child: Image.asset(
                                'images/map/ic_full_screen.png',
                                height: 60,
                                width: 60,
                              ),
                            ),
                          ),
                  ],
                ),
              ]),
              floatingActionButton:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: ()  {
                    
                    // final GoogleMapController controller =
                    //     await _controller.future;
                    googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: LatLng(currentLocation.latitude,
                              currentLocation.longitude),
                          zoom: 10),
                    ));
                  },
                  child: Image.asset(
                    'images/map/ic_gps_mark.png',
                    height: 60,
                    width: 60,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        value = !value;
                      });
                    },
                    child: value == true
                        ? Image.asset(
                            'images/map/satelite_map.png',
                            height: 60,
                            width: 60,
                          )
                        : Image.asset(
                            'images/map/default.png',
                            height: 60,
                            width: 60,
                          ))
              ]),
            )
          : Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                leading: GestureDetector(
                    onTap: () {
                      setState(() {
                        searchplacevalue = true;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        "images/ic_back.png",
                        height: 20,
                        width: 20,
                      ),
                    )),
                title: TextField(
                  controller: searchplace,
                  decoration: InputDecoration(
                    hintText: 'Search any city, state',
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                actions: [
                  GestureDetector(
                      onTap: () {
                        searchplace.clear();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          "images/ic_close1.png",
                          height: 20,
                          width: 20,
                        ),
                      )),
                ],
              ),
              body: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: placeList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: sourceadressvalue == true
                          ? () async {
                              sourcelocation = await locationFromAddress(
                                  placeList[index]["description"]);
                              setState(() {
                                searchplacevalue = true;
                                sourceadressvalue = false;
                                sorceAddress = LatLng(
                                    sourcelocation.last.latitude,
                                    sourcelocation.last.longitude);
                                sourceplace = placeList[index]["description"];
                                placeList = [];
                              });
                            }
                          : () async {
                              destinationlocation = await locationFromAddress(
                                  placeList[index]["description"]);
                              setState(() {
                                searchplacevalue = true;
                                initialPosition = LatLng(
                                    destinationlocation.last.latitude,
                                    destinationlocation.last.longitude);
                                deastinationAddress = LatLng(
                                    destinationlocation.last.latitude,
                                    destinationlocation.last.longitude);
                                destinationplace =
                                    placeList[index]["description"];
                                placeList = [];
                              });
                            },
                      child: ListTile(
                        leading: Image.asset(
                          "images/addnewstation/ic_pincode.png",
                          height: 25,
                          width: 25,
                        ),
                        title: Text(placeList[index]["description"]),
                      ),
                    );
                  }),
            ),
    );
  }

  void showPinsOnMap() {
    setState(() {
      _markers = {};
      _markers.add(Marker(
        markerId: MarkerId('sourcePin'),
        position: sorceAddress!,
        icon: markerbitmap!,
      ));

      _markers.add(Marker(
        markerId: MarkerId('destinationPin'),
        position: deastinationAddress!,
        icon: markerbitmap!,
      ));
    });
  }

  void setPolylines() async {
    result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyBQdEh3aocXi-dkH-661f1XP6YdsS_II2A",
        PointLatLng(sorceAddress!.latitude, sorceAddress!.longitude),
        PointLatLng(
            deastinationAddress!.latitude, deastinationAddress!.longitude));
    //  PointLatLng(
    //     destinationlocation.last.latitude, destinationlocation.last.longitude));

    if (result!.status == 'OK') {
      setState(() {});
      result!.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
  }
}
