import 'package:barq/src/screens/about_app_screen.dart';
import 'package:barq/src/screens/contact_us_screen.dart';
import 'package:barq/src/screens/terms_and_conditions_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsSecreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => SettingsSecreen(),
      );

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsSecreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF333333),
        title: Text("Settings"),
        textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 60,
            margin: EdgeInsets.only(top: 1),
            padding: EdgeInsets.only(left: 25, right: 25),
            color: const Color(0x309e9e9e),
            child: Stack(children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Language",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_right,
                    color: const Color(0xee9e9e9e),
                  )),
            ]),
          ),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(AboutAppScreen.route());
              },
              child: Container(
                height: 60,
                margin: EdgeInsets.only(top: 1),
                padding: EdgeInsets.only(left: 25, right: 25),
                color: const Color(0x309e9e9e),
                child: Stack(children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "About App",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_right,
                        color: const Color(0xee9e9e9e),
                      )),
                ]),
              )),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(TermsAndConditionsScreen.route());
              },
              child: Container(
                height: 60,
                margin: EdgeInsets.only(top: 1),
                padding: EdgeInsets.only(left: 25, right: 25),
                color: const Color(0x309e9e9e),
                child: Stack(children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Terms And Conditions",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_right,
                        color: const Color(0xee9e9e9e),
                      )),
                ]),
              )),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(ContactUsScreen.route());
            },
            child: Container(
              height: 60,
              color: const Color(0x309e9e9e),
              margin: EdgeInsets.only(top: 1),
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Stack(children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Contact Us",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_right,
                      color: const Color(0xee9e9e9e),
                    )),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
