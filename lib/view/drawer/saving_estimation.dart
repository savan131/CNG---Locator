// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, depend_on_referenced_packages, non_constant_identifier_names, unused_field

import 'package:cng_locator/view/customwidget/saving_estimationTextfield.dart';
import 'package:cng_locator/view/customwidget/saving_estimationbutton.dart';
import 'package:cng_locator/view/customwidget/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class Saving_Estimator extends StatefulWidget {
  const Saving_Estimator({super.key});

  @override
  State<Saving_Estimator> createState() => _Saving_EstimatorState();
}

// ignore: camel_case_types
class _Saving_EstimatorState extends State<Saving_Estimator> {
  int pageIndex = 0;
  final _savingestimation = GlobalKey<FormState>();
  bool value = false;
  String dropdownalue = '';
  TextEditingController cngprice = TextEditingController();
  TextEditingController cngmilege = TextEditingController();
  TextEditingController petrolprice = TextEditingController();
  TextEditingController petrolmilege = TextEditingController();
  TextEditingController avgdistance = TextEditingController();
  String? result;
  int timeduration = 1;

   calculateSavingestimation() {
    double cng = (double.parse(cngprice.text) * double.parse(avgdistance.text)) /
        double.parse(cngmilege.text);
    double petrol =
        (double.parse(petrolprice.text) * double.parse(avgdistance.text)) /
            double.parse(petrolmilege.text);
    setState(() {
      result = ((petrol - cng) * timeduration).toStringAsFixed(4);
    });
  }

  final _Saving_Estimator = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Saving Estimation',
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
        body: Form(
          key: _savingestimation,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                pageIndex = 1;
                                timeduration = 1;
                              });

                              if (_savingestimation.currentState!.validate()) {
                              } else {}

                              calculateSavingestimation();
                            },
                            child: buttonsavingestimation(
                              text: "Daily",
                              color: pageIndex == 1
                                  ? const Color(0xff0F529C)
                                  : Colors.white,
                              border: pageIndex == 1
                                  ? Border.all(color: Colors.transparent)
                                  : Border.all(color: Colors.grey),
                              textcolor: pageIndex == 1
                                  ? Colors.white
                                  : const Color(0xff0F529C),
                            )),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                pageIndex = 2;
                                timeduration = 30;
                              });
                              if (_savingestimation.currentState!.validate()) {
                              } else {}
                              calculateSavingestimation();
                            },
                            child: buttonsavingestimation(
                              text: "Monthly",
                              color: pageIndex == 2
                                  ? const Color(0xff0F529C)
                                  : Colors.white,
                              border: pageIndex == 2
                                  ? Border.all(color: Colors.transparent)
                                  : Border.all(color: Colors.grey),
                              textcolor: pageIndex == 2
                                  ? Colors.white
                                  : const Color(0xff0F529C),
                            )),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                pageIndex = 3;
                                timeduration = 365;
                              });
                              if (_savingestimation.currentState!.validate()) {
                              } else {}
                              calculateSavingestimation();
                            },
                            child: buttonsavingestimation(
                              text: "Yearly",
                              color: pageIndex == 3
                                  ? const Color(0xff0F529C)
                                  : Colors.white,
                              border: pageIndex == 3
                                  ? Border.all(color: Colors.transparent)
                                  : Border.all(color: Colors.grey),
                              textcolor: pageIndex == 3
                                  ? Colors.white
                                  : const Color(0xff0F529C),
                            ))
                      ]),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 14,
                      ),
                      Textcard(
                        data: 'CNG',
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Row(
                        children: [
                          Flexible(
                              child: savingTextcard(
                            controller: cngprice,
                            hinttext: 'Price',
                          )),
                          SizedBox(
                            width: 12,
                          ),
                          Flexible(
                              child: savingTextcard(
                            controller: cngmilege,
                            hinttext: 'Mileage',
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Textcard(
                        data: 'Petrol',
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Row(
                        children: [
                          Flexible(
                              child: savingTextcard(
                            controller: petrolprice,
                            hinttext: 'Price',
                          )),
                          SizedBox(
                            width: 12,
                          ),
                          Flexible(
                              child: savingTextcard(
                            controller: petrolmilege,
                            hinttext: 'Mileage',
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Textcard(
                        data: 'AvgDistance',
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      savingTextcard(
                          hinttext: 'Distance(in km)', controller: avgdistance),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          result == null ? '0.00000' : '$result',
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
