import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class AuthMethodRepository {
  String keyAuthMap = '';
  Future<Map<String, String>> logIn(Map<String, dynamic> authData);
  String formatToken(String? token);
}

class AuthToken implements AuthMethodRepository {
  final SharedPreferences prefs;
  AuthToken({required this.prefs});
  @override
  String keyAuthMap = 'token';

  @override
  Future<Map<String, String>> logIn(Map<String, dynamic> authData) async {
    debugPrint('auth data:   $authData');
    final prefs = await SharedPreferences.getInstance();
    final authKey = authData[keyAuthMap] as String;
    final userId = authData['id'].toString();
    final userData = authData['user_data'].toString();
    prefs.setString(keyAuthMap, authKey);
    prefs.setString('id', userId);
    prefs.setString('user_data', userData);


    return {
      'auth_token': authKey,
      'id': userId,
    };
  }

  bool get haveAccess => prefs.containsKey(keyAuthMap) && prefs.containsKey('user_data');

  Map<String, dynamic> get userData {
    String data = prefs.getString('user_data') ?? '';
    return json.decode(data);
  }
  String get token => prefs.getString(keyAuthMap)!;

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
