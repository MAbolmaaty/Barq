import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class NewWebsiteApi {
  // Future<Map<String, dynamic>> addNewWebsite(String name) async {
  //
  //   final Map<String, dynamic> data = {
  //     'name' : name,
  //   };
  //
  //   return await post("https://barq-app.herokuapp.com/websites",
  //   body: json.encode(data),
  //   headers: {'Content-Type': 'application/json'})
  //       .then(onValue)
  //       .catchError(onError);
  // }

  Future<int> addNewWebsite(File file) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("https://barq-app.herokuapp.com/websites"));

    Map<String, String> headers = {
      "Content-type": "multipart/form-data",
    };

    // Map<String, dynamic> fields = {
    //   'data': {'name': 'testing'},
    // };

    request.headers.addAll(headers);

    // request.fields.addAll({
    //   "name": "testing",
    // });

    request.files.add(
      http.MultipartFile(
        'photo',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: 'photo',
        contentType: MediaType('image','jpeg'),
      ),
    );

    var res = await request.send();
    var response = await http.Response.fromStream(res);
    print(response.body.toString());
    return res.statusCode;
  }

// static Future<FutureOr> onValue(Response response) async {
//   var result;
//   final Map<String, dynamic> responseData = json.decode(response.body);
//
//   if(response.statusCode == 200){
//     print(response.body.toString());
//     result = {
//       'status': true,
//       'message': 'Successfully registered',
//     };
//   } else {
//     result = {
//       'status': false,
//       'message': 'Registration failed',
//       'data': responseData
//     };
//   }
//
//   return result;
// }
//
// static onError(error){
//   print('the error is $error.detail');
//   return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
// }
}
