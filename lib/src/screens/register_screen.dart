import 'dart:async';
import 'dart:io';

import 'package:barq/src/utils/networking/authentication_api.dart';
import 'package:barq/src/widgets/choose_image_dialog.dart';
import 'package:barq/src/widgets/success_dialog.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'bottom_nav_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  //static final String route = "/register";
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => RegisterScreen(),
      );

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = new GlobalKey<FormState>();
  String _username, _email, _password, _confirmPassword, _phoneNumber;
  File _selectedImage;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthenticationApi(),
      child: Consumer<AuthenticationApi>(
        builder: (context, authenticationApi, child) {
          return SafeArea(child: Scaffold(body: LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewPortConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewPortConstraints.maxHeight),
                  child: IntrinsicHeight(
                      child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              _registerLabel(),
                              ///////////////////////// Profile Picture
                              GestureDetector(
                                  onTap: () {
                                    // showDialog(
                                    //     context: context,
                                    //     builder: (_) => ChooseImageDialog());
                                    getImage();
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 150,
                                      width: 150,
                                      child: Stack(children: <Widget>[
                                        Align(
                                            alignment: Alignment.center,
                                            child: CircleAvatar(
                                              radius: 60,
                                              backgroundColor:
                                                  const Color(0x109e9e9e),
                                              child: CircleAvatar(
                                                  radius: 62,
                                                  backgroundColor:
                                                      const Color(0x109e9e9e),
                                                  backgroundImage:
                                                      _selectedImage != null
                                                          ? FileImage(
                                                              _selectedImage)
                                                          : AssetImage(
                                                              'assets/profile.png',
                                                            )),
                                            )),
                                        Visibility(
                                            visible: _selectedImage != null
                                                ? false
                                                : true,
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle),
                                                  child: Padding(
                                                      padding:
                                                          EdgeInsets.all(6),
                                                      child: Image.asset(
                                                        'assets/camera.png',
                                                      ))),
                                            )),
                                      ]))),
                              SizedBox(
                                height: 20,
                              ),
                              ////////////////////////// Username
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                child: TextFormField(
                                  maxLines: 1,
                                  validator: (value) => value.isEmpty
                                      ? AppLocalizations.of(context)
                                          .pleaseEnterUsername
                                      : null,
                                  onSaved: (value) => _username = value,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          top: 11,
                                          bottom: 11,
                                          left: 8,
                                          right: 8),
                                      labelText:
                                          AppLocalizations.of(context).username,
                                      labelStyle: TextStyle(
                                          color: const Color(0xFF9e9e9e),
                                          fontSize: 13,
                                          fontFamily: 'Cairo'),
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(),
                                      isDense: true),
                                ),
                              ),
                              ///////////////////// Email
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                child: TextFormField(
                                  maxLines: 1,
                                  validator: (value) => value.isEmpty
                                      ? AppLocalizations.of(context)
                                          .pleaseEnterEmail
                                      : null,
                                  onSaved: (value) => _email = value,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          top: 11,
                                          bottom: 11,
                                          left: 8,
                                          right: 8),
                                      labelText:
                                          AppLocalizations.of(context).email,
                                      labelStyle: TextStyle(
                                          color: const Color(0xFF9e9e9e),
                                          fontSize: 13,
                                          fontFamily: 'Cairo'),
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(),
                                      isDense: true),
                                ),
                              ),
                              ////////////////////////////////////// Password
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                child: TextFormField(
                                  maxLines: 1,
                                  validator: (value) => value.isEmpty
                                      ? AppLocalizations.of(context)
                                          .pleaseEnterPassword
                                      : null,
                                  onSaved: (value) => _password = value,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          top: 11,
                                          bottom: 11,
                                          left: 8,
                                          right: 8),
                                      labelText:
                                          AppLocalizations.of(context).password,
                                      labelStyle: TextStyle(
                                          color: const Color(0xFF9e9e9e),
                                          fontSize: 13,
                                          fontFamily: 'Cairo'),
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(),
                                      isDense: true),
                                ),
                              ),
                              /////////////////////// Password Confirmation
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                child: TextFormField(
                                  maxLines: 1,
                                  validator: (value) => value.isEmpty
                                      ? AppLocalizations.of(context)
                                          .pleaseConfirmPassword
                                      : null,
                                  onSaved: (value) => _confirmPassword = value,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          top: 11,
                                          bottom: 11,
                                          left: 8,
                                          right: 8),
                                      labelText: AppLocalizations.of(context)
                                          .confirmPassword,
                                      labelStyle: TextStyle(
                                          color: const Color(0xFF9e9e9e),
                                          fontSize: 13,
                                          fontFamily: 'Cairo'),
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(),
                                      isDense: true),
                                ),
                              ),
                              ////////////////// Phone Number
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                child: TextFormField(
                                  maxLines: 1,
                                  validator: (value) => value.isEmpty
                                      ? AppLocalizations.of(context)
                                          .pleaseEnterPhoneNumber
                                      : null,
                                  onSaved: (value) => _phoneNumber = value,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          top: 11,
                                          bottom: 11,
                                          left: 8,
                                          right: 8),
                                      labelText: AppLocalizations.of(context)
                                          .phoneNumber,
                                      labelStyle: TextStyle(
                                          color: const Color(0xFF9e9e9e),
                                          fontSize: 13,
                                          fontFamily: 'Cairo'),
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(),
                                      isDense: true),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ////////////////////////// Register
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 40,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: const Color(0x709e9e9e),
                                          offset: Offset(1, 2),
                                          blurRadius: 5,
                                          spreadRadius: 1)
                                    ],
                                    color: const Color(0xffFEC200)),
                                child: authenticationApi.registeredStatus ==
                                        Status.Registering
                                    ? _loading()
                                    : GestureDetector(
                                        onTap: () {
                                          final form = formKey.currentState;
                                          if (form.validate()) {
                                            form.save();
                                            if (_password == _confirmPassword) {
                                              authenticationApi
                                                  .register(_username, _email,
                                                      _password, _selectedImage)
                                                  .then((result) {
                                                if (result['status']) {
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (_) => SuccessDialog(
                                                                message: AppLocalizations.of(
                                                                        context)
                                                                    .accountSuccessfullyCreated,
                                                              ));
                                                  Timer(Duration(seconds: 1),
                                                      () {
                                                    Navigator.pop(context);
                                                    Navigator.of(context).pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                BottomNavScreen()));
                                                  });
                                                } else {
                                                  Flushbar(
                                                    title: AppLocalizations.of(
                                                            context)
                                                        .registrationFailed,
                                                    message:
                                                        AppLocalizations.of(
                                                                context)
                                                            .invalidData,
                                                    duration: Duration(
                                                        milliseconds: 1500),
                                                  ).show(context);
                                                }
                                              });
                                            } else {
                                              Flushbar(
                                                title:
                                                    AppLocalizations.of(context)
                                                        .registrationFailed,
                                                message:
                                                    AppLocalizations.of(context)
                                                        .passwordsDoNotMatch,
                                                duration: Duration(
                                                    milliseconds: 1500),
                                              ).show(context);
                                            }
                                          }
                                        },
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .createNewAccount,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        )),
                              ),
                              _loginLabel(),
                            ],
                          )))),
            );
          })));
        },
      ),
    );
  }

  Widget _loading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          child: CircularProgressIndicator(
              backgroundColor: Colors.white,
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
          AppLocalizations.of(context).registering,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget _loginLabel() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          LoginScreen.route(),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          AppLocalizations.of(context).alreadyHaveAccount +
              AppLocalizations.of(context).login,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF9e9e9e),
              fontFamily: 'Cairo'),
        ),
      ),
    );
  }

  Widget _registerLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        AppLocalizations.of(context).newAccount,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: const Color(0xff212121),
            fontFamily: 'Cairo'),
      ),
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      }
    });
  }
}
