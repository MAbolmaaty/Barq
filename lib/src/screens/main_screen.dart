import 'dart:math';

import 'package:barq/src/screens/active_links_screen.dart';
import 'package:barq/src/screens/all_links_screen.dart';
import 'package:barq/src/screens/deactivated_links_screen.dart';
//import 'file:///C:/MU/barq/lib/src/utils/localization/app_locale.dart';
import 'package:barq/src/widgets/new_website_dialog.dart';
import 'package:barq/src/widgets/screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/localization/app_locale.dart';
import 'login_screen.dart';

class MainScreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => MainScreen(),
      );

  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var locale = Provider.of<AppLocale>(context);
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints(maxHeight: 150.0),
              child: Material(
                color: Colors.white,
                child: TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.orange,
                  indicatorColor: Colors.orange,
                  labelStyle: TextStyle(fontFamily: 'Cairo'),
                  tabs: [
                    Tab(text: AppLocalizations.of(context).all),
                    Tab(text: AppLocalizations.of(context).activated),
                    Tab(text: AppLocalizations.of(context).deactivated)
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  AllLinksScreen(),
                  ActiveLinksScreen(),
                  DeactivatedLinksScreen()
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          ScreenAppBar(
            screenTitle: AppLocalizations.of(context).main,
            implyLeading: false,
            thirdAction: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()));
                },
                child: Container(
                    height: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Transform.rotate(
                          angle: locale.locale == Locale("en") ? 0 : pi,
                          child: Icon(
                            Icons.logout,
                            color: const Color(0xffFEC200),
                          )),
                    ))),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: const Color(0xFFFEC200),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => NewWebsiteDialog(),
          );
        },
      ),
    );
  }
}
