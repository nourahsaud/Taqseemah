import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../C/essentials_controller.dart';
import '../../C/expenses_controler.dart';
import '../../M/records.dart';
import '../../constance.dart';

List<Records> MIFromJson(String str) =>
    List<Records>.from(json.decode(str).map((x) => Records.fromJson(x)));

class ExpensesList extends StatefulWidget {
  ExpensesList({Key? key}) : super(key: key);

  @override
  State<ExpensesList> createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  var Controller = Get.put(ExpensesController());
  loadRecords() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      try {
        Controller.Expenses = MIFromJson(prefs.getString("Expenses")!);
      } catch (e) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            color: GreyColor2,
          )
        ],
      ),
      padding: const EdgeInsets.only(top: 4, left: 12, right: 12, bottom: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'مصروفات',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: DarkColor1,
                  //fontFamily:
                ),
              ),
            ],
          ),
          SizedBox(
            height: 350,
            // child: ListView(
            //   padding: const EdgeInsets.all(8),
            //   children: <Widget>[
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   '500,000',
            //                   style: TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 16,
            //                     color: DarkColor1,
            //                     //fontFamily:
            //                   ),
            //                 ),
            //                 Row(
            //                   // ignore: prefer_const_literals_to_create_immutables
            //                   children: [
            //                     Text(
            //                       'حفلة تخرج سارة',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 16,
            //                         color: DarkColor1,
            //                         //fontFamily:
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 8.0),
            //                       child: Icon(
            //                         Icons.heart_broken,
            //                         color: DarkColor1,
            //                         size: 24,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //
            //           Padding(
            //             padding: const EdgeInsets.only(left: 16.0, top: 8),
            //             child: Align(
            //               alignment: Alignment.centerLeft,
            //               child: Text(
            //                 '2022/2/3',
            //               ),
            //             ),
            //           ),
            //
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   '500,000',
            //                   style: TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 16,
            //                     color: DarkColor1,
            //                     //fontFamily:
            //                   ),
            //                 ),
            //                 Row(
            //                   // ignore: prefer_const_literals_to_create_immutables
            //                   children: [
            //                     Text(
            //                       'بنزين',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 16,
            //                         color: DarkColor1,
            //                         //fontFamily:
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 8.0),
            //                       child: Icon(
            //                         Icons.heart_broken,
            //                         color: DarkColor1,
            //                         size: 24,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //
            //           Padding(
            //             padding: const EdgeInsets.only(left: 16.0, top: 8),
            //             child: Align(
            //               alignment: Alignment.centerLeft,
            //               child: Text(
            //                 '2022/2/3',
            //               ),
            //             ),
            //           ),
            //
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   '500,000',
            //                   style: TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 16,
            //                     color: DarkColor1,
            //                     //fontFamily:
            //                   ),
            //                 ),
            //                 Row(
            //                   // ignore: prefer_const_literals_to_create_immutables
            //                   children: [
            //                     Text(
            //                       'عشا',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 16,
            //                         color: DarkColor1,
            //                         //fontFamily:
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 8.0),
            //                       child: Icon(
            //                         Icons.heart_broken,
            //                         color: DarkColor1,
            //                         size: 24,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //
            //           Padding(
            //             padding: const EdgeInsets.only(left: 16.0, top: 8),
            //             child: Align(
            //               alignment: Alignment.centerLeft,
            //               child: Text(
            //                 '2022/2/3',
            //               ),
            //             ),
            //           ),
            //
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   '500,000',
            //                   style: TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 16,
            //                     color: DarkColor1,
            //                     //fontFamily:
            //                   ),
            //                 ),
            //                 Row(
            //                   // ignore: prefer_const_literals_to_create_immutables
            //                   children: [
            //                     Text(
            //                       'كوفي',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 16,
            //                         color: DarkColor1,
            //                         //fontFamily:
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 8.0),
            //                       child: Icon(
            //                         Icons.heart_broken,
            //                         color: DarkColor1,
            //                         size: 24,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //
            //           Padding(
            //             padding: const EdgeInsets.only(left: 16.0, top: 8),
            //             child: Align(
            //               alignment: Alignment.centerLeft,
            //               child: Text(
            //                 '2022/2/3',
            //               ),
            //             ),
            //           ),
            //
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   '500,000',
            //                   style: TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 16,
            //                     color: DarkColor1,
            //                     //fontFamily:
            //                   ),
            //                 ),
            //                 Row(
            //                   // ignore: prefer_const_literals_to_create_immutables
            //                   children: [
            //                     Text(
            //                       'شنطه',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 16,
            //                         color:DarkColor1,
            //                         //fontFamily:
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 8.0),
            //                       child: Icon(
            //                         Icons.heart_broken,
            //                         color: DarkColor1,
            //                         size: 24,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //
            //           Padding(
            //             padding: const EdgeInsets.only(left: 16.0, top: 8),
            //             child: Align(
            //               alignment: Alignment.centerLeft,
            //               child: Text(
            //                 '2022/2/3',
            //               ),
            //             ),
            //           ),
            //
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: Controller.Expenses.length,
              itemBuilder: (BuildContext context, int position) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  elevation: 2.4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    title: Text(Controller.Expenses[position].title),
                    subtitle:
                        Text(Controller.Expenses[position].amount.toString()),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: DarkColor1,
                      ),
                      onPressed: () {
                        setState(() {
                          Controller.delete(context, position);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadRecords();
  }
}
