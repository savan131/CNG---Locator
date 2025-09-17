// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types


import 'package:cng_locator/view/customwidget/text.dart';
import 'package:cng_locator/view/bottomnavigationbar/seviceprovider/cng_conversation.dart';
import 'package:cng_locator/view/bottomnavigationbar/seviceprovider/cylindertest.dart';
import 'package:get/get.dart';
import 'package:cng_locator/view/bottomnavigationbar/seviceprovider/select_service_provider.dart';
import 'package:flutter/material.dart';

class service_provider extends StatefulWidget {
  const service_provider({super.key});

  @override
  State<service_provider> createState() => _service_providerState();
}

class _service_providerState extends State<service_provider> {
  int tabvalue = 0;
  Widget body1 = cngconversion();
  int pageIndex = 3;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
       
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          // ignore: sort_child_properties_last
          child: Image.asset(
            "images/select_service_provider.png",
            height: 25,
            width: 25,
          ),
          backgroundColor: const Color(0xff74B530),
          onPressed: () {
            Get.to( select_service_provider(),
                );
          },
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Service Provider',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500)),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
              indicatorColor: Colors.transparent,
              unselectedLabelColor: Colors.black.withOpacity(0.4),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      tabvalue = 0;
                      body1 = cngconversion();
                    });
                  },
                  child: Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          color:
                              tabvalue == 0 ? Color(0xff0F529C) : Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: tabvalue == 0
                                ? Colors.transparent
                                : Colors.black.withOpacity(0.4),
                          )),
                      child: Align(
                        alignment: Alignment.center,
                        child: Textcard(
                          data: "CNG Conversion",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: tabvalue == 0
                              ? Colors.white
                              : Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (() {
                    setState(() {
                      tabvalue = 1;
                      body1 = cylindertest();
                    });
                  }),
                  child: Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          color:
                              tabvalue == 1 ? Color(0xff0F529C) : Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: tabvalue == 1
                                ? Colors.transparent
                                : Colors.black.withOpacity(0.4),
                          )),
                      child: Align(
                        alignment: Alignment.center,
                        child: Textcard(
                          data: "Cylinder Test",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: tabvalue == 1
                              ? Colors.white
                              : Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
        body: Container(padding: EdgeInsets.only(top: 10), child: body1),
      ),
    );
  }
}
