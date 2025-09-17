// ignore_for_file: non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextformFieldCard extends StatelessWidget {
  final String? ImageLocation;
  final String? suffixtext;
  final TextInputType? keyboardType;
  final String? Regexp;
  final String? hintText;
  TextformFieldCard(
      {super.key,
      this.ImageLocation,
      this.hintText,
      this.keyboardType,
      this.Regexp,
      this.suffixtext});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(Regexp!),
        )
      ],
      decoration: InputDecoration(
      
        prefixIcon: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Image.asset(
            ImageLocation ?? '',
            height: 0,
            width: 0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.2, color: Colors.red.withOpacity(1)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.2, color: Colors.red.withOpacity(1)),
        ),
        hintText: hintText ?? '',
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
