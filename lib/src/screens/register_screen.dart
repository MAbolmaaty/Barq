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
  final formKey = new GlobalKey<FormState>();

  String _username, _email, _password, _confirmPassword, _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: TextFormField(
                    maxLines: 1,
                    validator: (value) =>
                        value.isEmpty ? AppLocalizations.of(context).pleaseEnterUsername : null,
                    onSaved: (value) => _username = value,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 11, bottom: 11, left: 8, right: 8),
                        labelText: AppLocalizations.of(context).username,
                        labelStyle: TextStyle(
                            color: const Color(0xFF9e9e9e),
                            fontSize: 13,
                            fontFamily: 'Cairo'),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                        isDense: true),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: TextFormField(
                    maxLines: 1,
                    validator: (value) =>
                    value.isEmpty ? AppLocalizations.of(context).pleaseEnterEmail : null,
                    onSaved: (value) => _email = value,
                    decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).email,
                        labelStyle: TextStyle(
                            color: const Color(0xFF9e9e9e),
                            fontSize: 13,
                            fontFamily: 'Cairo'),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                        isDense: true),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: TextFormField(
                    maxLines: 1,
                    validator: (value) =>
                    value.isEmpty ? AppLocalizations.of(context).pleaseEnterPassword : null,
                    onSaved: (value) => _password = value,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).password,
                        labelStyle: TextStyle(
                            color: const Color(0xFF9e9e9e),
                            fontSize: 13,
                            fontFamily: 'Cairo'),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                        isDense: true),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: TextFormField(
                    maxLines: 1,
                    validator: (value) =>
                    value.isEmpty ? AppLocalizations.of(context).pleaseConfirmPassword : null,
                    onSaved: (value) => _confirmPassword = value,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).confirmPassword,
                        labelStyle: TextStyle(
                            color: const Color(0xFF9e9e9e),
                            fontSize: 13,
                            fontFamily: 'Cairo'),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                        isDense: true),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: TextFormField(
                    maxLines: 1,
                    validator: (value) =>
                    value.isEmpty ? AppLocalizations.of(context).pleaseEnterPhoneNumber : null,
                    onSaved: (value) => _phoneNumber = value,
                    decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).phoneNumber,
                        labelStyle: TextStyle(
                            color: const Color(0xFF9e9e9e),
                            fontSize: 13,
                            fontFamily: 'Cairo'),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                        isDense: true),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _registerButton(),
                _loginLabel(),
              ],
            )),
      ),
    ));
  }

  Widget _registerButton() {
    return GestureDetector(
        onTap: () {
          final form = formKey.currentState;
          if (form.validate()) {
            form.save();
            print(_username);
            print(_email);
            print(_password);
          }
          // showDialog(
          //     context: context,
          //     builder: (_) => SuccessDialog(
          //           message:
          //               AppLocalizations.of(context).accountSuccessfullyCreated,
          //         ));
          // Timer(Duration(seconds: 1), () {
          //   Navigator.pop(context);
          //   Navigator.of(context).pushReplacement(MaterialPageRoute(
          //       builder: (BuildContext context) => BottomNavScreen()));
          // });
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
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontFamily: 'Cairo'),
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
              color: const Color(0xFF9e9e9e),
              fontFamily: 'Cairo'),
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
            color: const Color(0xff212121),
            fontFamily: 'Cairo'),
      ),
    );
  }
}
