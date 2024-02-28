

import '../config/api_config.dart';

class ApiService {
  late ApiConfig config;
  late String host;
  late String prefix;
  late int port;
  late bool useHttps;
  late Client client;
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

    client = HttpClient.instance.client;
  }
}