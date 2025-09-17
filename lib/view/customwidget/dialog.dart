// ignore_for_file: sort_child_properties_last, prefer_const_constructors, camel_case_types

import 'package:cng_locator/view/customwidget/text.dart';
import 'package:flutter/material.dart';

class dialog extends StatelessWidget {
  final String? imageLocation;
  final String? title;
  final String? subtitle;
  final String? button1name;
  final String? buttn2name;
  final void Function()? button1;
  final void Function()? button2;

  const dialog(
      {super.key,
      this.imageLocation,
      this.title,
      this.subtitle,
      this.buttn2name,
      this.button1name,
      this.button1,
      this.button2});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.all(14),
      title: Row(
        children: [
          Image.asset(
            imageLocation!,
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
          SizedBox(
            width: 10,
          ),
          Textcard(
              data: title,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ],
      ),
      contentPadding: EdgeInsets.only(left: 14, right: 14),
      content: Textcard(
          data: subtitle,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black),
      actionsPadding: EdgeInsets.all(15),
      actions: [
        ElevatedButton(
          onPressed:button1!,
          child: Textcard(
            data: button1name,
            color: Colors.black.withOpacity(0.8),
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff74B530),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // <-- Radius
            ),
          ),
        ),
        ElevatedButton(
          onPressed: button2!,
          child: Textcard(
            data: buttn2name,
            color: Colors.black.withOpacity(0.8),
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff0F529C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // <-- Radius
            ),
          ),
        )
      ],
    );
  }
}
