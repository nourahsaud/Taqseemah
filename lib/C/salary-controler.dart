import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taqseemah/M/User.dart';

import '../view/screens/base.dart';



class UserController extends GetxController {
  List<UserModel> user = <UserModel>[].obs;


  Future<List<UserModel>> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user = UserModelFromJson(prefs.getString("User")!);
    return user;
  }

  void add(BuildContext context, String name, int salary, String date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user.add(UserModel(name: name, salary: salary,date: date));
    prefs.setString('user', jsonEncode(user));


  }
  void delete(BuildContext context, int pos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user.removeAt(pos);
    prefs.setString('User', jsonEncode(user));

  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }

}