import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/auth/domain/auth_repository.dart';
import '../features/auth/presentation/providers/auth_provider.dart';
import '../service/api_service.dart';
import 'app_config.dart';

class ProviderScope extends StatelessWidget {
  final Widget child;
  const ProviderScope({
    required this.child,
    super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();
    apiService.configApiService(AppConfig.of(context).apiConfig);

    final authRepository = AuthRepository(
      apiService: apiService,
    );

    return MultiProvider(providers: [
      ChangeNotifierProvider<AuthProvider>(
        create: (_) => AuthProvider(authRepository: authRepository),
      ),    ],
    child: child,
    );
  }
}
