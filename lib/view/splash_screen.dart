// ignore_for_file: override_on_non_overriding_member

import 'dart:async';

import 'package:firebase_demo/view/HomePage.dart';
import 'package:firebase_demo/view/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  static const String KEYLOGIN = 'login';

  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 1500),
      () {
        whereToGo();
      },
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image(image: AssetImage('asset/image/AppIcon.png')),
        ),
      ),
    ));
  }

  void whereToGo() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPreferences.getBool(KEYLOGIN);
    if(isLoggedIn != null){
        isLoggedIn? Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          )
        : Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignInScreen()),
          );}
          else{
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignInScreen()),
          );
          }
  }
}
