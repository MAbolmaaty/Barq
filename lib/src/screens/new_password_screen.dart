
import 'package:flutter/material.dart';

import 'login_screen.dart';

class NewPasswordScreen extends StatefulWidget{
  static Route<dynamic> route() => MaterialPageRoute(
      builder: (context) => NewPasswordScreen(),);

  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();

}

class _NewPasswordScreenState extends State<NewPasswordScreen>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 180,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Padding(padding: EdgeInsets.all(16), child: _title())),
                    Align(alignment: Alignment.center, child: _subTitle()),
                    SizedBox(
                      height: 40,
                    ),
                    _entryField(title: 'Enter new password', isPassword: false, maxLines: 1),
                    _entryField(title: 'Re-enter new password', isPassword: false, maxLines: 1),
                    SizedBox(
                      height: 40,
                    ),
                    _confirmButton(),
                    _loginLabel(),
                  ],
                ))));
  }

  Widget _title() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Reset Password',
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
          text: 'To continue resetting enter new password',
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

  Widget _confirmButton() {
    return GestureDetector(
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
            'Confirm',
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
              'Try again .. ',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF9e9e9e)),
            ),
            Text(
              'Login',
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