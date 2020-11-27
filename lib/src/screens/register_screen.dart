import 'dart:async';

import 'package:barq/src/screens/bottom_nav_screen.dart';
import 'package:barq/src/widgets/success_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  //static final String route = "/register";
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => RegisterScreen(),
      );

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            _registerLabel(),
            SizedBox(
              height: 40,
            ),
            Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color(0x109e9e9e),
                  child: CircleAvatar(
                      radius: 52,
                      backgroundColor: const Color(0x109e9e9e),
                      backgroundImage: AssetImage(
                        'assets/profile.png',
                      )),
                )),
            SizedBox(
              height: 20,
            ),
            _entryField(title: AppLocalizations.of(context).fullName),
            _entryField(title: AppLocalizations.of(context).email),
            _entryField(
                title: AppLocalizations.of(context).password, isPassword: true),
            _entryField(
                title: AppLocalizations.of(context).confirmPassword,
                isPassword: true),
            _entryField(title: AppLocalizations.of(context).phoneNumber),
            SizedBox(
              height: 20,
            ),
            _registerButton(),
            _loginLabel(),
          ],
        ),
      ),
    ));

    // FlatButton(
    //     onPressed: () => Navigator.of(context).push(LoginScreen.route()),
    //     child: Text('I already have account ... Login')),
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
              fontSize: 12,
            ),
            alignLabelWithHint: true,
            border: OutlineInputBorder(),
            isDense: true),
      ),
    );
  }

  Widget _registerButton() {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (_) => SuccessDialog(
                    message:
                        AppLocalizations.of(context).accountSuccessfullyCreated,
                  ));
          Timer(Duration(seconds: 1), () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => BottomNavScreen()));
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
                    color: const Color(0x709e9e9e),
                    offset: Offset(1, 2),
                    blurRadius: 5,
                    spreadRadius: 1)
              ],
              color: const Color(0xffFEC200)),
          child: Text(
            AppLocalizations.of(context).createNewAccount,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ));
  }

  Widget _loginLabel() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          LoginScreen.route(),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          AppLocalizations.of(context).alreadyHaveAccount +
              AppLocalizations.of(context).login,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF9e9e9e)),
        ),
      ),
    );
  }

  Widget _registerLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        AppLocalizations.of(context).newAccount,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: const Color(0xff212121)),
      ),
    );
  }
}
