import 'package:barq/src/models/register_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(RegisterResponseModel registerResponseModel) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString('token', registerResponseModel.jwt);
    sharedPreferences.setString(
        'username', registerResponseModel.user.username);
    sharedPreferences.setString('email', registerResponseModel.user.email);

    return true;
  }

  Future<RegisterResponseModel> getUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String token = sharedPreferences.getString('token');
    String username = sharedPreferences.getString('username');
    String email = sharedPreferences.getString('email');

    return RegisterResponseModel(
        jwt: token, user: User(username: username, email: email));
  }

  void removeUser() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.remove('token');
    sharedPreferences.remove('username');
    sharedPreferences.remove('email');
  }

  Future<String> getToken(args) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    return token;
  }

}