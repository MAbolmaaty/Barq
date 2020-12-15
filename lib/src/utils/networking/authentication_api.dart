import 'dart:async';
import 'dart:convert';

import 'package:barq/src/models/authentication_response_model.dart';
import 'package:barq/src/utils/networking/app_url.dart';
import 'package:barq/src/utils/preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut,
}

class AuthProvider with ChangeNotifier {

  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredStatus => _registeredStatus;

  Future<Map<String, dynamic>> register(String username, String email, String password) async {

    final Map<String, dynamic> requestBody = {
        'username': username,
        'email': email,
        'password': password
    };

    _registeredStatus = Status.Registering;
    notifyListeners();

    return await post(AppUrl.register_url,
    body: json.encode(requestBody),
    headers: {'Content-Type': 'application/json'})
        .then(onValue)
        .catchError(onError);

  }

  Future<Map<String, dynamic>> login(String email, String password) async {

    final Map<String, dynamic> requestBody = {
      'identifier': email,
      'password': password
    };

    _loggedInStatus = Status.Registering;
    notifyListeners();

    return await post(AppUrl.register_url,
        body: json.encode(requestBody),
        headers: {'Content-Type': 'application/json'})
        .then(onValue)
        .catchError(onError);

  }

  static Future<FutureOr> onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    if(response.statusCode == 200){
      AuthenticationResponseModel authenticationResponseModel = AuthenticationResponseModel.fromJson(responseData);

      UserPreferences().saveUser(authenticationResponseModel);

      result = {
        'status': true,
        'message': 'Successfully authenticated',
        'data': authenticationResponseModel
      };
    } else {
      result = {
        'status': false,
        'message': 'Authentication failed',
        'data': responseData
      };
    }

    return result;
  }

  static onError(error){
    print('the error is $error.detail');
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }

}