import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../M/records.dart';
import '../view/widgets/essentials_list.dart';


class EssentialsController extends GetxController {
  List<Records> Essentials = <Records>[].obs;

  Future<List<Records>> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Essentials = MIFromJson(prefs.getString("Essentials")!);
    return Essentials;
  }
//   var sumEssentials = 0.obs;
//
//
// getTotal() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//     try {
//       for (final e in Essentials) {
//         sumEssentials += e.amount;
//       }
//     } catch (e) {}
//   }


  void add(BuildContext context, String title, int amount, String date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Essentials.add(Records(title: title, amount: amount,date: date));
    prefs.setString('Essentials', jsonEncode(Essentials));


  }
  void delete(BuildContext context, int pos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Essentials.removeAt(pos);
    prefs.setString('Essentials', jsonEncode(Essentials));

  }
  // @override
  // void onInit() {
  //   super.onInit();
  //   getData();
  //   getTotal();
  // }

}