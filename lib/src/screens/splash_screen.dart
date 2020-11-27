import 'dart:async';

import 'package:barq/src/screens/bottom_nav_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => BottomNavScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff212121),
        body: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: const EdgeInsets.all(56.0),
                    child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            const Color(0xffFEC200))))),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/barq_logo.png',
                width: 120,
                height: 120,
              ),
            )
          ],
        ));
  }
}
