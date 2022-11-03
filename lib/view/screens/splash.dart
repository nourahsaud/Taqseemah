import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:taqseemah/view/screens/base.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
      logoWidth: 200,
      backgroundImage: AssetImage('assets/images/bg_splash.png'),
      backgroundColor: Color.fromRGBO(88, 161, 184, 1),
      navigator: Base(),
      showLoader: false,
      durationInSeconds: 1,
    );
  }
}
