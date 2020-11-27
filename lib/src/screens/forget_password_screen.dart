import 'dart:async';

import 'package:barq/src/screens/login_screen.dart';
import 'package:barq/src/widgets/success_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'new_password_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => ForgetPasswordScreen(),
      );

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(child: Scaffold(body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewPortConstraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewPortConstraints.maxHeight),
              child: Column(
                children: [
                  SizedBox(
                    height: height * .3,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: EdgeInsets.all(16), child: _title())),
                  Align(alignment: Alignment.center, child: _subTitle()),
                  SizedBox(
                    height: 20,
                  ),
                  _entryField(
                      title: AppLocalizations.of(context).email,
                      isPassword: false,
                      maxLines: 1),
                  SizedBox(
                    height: 20,
                  ),
                  _sendButton(),
                  SizedBox(
                    height: height * .3,
                  ),
                  _loginLabel(),
                ],
              )));
    })));
  }

  Widget _title() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: AppLocalizations.of(context).resetPassword,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: const Color(0xff212121)),
        ));
  }

  Widget _subTitle() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: AppLocalizations.of(context).resetPasswordHint,
          style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
              color: const Color(0xff212121)),
        ));
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
            hintStyle: TextStyle(
              color: const Color(0xFF9e9e9e),
              fontSize: 14,
            ),
            alignLabelWithHint: true,
            border: OutlineInputBorder(),
            isDense: true),
      ),
    );
  }

  Widget _sendButton() {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (_) => SuccessDialog(
                    message: AppLocalizations.of(context).codeSuccessfullySent,
                  ));
          Timer(Duration(seconds: 1), () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => NewPasswordScreen()));
          });
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
            AppLocalizations.of(context).send,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ));
  }

  Widget _loginLabel() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          LoginScreen.route(),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: <Widget>[
            Text(
              AppLocalizations.of(context).tryAgain,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF9e9e9e)),
            ),
            Text(
              AppLocalizations.of(context).login,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.orange),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
