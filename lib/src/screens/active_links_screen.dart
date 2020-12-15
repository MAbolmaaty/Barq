import 'package:barq/src/screens/website_details_screen.dart';
import 'package:flutter/material.dart';

class ActiveLinksScreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => ActiveLinksScreen(),
      );

  @override
  _ActiveLinksScreen createState() => _ActiveLinksScreen();
}

class _ActiveLinksScreen extends State<ActiveLinksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: 0,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(WebsiteDetailsScreen.route());
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              Text(
                                '',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: const Color(0x909e9e9e)),
                              )
                            ],
                          ))
                    ],
                  ),
                ));
          }),
    );
  }
}
