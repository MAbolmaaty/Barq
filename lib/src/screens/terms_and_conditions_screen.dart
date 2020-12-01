import 'package:barq/src/widgets/screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => TermsAndConditionsScreen(),
      );

  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF333333),
              actions: [
                ScreenAppBar(
                    screenTitle:
                        AppLocalizations.of(context).termsAndConditions,
                    implyLeading: true),
              ],
            ),
            body: SingleChildScrollView(
                child: Column(children: [
              Padding(
                  padding: EdgeInsets.only(left: 16, top: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Terms And Conditions",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'Cairo',
                        ),
                      ))),
              Padding(
                  padding: EdgeInsets.only(left: 16, top: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Barq App Terms And Conditions.\n@Force Touches 2020",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF9e9e9e),
                          fontFamily: 'Cairo',
                        ),
                      ))),
            ]))));
  }
}
