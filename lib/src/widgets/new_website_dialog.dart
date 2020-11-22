import 'package:barq/src/screens/bottom_nav_screen.dart';
import 'package:flutter/material.dart';

class NewWebsiteDialog extends StatefulWidget {
  @override
  _NewWebsiteDialogState createState() => _NewWebsiteDialogState();
}

class _NewWebsiteDialogState extends State<NewWebsiteDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(15.0),
              //height: 180.0,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(children: <Widget>[
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "New Website",
                          style: TextStyle(
                              color: const Color(0xff212121),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    GestureDetector(
                        onTap: () => {
                              setState(() {
                                // Route route = MaterialPageRoute(
                                //     builder: (context) => BottomNavScreen());
                                // Navigator.pushReplacement(context, route);
                                Navigator.pop(context);
                              })
                            },
                        child: Align(
                          child: Icon(
                            Icons.cancel_outlined,
                            size: 30,
                            color: const Color(0xffFEC200),
                          ),
                          alignment: Alignment.topRight,
                        )),
                  ]),
                  const Divider(
                    color: const Color(0x309e9e9e),
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  _entryField('Website Name'),
                  _entryField('Website Link'),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    child: Text(
                      "Website will be checked every",
                      style: TextStyle(
                          color: const Color(0xaa9e9e9e),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  const Divider(
                    color: const Color(0x309e9e9e),
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          color: const Color(0x309e9e9e),
                          child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Wrap(
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    Expanded(
                                        child: Column(
                                      children: <Widget>[
                                        Text(
                                          "00",
                                          style: TextStyle(
                                              color: const Color(0xff212121),
                                              fontSize: 36.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Minutes",
                                          style: TextStyle(
                                              color: const Color(0xff212121),
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          color: const Color(0xffFEC200),
                                          child: Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Icon(Icons.arrow_drop_up),
                                          ),
                                        ),
                                        Container(
                                            color: const Color(0x309e9e9e),
                                            child: SizedBox(
                                              height: 1,
                                            )),
                                        Container(
                                          color: const Color(0xffFEC200),
                                          child: Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Icon(Icons.arrow_drop_down),
                                          ),
                                        ),
                                      ],
                                    )
                                  ])
                                ],
                              )),
                        ),
                      )),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          color: const Color(0x309e9e9e),
                          child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Wrap(
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    Expanded(
                                        child: Column(
                                      children: <Widget>[
                                        Text(
                                          "00",
                                          style: TextStyle(
                                              color: const Color(0xff212121),
                                              fontSize: 36.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Hours",
                                          style: TextStyle(
                                              color: const Color(0xff212121),
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          color: const Color(0xffFEC200),
                                          child: Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Icon(Icons.arrow_drop_up),
                                          ),
                                        ),
                                        Container(
                                            color: const Color(0x309e9e9e),
                                            child: SizedBox(
                                              height: 1,
                                            )),
                                        Container(
                                          color: const Color(0xffFEC200),
                                          child: Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Icon(Icons.arrow_drop_down),
                                          ),
                                        ),
                                      ],
                                    )
                                  ])
                                ],
                              )),
                        ),
                      ))
                    ],
                  ),
                  const Divider(
                    color: const Color(0x309e9e9e),
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Container(
                      width: double.infinity,
                      child: ButtonTheme(
                          height: 40.0,
                          minWidth: 110.0,
                          child: RaisedButton(
                            color: const Color(0xffFEC200),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            splashColor: Colors.white.withAlpha(40),
                            child: Text(
                              'Create',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: const Color(0xff212121),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.0),
                            ),
                            onPressed: () {
                              setState(() {
                                Route route = MaterialPageRoute(
                                    builder: (context) => BottomNavScreen());
                                Navigator.pushReplacement(context, route);
                              });
                            },
                          ))),
                ],
              )),
        ),
      ),
    );
  }

  Widget _entryField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: const Color(0xFF9e9e9e), fontSize: 14),
          border: InputBorder.none,
          fillColor: Color(0xfff3f3f4),
          filled: true,
        ),
      ),
    );
  }
}
