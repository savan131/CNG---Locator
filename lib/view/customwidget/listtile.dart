// ignore_for_file: prefer_const_constructors, must_be_immutable, camel_case_types

import 'package:cng_locator/view/customwidget/text.dart';
import 'package:flutter/material.dart';

class listtille extends StatelessWidget {
  String? imagelocation;
  String? title;
  final void Function()? navigation;
  listtille({super.key, this.imagelocation, this.navigation, this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset(
          imagelocation!,
          height: 25,
          width: 25,
        ),
        title: Textcard(
          data: title,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 22,
        ),
        onTap: navigation);
  }
}
