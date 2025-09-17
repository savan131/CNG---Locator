// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, depend_on_referenced_packages, sized_box_for_whitespace, unused_import
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cng_locator/controller/currentlocation.dart';
import 'package:cng_locator/model/cylinder.dart';
import 'package:http/http.dart' as http;
import 'package:cng_locator/view/customwidget/text.dart';
import 'package:cng_locator/view/drawer/drawer.dart';
import 'package:cng_locator/view/quick_view.dart';
import 'package:cng_locator/view/bottomnavigationbar/home_page/station_Distribution.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String apiKey = "AIzaSyBQdEh3aocXi-dkH-661f1XP6YdsS_II2A";

  late double latitude = currentLocation.latitude;
  late double longitude = currentLocation.longitude;
  bool value = false;
  int activeIndex = 0;
  int pageIndex = 0;

CNGdata cngData = CNGdata();

  @override
  void initState() {
    super.initState();
    getUserLocation();
    getNearbyPlaces();
  }


 void getNearbyPlaces() async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=3000&key=AIzaSyBQdEh3aocXi-dkH-661f1XP6YdsS_II2A&keyword=CNG&type=gas_station');

    var response = await http.post(url);

    cngData =
        CNGdata.fromJson(jsonDecode(response.body));

    setState(() {});
  }

  Widget nearbyPlacesWidget(Results results) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Textcard(
            data: results.name!,
            color: Colors.black.withOpacity(0.8),
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          subtitle: Textcard(
            data: results.vicinity!,
            color: Colors.black.withOpacity(0.45),
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          trailing: Image.asset(
            'images/location_ic.png',
            height: 25,
            width: 25,
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Image.asset('images/fuelzi.png',color: Colors.black,height: 100,width: 100,),
        backgroundColor: Colors.white,
      ),
      drawer: drawer(),
      body: Container(
          child: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            CarouselSlider(
              items: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff0F529C),
                            Color(0xff266EBC),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Textcard(
                                    data: "Station",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                  Textcard(
                                    data: "(acroos country)",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Textcard(
                                    data: "3879",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              'images/ic_location.png',
                              width: 100,
                              height: 110,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff0F529C),
                            Color(0xff266EBC),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Textcard(
                                    data: "CNG Price",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                  Textcard(
                                    data: "(last 6 month)",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Textcard(
                                    data: "14.5",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              'images/ic_price_up.png',
                              width: 100,
                              height: 110,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],

              //Slider Container properties
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: activeIndex == 0 ? Colors.grey : Color(0xff266EBC),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: activeIndex == 1 ? Colors.grey : Color(0xff266EBC),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.only(left: 6, right: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTile(
                    title: Textcard(
                        data: 'CNG Stations',
                        fontWeight: FontWeight.w500,
                        fontSize: 22),
                    subtitle: Textcard(
                      data: 'State wise distribution info',
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        Get.to(StationDistribution());
                      },
                      child: Text(
                        'See more >',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 18,
                            color: Color(0xff74B530)),
                      ),
                    ),
                  ),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      childrenPadding: EdgeInsets.all(10),
                      title: Textcard(
                        data: "Near By Me",
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                      trailing: Text(
                        'View all',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 18,
                            color: Color(0xff74B530)),
                            
                      ),
                      children: [
                        if (cngData.results != null)
                    for (int i = 0;
                              i < cngData.results!.length;
                              i++)
                            GestureDetector(
                                onTap: () {
                                  Get.to(quickview(
                                    results: cngData.results![i],
                                  ));
                                },
                                child: nearbyPlacesWidget(
                                    cngData.results![i]))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

 
}
