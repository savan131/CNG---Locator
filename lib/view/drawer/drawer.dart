// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, depend_on_referenced_packages, camel_case_types
import 'package:cng_locator/view/customwidget/listtile.dart';
import 'package:cng_locator/view/customwidget/text.dart';
import 'package:cng_locator/view/drawer/add_station.dart';
import 'package:cng_locator/view/drawer/Favorites.dart';
import 'package:cng_locator/view/drawer/My_profile.dart';
import 'package:cng_locator/view/drawer/Recommendations.dart';
import 'package:cng_locator/view/drawer/saving_estimation.dart';
import 'package:cng_locator/view/drawer/setting.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../auth/googlelogin.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  final controller = Get.put(LoginController());
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        elevation: 10.0,
        child: ListView(
          children: <Widget>[
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xff74B530),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                    ),
                  ],
                ),
                Positioned(
                  top: 50,
                  left: 18,
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5.0,
                            offset: Offset(0, 3),
                          )
                        ],
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 5)),
                    child: CircleAvatar(
                      backgroundColor: Color(0xff0F529C),
                      child: Textcard(
                        data: user!.displayName![0],
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 44,
                      ),
                      radius: 40.0,
                    ),
                  ),
                ),
                Positioned(
                    left: 120,
                    top: 72,
                    child: Textcard(
                      data: user!.displayName,
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ))
              ],
            ),
            listtille(
              imagelocation: "images/drawer/ic_profile.png",
              title: "My Profile",
              navigation: () {
                Get.to(MyProfile());
              },
            ),
            listtille(
              imagelocation: "images/drawer/ic_like.png",
              title: "Favorites",
              navigation: () {
                Get.to(Favourite());
              },
            ),
            listtille(
              imagelocation: "images/drawer/ic_recommend.png",
              title: "Recommendations",
              navigation: () {
                Get.to(Recommendations());
              },
            ),
            listtille(
              imagelocation: "images/drawer/ic_estimator.png",
              title: "Savings Estimator",
              navigation: () {
                Get.to(Saving_Estimator());
              },
            ),
            listtille(
              imagelocation: "images/drawer/ic_add_new_station.png",
              title: "Add New Station",
              navigation: () {
                Get.to(AddNewStation());
              },
            ),
            listtille(
              imagelocation: "images/drawer/ic_settings.png",
              title: "Setting",
              navigation: () {
                Get.to(setting());
              },
            ),
            ListTile(
              leading: Image.asset(
                "images/drawer/ic_feedback.png",
                height: 22,
                width: 22,
              ),
              title: Textcard(
                data: "Feedback",
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              subtitle: Textcard(
                data: user!.email,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.45),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.logoutGoogle();
              },
              child: listtille(
                imagelocation: "images/drawer/ic_logout.png",
                title: "Logout",
              ),
            ),
            
          ],
        ));
  }
}
