// ignore_for_file: file_names, prefer_const_constructors, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class savingTextcard extends StatelessWidget {
  String hinttext;
  TextEditingController controller;
  savingTextcard({super.key, required this.hinttext,required this.controller});
  TextEditingController petrolprice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp('[0-9.]'),
        )
      ],
      decoration: InputDecoration(
        suffixText: '(Rs./ltr)',
        suffixStyle: TextStyle(color: Color(0xff0F529C)),
         focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.2, color: Colors.red.withOpacity(1)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.2, color: Colors.red.withOpacity(1)),
        ),
        hintText: hinttext,
        border: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1.2, color: const Color(0xff212121).withOpacity(0.2)),
               borderRadius: BorderRadius.circular(6.0)
        ),
        
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
