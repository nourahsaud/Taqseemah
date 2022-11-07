// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:taqseemah/C/saving_controller.dart';

class Saving extends StatefulWidget {
  const Saving({Key? key}) : super(key: key);

  @override
  State<Saving> createState() => _SavingState();
}

class _SavingState extends State<Saving> {
  var Controller = Get.put(SavingController());
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
                      builder: (BuildContext context) => AlertDialog(
                            title: Text('add new goal'),
                            content: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'goal name',
                                  ),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Amount',
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        check = false;
                                      });
                                    },
                                    child: Text('hi')),
                              ],
                            ),
                          )),
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
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '500,000',
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
                                  'أهدافي',
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
