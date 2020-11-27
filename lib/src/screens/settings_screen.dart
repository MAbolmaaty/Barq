import 'package:barq/app_locale.dart';
import 'package:barq/src/screens/about_app_screen.dart';
import 'package:barq/src/screens/contact_us_screen.dart';
import 'package:barq/src/screens/terms_and_conditions_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsSecreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => SettingsSecreen(),
      );

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsSecreen> {
  bool isVisible = false;
  int language = 1;

  @override
  Widget build(BuildContext context) {
    var locale = Provider.of<AppLocale>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF333333),
        title: Text(AppLocalizations.of(context).settings),
        textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
              onTap: () => setState(() {
                    isVisible ? isVisible = false : isVisible = true;
                  }),
              child: Container(
                height: 60,
                margin: EdgeInsets.only(top: 1),
                padding: EdgeInsets.only(left: 25, right: 25),
                color: const Color(0x309e9e9e),
                child: Stack(children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context).language,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_right,
                        color: const Color(0xee9e9e9e),
                      )),
                ]),
              )),
          Visibility(
              visible: isVisible,
              child: GestureDetector(
                  onTap: () => setState(() {
                        language = 0;
                        locale.changeLocale(Locale('ar'));
                      }),
                  child: Container(
                    height: 60,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Align(
                          child: Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: language == 0
                                  ? Text(
                                AppLocalizations.of(context).arabic,
                                      style: TextStyle(
                                          color: const Color(0xffFEC200)),
                                    )
                                  : Text(
                                AppLocalizations.of(context).arabic,
                                      style: TextStyle(
                                          color: const Color(0xff9e9e9e)),
                                    )),
                          alignment: Alignment.centerLeft,
                        ),
                        Align(
                          child: Padding(
                              padding: EdgeInsets.only(right: 25),
                              child: language == 0
                                  ? Icon(
                                      Icons.check_circle,
                                      color: const Color(0xffFEC200),
                                    )
                                  : Icon(
                                      Icons.check_circle,
                                      color: const Color(0x809e9e9e),
                                    )),
                          alignment: Alignment.centerRight,
                        )
                      ],
                    ),
                  ))),
          Visibility(
              visible: isVisible,
              child: GestureDetector(
                  onTap: () => setState(() {
                        language = 1;
                        locale.changeLocale(Locale('en'));
                      }),
                  child: Container(
                    height: 60,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Align(
                          child: Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: language == 1
                                  ? Text(
                                AppLocalizations.of(context).english,
                                      style: TextStyle(
                                          color: const Color(0xffFEC200)),
                                    )
                                  : Text(AppLocalizations.of(context).english,
                                      style: TextStyle(
                                          color: const Color(0xff9e9e9e)))),
                          alignment: Alignment.centerLeft,
                        ),
                        Align(
                          child: Padding(
                              padding: EdgeInsets.only(right: 25),
                              child: language == 1
                                  ? Icon(
                                      Icons.check_circle,
                                      color: const Color(0xffFEC200),
                                    )
                                  : Icon(
                                      Icons.check_circle,
                                      color: const Color(0x809e9e9e),
                                    )),
                          alignment: Alignment.centerRight,
                        )
                      ],
                    ),
                  ))),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(AboutAppScreen.route());
              },
              child: Container(
                height: 60,
                margin: EdgeInsets.only(top: 1),
                padding: EdgeInsets.only(left: 25, right: 25),
                color: const Color(0x309e9e9e),
                child: Stack(children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context).aboutApp,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_right,
                        color: const Color(0xee9e9e9e),
                      )),
                ]),
              )),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(TermsAndConditionsScreen.route());
              },
              child: Container(
                height: 60,
                margin: EdgeInsets.only(top: 1),
                padding: EdgeInsets.only(left: 25, right: 25),
                color: const Color(0x309e9e9e),
                child: Stack(children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context).termsAndConditions,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_right,
                        color: const Color(0xee9e9e9e),
                      )),
                ]),
              )),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(ContactUsScreen.route());
            },
            child: Container(
              height: 60,
              color: const Color(0x309e9e9e),
              margin: EdgeInsets.only(top: 1),
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Stack(children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context).contactUs,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_right,
                      color: const Color(0xee9e9e9e),
                    )),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
