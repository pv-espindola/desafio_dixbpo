import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderScope extends StatelessWidget {
  final Widget child;
  const ProviderScope({
    required this.child,
    super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: const[

    ],
    child: child,
    );
  }
}
