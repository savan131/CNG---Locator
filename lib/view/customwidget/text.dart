// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';



class Textcard extends StatelessWidget {
  final String? data;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  Textcard({super.key, this.data,this.color,this.fontSize,this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? "",
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontFamily: 'SF Pro Display',
          fontStyle: FontStyle.normal),
    );
  }
}
