import 'package:barq/src/widgets/screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => ProfileScreen(),
      );

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF333333),
              actions: [
                ScreenAppBar(
                  screenTitle: AppLocalizations.of(context).profile,
                  implyLeading: false,
                  thirdAction: GestureDetector(
                      child: Container(
                    height: double.infinity,
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Image.asset(
                          'assets/edit.png',
                          width: 20,
                          height: 20,
                        )),
                  )),
                )
              ],
              textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
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
                    _entryField(AppLocalizations.of(context).fullName),
                    _entryField(AppLocalizations.of(context).email),
                    //_entryField('Password', isPassword: true),
                    _entryField(AppLocalizations.of(context).phoneNumber),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )));
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
}
