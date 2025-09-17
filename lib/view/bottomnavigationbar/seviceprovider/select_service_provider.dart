// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, depend_on_referenced_packages

import 'package:cng_locator/view/customwidget/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class select_service_provider extends StatefulWidget {
  const select_service_provider({super.key});

  @override
  State<select_service_provider> createState() =>
      _select_service_providerState();
}

class _select_service_providerState extends State<select_service_provider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Select Service Providers',
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
      body: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(children: [
          SizedBox(
            height: 10,
          ),
          dropdown(
            items: ['car', 'bike', 'truck'],
            imagelocation: 'images/addnewstation/ic_state.png',
            data: 'State',
          ),
          const SizedBox(
            height: 12,
          ),
          dropdown(
            items: ['car', 'bike', 'truck'],
            imagelocation: 'images/addnewstation/ic_city.png',
            data: 'City',
          ),
        ]),
      ),
    );
  }
}
