// ignore_for_file: prefer_const_constructors, sort_child_properties_last, depend_on_referenced_packages, camel_case_types

import 'dart:convert';
import 'package:cng_locator/controller/currentlocation.dart';
import 'package:cng_locator/model/cylinder.dart';
import 'package:cng_locator/view/customwidget/custommarker.dart';
import 'package:cng_locator/view/customwidget/dialog.dart';
import 'package:cng_locator/view/drawer/add_station.dart';
import 'package:cng_locator/view/station_details.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  bool value = true;
  bool searchplacevalue = true;
  
  List<dynamic> placeList = [];
  Set<Marker> markers = {};
  List<geocoding.Location> location = [];
  String place = 'Search any city, state';
  TextEditingController textEditingController = TextEditingController();

  CNGdata cngData = CNGdata();
  GoogleMapController? googleMapController;
  Cngstationlist() async {
    BitmapDescriptor? markerbitmap;
    markerbitmap = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "images/ic_fuel_station_mark.png",
    );

    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=CNG%20in%20India&key=AIzaSyBQdEh3aocXi-dkH-661f1XP6YdsS_II2A');

    var response = await http.post(url);
    if (response.statusCode == 200) {
      setState(() {
        cngData = CNGdata.fromJson(jsonDecode(response.body));
      });
    }

    if (cngData.results != null) {
      for (int i = 0; i < cngData.results!.length; i++) {
        markers.add(Marker(
            markerId: MarkerId(cngData.results![i].name!.toString()),
            position: LatLng(
                cngData.results![i].geometry!.location!.lat!.toDouble(),
                cngData.results![i].geometry!.location!.lng!.toDouble()),
            icon: markerbitmap,
            onTap: () {
              Get.to(station_details(result: cngData.results![i]));
            }));
      }
    }
  }

  @override
  void initState() {
    Cngstationlist();
    getUserLocation();
    imagemarker();
    super.initState();
    textEditingController.addListener(() {
      getSuggestion(textEditingController.text);
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      markers.add(Marker(
        markerId: MarkerId('addstation'),
        position: initialPosition!,
        draggable: true,
        icon: markerbitmap!,
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return dialog(
                  imageLocation: 'images/ic_my_location.png',
                  title: 'Add new Station',
                  subtitle:
                      'Do you want to proceed to add new station details?',
                  button1name: 'NO,REMOVE MARKER',
                  buttn2name: 'YES',
                  button1: () {
                    setState(() {
                      markers.removeWhere((Marker marker) =>
                          marker.markerId == MarkerId('addstation'));
                      Get.back();
                    });
                  },
                  button2: () {
                    Get.to(AddNewStation());
                  },
                );
              });
        },
      ));
    });
  }

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
                  initialCameraPosition:
                      CameraPosition(target: initialPosition!, zoom: 10),
                  mapType: value == true ? MapType.normal : MapType.satellite,
                  zoomControlsEnabled: false,
                  markers: markers,
                  myLocationEnabled: true,
                  onMapCreated: (GoogleMapController controller) async {
                    googleMapController = controller;}
                ),
                Positioned(
                  top: 70,
                  left: MediaQuery.of(context).size.width - 75,
                  child: Image.asset(
                    'images/map/ic_full_screen.png',
                    height: 60,
                    width: 60,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        searchplacevalue = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4.0,
                            offset: Offset(0, 3),
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          CircleAvatar(
                            backgroundColor: Color(0xff0F529C),
                            child: Image.asset(
                              "images/search.png",
                              height: 18,
                              width: 18,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            searchplacevalue == false
                                ? 'Search any city, state'
                                : place,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              "images/ic_close1.png",
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
              floatingActionButton:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _onAddMarkerButtonPressed();
                      },
                      child: Image.asset(
                        'images/map/ic_add_mark.png',
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
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
                        searchplacevalue == true;
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
                  controller: textEditingController,
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
                        textEditingController.clear();
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
                      onTap: () async {
                        location = await geocoding.locationFromAddress(
                            placeList[index]["description"]);
                             googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target:  LatLng(
                              location.last.latitude, location.last.longitude),
                          zoom: 10),
                    ));
                        setState(() {
                          searchplacevalue = true;
                          initialPosition = LatLng(
                              location.last.latitude, location.last.longitude);
                          place = placeList[index]["description"];
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
}
