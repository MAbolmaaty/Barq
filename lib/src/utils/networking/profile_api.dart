import 'dart:convert';

import 'package:barq/src/models/profile_response_model.dart';
import 'package:barq/src/utils/networking/app_url.dart';
import 'package:http/http.dart';

class ProfileApi {
  Future<Map<String, dynamic>> getProfile(String token) async {
    var result;

    Response response = await get(Uri.parse(AppUrl.profile_url),
        headers: {'Authorization': 'Bearer $token'});

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      ProfileResponseModel profileResponseModel =
          ProfileResponseModel.fromJson(responseData);

      result = {'status': true, 'data': profileResponseModel};
    } else {
      result = {'status': false, 'data': responseData};
    }
    return result;
  }
}
