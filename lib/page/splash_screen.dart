import 'dart:async';
import 'package:flutter/material.dart';
import 'package:street__report/config/app_colors.dart';
import 'package:street__report/page/beranda.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set timer untuk pindah ke halaman utama setelah beberapa detik
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Beranda()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary500,
      body: Center(
          child: Column(
        children: [
          Image.asset("assets/images/subtract1.png"),
          Container(
            width: 100,
            height: 100,
            color: Colors.amberAccent,
          ),
          Image.asset("assets/images/subtract2.png"),
        ],
      )),
    );
  }
}
