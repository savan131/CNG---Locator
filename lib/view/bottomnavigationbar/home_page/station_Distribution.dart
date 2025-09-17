// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:cng_locator/model/chartmodel.dart';
import 'package:cng_locator/view/customwidget/text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:get/get.dart';

class StationDistribution extends StatefulWidget {
  const StationDistribution({Key? key}) : super(key: key);
  @override
  State<StationDistribution> createState() => _StationDistributionState();
}

class _StationDistributionState extends State<StationDistribution> {
  late List<ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      ChartData('CHN', 520),
      ChartData('GER', 900),
      ChartData('RUS', 600),
      ChartData('BRZ', 740),
      ChartData('IND', 40),
      ChartData('IND1', 640),
      ChartData('IND2', 340),
      ChartData('IND3', 540)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final search = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Station Distribution',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Container(
                  height: 230,
                  child: SfCartesianChart(
                      plotAreaBorderWidth: 0,
                      primaryXAxis: CategoryAxis(
                        labelPosition: ChartDataLabelPosition.outside,
                        labelRotation: 270,
                        majorTickLines: const MajorTickLines(width: 0),
                        majorGridLines: const MajorGridLines(width: 0),
                        axisLine: const AxisLine(width: 0),
                      ),
                      primaryYAxis: NumericAxis(
                          axisLine: const AxisLine(width: 0),
                          majorTickLines: const MajorTickLines(width: 0),
                          minimum: 0,
                          maximum: 900,
                          interval: 300),
                      tooltipBehavior: _tooltip,
                      series: <ChartSeries<ChartData, String>>[
                        ColumnSeries<ChartData, String>(
                            dataSource: data,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            dataLabelSettings: const DataLabelSettings(
                                isVisible: true, angle: 270),
                            gradient: const LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff0F529C),
                                Color(0xff266EBC),
                              ],
                            ),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)))
                      ]),
                ),
                const SizedBox(height: 15),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border:
                        Border.all(color: const Color(0xff212121), width: 1.5),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                            left: 5, right: 5, top: 5, bottom: 5),
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                            color: Color(0xff0F529C), shape: BoxShape.circle),
                        child: Image.asset("images/search.png",
                            height: 18, width: 18, fit: BoxFit.fill),
                      ),
                      suffixIcon: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(right: 5),
                          child: GestureDetector(
                            onTap: () {
                              search.clear();
                            },
                            child: Image.asset(
                              "images/ic_close1.png",
                              height: 20,
                              width: 20,
                            ),
                          )),
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ExpansionTile(
                    childrenPadding: EdgeInsets.all(10),
                    title: Textcard(
                      data: "Andhara Pradesh",
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                    subtitle: Textcard(
                      data: "Total:110",
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                    ),
                    trailing: Icon(Icons.keyboard_arrow_down_rounded),
                    children: [
                      Divider(
                        thickness: 1.2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Textcard(
                            data: 'Anantapuram',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          Textcard(
                            data: '8',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Textcard(
                            data: 'Anantapuram',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          Textcard(
                            data: '8',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Textcard(
                            data: 'Anantapuram',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          Textcard(
                            data: '8',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
