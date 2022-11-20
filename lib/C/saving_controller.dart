import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../M/records.dart';
import '../view/widgets/saving.dart';


class SavingController extends GetxController {
  List<Records> Saving = <Records>[].obs;

  Future<List<Records>> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Saving = RecordsFromJson(prefs.getString("Saving")!);
    return Saving;
  }

  void add(BuildContext context, String title, int amount,String date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Saving.add(Records(title: title, amount: amount,date: date));
    prefs.setString('Saving', jsonEncode(Saving));
  }

  void delete(BuildContext context, int pos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Saving.removeAt(pos);
    prefs.setString('Saving', jsonEncode(Saving));
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
