import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:taqseemah/view/widgets/dashboard.dart';
import 'package:taqseemah/view/widgets/essentials.dart';
import 'package:taqseemah/view/widgets/expenses.dart';

int _selectedIndex = 0;

class Base extends StatefulWidget {
  Base({Key? key}) : super(key: key);
  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
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
              _selectedIndex == 1 ? print(1) : print(2);
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
                    text: 'الإلتزامات',
                  ),
                  GButton(
                    icon: LineIcons.moneyBill,
                    text: 'المصروفات',
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
  const appBarDB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'الميزانية الحالية',
            style: TextStyle(color: Color.fromRGBO(0, 60, 79, 1), fontSize: 16),
          ),
          Text(
            '9,000,000',
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
    );
  }
}

// Other Pages App bar
class appBar extends StatelessWidget {
  const appBar({
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
            _selectedIndex == 1 ? '25,000' : '20,000',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        ],
      ),
    );
  }
}
