import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../M/records.dart';

List<Records> MIFromJson(String str) =>
    List<Records>.from(json.decode(str).map((x) => Records.fromJson(x)));
class SavingController extends GetxController {


  List<Records> Saving = <Records>[].obs;


  void add(BuildContext context, String title, int amount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Saving.add(Records(title: title, amount: amount));
    prefs.setString('Saving', jsonEncode(Saving));


  }
  void delete(BuildContext context, int pos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Saving.removeAt(pos);
    prefs.setString('Saving', jsonEncode(Saving));

  }


}