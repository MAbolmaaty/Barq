import 'dart:async';
import 'dart:convert';

import 'package:barq/src/models/register_response_model.dart';
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

    final Map<String, dynamic> registrationData = {
        'username': username,
        'email': email,
        'password': password
    };

    _registeredStatus = Status.Registering;
    notifyListeners();

    return await post(AppUrl.register_url,
    body: json.encode(registrationData),
    headers: {'Content-Type': 'application/json'})
        .then(onValue)
        .catchError(onError);

  }

  static Future<FutureOr> onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    if(response.statusCode == 200){
      RegisterResponseModel registerResponseModel = RegisterResponseModel.fromJson(responseData);

      UserPreferences().saveUser(registerResponseModel);

      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': registerResponseModel
      };
    } else {
      result = {
        'status': false,
        'message': 'Registration failed',
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