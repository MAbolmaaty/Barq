import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            _entryField('Full Name'),
            _entryField('E-mail'),
            _entryField('Password', isPassword: true),
            _entryField('Confirm Password', isPassword: true),
            _entryField('Phone  Number'),
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

  Widget _entryField(String title, {bool isPassword = false}) {
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

  Widget _registerButton() {
    return Container(
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
          color: Colors.orange),
      child: Text(
        'Register',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  Widget _loginLabel() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          LoginScreen.route(),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          'Already have an account ? .. Login',
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
          'New Account',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: const Color(0xff212121)),
        ),
    );
  }
}
