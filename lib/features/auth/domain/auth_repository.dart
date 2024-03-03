import 'dart:convert';

import 'package:desafio_dixbpo/features/auth/data/auth_token.dart';
import 'package:desafio_dixbpo/features/auth/data/register_form_model.dart';
import 'package:desafio_dixbpo/features/auth/presentation/ui/widgets/register_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/app_config.dart';
import '../../../service/api_service.dart';
import '../../../service/endpoint.dart';
import '../data/user.dart';

class AuthRepository {
  final SharedPreferences prefs;
  final ApiService apiService;
  late AuthToken authToken;

  AuthRepository({
    required this.prefs,
    required this.apiService,
  }) {
    authToken = AuthToken(prefs: prefs);
  }




  Future<User> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();


    Map<String, String> userMapReturn;

    try {
      if (apiService.hasLocalCredentials()) {
        final userData = prefs.getString('user_data')!;
        final user = User.fromMap(json.decode(userData));


        return user;
      } else {
      final response = await apiService.post(
          Endpoint.userLogin,
          params: {
            'username': email,
            'password': password,
          },
        );
        print('ON LOGIN RESPONSE: ${response.statusCode} ');
        final authData = json.decode(utf8.decode(response.bodyBytes))
            as Map<String, dynamic>;
      Map<String, dynamic> userData = authData['data']['user'];
      String accessToken = authData['data']['token'];
      // print('LOGIN RESPONSE DATA: ${userData} ');
      // print('LOGIN RESPONSE token: ${accessToken} ');

        final user = User.fromMap(userData);
        authToken.logIn({
          'token' : accessToken,
          'id' : user.id,
          'user_data' : jsonEncode(userData)
        });
        return user;
      }
    } on Exception {
      await apiService.removeLocalCredentials();
      rethrow;
    }
  }

  /// Sign up with email only. Password will be sent to email. The request to
  /// register endpoint will automatically log the user in if successful. So,
  /// we return the same data as signin (Map with 'key' and 'id' keys).
  Future<bool> signup({required RegisterFormModel user}) async {
    try {
      final Map<String, dynamic> body;

      body = user.toMap();

      final response = await apiService.post(
        Endpoint.userRegister,
        body: body,
      );

      final authData =
          json.decode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      print('REGISTER NEW USER \n $authData');

      // keep the data in local storage
      // Map<String, String> userMapReturn =
      //     await authMethodRepository.logIn(authData);

      return true;
    } on Exception {
      await apiService.removeLocalCredentials();
      rethrow;
    }
  }

  /// Sign the user out. This will trigger a sign out request to the API and
  /// remove any local credentials.
  Future<void> signOut() async {
    try {} finally {
      await apiService.removeLocalCredentials();
    }
  }
}
