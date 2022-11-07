import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'base.dart';
import '../../C/salary-controler.dart';
import 'package:flutter/cupertino.dart';

class Registeration extends StatefulWidget {
  Registeration({super.key});

  @override
  State<Registeration> createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  var salController = Get.put(salaryController());
  var ControllerUser = Get.put(UserController());

  final _nameController = TextEditingController();
  final _salaryController = TextEditingController();
  final _dateController = TextEditingController();

  bool _a = false;
  // DateTime datetime = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          padding: EdgeInsets.all(100),
          child: Column(
            children: [
              Image.asset(
                'assets/images/sallogo.png',
                height: 250,
                width: 250,
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _nameController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))
                ],
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'الإسم',
                  suffixIcon: Icon(Icons.account_circle_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _dateController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
                // onChanged: (valu) {},
                onTap: () {
                  setState(() {
                    _a = !_a;
                  });
                },
                onChanged: (value) {},
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'تاريخ الراتب',
                  suffixIcon: Icon(
                    Icons.money_rounded,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _salaryController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
                // onChanged: (valu) {},
                onTap: () {
                  setState(() {
                    _a = !_a;
                  });
                },
                onChanged: (value) {},
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'الدخل الشهري',
                  suffixIcon: Icon(
                    Icons.money_rounded,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              _a == true
                  ? Text('مربع النص يستقبل أرقام فقط ⚠',
                      style: TextStyle(color: Colors.red))
                  : Text(''),

              Container(
                width: 150.0,
                padding: EdgeInsets.only(top: 100),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(88, 161, 184, 1),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.all(20.0),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    ControllerUser.add(context,_nameController.text,  int.parse(_salaryController.text),_dateController.text);
                    _nameController.clear();
                    _salaryController.clear();
                    _dateController.clear();
                    print(ControllerUser.User);
                    Get.offAll(Base());
                  },
                  child: const Text('إبدأ'),
                ),
              ),
              // Text('$datetime'),
            ],
          )),
    );
  }
}
