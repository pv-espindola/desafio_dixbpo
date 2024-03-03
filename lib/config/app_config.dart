import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_config.dart';

class AppConfig extends InheritedWidget {
  final String appTitle;
  final ApiConfig apiConfig;
  final SharedPreferences prefs;

  const AppConfig({
    Key? key,
    required this.appTitle,
    required this.apiConfig,
    required this.prefs,
    required Widget child,
  }) : super(key: key, child: child);

  static AppConfig of(BuildContext context) {
    final AppConfig? result =
        context.dependOnInheritedWidgetOfExactType<AppConfig>();
    assert(result != null, 'No AppConfig found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppConfig oldWidget) => false;

  //String get version => "${packageInfo.version} (${packageInfo.buildNumber})";

  InputDecoration get loginStyle => InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      filled: true,
      fillColor: Colors.white);





}
