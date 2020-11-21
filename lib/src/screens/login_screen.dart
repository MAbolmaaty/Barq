import 'package:barq/src/screens/forget_password_screen.dart';
import 'package:barq/src/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              constraints: BoxConstraints(
                minHeight: viewPortConstraints.maxHeight
              ),
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
                    _entryField(title: 'E-mail'),
                    _entryField(title: 'Password', isPassword: true),
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
          text: 'Login',
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF333333)),
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
              fontSize: 12,
            ),
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
            'Login',
            style: TextStyle(fontSize: 17, color: Colors.white),
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
            'Forget Password ?',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF9e9e9e)),
          ),
        ));
  }

  Widget _registerLabel() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          RegisterScreen.route(),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: <Widget>[
            Text(
              'Don\'t have an account ? .. ',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF9e9e9e)),
            ),
            Text(
              'Register',
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
