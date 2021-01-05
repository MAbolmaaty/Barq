import 'dart:ui';

import 'package:barq/src/models/profile_response_model.dart';
import 'package:barq/src/utils/networking/profile_api.dart';
import 'package:barq/src/utils/preferences/user_preferences.dart';
import 'package:barq/src/widgets/screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactUsScreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => ContactUsScreen(),
      );

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  String _username, _email, _phoneNumber, _messageSubject;
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: [
                ScreenAppBar(
                  screenTitle: AppLocalizations.of(context).contactUs,
                  implyLeading: true,
                  thirdAction: _isLoading ? _loading() : null,
                ),
              ],
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 16, top: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppLocalizations.of(context).contactUs,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontFamily: 'Cairo'),
                          ))),
                  Padding(
                      padding: EdgeInsets.only(left: 16, top: 8),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppLocalizations.of(context).contactUsHint,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF9e9e9e),
                                fontFamily: 'Cairo'),
                          ))),
                  SizedBox(
                    height: 24,
                  ),
                  /////////////////////////////// Username
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: TextFormField(
                      key: Key(_username),
                      maxLines: 1,
                      initialValue: _username,
                      validator: (value) => value.isEmpty
                          ? AppLocalizations.of(context).enterUsername
                          : null,
                      onSaved: (value) => _username = value,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 11, bottom: 11, left: 8, right: 8),
                          labelText: AppLocalizations.of(context).username,
                          labelStyle: TextStyle(
                              color: const Color(0xFF9e9e9e),
                              fontSize: 13,
                              fontFamily: 'Cairo'),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(),
                          isDense: true),
                    ),
                  ),
                  /////////////////////////////// Email
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: TextFormField(
                      key: Key(_email),
                      maxLines: 1,
                      initialValue: _email,
                      validator: (value) => value.isEmpty
                          ? AppLocalizations.of(context).enterEmail
                          : null,
                      onSaved: (value) => _email = value,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 11, bottom: 11, left: 8, right: 8),
                          labelText: AppLocalizations.of(context).email,
                          labelStyle: TextStyle(
                              color: const Color(0xFF9e9e9e),
                              fontSize: 13,
                              fontFamily: 'Cairo'),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(),
                          isDense: true),
                    ),
                  ),
                  /////////////////////////////// Phone Number
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: TextFormField(
                      key: Key(_phoneNumber),
                      maxLines: 1,
                      initialValue: _phoneNumber,
                      validator: (value) => value.isEmpty
                          ? AppLocalizations.of(context).enterPhoneNumber
                          : null,
                      onSaved: (value) => _phoneNumber = value,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 11, bottom: 11, left: 8, right: 8),
                          labelText: AppLocalizations.of(context).phoneNumber,
                          labelStyle: TextStyle(
                              color: const Color(0xFF9e9e9e),
                              fontSize: 13,
                              fontFamily: 'Cairo'),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(),
                          isDense: true),
                    ),
                  ),
                  /////////////////////////////// Message Subject
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: TextFormField(
                      maxLines: 10,
                      validator: (value) => value.isEmpty
                          ? AppLocalizations.of(context).enterMessageSubject
                          : null,
                      onSaved: (value) => _messageSubject = value,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 11, bottom: 11, left: 8, right: 8),
                          labelText:
                              AppLocalizations.of(context).messageSubject,
                          labelStyle: TextStyle(
                              color: const Color(0xFF9e9e9e),
                              fontSize: 13,
                              fontFamily: 'Cairo'),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(),
                          isDense: true),
                    ),
                  ),
                  //////////////////////////// Send Message
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: Offset(2, 4),
                                  blurRadius: 5,
                                  spreadRadius: 2)
                            ],
                            color: const Color(0xffFEC200)),
                        child: Text(
                          AppLocalizations.of(context).send,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: 'Cairo'),
                        ),
                      )),
                ],
              ),
            )));
  }

  void getProfile() async {
    UserPreferences userPreferences = UserPreferences();
    userPreferences.getUser().then((authenticationResponseModel) => {
          ProfileApi()
              .getProfile(authenticationResponseModel.jwt)
              .then((result) {
            if (result['status']) {
              setState(() {
                ProfileResponseModel profile = result['data'];
                _username = profile.username;
                _email = profile.email;
                _phoneNumber = profile.phoneNumber;
                _isLoading = false;
              });
            }
          })
        });
  }

  Widget _loading() {
    return GestureDetector(
        child: Container(
      margin: EdgeInsets.all(12.0),
      child: SizedBox(
        child: CircularProgressIndicator(
            backgroundColor: Colors.black,
            strokeWidth: 2,
            valueColor:
                new AlwaysStoppedAnimation<Color>(const Color(0xffFEC200))),
        height: 20,
        width: 20,
      ),
    ));
  }
}
