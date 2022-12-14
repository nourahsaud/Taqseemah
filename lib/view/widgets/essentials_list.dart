import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../C/essentials_controller.dart';
import '../../M/records.dart';
import '../../constance.dart';







class EssentialsList extends StatelessWidget {
  EssentialsList({Key? key}) : super(key: key);

  var Controller = Get.put(EssentialsController());

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
                SizedBox(height: 20,),
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
            SizedBox(height: 20,),
            SizedBox(
              height: 350,

                child:      ListView.builder(
                    shrinkWrap: true,

                    itemCount: Controller.Essentials.length,
                    itemBuilder: (BuildContext context, int position) {
                      return Card(
                        margin: const EdgeInsets.all(8),
                        elevation: 2.4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${Controller.Essentials[position].amount.toString()}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color:DarkColor1,
                                      //fontFamily:
                                    ),
                                  ),
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text(
                                        '${Controller.Essentials[position].title}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: DarkColor1,
                                          //fontFamily:
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Icon(
                                          Icons.money,
                                          color: DarkColor1,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 16.0, top: 8),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${Controller.Essentials[position].date}',
                                ),

                              ),
                            ),

                          ],
                        ),
                      );
                    })
              ),

      ],
        ),
      );

  }
}
