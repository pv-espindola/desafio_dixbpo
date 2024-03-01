

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/api_config.dart';
import '../config/app_exceptions.dart';

const authKey = 'Authorization';

class ApiService {
  late ApiConfig config;
  late String host;
  late String prefix;
  late int port;
  late bool useHttps;
  SharedPreferences prefs;
  Map<String, String> headers = {};


  factory ApiService({required SharedPreferences prefs}) {
    final ApiService _apiService = ApiService._internal(prefs);
    return _apiService;
  }

  ApiService._internal(this.prefs);

  void configApiService(ApiConfig config) {
    host = config.host;
    port = config.port;
    prefix = config.prefix;
    useHttps = config.useHttps;
    configHeaders();
  }


  void configHeaders(){
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'app': '583f0a5b-c017-4956-b788-a6305767c117',
      //'Authorization': 'Bearer $token',
    };
  }

  addTokenAccess(String token){
    headers.addAll({authKey: 'Bearer $token'});
  }

  bool get haveAuthorization => headers.containsKey(authKey);

  Future<Response> get(String endpoint,
      {Map<String, String>? headers,
        Map<String, String>? params,
       }) async {

    final prefs = await SharedPreferences.getInstance();

    if (!haveAuthorization) {
      String? token = prefs.getString(authKey);
      if(token != null) {
        addTokenAccess(authKey);
      }
    }
    var response = await http.get(
      endpointUri(
          endpoint,
          params: params),
      headers: this.headers,
    );
    return handleExceptions(response);
  }
  Future<Response> post(
      String endpoint, {
        Map<String, String>? headers,
        Object? body,
        Map<String, String>? params
      }) async {

    try {
      var response = await http.post(
        endpointUri(endpoint,  params: params),
        headers: this.headers,
        body: json.encode(body),

      );
      return handleExceptions(response);
    } on Exception catch (e) {
      print('ERROR API SERVICE $e');
      rethrow;
    }

  }

Response handleExceptions(Response response) {
  switch (response.statusCode) {
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
      return response;
    case 403:
      throw UnauthorizedException(response.body.toString());
    case 404:
      throw NotFoundException(response.body.toString());
    case 405:
      throw Exception(response.body.toString());
    case 500:
    case 501:
    case 502:
    case 503:
    case 504:
      throw ServerErrorException(response.body.toString());
    case 422:
      print('Error 422: ${response.request!.url}');
      return response;
    case 200:
    default:
      return response;
  }
}


  bool hasLocalCredentials(){
    String token = '';
    bool containsAccess = prefs.containsKey('authKey');
    if(containsAccess){
      token = prefs.getString('authKey')!;
      headers.containsKey(authKey)?
          null
          : addTokenAccess(token);
    }


    return containsAccess;
  }

  Future<void> removeLocalCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    headers = {};
  }

  Uri endpointUri(String endpoint,
      {Map<String, String>? params, bool? isSlashNeedIt}) =>
      Uri(
          scheme: useHttps ? 'https' : 'http',
          host: host,
          port: port,
          path: endpointPath(endpoint, params, isSlashNeedIt),
          queryParameters: params);

  addSlash(bool? isNeedIt) {
    if (isNeedIt == null || isNeedIt == true) return '/';
    return '';
  }

  String? endpointPath(
      String endpoint, Map<String, String>? params, bool? isSlashNeedIt) =>
      "$prefix/$endpoint${addSlash(isSlashNeedIt)}";

}