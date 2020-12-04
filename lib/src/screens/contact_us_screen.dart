import 'dart:ui';

import 'package:barq/src/widgets/screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              actions: [
                ScreenAppBar(
                    screenTitle: AppLocalizations.of(context).contactUs,
                    implyLeading: true),
              ],
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 16, top: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppLocalizations.of(context).contactUs,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontFamily: 'Cairo'),
                          ))),
                  Padding(
                      padding: EdgeInsets.only(left: 16, top: 8),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppLocalizations.of(context).contactUsHint,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF9e9e9e),
                                fontFamily: 'Cairo'),
                          ))),
                  SizedBox(
                    height: 24,
                  ),
                  _entryField(title: AppLocalizations.of(context).fullName),
                  _entryField(title: AppLocalizations.of(context).email),
                  _entryField(title: AppLocalizations.of(context).phoneNumber),
                  _entryField(
                      title: AppLocalizations.of(context).messageSubject,
                      maxLines: 10),
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
            labelStyle: TextStyle(
                color: const Color(0xFF9e9e9e),
                fontSize: 13,
                fontFamily: 'Cairo'),
            alignLabelWithHint: true,
            border: OutlineInputBorder(),
            isDense: true),
      ),
    );
  }

  Widget _sendButton() {
    return GestureDetector(
        onTap: () {},
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
            AppLocalizations.of(context).send,
            style: TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'Cairo'),
          ),
        ));
  }
}
