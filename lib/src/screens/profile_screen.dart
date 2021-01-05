import 'dart:io';

import 'package:barq/src/models/profile_response_model.dart';
import 'package:barq/src/utils/networking/profile_api.dart';
import 'package:barq/src/utils/networking/profile_update_api.dart';
import 'package:barq/src/utils/preferences/user_preferences.dart';
import 'package:barq/src/widgets/screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => ProfileScreen(),
      );

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final formKey = new GlobalKey<FormState>();
  final picker = ImagePicker();
  File _selectedImage;
  String _username = "", _email = "", _phoneNumber = "";
  String _profilePictureURL;
  bool isLoading = false;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: [
                ScreenAppBar(
                  screenTitle: AppLocalizations.of(context).profile,
                  implyLeading: false,
                  thirdAction: isLoading
                      ? _loading()
                      : GestureDetector(
                          onTap: () {
                            isEditing
                                ? setState(() {
                                    final form = formKey.currentState;
                                    if (form.validate()) {
                                      isLoading = true;
                                      form.save();
                                      UserPreferences userPreferences =
                                          UserPreferences();
                                      userPreferences.getUser().then(
                                          (authenticationResponseModel) => {
                                          UserPreferences().getProfilePicture().then((profilePictureId) => {
                                            ProfileUpdateApi()
                                                .updateProfile(
                                                    authenticationResponseModel
                                                        .jwt,
                                                    authenticationResponseModel
                                                        .user.sId,
                                                    _username,
                                                    _phoneNumber,_selectedImage, profilePictureId)
                                                .then((result) => {
                                                      if (result['status'])
                                                        setState(() {
                                                          isLoading = false;
                                                          isEditing = false;
                                                        })
                                                    })
                                          })
                                              });
                                    }
                                  })
                                : setState(() {
                                    isEditing = true;
                                  });
                          },
                          child: Container(
                            height: double.infinity,
                            child: Padding(
                                padding: EdgeInsets.all(15),
                                child: isEditing
                                    ? Icon(Icons.check,
                                        color: const Color(0xffFEC200))
                                    : Image.asset(
                                        'assets/edit.png',
                                        width: 20,
                                        height: 20,
                                      )),
                          )),
                )
              ],
            ),
            body: SingleChildScrollView(
                child: Form(
              key: formKey,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    ///////////////////Profile Picture
                    GestureDetector(
                        onTap: () {
                          if (isEditing) {
                            getImage();
                          }
                        },
                        child: Container(
                            height: 150,
                            width: 150,
                            child: Stack(children: <Widget>[
                              Align(
                                  child: CircleAvatar(
                                radius: 60,
                                backgroundColor: const Color(0x109e9e9e),
                                child: CircleAvatar(
                                    radius: 62,
                                    backgroundColor: const Color(0x109e9e9e),
                                    backgroundImage: _profilePictureURL != null
                                        ? NetworkImage(_profilePictureURL)
                                        : _selectedImage != null
                                            ? FileImage(_selectedImage)
                                            : AssetImage(
                                                'assets/profile.png',
                                              )),
                              )),
                              Visibility(
                                  visible: isEditing ? true : false,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        child: Padding(
                                            padding: EdgeInsets.all(6),
                                            child: Image.asset(
                                              'assets/camera.png',
                                            ))),
                                  )),
                            ]))),
                    SizedBox(
                      height: 20,
                    ),
                    ///////////////////////////Username
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: isEditing
                            ? Visibility(
                                visible: isEditing,
                                child: TextFormField(
                                  maxLines: 1,
                                  initialValue: _username,
                                  validator: (value) => value.isEmpty
                                      ? AppLocalizations.of(context)
                                          .enterUsername
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
                                      ),
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(),
                                      isDense: true),
                                ))
                            : Visibility(
                                visible: !isEditing,
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      color: const Color(0xfff3f3f4),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Text(_username)))),
                    //////////////////////////Email
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: false //////isEditing
                            ? Visibility(
                                visible: isEditing,
                                child: TextFormField(
                                  maxLines: 1,
                                  validator: (value) => value.isEmpty
                                      ? AppLocalizations.of(context)
                                          .enterEmail
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
                                      ),
                                      hintText: _email,
                                      hintStyle: TextStyle(
                                        color: const Color(0xFF9e9e9e),
                                        fontSize: 12,
                                      ),
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(),
                                      isDense: true),
                                ))
                            : Visibility(
                                visible: !isEditing,
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      color: const Color(0xfff3f3f4),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Text(_email)))),
                    ////////////////////////////PhoneNumber
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: isEditing
                            ? Visibility(
                                visible: isEditing,
                                child: TextFormField(
                                  maxLines: 1,
                                  initialValue: _phoneNumber,
                                  validator: (value) => value.isEmpty
                                      ? AppLocalizations.of(context)
                                          .enterPhoneNumber
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
                                      ),
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(),
                                      isDense: true),
                                ))
                            : Visibility(
                                visible: !isEditing,
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      color: const Color(0xfff3f3f4),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Text(_phoneNumber)))),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ))));
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

  void getProfile() async {
    isLoading = true;
    UserPreferences userPreferences = UserPreferences();
    userPreferences.getUser().then((authenticationResponseModel) => {
          ProfileApi()
              .getProfile(authenticationResponseModel.jwt)
              .then((result) {
            if (result['status']) {
              setState(() {
                isLoading = false;
                ProfileResponseModel profile = result['data'];
                _username = profile.username;
                _email = profile.email;
                _phoneNumber = profile.phoneNumber;
                if (profile.profilePicture != null)
                  _profilePictureURL = profile.profilePicture.url;
              });
            }
          })
        });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
        _profilePictureURL = null;
      }
    });
  }
}
