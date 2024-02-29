import 'package:desafio_dixbpo/desafio_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/api_config.dart';
import 'config/app_config.dart';
import 'config/provider_scope.dart';

void main() async{
  await dotenv.load(fileName: "dotenv");
  const myApp = ProviderScope(
      child: DesafioApp());

  final configuredApp = AppConfig(
      appTitle: 'Bid365',
      apiConfig: ApiConfig(
        host: dotenv.env['HOST'] as String,
        prefix: dotenv.env['PREFIX'] as String,
        useHttps: true,
        port: int.parse(dotenv.env['PORT'] as String),
      ),
      prefs: await SharedPreferences.getInstance(),

  child: myApp,
  );

  runApp(configuredApp);
}
