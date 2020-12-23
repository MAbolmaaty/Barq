import 'package:barq/src/utils/networking/app_url.dart';
import 'package:http/http.dart';

class UserApi {
  Future<Map<String, dynamic>> getUser(String token) async {
    var result;

    Response response = await get(Uri.parse(AppUrl.user_url),
        headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      result = {'status': true};
    } else {
      result = {'status': false};
    }
    return result;
  }
}
