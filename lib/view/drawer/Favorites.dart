// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages


import 'package:cng_locator/view/customwidget/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Favourites',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
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
        body: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: ListTile(
                      contentPadding: EdgeInsets.all(10),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Textcard(
                          data: "3S AUTOMOTIVE",
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Textcard(
                        data:
                            "37/19 Kaushik Enclave, Near Gali No.9, Main Nathu Pura Road, Burari, New Delhi-84,Delhi",
                        color: Colors.black.withOpacity(0.45),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      trailing: Image.asset(
                        'images/ic_fill_like.png',
                        height: 25,
                        width: 25,
                      )),
                ),
              ),
            );
          },
        ));
  }
}
