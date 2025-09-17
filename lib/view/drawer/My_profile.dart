// ignore: file_names
// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers, depend_on_referenced_packages


import 'package:cng_locator/view/auth/googlelogin.dart';
import 'package:cng_locator/view/customwidget/dropdown.dart';
import 'package:cng_locator/view/customwidget/text.dart';
import 'package:cng_locator/view/customwidget/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';


class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final _Myprofile = GlobalKey<FormState>();
  final controller = Get.put(LoginController());
  final user = FirebaseAuth.instance.currentUser;
  int? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'My Profile',
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
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Container(
              child: Form(
                key: _Myprofile,
                child: Column(children: [
                    const SizedBox(
                    height: 12,
                  ),
                  
                  TextformFieldCard(
                    ImageLocation: "images/drawer/ic_profile.png",
                    hintText: 'First Name',
                    
                    keyboardType: TextInputType.text,
                    Regexp: '[A-Za-z]',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextformFieldCard(
                    ImageLocation: "images/drawer/ic_profile.png",
                    hintText: 'Last Name',
                    keyboardType: TextInputType.text,
                    Regexp: '[A-Za-z]',
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            value = 0;
                          });
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              value == 0
                                  ? 'images/myprofile/ic_fill_male.png'
                                  : 'images/myprofile/ic_male.png',
                              height: 25,
                              width: 25,
                            ),
                            Textcard(
                              data: '  Male',
                              color: value == 0
                                  ? Color(0xff74B530)
                                  : Colors.black.withOpacity(0.6),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            value = 1;
                          });
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              value == 1
                                  ? 'images/myprofile/ic_fill_female.png'
                                  : 'images/myprofile/ic_female.png',
                              height: 25,
                              width: 25,
                            ),
                            Textcard(
                              data: '  Female',
                              color: value == 1
                                  ? Color(0xff74B530)
                                  : Colors.black.withOpacity(0.6),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            value = 2;
                          });
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              value == 2
                                  ? 'images/myprofile/ic_fill_other.png'
                                  : 'images/myprofile/ic_other.png',
                              height: 25,
                              width: 25,
                            ),
                            Textcard(
                              data: '  Other',
                              color: value == 2
                                  ? Color(0xff74B530)
                                  : Colors.black.withOpacity(0.6),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  TextformFieldCard(
                    ImageLocation: "images/myprofile/ic_date.png",
                    hintText: 'Date of Birth',
                    keyboardType: TextInputType.text,
                    Regexp: '[A-Za-z]',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextformFieldCard(
                    keyboardType: TextInputType.phone,
                    ImageLocation: "images/myprofile/phone.png",
                    hintText: 'Phone Number',
                    Regexp: '[0-9]',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  dropdown(
                    items: ['car', 'bike', 'truck'],
                    imagelocation: 'images/myprofile/car.png',
                    data: 'Vehicle Model',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextformFieldCard(
                    ImageLocation: "images/myprofile/car.png",
                    hintText: 'Vehicle Model',
                    keyboardType: TextInputType.text,
                    Regexp: '[A-Za-z0-9]',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  dropdown(
                    items: ['car', 'bike', 'truck'],
                    imagelocation: 'images/myprofile/ic_vehicle_perpose.png',
                    data: 'Vehicle Purpose',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  dropdown(
                    items: ['car', 'bike', 'truck'],
                    imagelocation: 'images/myprofile/ic_business_category.png',
                    data: 'Business Category',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                    onPressed: () async{
                     // await DatabaseService(uid: user!.uid).updateUserData('');
                      // if (_Myprofile.currentState!.validate()) {
                      //   // ScaffoldMessenger.of(context).showSnackBar(
                      //   //   const SnackBar(content: Text('Processing Data')),
                      //   // );
                      // } else {}
                      // ;
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff74B530),
                      minimumSize: Size(MediaQuery.of(context).size.width, 55),
                    ),
                  )
                ]),
              ),
            ),
          ),
        )));
  }
}
