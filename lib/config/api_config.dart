class ApiConfig {
  final String host;
  final int port;
  final String prefix;
  final bool useHttps;

  const ApiConfig({
    required this.host,
    this.port = 80,
    required this.prefix,
    required this.useHttps,
  });
}
