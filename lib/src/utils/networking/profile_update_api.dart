import 'dart:convert';
import 'dart:io';

import 'package:barq/src/models/profile_response_model.dart';
import 'package:barq/src/utils/networking/file_upload_api.dart';
import 'package:http/http.dart';

import 'app_url.dart';

class ProfileUpdateApi {
  Future<Map<String, dynamic>> updateProfile(
      String token,
      String userId,
      String username,
      String phoneNumber,
      File profilePicture,
      String currentProfilePictureId) async {
    var result;

    final Map<String, dynamic> requestBody = {
      'username': username,
      'phoneNumber': phoneNumber,
    };

    Response response;

    try {
      response = await put(AppUrl.profile_update_url + userId,
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json'
          },
          body: json.encode(requestBody));
      if (profilePicture != null) {
        FileUploadApi().update(
            profilePicture, userId, token, username, currentProfilePictureId);
      }
    } on Exception catch (ex) {
      ex.toString();
    }

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
