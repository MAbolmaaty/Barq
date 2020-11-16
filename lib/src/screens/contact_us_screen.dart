import 'dart:ui';

import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => ContactUsScreen(),
      );

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF333333),
              title: Text("Contact Us"),
              textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 16, top: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Contact Us",
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
                            "We will be happy to be contacted with you",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF9e9e9e)),
                          ))),
                  SizedBox(
                    height: 24,
                  ),
                  _entryField(title: 'Full Name'),
                  _entryField(title: 'E-mail'),
                  _entryField(title: 'Phone  Number'),
                  _entryField(title: 'Message Subject', maxLines: 10),
                  _sendButton(),
                ],
              ),
            )));
  }

  Widget _entryField(
      {String title, bool isPassword = false, int maxLines = 1}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextField(
        maxLines: maxLines,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: title,
          hintStyle: TextStyle(color: const Color(0xFF9e9e9e), fontSize: 14,),alignLabelWithHint: true,
          border: OutlineInputBorder(),
          isDense: true
        ),
      ),
    );
  }

  Widget _sendButton() {
    return InkWell(
        onTap: () {
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              color: const Color(0xffFEC200)),
          child: Text(
            'Send',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }
}
