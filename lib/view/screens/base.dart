import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:taqseemah/view/widgets/dashboard.dart';
import 'package:taqseemah/view/widgets/essentials.dart';
import 'package:taqseemah/view/widgets/expenses.dart';
import '../../C/essentials_controller.dart';
import '../../C/expenses_controler.dart';
import '../../C/salary-controler.dart';
import '../../M/User.dart';



List<UserModel> MIFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));
var ControllerUser = Get.put(UserController());


int _selectedIndex = 0;

class Base extends StatefulWidget {
  Base({Key? key}) : super(key: key);
  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  var Controller = Get.put(ExpensesController());
  var ControllerEssentials = Get.put(EssentialsController());
  final _amuntController = TextEditingController();
  final _titleController = TextEditingController();
  final screens = [DashBoard(), Expenses(), Essentials()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 200,
        backgroundColor: Color.fromRGBO(248, 248, 248, 1),
        title: _selectedIndex == 0 ? appBarDB() : appBar(),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: _selectedIndex == 0
                    ? AssetImage('assets/images/bg_appBar.png')
                    : AssetImage('assets/images/bg_appBar1.png'),
                fit: BoxFit.fill),
          ),
        ),
      ),
      body: screens[_selectedIndex], // call the page
      floatingActionButton: _selectedIndex != 0
          ? FloatingActionButton(onPressed: () {
              _selectedIndex == 1
                  ? showDialog(
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
                                  " مصروف جديد",
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
                                      labelText: 'المصروف'),
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
                                )
                              ]),
                          actions: <Widget>[
                            ElevatedButton(
                                onPressed: () {
                                  Controller.add(
                                    context,
                                    _titleController.text,
                                    int.parse(_amuntController.text),
                                  );
                                  // setState(() {
                                  //   Controller.Expenses.length =
                                  //       Controller.Expenses.length;
                                  // });
                                  _titleController.clear();
                                  _amuntController.clear();
                                  Get.back();
                                  print(Controller.Expenses);
                                },
                                child: Text('إضافة')),
                            TextButton(
                                onPressed: Navigator.of(context).pop,
                                child: const Text('إلغاء')),
                          ],
                        );
                      })
                  : showDialog(
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
                                  " إلتزام جديد",
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
                                      labelText: 'الالتزام'),
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
                                )
                              ]),
                          actions: <Widget>[
                            ElevatedButton(
                                onPressed: () {
                                  ControllerEssentials.add(
                                      context,
                                      _titleController.text,
                                      int.parse(_amuntController.text));
                                  // setState(() {
                                  //   ControllerEssentials.Essentials.length =
                                  //       ControllerEssentials.Essentials.length;
                                  // });
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
                      });
            })
          : null,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 16,
              color: Color.fromRGBO(0, 109, 143, 0.06),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                rippleColor: Color.fromRGBO(0, 109, 143, 0.06),
                hoverColor: Color.fromRGBO(0, 109, 143, 0.06),
                gap: 8,
                activeColor: Color.fromRGBO(0, 109, 143, 1),
                iconSize: 24,
                textSize: 14,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Color.fromRGBO(0, 109, 143, 1),
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'الرئيسية',
                  ),
                  GButton(
                    icon: LineIcons.file,
                    text: ' المصروفات',
                  ),
                  GButton(
                    icon: LineIcons.moneyBill,
                    text: 'الإلتزامات',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}

// Dashboard App bar
class appBarDB extends StatelessWidget {
   appBarDB({

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: [
      Padding(
      padding: const EdgeInsets.only(right: 52.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("مرحبا ${ControllerUser.user[0].name}"),
          Icon(Icons.person_outline_rounded),
        ],
      ),
    ),
       Column(
        children: [
          Text(
            'الميزانية الحالية',
            style: TextStyle(color: Color.fromRGBO(0, 60, 79, 1), fontSize: 16),
          ),
          Text(
            '${ControllerUser.user[0].salary}',
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' ${_selectedIndex} : الدخل الشهري',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    ]));
  }
}

// Other Pages App bar
class appBar extends StatelessWidget {
   appBar({

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 52.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("مرحبا ${ControllerUser.user[0].name}"),
                Icon(Icons.person_outline_rounded),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _selectedIndex == 1 ? 'رصيد الإدخارات' : 'رصيد المصروفات ',
                style: TextStyle(
                    color: Color.fromRGBO(0, 60, 79, 1), fontSize: 14),
              ),
              _selectedIndex == 2 ? Icon(Icons.money) : Text(''),
            ],
          ),
          Text(
            _selectedIndex == 1 ? '${ControllerUser.user[0].salary * 30 / 100}'  : '${ControllerUser.user[0].salary / 2}' ,
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        ],
      ),
    );
  }
}
