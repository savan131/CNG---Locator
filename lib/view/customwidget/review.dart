// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class review extends StatefulWidget {
  const review({super.key});

  @override
  State<review> createState() => _reviewState();
}

class _reviewState extends State<review> {
  bool rating1 = false;
  bool rating2 = false;
  bool rating3 = false;
  bool rating4 = false;
  bool rating5 = false;
  int ratingvalue = 0;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
        onTap: () {
          setState(() {
            ratingvalue = 1;
            rating1 = true;
            rating2 = false;
            rating3 = false;
            rating4 = false;
            rating5 = false;
          });
        },
        child: Image.asset(
          rating1 == true
              ? 'images/emoji/emoji_fill_1.png'
              : 'images/emoji/emoji_1.png',
          height: 25,
          width: 25,
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            ratingvalue = 2;
            rating2 = true;
            rating3 = false;
            rating4 = false;
            rating1 = true;
            rating5 = false;
          });
        },
        child: Image.asset(
          rating2 == true
              ? 'images/emoji/emoji_fill_2.png'
              : 'images/emoji/emoji_2.png',
          height: 25,
          width: 25,
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            ratingvalue = 3;
            rating3 = true;
            rating2 = true;
            rating4 = false;
            rating1 = true;
            rating5 = false;
          });
        },
        child: Image.asset(
          rating3 == true
              ? 'images/emoji/emoji_fill_3.png'
              : 'images/emoji/emoji_3.png',
          height: 25,
          width: 25,
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            ratingvalue = 4;
            rating4 = true;
            rating2 = true;
            rating3 = true;
            rating1 = true;
            rating5 = false;
          });
        },
        child: Image.asset(
          rating4 == true
              ? 'images/emoji/emoji_fill_4.png'
              : 'images/emoji/emoji_4.png',
          height: 25,
          width: 25,
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            ratingvalue = 5;
            rating4 = true;
            rating2 = true;
            rating3 = true;
            rating1 = true;
            rating5 = true;
          });
        },
        child: Image.asset(
          rating5 == true
              ? 'images/emoji/emoji_fill_5.png'
              : 'images/emoji/emoji_5.png',
          height: 25,
          width: 25,
        ),
      ),
    ]);
  }

  
}
