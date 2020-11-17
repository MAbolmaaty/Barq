import 'package:flutter/material.dart';

class WebsiteDetailsScreen extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => WebsiteDetailsScreen());

  @override
  _WebsiteDetailsScreenState createState() => _WebsiteDetailsScreenState();
}

class _WebsiteDetailsScreenState extends State<WebsiteDetailsScreen> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff212121),
        title: Text('Website Name'),
        textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.language,
                      size: 70,
                      color: const Color(0xffFEC200),
                    ),
                    Column(children: [
                      Text('Website Name', style: TextStyle(color: const Color(0xff212121),
                      fontSize: 15, fontWeight: FontWeight.w700),),
                      Text('Website Link', style: TextStyle(color: const Color(0xffC1C1C1),
                          fontSize: 13, fontWeight: FontWeight.w500,)),
                    ],),
                    SizedBox(width: 50,),
                    Switch(value: active, onChanged: (value){
                      setState(() {
                        active = value;
                      });
                    },
                    activeTrackColor: const Color(0xff212121),
                    activeColor: const Color(0xffFEC200),)
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
