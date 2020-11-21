import 'package:barq/src/screens/active_links_screen.dart';
import 'package:barq/src/screens/all_links_screen.dart';
import 'package:barq/src/screens/deactivated_links_screen.dart';
import 'package:barq/src/widgets/new_website_dialog.dart';
import 'package:flutter/material.dart';

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
                  tabs: [
                    Tab(text: "All"),
                    Tab(text: "Active"),
                    Tab(text: "Deactivated")
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
        backgroundColor: const Color(0xFF333333),
        title: Center(child:Text("Main", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.logout,
                color: const Color(0xffFEC200),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => LoginScreen()));
              })
        ],
        textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: const Color(0xFFFEC200),
        onPressed: (){
          showDialog(context : context, builder: (_) => NewWebsiteDialog(),);
        },
      ),
    );
  }
}
