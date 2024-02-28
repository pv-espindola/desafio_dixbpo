import 'package:desafio_dixbpo/desafio_app.dart';
import 'package:flutter/material.dart';

import 'config/provider_scope.dart';

void main() {
  const myApp = ProviderScope(
      child: DesafioApp());

  runApp(myApp);
}
