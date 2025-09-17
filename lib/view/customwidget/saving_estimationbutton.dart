// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';


class buttonsavingestimation extends StatelessWidget {
  Color color;
  Color textcolor;
  Border border;
  String text;
  buttonsavingestimation(
      {super.key,
      required this.color,
      required this.border,
      required this.textcolor,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        border: border,
      ),
      child: Center(
        child: Text(
          text ,
          style: TextStyle(
            color: textcolor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
