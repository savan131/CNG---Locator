// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, depend_on_referenced_packages, unused_import

import 'package:cng_locator/controller/LocationPermission.dart';
import 'package:cng_locator/controller/currentlocation.dart';
import 'package:cng_locator/view/bottomnavigationbar/home_page/home_page.dart';
import 'package:cng_locator/view/bottomnavigationbar/search/search.dart';
import 'package:cng_locator/view/bottomnavigationbar/search_route.dart';
import 'package:cng_locator/view/bottomnavigationbar/seviceprovider/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final pages = [
    const homepage(),
    const search(),
    const search_route(),
    const service_provider()
  ];
  @override
  void initState() {
    super.initState();
    handleLocationPermission();
    getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[pageIndex],
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 7.0,
                offset: Offset(4, 0),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor:
                      pageIndex == 0 ? Color(0xff0F529C) : Colors.transparent,
                  child: Image.asset(
                    pageIndex == 0
                        ? "images/bottomnavigation/Vecto1.png"
                        : "images/bottomnavigation/Vector1.png",
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                // Cngstationlist();
                  setState(() {
                    pageIndex = 1;
                  });
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor:
                      pageIndex == 1 ? Color(0xff0F529C) : Colors.transparent,
                  child: Image.asset(
                    pageIndex == 1
                        ? "images/bottomnavigation/Vecto2.png"
                        : "images/bottomnavigation/Vector2.png",
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor:
                      pageIndex == 2 ? Color(0xff0F529C) : Colors.transparent,
                  child: Image.asset(
                    pageIndex == 2
                        ? "images/bottomnavigation/Vecto3.png"
                        : "images/bottomnavigation/Vector3.png",
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor:
                      pageIndex == 3 ? Color(0xff0F529C) : Colors.transparent,
                  child: Image.asset(
                    pageIndex == 3
                        ? "images/bottomnavigation/Vecto4.png"
                        : "images/bottomnavigation/Vector4.png",
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
