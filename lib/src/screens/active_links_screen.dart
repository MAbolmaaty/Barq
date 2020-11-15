import 'package:flutter/material.dart';

class ActiveLinksScreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => ActiveLinksScreen(),
  );

  @override
  _ActiveLinksScreen createState() => _ActiveLinksScreen();
}

class _ActiveLinksScreen extends State<ActiveLinksScreen>{
  final List<String> websiteNames = <String>['Facebook', 'Google'];
  final List<String> websiteLinks = <String>[
    'facebook.com',
    'google.com'
  ];
  final List<Icon> websiteStatuses = <Icon>[
    Icon(
      Icons.language,
      color: Colors.orange,
      size: 50,
    ),
    Icon(
      Icons.language,
      color: Colors.orange,
      size: 50,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: websiteNames.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  websiteStatuses[index],
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${websiteNames[index]}', style: TextStyle(fontSize: 16, color: Colors.black),),
                          Text('${websiteLinks[index]}', style: TextStyle(fontSize: 12, color:const Color(0x909e9e9e)),)
                        ],
                      ))
                ],
              ),
            );
          }),
    );
  }

}