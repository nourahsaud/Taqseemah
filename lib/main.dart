import 'package:flutter/material.dart';
import 'package:taqseemah/view/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تقسيمة',
      home: Splash(),
    );
  }
}
