import 'package:desafio_dixbpo/features/auth/presentation/providers/auth_provider.dart';
import 'package:desafio_dixbpo/features/auth/presentation/providers/auth_state.dart';
import 'package:desafio_dixbpo/features/auth/presentation/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/presentation/ui/pages/home_page.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = context.watch<AuthProvider>();

    switch (auth.state.authStatus) {
      case AuthStatus.loading:
        return const LoginPage();
      case AuthStatus.authenticated:
        return const HomePage();
      case AuthStatus.unauthenticated:
      default:
        return const LoginPage();
    }
  }
}
