// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names, must_be_immutable, camel_case_types, depend_on_referenced_packages


import 'package:cng_locator/view/customwidget/dialog.dart';
import 'package:cng_locator/view/customwidget/text.dart';
import 'package:cng_locator/view/feedback.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../model/cylinder.dart';
class station_details extends StatefulWidget {
  Results result;
  station_details({super.key, required this.result});

  @override
  State<station_details> createState() => _station_detailsState();
}


class _station_detailsState extends State<station_details> {
  bool recommoned = false;
  bool nocngstation = false;
  bool rating1 = false;
  bool rating2 = false;
  bool rating3 = false;
  bool rating4 = false;
  bool rating5 = false;
  int ratingvalue = 0;
  bool favourite = false;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Station Details",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              fontFamily: 'SF Pro Display',
              fontStyle: FontStyle.normal),
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Image.asset(
                "images/ic_back.png",
                height: 20,
                width: 20,
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ListTile(
            title: Text(
              widget.result.name!,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontFamily: 'SF Pro Display',
                  fontStyle: FontStyle.normal),
            ),
            trailing: GestureDetector(
              onTap: () {
              
                if (favourite == false) {
                  setState(() {
                    favourite = true;
                  });
                } else {
                  setState(() async {
                    favourite = false;

                  });
                }
              },
              child: Image.asset(favourite == true
                  ? 'images/ic_direction_station.png'
                  : 'images/like.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //padding: EdgeInsets,
              height: 25,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      width: 1, color: Colors.black.withOpacity(0.4))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Color(0xffFFB618),
                    size: (20),
                  ),
                  Text(widget.result.rating.toString())
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5, left: 14, right: 14),
            child: Row(
              children: [
                Image.asset(
                  "images/ic_recommend.png",
                  height: 17,
                  width: 17,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "5 people recommend this",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: 'SF Pro Display',
                      fontStyle: FontStyle.normal),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 10, right: 10),
              title: Text(
                "Location",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xff0F529C),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    fontFamily: 'SF Pro Display',
                    fontStyle: FontStyle.normal),
              ),
              subtitle: Text(widget.result.vicinity == null?  widget.result.formattedaddress!: widget.result.vicinity!,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    fontFamily: 'SF Pro Display',
                    fontStyle: FontStyle.normal),
              ),
              trailing: Image.asset(
                'images/ic_direction_station.png',
              ),
            ),
          ),
          ExpansionTile(
            title: Text(
              "Company Details",
              style: TextStyle(
                  color: Color(0xff0F529C),
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  fontFamily: 'SF Pro Display',
                  fontStyle: FontStyle.normal),
            ),
            subtitle: Text(
              "Details of the gas supply company",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  fontFamily: 'SF Pro Display',
                  fontStyle: FontStyle.normal),
            ),
            children: [
              ListTile(
                  title: Text(
                    "Gujarat Gas Ltd",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        fontFamily: 'SF Pro Display',
                        fontStyle: FontStyle.normal),
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      text: 'Station Type: ',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          fontFamily: 'SF Pro Display',
                          fontStyle: FontStyle.normal),
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'Daughter Booster',
                            style: TextStyle(
                                color: Color(0xff74B530),
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: 'SF Pro Display',
                                fontStyle: FontStyle.normal)),
                      ],
                    ),
                  ))
            ],
          ),
          ExpansionTile(
            title: Text(
              "Other Details",
              style: TextStyle(
                  color: Color(0xff0F529C),
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  fontFamily: 'SF Pro Display',
                  fontStyle: FontStyle.normal),
            ),
            subtitle: Text(
              "As provided by the public feedback",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  fontFamily: 'SF Pro Display',
                  fontStyle: FontStyle.normal),
            ),
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 30,
                      bottom: 12,
                    ),
                    child: Row(
                      children: [
                        ImageIcon(
                          AssetImage('images/ic_average_fill_time.png'),
                          size: (15),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Average Fill Time: N/A",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              fontFamily: 'SF Pro Display',
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 0, left: 30, bottom: 10),
                    child: Row(
                      children: [
                        ImageIcon(
                          AssetImage('images/ic_price1.png'),
                          size: 15,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "CNG Price: N/A",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              fontFamily: 'SF Pro Display',
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ])),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(14),
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (recommoned == false) {
                      setState(() {
                        recommoned = true;
                      });
                    } else {
                      setState(() {
                        recommoned = false;
                      });
                    }
                  },
                  child: Row(
                    children: [
                      ImageIcon(
                        color: recommoned == true
                            ? Color(0xff74B530)
                            : Colors.grey,
                        AssetImage('images/recommend.png'),
                        size: 22,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Textcard(
                        data: "Recommend",
                        color: recommoned == true
                            ? Color(0xff74B530)
                            : Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 23,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => nocngstation
                            ? dialog(
                                imageLocation: 'images/invalid_station.png',
                                title: 'Invalid station !',
                                subtitle:
                                    'You are about to report that this is not a valid CNG station.\n \nDo you want to submit?',
                                button1name: 'NO',
                                buttn2name: 'YES',
                                button1: () {
                                  Get.back();
                                  setState(() {
                                    nocngstation = false;
                                  });
                                },
                                button2: () {
                                  Get.back();
                                },
                              )
                            : dialog(
                                imageLocation: 'images/valid_station.png',
                                title: 'Invalid station !',
                                subtitle:
                                    'You are about to report that this is a valid CNG station.\n \nDo you want to submit?',
                                button1name: 'NO',
                                buttn2name: 'YES',
                                button1: () {
                                  Get.back();
                                  setState(() {
                                    nocngstation = true;
                                  });
                                },
                                button2: () {
                                  Get.back();
                                },
                              ));
                    setState(() {
                      nocngstation = !nocngstation;
                    });
                  },
                  child: Row(
                    children: [
                      ImageIcon(
                          color:
                              nocngstation == true ? Colors.red : Colors.grey,
                          AssetImage('images/nocngstation.png'),
                          size: 22),
                      SizedBox(
                        width: 8,
                      ),
                      Textcard(
                        data: "No CNG Station",
                        color: nocngstation == true
                            ? Colors.red
                            : Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Textcard(
                  data: "Your Rating",
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          ratingvalue = 1;
                          rating1 = !rating1;
                          rating2 = false;
                          rating3 = false;
                          rating4 = false;
                          rating5 = false;
                        });
                      },
                      child: Icon(
                        Icons.star,
                        size: 25,
                        color: rating1 == true
                            ? Color(0xff74B530)
                            : Color(0xffA6A6A6),
                      )),
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
                      child: Icon(
                        Icons.star,
                        size: 25,
                        color: rating2 == true
                            ? Color(0xff74B530)
                            : Color(0xffA6A6A6),
                      )),
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
                      child: Icon(
                        Icons.star,
                        size: 25,
                        color: rating3 == true
                            ? Color(0xff74B530)
                            : Color(0xffA6A6A6),
                      )),
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
                      child: Icon(
                        Icons.star,
                        size: 25,
                        color: rating4 == true
                            ? Color(0xff74B530)
                            : Color(0xffA6A6A6),
                      )),
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
                      child: Icon(
                        Icons.star,
                        size: 25,
                        color: rating5 == true
                            ? Color(0xff74B530)
                            : Color(0xffA6A6A6),
                      )),
                  Text('$ratingvalue')
                ])
                //  Get.to(starreview());
                // RatingBar.builder(
                //   initialRating: 0,
                //   minRating: 1,
                //   direction: Axis.horizontal,
                //   itemCount: 5,
                //   itemSize: 25,
                //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                //   itemBuilder: (context, _) => Icon(
                //     Icons.star,
                //     color: Color(0xff74B530),
                //   ),
                //   onRatingUpdate: (rating) {
                //     setState(() {
                //       rating_value = rating;
                //       showDialog(
                //           context: context,
                //           builder: (BuildContext context) {
                //             return AlertDialog(
                //               titlePadding: EdgeInsets.all(14),
                //               title: Row(
                //                 children: [
                //                   CircleAvatar(
                //                     radius: 25,
                //                     backgroundColor: Color(0xffFFB618),
                //                     child: Textcard(
                //                       color: Colors.white,
                //                       fontSize: 17,
                //                       fontWeight: FontWeight.w600,
                //                       data: '$rating',
                //                     ),
                //                   ),
                //                   SizedBox(
                //                     width: 10,
                //                   ),
                //                   Textcard(
                //                       data: 'Your Rating !',
                //                       fontSize: 20,
                //                       fontWeight: FontWeight.w500,
                //                       color: Colors.black),
                //                 ],
                //               ),
                //               contentPadding:
                //                   EdgeInsets.only(left: 14, right: 14),
                //               content: Textcard(
                //                   data:
                //                       "You cannot update or cancel the rating later. \n \nDo you want to submit?",
                //                   fontSize: 16,
                //                   fontWeight: FontWeight.w400,
                //                   color: Colors.black),
                //               actionsPadding: EdgeInsets.all(15),
                //               actions: [
                //                 ElevatedButton(
                //                   onPressed: () {
                //                     Get.back();
                //                   },
                //                   child: Textcard(
                //                     data: 'BACK',
                //                     color: Colors.black.withOpacity(0.8),
                //                     fontWeight: FontWeight.w500,
                //                     fontSize: 14,
                //                   ),
                //                   style: ElevatedButton.styleFrom(
                //                     backgroundColor: Color(0xff74B530),
                //                     shape: RoundedRectangleBorder(
                //                       borderRadius: BorderRadius.circular(
                //                           5), // <-- Radius
                //                     ),
                //                   ),
                //                 ),
                //                 ElevatedButton(
                //                   onPressed: () {
                //                     Get.back();
                //                   },
                //                   child: Textcard(
                //                     data: "YES",
                //                     color: Colors.black.withOpacity(0.8),
                //                     fontWeight: FontWeight.w500,
                //                     fontSize: 14,
                //                   ),
                //                   style: ElevatedButton.styleFrom(
                //                     backgroundColor: Color(0xff0F529C),
                //                     shape: RoundedRectangleBorder(
                //                       borderRadius: BorderRadius.circular(
                //                           5), // <-- Radius
                //                     ),
                //                   ),
                //                 )
                //               ],
                //             );
                //           });
                //     });
                //   },
                // ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: ElevatedButton(
                    child: Text(
                      'My Feedback',
                    ),
                    onPressed: () {
                      Get.to(feedback());
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      backgroundColor: Color(0xff74B530),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: ElevatedButton(
                    child: const Text('Public Feedback'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      backgroundColor: Color(0xff0F529C),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
