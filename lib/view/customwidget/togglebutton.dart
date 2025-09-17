// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';


class togglebuttonm extends StatefulWidget {
  const togglebuttonm({super.key});

  @override
  State<togglebuttonm> createState() => _togglebuttonmState();
}

class _togglebuttonmState extends State<togglebuttonm> {
  bool onSwitch = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          onSwitch = !onSwitch;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: onSwitch == true ? Color(0xff74B530) : Color(0xffA6A6A6),
          borderRadius: BorderRadius.circular(100),
        ),
        height: 27,
        width: 55,
        child: Column(
          mainAxisAlignment: onSwitch == true
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          crossAxisAlignment: onSwitch == true
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 19,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
