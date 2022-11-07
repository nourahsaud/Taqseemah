import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../M/records.dart';


class EssentialsController extends GetxController {
  List<Records> Essentials = <Records>[].obs;

  void add(BuildContext context, String title, int amount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Essentials.add(Records(title: title, amount: amount));
    prefs.setString('Essentials', jsonEncode(Essentials));


  }
  void delete(BuildContext context, int pos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Essentials.removeAt(pos);
    prefs.setString('Essentials', jsonEncode(Essentials));

  }

}