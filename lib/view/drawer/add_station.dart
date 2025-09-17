// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, depend_on_referenced_packages

import 'package:cng_locator/view/customwidget/dropdown.dart';
import 'package:cng_locator/view/customwidget/text.dart';
import 'package:cng_locator/view/customwidget/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewStation extends StatefulWidget {
  const AddNewStation({super.key});

  @override
  State<AddNewStation> createState() => _AddNewStationState();
}

class _AddNewStationState extends State<AddNewStation> {
  final _addstation = GlobalKey<FormState>();
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Textcard(
            data: 'Add New Station',
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                "images/ic_back.png",
                height: 20,
                width: 20,
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          child: Form(
            key: _addstation,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextformFieldCard(
                    ImageLocation: "images/addnewstation/ic_station_name.png",
                    hintText: 'Station Name',
                    keyboardType: TextInputType.text,
                    Regexp: "[a-zA-Z]",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  dropdown(
                    items: ['car', 'bike', 'truck'],
                    imagelocation: 'images/addnewstation/ic_gas_company.png',
                    data: 'Gas Company',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  dropdown(
                    items: ['car', 'bike', 'truck'],
                    imagelocation: 'images/addnewstation/ic_station_type.png',
                    data: 'Station type',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextformFieldCard(
                    ImageLocation:
                        "images/addnewstation/ic_station_address.png",
                    hintText: 'Address',
                    keyboardType: TextInputType.text,
                    Regexp: "[a-zA-Z0-9-,]",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextformFieldCard(
                      ImageLocation: "images/addnewstation/ic_city.png",
                      hintText: 'City',
                      keyboardType: TextInputType.text,
                      Regexp: "[a-zA-Z]"),
                  const SizedBox(
                    height: 12,
                  ),
                  TextformFieldCard(
                      ImageLocation: "images/addnewstation/ic_state.png",
                      hintText: 'State',
                      keyboardType: TextInputType.text,
                      Regexp: "[a-zA-Z]"),
                  const SizedBox(
                    height: 12,
                  ),
                  TextformFieldCard(
                      ImageLocation: "images/addnewstation/ic_pincode.png",
                      hintText: 'Pincode',
                      keyboardType: TextInputType.number,
                      Regexp: "[0-9]"),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.all(0),
                    title: Textcard(
                      color: Colors.black.withOpacity(0.8),
                      data: "I agree to the given terms & conditions",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    value: value,
                    onChanged: (bool? value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Container(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_addstation.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          } else {}
                        },
                        child: Textcard(
                          data: 'Submit',
                          fontSize: 20,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: value == true
                              ? const Color(0xff74B530)
                              : Color(0xff212121).withOpacity(0.4),
                          minimumSize:
                              Size(MediaQuery.of(context).size.width, 55),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

validator(value) {
  if (value!.isEmpty) {
    return 'Please enter some text';
  }
  return null;
}
