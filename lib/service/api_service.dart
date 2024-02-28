

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/api_config.dart';
import '../config/app_exceptions.dart';

class ApiService {
  late ApiConfig config;
  late String host;
  late String prefix;
  late int port;
  late bool useHttps;

  Map<String, String> headers = {};

  static final ApiService _apiService = ApiService._internal();

  factory ApiService() {
    return _apiService;
  }

  ApiService._internal();
  void configApiService(ApiConfig config) {
    // On Android, if the API host is set to localhost, use specific IP.
    host = config.host;

    port = config.port;
    prefix = config.prefix;
    useHttps = config.useHttps;


  }
  Future<Response> get(String endpoint,
      {Map<String, String>? headers,
        Map<String, String>? params,
        bool? isSlashNeedIt}) async {
    Map<String, String> mergedHeaders = headers ?? {};

    final prefs = await SharedPreferences.getInstance();
    String? authKey = prefs.getString('authKey');
    if (authKey != null) {
      mergedHeaders
          .addAll({});
    }

    var response = await http.get(
      endpointUri(endpoint, params: params, isSlashNeedIt: isSlashNeedIt),
      headers: mergeHeaders(mergedHeaders),
    );


      final bool isRefresh = false;

      if (isRefresh) {
        authKey = prefs.getString('authKey');
        mergedHeaders.addAll(
            {});

        response = await http.get(
          endpointUri(endpoint, params: params, isSlashNeedIt: isSlashNeedIt),
          headers: mergeHeaders(mergedHeaders),
        );
      }


    //debugPrint('Uri: ${endpointUri(endpoint, params: params)}');

    return handleExceptions(response);
  }

  /// Wrapper for POST requests that accepts an [Endpoint] string, parses the
  /// response handling the set-cookie header, and returns the HTTP response,
  /// checking response status and raising possible exceptions.
  Future<Response> post(
      String endpoint, {
        Map<String, String>? headers,
        Object? body,
        Encoding? encoding,
      }) async {
    Map<String, String> mergedHeaders = headers ?? {};

    mergedHeaders.addAll({
      'Content-Type': 'application/json',
    });
    final prefs = await SharedPreferences.getInstance();
    String? authKey = prefs.getString('authKey');
    if (authKey != null) {
      mergedHeaders
          .addAll({'Authorization': 'authMethodRepository.formatToken(authKey)'});
    }

    var response = await http.post(
      endpointUri(endpoint),
      headers: mergeHeaders(mergedHeaders),
      body: json.encode(body),
      encoding: encoding,
    );

    // Handle set-cookie header for both web and app using the appropriate code
    // given by the HttpClient.
    //await HttpClient.instance.handleHeaders(response, this.headers);

    if (handleExceptions(response).statusCode == 401) {
     // final bool isRefresh = await authMethodRepository.refreshToken(prefs);

      if (true) {
        authKey = prefs.getString('authKey');
        mergedHeaders.addAll(
            {'Authorization':' '});

        response = await http.post(
          endpointUri(endpoint),
          headers: mergeHeaders(mergedHeaders),
          body: json.encode(body),
          encoding: encoding,
        );
      }
    }

    return handleExceptions(response);
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
    case 200:
    default:
      return response;
  }
}

  Map<String, String> mergeHeaders(Map<String, String>? headers) {
    var mergedHeaders = Map<String, String>.from(this.headers);
    mergedHeaders.addAll(headers ?? {});
    mergedHeaders.addAll({
      // 'content-type': 'application/json; charset=utf-8',
      'Accept': 'application/json',
    });

    return mergedHeaders;
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