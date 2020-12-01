import 'package:barq/src/screens/forget_password_screen.dart';
import 'package:barq/src/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bottom_nav_screen.dart';

class LoginScreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => LoginScreen(),
      );

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: height * .1,
                    ),
                    _title(),
                    SizedBox(
                      height: height * .1,
                    ),
                    _entryField(title: AppLocalizations.of(context).email),
                    _entryField(
                        title: AppLocalizations.of(context).password,
                        isPassword: true),
                    _loginButton(),
                    _forgetPassword(),
                    SizedBox(
                      height: height * .1,
                    ),
                    _registerLabel(),
                  ],
                )));
      },
    )));
  }

  Widget _title() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: AppLocalizations.of(context).login,
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF333333),
              fontFamily: 'Cairo'),
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

  Widget _loginButton() {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => BottomNavScreen()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: const Color(0x709e9e9e),
                    offset: Offset(1, 2),
                    blurRadius: 5,
                    spreadRadius: 1)
              ],
              color: const Color(0xffFEC200)),
          child: Text(
            AppLocalizations.of(context).login,
            style: TextStyle(
                fontSize: 17, color: Colors.white, fontFamily: "Cairo"),
          ),
        ));
  }

  Widget _forgetPassword() {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(ForgetPasswordScreen.route());
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            AppLocalizations.of(context).forgetPassword,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF9e9e9e),
                fontFamily: "Cairo"),
          ),
        ));
  }

  Widget _registerLabel() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => RegisterScreen()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: <Widget>[
            Text(
              AppLocalizations.of(context).dontHaveAccount,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF9e9e9e),
                  fontFamily: "Cairo"),
            ),
            Text(
              AppLocalizations.of(context).register,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.orange,
                  fontFamily: "Cairo"),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
