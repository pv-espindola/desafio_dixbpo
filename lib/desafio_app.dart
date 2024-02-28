import 'package:flutter/material.dart';

import 'config/color_schemes.g.dart';
import 'features/auth/presentation/ui/pages/login_page.dart';

class DesafioApp extends StatelessWidget {
  const DesafioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const LoginPage(),
    );
  }
}
