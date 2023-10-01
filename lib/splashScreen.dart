import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami10/ui/home/HomeScreen.dart';

class splashScreen extends StatefulWidget {

  static const String routeName = "Splash";

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState(){
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context , HomeScreen.routeName);
    });
}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/splash.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,

      ),
    );
  }
}
