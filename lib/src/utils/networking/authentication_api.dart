import 'dart:convert';
import 'dart:io';

import 'package:barq/src/models/authentication_response_model.dart';
import 'package:barq/src/utils/networking/app_url.dart';
import 'package:barq/src/utils/preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut,
}

class AuthenticationApi with ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;

  Status get registeredStatus => _registeredStatus;

  Future<Map<String, dynamic>> register(String username, String email,
      String password, File profilePicture) async {
    var result;

    final Map<String, dynamic> requestBody = {
      'username': username,
      'email': email,
      'password': password
    };

    _registeredStatus = Status.Registering;
    notifyListeners();

    Response response = await post(AppUrl.register_url,
        body: json.encode(requestBody),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      AuthenticationResponseModel authenticationResponseModel =
          AuthenticationResponseModel.fromJson(responseData);

      UserPreferences().saveUser(authenticationResponseModel);

      uploadProfilePicture(
          profilePicture,
          authenticationResponseModel.user.sId,
          authenticationResponseModel.jwt,
          authenticationResponseModel.user.username);

      _registeredStatus = Status.Registered;
      notifyListeners();

      result = {
        'status': true,
        'message': 'Successfully Registered',
        'data': authenticationResponseModel
      };
    } else {
      _registeredStatus = Status.NotRegistered;
      notifyListeners();
      result = {
        'status': false,
        'message': 'Register Failed',
        'data': json.decode(response.body)
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    final Map<String, dynamic> requestBody = {
      'identifier': email,
      'password': password
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Response response = await post(AppUrl.login_url,
        body: json.encode(requestBody),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      AuthenticationResponseModel authenticationResponseModel =
          AuthenticationResponseModel.fromJson(responseData);

      UserPreferences().saveUser(authenticationResponseModel);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {
        'status': true,
        'message': 'Login Successfully',
        'data': authenticationResponseModel
      };
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': 'Login Failed',
        'data': json.decode(response.body)
      };
    }

    return result;
  }

  Future<Map<String, dynamic>> uploadProfilePicture(
      File profilePicture, String userId, String token, String username) async {
    var result;

    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-type': "multipart/form-data"
    };

    Map<String, String> fields = {
      'refId': '$userId',
      'ref': 'user',
      'source': 'users-permissions',
      'field': 'profilePicture'
    };

    var request = MultipartRequest('POST', Uri.parse(AppUrl.upload_url))
      ..headers.addAll(headers)
      ..fields.addAll(fields)
      ..files.add(MultipartFile('files',
          profilePicture.readAsBytes().asStream(), profilePicture.lengthSync(),
          filename: username, contentType: MediaType('image', 'jpeg')));

    var response = await request.send();

    result = {'statusCode': response.statusCode};

    return result;
  }
}
