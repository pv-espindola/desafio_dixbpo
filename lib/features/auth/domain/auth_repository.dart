import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/app_config.dart';
import '../../../service/api_service.dart';
import '../../../service/endpoint.dart';
import '../data/user.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository({
    required this.apiService,
  });

  /// Sign in with email and password. If credentials are stored locally,
  /// they will be retrieved from shared preferences. Either way, this method
  /// will return a Map with the following keys: 'key' and 'id'.
  Future<User> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    late String? authKey;
    late String userId;

    Map<String, String> userMapReturn;

    try {
      // if (await apiService.hasLocalCredentials()) {
      //   final userData = prefs.getString('userData')!;
      //
      //   final user = User.fromMap(json.decode(userData));
      //
      //   authKey = prefs.getString('authKey')!;
      //   userId = user.id.toString();
      //
      //   return user;
      // } else {
        // if no local credentials are stored, we need to login
      print('REPOSITORY: email: $email  password: $password ');


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
      print('LOGIN RESPONSE DATA: ${userData} ');
        final user = User.fromMap(userData);
        return user;
      //}
    } on Exception {
      await apiService.removeLocalCredentials();
      rethrow;
    }
  }

  /// Sign up with email only. Password will be sent to email. The request to
  /// register endpoint will automatically log the user in if successful. So,
  /// we return the same data as signin (Map with 'key' and 'id' keys).
  Future<bool> signup({required User user}) async {
    try {
      final Map<String, dynamic> body;

      body = user.toMap();

      final response = await apiService.post(
        Endpoint.userRegister,
        body: body,
      );

      final authData =
          json.decode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

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
