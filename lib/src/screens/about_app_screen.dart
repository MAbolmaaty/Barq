import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class AboutAppScreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => AboutAppScreen(),
      );

  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutAppScreen> {
  List<String> images = [
    'assets/coffee1.jpg',
    'assets/coffee2.jpg',
    'assets/coffee3.jpg'
  ];

  @override
  void initState() {
    super.initState();
    //pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF333333),
              title: Text("About App"),
              textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
            ),
            body: SingleChildScrollView(
                child: Column(children: [
              Padding(
                  padding: EdgeInsets.only(left: 16, top: 8),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "About Barq App.\n@Force Touches 2020",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF9e9e9e)),
                      ))),
              Container(
                constraints: BoxConstraints.expand(height: 200),
                child: imageSlider(context),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(16),
                        child: ButtonTheme(
                          height: 40.0,
                          child: RaisedButton(
                            color: const Color(0xff212121),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            splashColor: Colors.white.withAlpha(40),
                            child: Text(
                              'Website',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.0),
                            ),
                            onPressed: () {},
                          ),
                        )),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(16),
                    child: ButtonTheme(
                      height: 40.0,
                      child: RaisedButton(
                        color: const Color(0xff212121),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        splashColor: Colors.white.withAlpha(40),
                        child: Text(
                          'App Store',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(16),
                    child: ButtonTheme(
                      height: 40.0,
                      child: RaisedButton(
                        color: const Color(0xff212121),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        splashColor: Colors.white.withAlpha(40),
                        child: Text(
                          'Google Play',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ))
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 16, top: 8),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Developed By Force Touches Inc.\n@All rights reserved 2020",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff212121)),
                      ))),
            ]))));
  }

  Swiper imageSlider(context) {
    return new Swiper(
      itemCount: images.length,
      viewportFraction: 0.8,
      scale: 0.9,
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          images[index],
        );
      },
    );
  }
}
