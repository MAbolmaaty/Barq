import 'dart:async';
import 'dart:convert';

import 'package:barq/src/models/new_website_response_model.dart';
import 'package:barq/src/utils/networking/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

enum Status { Connect, Succeed, Failed }

class NewWebsiteApi with ChangeNotifier {
  Status _addingNewWebsite;

  Status get addingNewWebsiteStatus => _addingNewWebsite;

  Future<Map<String, dynamic>> addNewWebsite(
      {String websiteName,
      String websiteURL,
      String checkingTime,
      String userId,
      String token}) async {
    var result;

    final Map<String, dynamic> requestData = {
      'websiteName': websiteName,
      'websiteURL': websiteURL,
      'checkingTime': checkingTime,
      'user_id': userId
    };

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    _addingNewWebsite = Status.Connect;
    notifyListeners();

    Response response = await post(AppUrl.websites_url,
        body: json.encode(requestData),
        headers: headers);

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      NewWebsiteResponseModel newWebsiteResponseModel =
          NewWebsiteResponseModel.fromJson(responseData);
      result = {
        'status': true,
        'data': newWebsiteResponseModel
      };
    } else {
      result = {
        'status': false,
        'data': responseData
      };
    }

    return result;
  }
}
