import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => TermsAndConditionsScreen(),
      );

  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF333333),
              title: Text("Terms And Conditions"),
              textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
            ),
            body: SingleChildScrollView(
                child: Column(children: [
              Padding(
                  padding: EdgeInsets.only(left: 16, top: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Terms And Conditions",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ))),
                  Padding(
                      padding: EdgeInsets.only(left: 16, top: 8),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Barq App Terms And Conditions.\n@Force Touches 2020",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF9e9e9e)),
                          ))),
            ]))));
  }
}
