// ignore_for_file: camel_case_types, sized_box_for_whitespace, prefer_const_constructors, depend_on_referenced_packages

import 'package:cng_locator/view/customwidget/review.dart';
import 'package:cng_locator/view/customwidget/text.dart';
import 'package:cng_locator/view/customwidget/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class feedback extends StatefulWidget {
  const feedback({super.key});
  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  final _formKey = GlobalKey<FormState>();
  String? payment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.black,
          centerTitle: true,
          elevation: 0,
          title: Textcard(
            data: "My Feedback",
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/ic_fuel.png',
                          color: Color(0xff0F529C),
                          height: 22,
                          width: 22,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Textcard(
                            data: 'Fuel',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0F529C)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14, right: 14),
                    child: TextformFieldCard(
                      ImageLocation: 'images/ic_timings.png',
                      hintText: 'Fill Time (in minutes)',
                      keyboardType: TextInputType.number,
                      Regexp: '[0-9.]',
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14, right: 14),
                    child: TextformFieldCard(
                      ImageLocation: 'images/ic_price.png',
                      hintText: 'CNG Price (in INR)',
                      keyboardType: TextInputType.number,
                      Regexp: '[0-9.]',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/review.png',
                          color: const Color(0xff0F529C),
                          height: 22,
                          width: 22,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Textcard(
                            data: 'Other Amenities:',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0F529C)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 14.0, right: 14.0, bottom: 14.0, top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Textcard(
                            data: 'Drinking Water',
                            color: Color(0xff212121),
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        review()
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 14.0, right: 14.0, bottom: 14.0, top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Textcard(
                            data: 'Toilet',
                            color: Color(0xff212121),
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        review(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/payment.png',
                          color: const Color(0xff0F529C),
                          height: 22,
                          width: 22,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Payment Method:',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0F529C)),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RadioListTile(
                        activeColor: Color(0xff74B530),
                        title: Textcard(
                          data: 'Cash',
                          color: Color(0xff212121),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        value: "Cash",
                        groupValue: payment,
                        onChanged: (value) {
                          setState(() {
                            payment = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        activeColor: Color(0xff74B530),
                        title: Textcard(
                          data: 'Credit / Debit card',
                          color: Color(0xff212121),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        value: "Credit / Debit card",
                        groupValue: payment,
                        onChanged: (value) {
                          setState(() {
                            payment = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        activeColor: Color(0xff74B530),
                        title: Textcard(
                            data: 'UPI / Wallets',
                            color: Color(0xff212121),
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        value: "UPI / Wallets",
                        groupValue: payment,
                        onChanged: (value) {
                          setState(() {
                            payment = value.toString();
                          });
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 100.0,
                  ),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(14.0),
                          height: 75,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () {},
                            // ignore: sort_child_properties_last
                            child: Textcard(
                              data: 'Submit',
                              fontSize: 20,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff74B530),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
