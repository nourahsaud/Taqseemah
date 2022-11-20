import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taqseemah/view/widgets/dashboard.dart';
import 'package:taqseemah/view/widgets/essentials.dart';
import 'package:taqseemah/view/widgets/expenses.dart';
import '../../C/essentials_controller.dart';
import '../../C/expenses_controler.dart';
import '../../C/salary-controler.dart';
import '../../M/User.dart';
import '../../constance.dart';


var Controller = Get.put(ExpensesController());
var ControllerEssentials = Get.put(EssentialsController());
var ControllerUser = Get.put(UserController());

int _selectedIndex = 0;

class Base extends StatefulWidget {
  Base({Key? key}) : super(key: key);
  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  final _amuntController = TextEditingController();
  final _titleController = TextEditingController();

  final screens = [DashBoard(), Expenses(), Essentials()];

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.yMMMEd().format(now);
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
          ? FloatingActionButton(
            backgroundColor:BlueyColor,
              child: const Text('+'),
              onPressed: () {
                _selectedIndex == 1
                    ? showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.close_rounded,
                                          color: BlueyColor),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
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
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ]),
                            actions: <Widget>[
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(88, 161, 184, 1),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.all(20.0),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                                  onPressed: () {
                                    Controller.add(
                                      context,
                                      _titleController.text,
                                      int.parse(_amuntController.text),
                                      formattedDate.toString(),
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
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.close_rounded,
                                          color: BlueyColor),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
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
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ]),
                            actions: <Widget>[
                              ElevatedButton(
                                           style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(88, 161, 184, 1),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.all(20.0),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                                  onPressed: () {
                                    ControllerEssentials.add(
                                        context,
                                        _titleController.text,
                                        int.parse(_amuntController.text),
                                        formattedDate.toString());
                                    // setState(() {
                                    //   ControllerEssentials.Essentials.length =
                                    //       ControllerEssentials.Essentials.length;
                                    // });
                                    _titleController.clear();
                                    _amuntController.clear();
                                    Get.back();
                                  },
                                  child: Text('إضافة')),
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
class appBarDB extends StatefulWidget {
  appBarDB({
    Key? key,
  }) : super(key: key);

  @override
  State<appBarDB> createState() => _appBarDBState();
}

class _appBarDBState extends State<appBarDB> {
  var remain;
  var sumEssentialsForTotal = 0;
  var sumExpensesForTotal = 0;

  getTotal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      try {
        for (final e in ControllerEssentials.Essentials) {
          sumEssentialsForTotal += e.amount;
        }
        for (final e in Controller.Expenses) {
          //
          sumExpensesForTotal += e.amount;
        }
        remain = (sumEssentialsForTotal + sumExpensesForTotal);
      } catch (e) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
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
            '${ControllerUser.user[0].salary - remain}',
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' ${ControllerUser.user[0].salary} : الدخل الشهري',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    ]));
  }

  @override
  void initState() {
    getTotal();
    super.initState();
  }
}

// Other Pages App bar
class appBar extends StatefulWidget {
  appBar({
    Key? key,
  }) : super(key: key);

  @override
  State<appBar> createState() => _appBarState();
}

class _appBarState extends State<appBar> {
  var remainEssentials;
  var remainExpenses;
  var sumEssentials = 0;
  var sumExpenses = 0;

  getSumForList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      try {
        for (final e in ControllerEssentials.Essentials) {
          sumEssentials += e.amount;
        }
        for (final e in Controller.Expenses) {
          //
          sumExpenses += e.amount;
        }
        remainEssentials = sumEssentials;
        remainExpenses = sumExpenses;
      } catch (e) {}
    });
  }

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
                _selectedIndex == 1 ? 'رصيد المصروفات' : 'رصيد الالتزامات ',
                style: TextStyle(
                    color: Color.fromRGBO(0, 60, 79, 1), fontSize: 14),
              ),
              _selectedIndex == 2 ? Icon(Icons.money) : Text(''),
              _selectedIndex == 1 ? Icon(Icons.money) : Text(''),
            ],
          ),
          Text(
            _selectedIndex == 1
                ? '${ControllerUser.user[0].salary * 30 / 100 - remainExpenses}'
                : '${ControllerUser.user[0].salary / 2 - remainEssentials}',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    getSumForList();
    super.initState();
  }
}
