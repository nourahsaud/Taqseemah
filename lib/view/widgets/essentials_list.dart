import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../C/expenses_controler.dart';
import '../../C/essentials_controller.dart';
import '../../M/records.dart';
import '../../constance.dart';
import 'expenses.dart';
List<Records> MIFromJson(String str) =>
    List<Records>.from(json.decode(str).map((x) => Records.fromJson(x)));
class EssentialsList extends StatefulWidget {


   EssentialsList({Key? key}) : super(key: key);

  @override
  State<EssentialsList> createState() => _EssentialsListState();
}

class _EssentialsListState extends State<EssentialsList> {


  var Controller = Get.put(EssentialsController());
  loadRecords() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      try {
        Controller.Essentials = MIFromJson(prefs.getString("Essentials")!);

      } catch (e) {

      }
    });
  }

  // loadMI() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     try {
  //       Controller.k = MIFromJson(prefs.getString("k")!);
  //     } catch (e) {
  //     }
  //   });
  // }

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
                'التزامات',
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
            //                       'فاتورة كهربا',
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
            //                       'ايجار البيت',
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
            //                       'قسط السياره',
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
            //   ],
            // ),
            child:   ListView.builder(
              // return ListView.builder(
                shrinkWrap: true,
                itemCount: Controller.Essentials.length,
                itemBuilder: (BuildContext context, int position) {
                  return Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 2.4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      title: Text(Controller.Essentials[position].title),
                      subtitle: Text(Controller.Essentials[position].amount.toString()),
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
                })
            )

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
