import 'package:flutter/material.dart';

import 'features/auth/presentation/ui/pages/login_page.dart';

class DesafioApp extends StatelessWidget {
  const DesafioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
