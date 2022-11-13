import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:taqseemah/C/salary-controler.dart';

import '../../M/User.dart';
import 'base.dart';
import 'registeration.dart';
List<UserModel> MIFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));
var ControllerUser = Get.put(UserController());

class sliderPages extends StatefulWidget {
  sliderPages({super.key});

  @override
  State<sliderPages> createState() => _sliderPagesState();
}

class _sliderPagesState extends State<sliderPages> {
  bool selected = false;
  void onDonePress() {
    if(ControllerUser.user.isEmpty){
      Get.offAll(Registeration());
    }else{
      Get.offAll(Base());
    }

  }

  void onSkipPress() {
    if(ControllerUser.user.isNotEmpty){
      Get.to((Registeration()));
    }else{
      Get.to((Base()));
    }
  }

  void onNextpress() {
    setState(() {
      selected = true;
    });
    print(slides[0]);
  }

  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();
    slides.add(
      Slide(
        description:
            '! متأزم من مصاريفك ؟   ولا تدري فلوسك وين تطير  \n تطبيق تقسيمة \n بيدير ميزانيتك معاك',
        styleDescription: TextStyle(
          color: Color.fromRGBO(88, 161, 184, 1),
          fontSize: 20.0,
        ),
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      Slide(
        description:
            "تطبيق تقسيمة  يساعدك على تطبيق منهجية ٢٠ ٣٠ ٥٠  \n تعتمد على تقسيم الراتب لإلتزامات ، مصاريفك ، ،ومدخرات",
        styleDescription: TextStyle(
          color: Color.fromRGBO(88, 161, 184, 1),
          fontSize: 20.0,
        ),
        widthImage: 400,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        toolbarHeight: 400,

        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //       bottomLeft: Radius.circular(57),
        //       bottomRight: Radius.circular(57)),
        // ),
        backgroundColor: Color.fromRGBO(88, 161, 184, 1),

        flexibleSpace: Container(
          // color: Colors.yellow,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9000),
          ),
          child: Image(
            // color: Colors.red,
            image: AssetImage(
              'assets/images/bg_splash.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
        //     Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(20),
        //   ),
        //   child: Image.asset(
        //     'assets/images/bg_splash.png',
        //     // fit: BoxFit.fitWidth,
        //   ),
        // ),

        title: selected == true
            ? Image.asset(
                'assets/images/slidlog.png',
                width: 250,
              )
            : Image.asset(
                'assets/images/log_.png',
                width: 250,
              ),
      ),
      body: IntroSlider(
        slides: slides,
        colorActiveDot: Colors.white,
        onDonePress: onDonePress,
        onSkipPress: onSkipPress,
        onNextPress: onNextpress,
      ),
    );
  }
}
