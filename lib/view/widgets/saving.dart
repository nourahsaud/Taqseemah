// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taqseemah/C/saving_controller.dart';

import '../../M/records.dart';
import '../../constance.dart';

List<Records> MIFromJson(String str) =>
    List<Records>.from(json.decode(str).map((x) => Records.fromJson(x)));

class Saving extends StatefulWidget {
  const Saving({Key? key}) : super(key: key);

  @override
  State<Saving> createState() => _SavingState();
}

class _SavingState extends State<Saving> {
  var Controller = Get.put(SavingController());
  final _amuntController = TextEditingController();
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();



  bool check = false; // to check if the button pressed or not
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                  TextFormField(
                                    controller: _dateController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0),
                                        ),
                                        labelText: 'التاريخ'),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  )
                                ]),
                            actions: <Widget>[
                              ElevatedButton(
                                  onPressed: () {
                                    Controller.add(
                                      context,
                                      _titleController.text,
                                      int.parse(_amuntController.text),_dateController.text
                                    );
                                    setState(() {
                                      Controller.Saving.length =
                                          Controller.Saving.length;
                                    });
                                    _titleController.clear();
                                    _amuntController.clear();
                                    Get.back();
                                  },
                                  child: Text('إضافة')),
                              TextButton(
                                  onPressed: Navigator.of(context).pop,
                                  child: const Text('إلغاء')),
                            ],
                          );
                        })),
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
                                        Icons.heart_broken,
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
                            percent: 0.7,
                            barRadius: const Radius.circular(16),
                            progressColor: Colors.blue[400],
                            backgroundColor: Colors.grey[300],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, top: 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '400,000',
                              ),
                            ),
                          ),
                          check == false
                              ? ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      check = true;
                                    });
                                  },
                                  child: Text('add'))
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            check = false;
                                          });
                                        },
                                        child: Text('hi')),
                                    SizedBox(
                                      width: 200,
                                      child: TextField(
                                        decoration: new InputDecoration(
                                            labelText: "Enter your number"),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ], // Only numbers can be entered
                                      ),
                                    ),
                                  ],
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

