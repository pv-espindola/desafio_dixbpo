
import 'package:desafio_dixbpo/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        position: PopupMenuPosition.under,
        itemBuilder: (context)=> [
       PopupMenuItem(
          child:  Text('Sair'),
      onTap: context.read<AuthProvider>().signOut,
      )
          ]
        );
  }
}
