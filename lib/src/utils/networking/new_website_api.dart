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
      {String websiteName, String websiteURL, String checkingTime}) async {

    final Map<String, dynamic> data = {
      'websiteName': websiteName,
      'websiteURL': websiteURL,
      'checkingTime': checkingTime
    };

    _addingNewWebsite = Status.Connect;
    notifyListeners();

    return await post(AppUrl.websites_url,
            body: json.encode(data),
            headers: {'Content-Type': 'application/json'})
        .then(onValue)
        .catchError(onError);
  }

  static Future<FutureOr> onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      NewWebsiteResponseModel newWebsiteResponseModel = NewWebsiteResponseModel.fromJson(responseData);
      result = {
        'status': true,
        'message': 'Successfully added new website',
        'data' : newWebsiteResponseModel
      };
    } else {
      result = {
        'status': false,
        'message': 'Adding new website failed',
        'data': responseData
      };
    }

    return result;
  }

  static onError(error) {
    print('the error is $error.detail');
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
