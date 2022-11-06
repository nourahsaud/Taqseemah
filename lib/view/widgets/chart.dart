// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../constance.dart';

class Chart extends StatelessWidget {
  Chart({Key? key}) : super(key: key);

  final dataMap = <String, double>{
    "مصروفات": 5,
    "مدخرات": 2,
    "إلتزامات": 4,
  };

  final colorList = <Color>[
    LightColor1,
    DarkColor1,
    BlueyColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            color: Color.fromRGBO(0, 109, 143, 0.06),
          )
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Container(
            padding:
                const EdgeInsets.only(top: 8, left: 4, right: 4, bottom: 8),
            alignment: Alignment.topRight,
            child: Text(
              'تقرير المصروفات',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromRGBO(0, 60, 79, 1)
                  //fontFamily:
                  ),
            ),
          ),
          const Divider(
            color: Color.fromRGBO(104, 104, 104, 1),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40, left: 40, right: 40),
            child: PieChart(
              dataMap: dataMap,
              animationDuration: Duration(milliseconds: 800),
              chartRadius: MediaQuery.of(context).size.width / 2.5,
              chartLegendSpacing: 32,
              chartType: ChartType.ring,
              legendOptions: LegendOptions(
                showLegendsInRow: true,
                legendPosition: LegendPosition.bottom,
                showLegends: true,
                legendTextStyle: TextStyle(
                    fontSize: 14, color: Color.fromRGBO(51, 45, 107, 1)
                    //fontFamily:
                    ),
              ),
              baseChartColor: Color.fromRGBO(104, 104, 104, 0.15),
              colorList: colorList,
              chartValuesOptions: const ChartValuesOptions(
                showChartValuesInPercentage: true,
              ),
              totalValue: 20,
            ),
          ),
        ],
      ),
    );
  }
}
