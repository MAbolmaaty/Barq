import 'package:barq/src/models/authentication_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(AuthenticationResponseModel authenticationResponseModel) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString('token', authenticationResponseModel.jwt);
    sharedPreferences.setString(
        'username', authenticationResponseModel.user.username);
    sharedPreferences.setString('email', authenticationResponseModel.user.email);

    return true;
  }

  Future<AuthenticationResponseModel> getUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String token = sharedPreferences.getString('token');
    String username = sharedPreferences.getString('username');
    String email = sharedPreferences.getString('email');

    return AuthenticationResponseModel(
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
