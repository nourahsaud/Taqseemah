import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

import 'registeration.dart';

class sliderPages extends StatefulWidget {
  sliderPages({super.key});

  @override
  State<sliderPages> createState() => _sliderPagesState();
}

class _sliderPagesState extends State<sliderPages> {
  void onDonePress() {
    Get.to((Registeration()));
  }

  void onSkipPress() {
    // print('hhhhi skip');
    Get.to((Registeration()));
  }

  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();
    slides.add(
      Slide(
        // title: "Management",
        description:
            '! متأزم من مصاريفك ؟   ولا تدري فلوسك وين تطير  \n تطبيق قسيمة \n بيدير ميزانيتك معاك',
        styleDescription: TextStyle(
          color: Color.fromRGBO(88, 161, 184, 1),
          fontSize: 20.0,
        ),

        pathImage: "assets/images/log_.png",
        // pathImage: 370,
        widthImage: 400,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
    );
    slides.add(
      Slide(
        description:
            "تطبيق قسيمة يساعدك على تطبيق منهجية ٢٠ ٣٠ ٥٠ \n تعتمد على تقسيم الراتب لإلتزامات ، مصاريفك ، ،ومدخرات",
        styleDescription: TextStyle(
          color: Color.fromRGBO(88, 161, 184, 1),
          fontSize: 20.0,
        ),
        pathImage: "assets/images/slidlog.png",
        // heightImage: 370,
        widthImage: 400,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }

  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      colorActiveDot: Colors.white,
      onDonePress: onDonePress,
      onSkipPress: onSkipPress,
    );
  }
}
