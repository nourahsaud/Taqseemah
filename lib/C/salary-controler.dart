import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../M/User.dart';

class salaryController {
  var salary = 0.obs;

  void sall() {
    salary;
  }
}


class UserController extends GetxController {
  List<UserModel> User = <UserModel>[].obs;

  void add(BuildContext context, String name, int salary, String date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    User.add(UserModel(name: name, salary: salary,date: date));
    prefs.setString('User', jsonEncode(User));


  }
  void delete(BuildContext context, int pos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    User.removeAt(pos);
    prefs.setString('User', jsonEncode(User));

  }

}