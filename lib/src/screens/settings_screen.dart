
import 'package:flutter/material.dart';

class SettingsSecreen extends StatelessWidget{

  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => SettingsSecreen(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF333333),
        title: Text("Settings"),
        textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}