import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../M/records.dart';
import '../view/widgets/essentials_list.dart';

class ExpensesController extends GetxController {
  List<Records> Expenses = <Records>[].obs;

  Future<List<Records>> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Expenses = MIFromJson(prefs.getString("Essentials")!);
    return Expenses;
  }

  void add(BuildContext context, String title, int amount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Expenses.add(Records(title: title, amount: amount));
    prefs.setString('Expenses', jsonEncode(Expenses));
  }

  void delete(BuildContext context, int pos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Expenses.removeAt(pos);
    prefs.setString('Expenses', jsonEncode(Expenses));
  }
  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
