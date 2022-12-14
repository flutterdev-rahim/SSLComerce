import 'package:ddba/view/HomeScreen.dart';
import 'package:ddba/view/login_screen.dart';
import 'package:ddba/view/splash_screen.dart';
import 'package:flutter/material.dart';

import 'view/Otp_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: Color(0xFFff9d00),
      ),
      home: SplashScreen()//LoginScreen(),//HomeScreen(),//
    );
  }
}
