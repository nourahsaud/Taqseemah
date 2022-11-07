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
  final _amuntController = TextEditingController()  ;
  final _titleController = TextEditingController();

  loadRecords() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      try {
        Controller.Saving = MIFromJson(prefs.getString("Saving")!);

      } catch (e) {

      }
    });
  }


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
                  onPressed: () =>    showDialog(
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
                                SizedBox(height: 15,),
                                TextFormField(
                                  controller: _titleController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      labelText: 'الهدف'),
                                ),
                                SizedBox(height: 15,),
                                TextFormField(
                                  controller: _amuntController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      labelText: 'المبلغ'),
                                ),
                                SizedBox(height: 15,)
                              ]),
                          actions: <Widget>[
                            ElevatedButton(onPressed: () {
                              Controller.add(context,_titleController.text,  int.parse(_amuntController.text),);
                              _titleController.clear();
                              _amuntController.clear();
                              Get.back();


                            }, child: Text('إضافة')),
                            TextButton(
                                onPressed: Navigator.of(context).pop,
                                child: const Text('إلغاء')),
                          ],
                        );
                      })

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
              child:   ListView.builder(
                // return ListView.builder(
                  shrinkWrap: true,
                  itemCount: Controller.Saving.length,
                  itemBuilder: (BuildContext context, int position) {
                    return Card(
                      margin: const EdgeInsets.all(8),
                      elevation: 2.4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        title: Text(Controller.Saving[position].title),
                        subtitle: Text(Controller.Saving[position].amount.toString()),
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
            // child: ListView(

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
