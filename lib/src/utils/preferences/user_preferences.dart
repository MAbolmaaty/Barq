import 'package:barq/src/models/authentication_response_model.dart';
import 'package:barq/src/models/profile_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(AuthenticationResponseModel authenticationResponseModel) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString('token', authenticationResponseModel.jwt);
    sharedPreferences.setString(
        'username', authenticationResponseModel.user.username);
    sharedPreferences.setString('email', authenticationResponseModel.user.email);
    sharedPreferences.setString('user_id', authenticationResponseModel.user.sId);

    return true;
  }

  Future<bool> saveProfilePicture(ProfileResponseModel profileResponseModel) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();

    sharedPreferences.setString('profile_picture_id', profileResponseModel.profilePicture.sId);

    return true;
  }

  Future<AuthenticationResponseModel> getUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String token = sharedPreferences.getString('token');
    String username = sharedPreferences.getString('username');
    String email = sharedPreferences.getString('email');
    String userId = sharedPreferences.getString('user_id');

    return AuthenticationResponseModel(
        jwt: token, user: User(username: username, email: email, sId: userId));
  }

  Future<String> getProfilePicture() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();

    String profilePictureId = sharedPreferences.getString('profile_picture_id');

    return profilePictureId;
  }

  void removeUser() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.remove('token');
    sharedPreferences.remove('username');
    sharedPreferences.remove('email');
    sharedPreferences.remove('user_id');
  }

  void removeProfilePicture() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.remove('profile_picture_id');
  }

  Future<String> getToken(args) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    return token;
  }

}
