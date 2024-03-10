import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app_flutter/ui/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splashscreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        color: Color(0xFFDFECDB),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png'),
        ],
      ),
    );
  }
}
