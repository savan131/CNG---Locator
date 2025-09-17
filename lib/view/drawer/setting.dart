// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:cng_locator/controller/LocationPermission.dart';
import 'package:cng_locator/view/customwidget/text.dart';
import 'package:cng_locator/view/customwidget/togglebutton.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: Textcard(
          data: "Settings",
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Image.asset(
                "images/ic_back.png",
                height: 20,
                width: 20,
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Textcard(
                  data: 'Device',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          width: 1.2,
                          color: Color(0xff212121).withOpacity(0.2))),
                        
                  child: ListTile(
                    title: Align(
                      alignment: Alignment(-2.5, 0),
                      child: Textcard(
                          data: 'Location Permission',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                    ),
                    leading: Image.asset(
                      'images/setting/ic_location_permission.png',
                      height: 22,
                      width: 22,
                    ),
                   trailing: GestureDetector(
                    onTap: (){handleLocationPermission();},
                    child: togglebuttonm())
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(width: 0.5, color: Colors.grey)),
                  child: ListTile(
                      title: Align( alignment: Alignment(-1.25, 0),
                        child: Textcard(
                         
                          data: 'Device Model',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      leading: Image.asset(
                        'images/setting/ic_device_model.png',
                        height: 22,
                        width: 22,
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                Textcard(
                  data: 'Other',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(width: 0.5, color: Colors.grey)),
                  child: ListTile(
                    title: Align( alignment: Alignment(-1.3, 0),
                      child: Textcard(
                       
                        data: 'Privacy policy',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    trailing: Icon(Icons.chevron_right_sharp),
                    leading: Image.asset(
                      'images/setting/ic_privacy_policy.png',
                      height: 22,
                      width: 22,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(width: 0.5, color: Colors.grey)),
                  child: ListTile(
                      title: Align( alignment: Alignment(-1.3, 0),
                        child: Textcard(
                         
                          data: 'App Settings',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      trailing: Icon(Icons.chevron_right_sharp),
                      leading: Image.asset(
                        'images/setting/ic_app_settings.png',
                        height: 22,
                        width: 22,
                      )),
                ),
              ]),
        ),
      ),
    );
  }
}
