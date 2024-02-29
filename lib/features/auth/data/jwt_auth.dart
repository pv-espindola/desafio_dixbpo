import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class AuthMethodRepository {
  String keyAuthMap = '';
  String keyRefreshToken = '';
  Future<Map<String, String>> logIn(Map<String, dynamic> authData);
  // Future<bool> refreshToken(SharedPreferences prefs);
  String formatToken(String? token);
}

class JwtAuth implements AuthMethodRepository {
  @override
  String keyAuthMap = 'key';
  @override
  String keyRefreshToken = 'refresh_token';

  @override
  Future<Map<String, String>> logIn(Map<String, dynamic> authData) async {
    debugPrint('auth data:   $authData');
    final prefs = await SharedPreferences.getInstance();
    // final authKey = authData[keyAuthMap] as String;
    final refreshToken = authData[keyRefreshToken].toString();
    final userId = authData['id'].toString();
    // prefs.setString('authKey', authKey);
    prefs.setString(keyRefreshToken, refreshToken);

    return {
      'key': 'authKey',
      'id': userId,
    };
  }

  @override
  // Future<bool> refreshToken(SharedPreferences prefs) async {
  //   final ApiService apiService = ApiService();
  //   try {
  //     // 'auth/token/refresh'
  //     // final refreshTokenResponse = await apiService.post(Endpoint.refreshToken,
  //     //     body: json.encode({"refresh": prefs.get(keyRefreshToken)}));
  //     final authData = json.decode(utf8.decode(refreshTokenResponse.bodyBytes))
  //         as Map<String, dynamic>;
  //     final authKey = authData['access'].toString();
  //
  //     prefs.setString('authKey', authKey);
  //
  //     debugPrint('token updated with refresh token');
  //     return true;
  //   } catch (err) {
  //     debugPrint(err.toString());
  //     return false;
  //   }
  // }

  @override
  String formatToken(String? token) {
    return 'app $token';
  }


}

// class BasicAuthToken implements AuthMethodRepository {
//   @override
//   String keyAuthMap = 'key';
//   @override
//   Future<Map<String, String>> logIn(Map<String, dynamic> authData) async {
//     final prefs = await SharedPreferences.getInstance();
//     final authKey = authData[keyAuthMap].toString();
//     final userId = authData['user'].toString();
//     prefs.setString('authKey', authKey);

//     return {
//       'key': authKey,
//       'id': userId,
//     };
//   }

//   @override
//   Future<bool> refreshToken(SharedPreferences prefs) {
//     throw false;
//   }

//   @override
//   String formatToken(String? token) {
//     return '$token';
//   }
// }
