import 'package:flutter/material.dart';

class DeactivatedLinksScreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => DeactivatedLinksScreen(),
      );

  @override
  _DeactivatedLinksScreen createState() => _DeactivatedLinksScreen();
}

class _DeactivatedLinksScreen extends State<DeactivatedLinksScreen> {
  final List<String> websiteNames = <String>['Youtube'];
  final List<String> websiteLinks = <String>[
    'youtube.com',
  ];
  final List<Icon> websiteStatuses = <Icon>[
    Icon(
      Icons.error,
      color: Colors.red,
      size: 50,
    ),
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
