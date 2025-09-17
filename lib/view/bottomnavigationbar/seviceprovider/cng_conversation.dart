// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'dart:convert';
import 'package:cng_locator/model/cylinder.dart';
import 'package:cng_locator/view/customwidget/text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class cngconversion extends StatefulWidget {
  const cngconversion({super.key});

  @override
  State<cngconversion> createState() => _cngconversionState();
}

CNGdata cngData = CNGdata();

class _cngconversionState extends State<cngconversion> {
  cylinderTest() async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=CNG%20conversion%20in%20India&key=AIzaSyBQdEh3aocXi-dkH-661f1XP6YdsS_II2A');
    var response = await http.post(url);
    if (response.statusCode == 200) {
      setState(() {
        cngData =
            CNGdata.fromJson(jsonDecode(response.body));
      });
    } else {
      throw Exception('Error');
    }
  }

  @override
  void initState() {
    cylinderTest();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  print(cylinderTestModel.results!.length.toString());
    return Scaffold(
        body: ListView.builder(
      itemCount: cngData.results!.length,
      itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.only(left: 14.0, right: 14.0, bottom: 14),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
                contentPadding: EdgeInsets.all(10),
                title: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Textcard(
                    data: cngData.results![position].name,
                    color: Colors.black.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                subtitle: Textcard(
                  data:cngData.results![position].formattedaddress,
                  color: Colors.black.withOpacity(0.45),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'images/ic_message.png',
                      height: 16,
                      width: 16,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Image.asset(
                      'images/ic_call.png',
                      height: 16,
                      width: 16,
                    ),
                  ],
                )),
          ),
        );
      },
    ));
  }
}
