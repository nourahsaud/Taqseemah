// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taqseemah/C/saving_controller.dart';

import '../../C/salary-controler.dart';
import '../../M/records.dart';
import '../../constance.dart';
import '../screens/base.dart';

List<Records> MIFromJson(String str) =>
    List<Records>.from(json.decode(str).map((x) => Records.fromJson(x)));

class Saving extends StatefulWidget {
  const Saving({Key? key}) : super(key: key);

  @override
  State<Saving> createState() => _SavingState();
}

class _SavingState extends State<Saving> {
  var Controller = Get.put(SavingController());
  var ControllerUser = Get.put(UserController());

  final _amuntController = TextEditingController();
  final _titleController = TextEditingController();

  bool check = false; // to check if the button pressed or not
  @override
  Widget build(BuildContext context) {
    var c = ControllerUser.user[0].salary;
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
      padding: const EdgeInsets.only(top: 4, left: 12, right: 12, bottom: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Color.fromRGBO(0, 60, 79, 1),
                      size: 24,
                    ),
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.close_rounded,
                                          color: BlueyColor),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    " هدف جديد",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color.fromRGBO(0, 60, 79, 1),
                                      //fontFamily:
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: _titleController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        labelText: 'الهدف'),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: _amuntController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        labelText: 'المبلغ'),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ]),
                            actions: <Widget>[
                              SizedBox(
                                width: 50,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(88, 161, 184, 1),
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.all(20.0),
                                    textStyle: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Controller.add(
                                        context,
                                        _titleController.text,
                                        int.parse(_amuntController.text),
                                        DateTime.now().toString());
                                    setState(() {
                                      Controller.Saving.length =
                                          Controller.Saving.length;
                                    });
                                    _titleController.clear();
                                    _amuntController.clear();
                                    Get.back();
                                  },
                                  child: Text('إضافة')),
                            ],
                          );
                        })),
              ),
              Text(
                'مبلغ الاهداف : ${c * 20 / 100}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromRGBO(0, 60, 79, 1),
                  //fontFamily:
                ),
              ),
              Text(
                'أهدافي',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromRGBO(0, 60, 79, 1),
                  //fontFamily:
                ),
              ),
            ],
          ),
          SizedBox(
              height: 350,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Controller.Saving.length,
                  itemBuilder: (BuildContext context, int position) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${Controller.Saving[position].amount.toString()}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color.fromRGBO(0, 60, 79, 1),
                                    //fontFamily:
                                  ),
                                ),
                                Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      '${Controller.Saving[position].title}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color.fromRGBO(0, 60, 79, 1),
                                        //fontFamily:
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Icon(
                                        Icons.money,
                                        color: Color.fromRGBO(0, 60, 79, 1),
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 2000,
                            lineHeight: 20,
                            percent: (Controller.Saving[position].amount / c),
                            barRadius: const Radius.circular(16),
                            progressColor: Colors.blue[400],
                            backgroundColor: Colors.grey[300],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, top: 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${Controller.Saving[position].amount}',
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
              // child: ListView(

              ),
        ],
      ),
    );
  }
}
