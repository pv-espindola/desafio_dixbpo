import 'package:desafio_dixbpo/features/auth/presentation/providers/register_form_provider.dart';
import 'package:desafio_dixbpo/features/home/domain/auctions_repository.dart';
import 'package:desafio_dixbpo/features/home/presentation/providers/auctions_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    SharedPreferences prefs = AppConfig.of(context).prefs;
    final apiService = ApiService(prefs: prefs);
    apiService.configApiService(AppConfig.of(context).apiConfig);

    final authRepository = AuthRepository(
      prefs: prefs,
      apiService: apiService,
    );

    final auctionsRepository = AuctionsRepository(
      apiService: apiService,
    );



    return MultiProvider(providers: [
      ChangeNotifierProvider<AuthProvider>(
        create: (_) => AuthProvider(authRepository: authRepository),
      ),
      ChangeNotifierProvider<RegisterFormProvider>(
        create: (_) => RegisterFormProvider(authRepository: authRepository),
      ),
      ChangeNotifierProvider<AuctionsProvider>(
        create: (_) => AuctionsProvider(repository: auctionsRepository),
      ),


    ],
    child: child,
    );
  }
}
