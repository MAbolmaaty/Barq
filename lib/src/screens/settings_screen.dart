import 'package:barq/src/screens/about_app_screen.dart';
import 'package:barq/src/screens/contact_us_screen.dart';
import 'package:barq/src/screens/terms_and_conditions_screen.dart';
import 'package:barq/src/widgets/screen_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
//import 'file:///C:/MU/barq/lib/src/utils/localization/app_locale.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/localization/app_locale.dart';

class SettingsScreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => SettingsScreen(),
      );

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isLanguageListVisible = false;

  @override
  Widget build(BuildContext context) {
    var locale = Provider.of<AppLocale>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          ScreenAppBar(
            screenTitle: AppLocalizations.of(context).settings,
            implyLeading: false,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
              onTap: () => setState(() {
                    isLanguageListVisible ? isLanguageListVisible = false : isLanguageListVisible = true;
                  }),
              child: Container(
                height: 60,
                margin: EdgeInsets.only(top: 1),
                padding: EdgeInsets.only(left: 25, right: 25),
                color: const Color(0x309e9e9e),
                child: Stack(children: <Widget>[
                  Align(
                    alignment: locale.locale == Locale('en') ? Alignment.centerLeft : Alignment.centerRight,
                    child: Text(
                      AppLocalizations.of(context).language,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,),
                    ),
                  ),
                  Align(
                      alignment: locale.locale == Locale('en') ? Alignment.centerRight : Alignment.centerLeft,
                      child: Icon(
                        Icons.arrow_right,
                        color: const Color(0xee9e9e9e),
                      )),
                ]),
              )),
          Visibility(
              visible: isLanguageListVisible,
              child: GestureDetector(
                  onTap: () => setState(() {
                        locale.changeLocale(Locale('ar'));
                        setValue('ar');
                      }),
                  child: Container(
                    height: 60,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Align(
                          alignment: locale.locale == Locale('en') ? Alignment.centerLeft : Alignment.centerRight,
                          child: Padding(
                              padding: EdgeInsets.only(left: 25, right: 25),
                              child: locale.locale == Locale('ar')
                                  ? Text(
                                      AppLocalizations.of(context).arabic,
                                      style: TextStyle(
                                          color: const Color(0xffFEC200),),
                                    )
                                  : Text(
                                      AppLocalizations.of(context).arabic,
                                      style: TextStyle(
                                          color: const Color(0xff9e9e9e),),
                                    )),
                        ),
                        Align(
                          child: Padding(
                              padding: EdgeInsets.only(right: 25, left: 25),
                              child: locale.locale == Locale('ar')
                                  ? Icon(
                                      Icons.check_circle,
                                      color: const Color(0xffFEC200),
                                    )
                                  : Icon(
                                      Icons.check_circle,
                                      color: const Color(0x809e9e9e),
                                    )),
                          alignment: locale.locale == Locale('en') ? Alignment.centerRight : Alignment.centerLeft,
                        )
                      ],
                    ),
                  ))),
          Visibility(
              visible: isLanguageListVisible,
              child: GestureDetector(
                  onTap: () => setState(() {
                        locale.changeLocale(Locale('en'));
                        setValue('en');
                      }),
                  child: Container(
                    height: 60,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Align(
                          child: Padding(
                              padding: EdgeInsets.only(left: 25, right: 25),
                              child: locale.locale == Locale('en')
                                  ? Text(
                                      AppLocalizations.of(context).english,
                                      style: TextStyle(
                                          color: const Color(0xffFEC200), fontFamily: 'Cairo',),
                                    )
                                  : Text(AppLocalizations.of(context).english,
                                      style: TextStyle(
                                          color: const Color(0xff9e9e9e), fontFamily: 'Cairo',))),
                          alignment: locale.locale == Locale('en') ? Alignment.centerLeft : Alignment.centerRight,
                        ),
                        Align(
                          child: Padding(
                              padding: EdgeInsets.only(right: 25, left: 25),
                              child: locale.locale == Locale('en')
                                  ? Icon(
                                      Icons.check_circle,
                                      color: const Color(0xffFEC200),
                                    )
                                  : Icon(
                                      Icons.check_circle,
                                      color: const Color(0x809e9e9e),
                                    )),
                          alignment: locale.locale == Locale('en') ? Alignment.centerRight : Alignment.centerLeft,
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
                    alignment: locale.locale == Locale('en') ? Alignment.centerLeft : Alignment.centerRight,
                    child: Text(
                      AppLocalizations.of(context).aboutApp,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        fontFamily: 'Cairo',),
                    ),
                  ),
                  Align(
                      alignment: locale.locale == Locale('en') ? Alignment.centerRight : Alignment.centerLeft,
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
                    alignment: locale.locale == Locale('en') ? Alignment.centerLeft : Alignment.centerRight,
                    child: Text(
                      AppLocalizations.of(context).termsAndConditions,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        fontFamily: 'Cairo',),
                    ),
                  ),
                  Align(
                      alignment: locale.locale == Locale('en') ? Alignment.centerRight : Alignment.centerLeft,
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
                  alignment: locale.locale == Locale('en') ? Alignment.centerLeft : Alignment.centerRight,
                  child: Text(
                    AppLocalizations.of(context).contactUs,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      fontFamily: 'Cairo',),
                  ),
                ),
                Align(
                    alignment: locale.locale == Locale('en') ? Alignment.centerRight : Alignment.centerLeft,
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

  setValue(String lang) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Locale', lang);
  }
}
