import 'package:barq/src/screens/bottom_nav_screen.dart';
import 'package:barq/src/utils/networking/new_website_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class NewWebsiteDialog extends StatefulWidget {
  @override
  _NewWebsiteDialogState createState() => _NewWebsiteDialogState();
}

class _NewWebsiteDialogState extends State<NewWebsiteDialog>
    with SingleTickerProviderStateMixin {
  String _websiteName;
  String _websiteURL;
  String _checkingTime;
  int _hours = 10;
  int _minutes = 10;
  final formKey = new GlobalKey<FormState>();

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
    return ChangeNotifierProvider(
        create: (context) => NewWebsiteApi(),
        child:
            Consumer<NewWebsiteApi>(builder: (context, newWebsiteApi, child) {
          return Center(
            child: Material(
              color: Colors.transparent,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: Container(
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(15.0),
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                    child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Stack(children: <Widget>[
                              ///////////////////////////////////// Title
                              Align(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    AppLocalizations.of(context).newWebsite,
                                    style: TextStyle(
                                        color: const Color(0xff212121),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Cairo'),
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                              //////////////////// Cancel
                              GestureDetector(
                                  onTap: () => {
                                        setState(() {
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
                            ////////////////////////////////////// Entry Fields
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 4),
                              child: TextFormField(
                                validator: (value) => value.isEmpty
                                    ? AppLocalizations.of(context)
                                        .pleaseEnterWebsiteName
                                    : null,
                                onSaved: (value) => _websiteName = value,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 11, bottom: 11, left: 8, right: 8),
                                    labelText: AppLocalizations.of(context)
                                        .websiteName,
                                    labelStyle: TextStyle(
                                      color: const Color(0xFF9e9e9e),
                                      fontSize: 13,
                                    ),
                                    alignLabelWithHint: true,
                                    border: OutlineInputBorder(),
                                    isDense: true),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 4),
                              child: TextFormField(
                                validator: (value) => value.isEmpty
                                    ? AppLocalizations.of(context)
                                        .pleaseEnterWebsiteURL
                                    : null,
                                onSaved: (value) => _websiteURL = value,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 11, bottom: 11, left: 8, right: 8),
                                    labelText: AppLocalizations.of(context)
                                        .websiteLink,
                                    labelStyle: TextStyle(
                                      color: const Color(0xFF9e9e9e),
                                      fontSize: 13,
                                    ),
                                    alignLabelWithHint: true,
                                    border: OutlineInputBorder(),
                                    isDense: true),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Align(
                              child: Text(
                                AppLocalizations.of(context)
                                    .websiteWillBeCheckedEvery,
                                style: TextStyle(
                                  color: const Color(0xaa9e9e9e),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Cairo',
                                ),
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
                                    decoration: ShapeDecoration(
                                        color: const Color(0x309e9e9e),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        )),
                                    child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Wrap(
                                          children: <Widget>[
                                            Row(children: <Widget>[
                                              Expanded(
                                                  child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    "$_minutes",
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xff212121),
                                                        fontSize: 36.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo'),
                                                  ),
                                                  Text(
                                                    AppLocalizations.of(context)
                                                        .minutes,
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xff212121),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo'),
                                                  ),
                                                ],
                                              )),
                                              Column(
                                                children: <Widget>[
                                                  Container(
                                                      decoration: ShapeDecoration(
                                                          color: const Color(
                                                              0xffFEC200),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4))),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            if (_minutes < 59)
                                                              _minutes++;
                                                          });
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(4),
                                                          child: Icon(Icons
                                                              .arrow_drop_up),
                                                        ),
                                                      )),
                                                  Container(
                                                      color: const Color(
                                                          0x309e9e9e),
                                                      child: SizedBox(
                                                        height: 1,
                                                      )),
                                                  Container(
                                                      decoration: ShapeDecoration(
                                                          color: const Color(
                                                              0xffFEC200),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4))),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            if (_minutes > 10)
                                                              _minutes--;
                                                          });
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(4),
                                                          child: Icon(Icons
                                                              .arrow_drop_down),
                                                        ),
                                                      )),
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
                                    decoration: ShapeDecoration(
                                        color: const Color(0x309e9e9e),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4))),
                                    child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Wrap(
                                          children: <Widget>[
                                            Row(children: <Widget>[
                                              Expanded(
                                                  child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    "$_hours",
                                                    style: TextStyle(
                                                      color: const Color(
                                                          0xff212121),
                                                      fontSize: 36.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Cairo',
                                                    ),
                                                  ),
                                                  Text(
                                                    AppLocalizations.of(context)
                                                        .hours,
                                                    style: TextStyle(
                                                      color: const Color(
                                                          0xff212121),
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Cairo',
                                                    ),
                                                  ),
                                                ],
                                              )),
                                              Column(
                                                children: <Widget>[
                                                  Container(
                                                      decoration: ShapeDecoration(
                                                          color: const Color(
                                                              0xffFEC200),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4))),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            if (_hours < 99)
                                                              _hours++;
                                                          });
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(4),
                                                          child: Icon(Icons
                                                              .arrow_drop_up),
                                                        ),
                                                      )),
                                                  Container(
                                                      color: const Color(
                                                          0x309e9e9e),
                                                      child: SizedBox(
                                                        height: 1,
                                                      )),
                                                  Container(
                                                      decoration: ShapeDecoration(
                                                          color: const Color(
                                                              0xffFEC200),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4))),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            if (_hours > 10)
                                                              _hours--;
                                                          });
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(4),
                                                          child: Icon(Icons
                                                              .arrow_drop_down),
                                                        ),
                                                      )),
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
                            ////////////////////////////////////////// Create Button
                            GestureDetector(
                                onTap: () {
                                  // setState(() {
                                  //   Route route = MaterialPageRoute(
                                  //       builder: (context) => BottomNavScreen());
                                  //   Navigator.pushReplacement(context, route);
                                  // });
                                  _checkingTime =
                                      (_minutes + (_hours * 60)).toString();
                                  final form = formKey.currentState;
                                  if (form.validate()) {
                                    form.save();
                                    Route route = MaterialPageRoute(
                                        builder: (context) =>
                                            BottomNavScreen());
                                    newWebsiteApi
                                        .addNewWebsite(
                                            websiteName: _websiteName,
                                            websiteURL: _websiteURL,
                                            checkingTime: _checkingTime)
                                        .then((response) => {
                                              if (response['status'])
                                                {
                                                  Navigator.pop(context),
                                                  Navigator.pushReplacement(
                                                      context, route)
                                                }
                                            });
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color: const Color(0x709e9e9e),
                                            offset: Offset(1, 2),
                                            blurRadius: 5,
                                            spreadRadius: 1)
                                      ],
                                      color: const Color(0xffFEC200)),
                                  child: newWebsiteApi.addingNewWebsiteStatus ==
                                          Status.Connect
                                      ? _loading()
                                      : Text(
                                          AppLocalizations.of(context).add,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: const Color(0xff212121),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.0,
                                            fontFamily: 'Cairo',
                                          ),
                                        ),
                                )),
                          ],
                        ))),
              ),
            ),
          );
        }));
  }

  Widget _loading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          child: CircularProgressIndicator(
              backgroundColor: Colors.black,
              strokeWidth: 2,
              valueColor:
                  new AlwaysStoppedAnimation<Color>(const Color(0xffFEC200))),
          height: 20,
          width: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          AppLocalizations.of(context).addingNewWebsite,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
