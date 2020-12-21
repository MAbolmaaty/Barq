import 'dart:convert';

import 'package:barq/src/models/websites_response_model.dart';
import 'package:barq/src/utils/networking/app_url.dart';
import 'package:http/http.dart';

class WebsitesApi {
  Future<Map<String, dynamic>> getWebsites(String userId, String token) async {
    var result;

    Response response = await get(
        Uri.parse(AppUrl.websites_url + "?user_id=$userId"),
        headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      var responseData = await json.decode(response.body) as List;
      List<WebsitesResponseModel> websites = responseData
          .map((websitesResponseModel) =>
              WebsitesResponseModel.fromJson(websitesResponseModel))
          .toList();

      websites = websites.reversed.toList();

      result = {'status': true, 'data': websites};
    } else {
      result = {'status': false, 'data': json.decode(response.body)};
    }

    return result;
  }
}
