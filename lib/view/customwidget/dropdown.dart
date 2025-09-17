// ignore_for_file: camel_case_types, must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';

class dropdown extends StatefulWidget {
  String? dropdownvalue;
  String? imagelocation;
  String? data;

  // List of items in our dropdown menu
  List<String> items = [];
  dropdown(
      {super.key,
      this.dropdownvalue,
      this.imagelocation,
      required this.items,
      this.data});

  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  bool dropdown = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Image.asset(
                    widget.imagelocation ?? '',
                    height: 0,
                    width: 0,
                  ),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.2,
                        color: const Color(0xff212121).withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(6.0))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: Text(widget.data!),
                value: widget.dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: widget.items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    widget.dropdownvalue = newValue!;
                    dropdown = false;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
