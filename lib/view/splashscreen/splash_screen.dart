// ignore_for_file: camel_case_types, depend_on_referenced_packages, prefer_const_constructors

import 'dart:async';
import 'package:cng_locator/view/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () => Get.to(Sign_Up()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Image.asset('images/finallogo.png',height: 150,width: 150,)
      ),
    ));
  }
}
