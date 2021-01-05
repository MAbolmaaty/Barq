import 'dart:convert';
import 'dart:io';

import 'package:barq/src/models/profile_response_model.dart';
import 'package:barq/src/utils/networking/app_url.dart';
import 'package:barq/src/utils/networking/profile_api.dart';
import 'package:barq/src/utils/preferences/user_preferences.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FileUploadApi {
  Future<Map<String, dynamic>> upload(
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

    var request = MultipartRequest('POST', Uri.parse(AppUrl.file_upload_url))
      ..headers.addAll(headers)
      ..fields.addAll(fields)
      ..files.add(MultipartFile('files',
          profilePicture.readAsBytes().asStream(), profilePicture.lengthSync(),
          filename: username, contentType: MediaType('image', 'jpeg')));

    var response = await request.send();

    if(response.statusCode == 200){
      ProfileResponseModel profileResponseModel;
      ProfileApi().getProfile(token).then((result) => {
        if(result['status']){
          profileResponseModel = result['data'],
          UserPreferences().saveProfilePicture(profileResponseModel)
        }
      });
    }

    result = {'statusCode': response.statusCode};

    return result;
  }

  Future<Map<String, dynamic>> update(File profilePicture, String userId,
      String token, String username, String currentProfilePictureId) async {
    var result;

    Response responseDelete = await delete(
        AppUrl.file_delete_url + currentProfilePictureId,
        headers: {'Authorization': 'Bearer $token'});

    if (responseDelete.statusCode == 200) {
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

      var request = MultipartRequest('POST', Uri.parse(AppUrl.file_upload_url))
        ..headers.addAll(headers)
        ..fields.addAll(fields)
        ..files.add(MultipartFile(
            'files',
            profilePicture.readAsBytes().asStream(),
            profilePicture.lengthSync(),
            filename: username,
            contentType: MediaType('image', 'jpeg')));

      var responseUpload = await request.send();

      result = {'statusCode': responseUpload.statusCode};
    }

    return result;
  }
}
