

import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget{

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();

}

class _ContactUsScreenState extends State<ContactUsScreen>{
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
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    _entryField('Full Name'),
                    _entryField('E-mail'),
                    _entryField('Phone  Number'),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )));
  }

  Widget _entryField(String title, {bool isPassword = false}){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: const Color(0xFF9e9e9e), fontSize: 14),
          border: InputBorder.none,
          fillColor: Color(0xfff3f3f4),
          filled: true,
        ),
      ),
    );
  }

}