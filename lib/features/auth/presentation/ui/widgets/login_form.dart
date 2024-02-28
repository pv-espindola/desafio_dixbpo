import 'package:desafio_dixbpo/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = context.read<AuthProvider>();
    ThemeData theme = Theme.of(context);
print('THEME: ${theme.brightness.toString()}');
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 12, top: 16),
              child: Text(
                'Email',
                style:
                    theme.textTheme.titleMedium!.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.white),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 12, top: 16),
              child: Text(
                'Senha',
                style:
                    theme.textTheme.titleMedium!.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.white),
              obscureText: true,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      // If the button is pressed, return green, otherwise blue
                      if (states.contains(MaterialState.pressed)) {
                        return theme.colorScheme.onPrimary;
                      }
                      return theme.colorScheme.tertiary;
                    }),
                  ),
                  child: const Text('Esqueceu sua senha?')),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                    // If the button is pressed, return green, otherwise blue
                    if (states.contains(MaterialState.pressed)) {
                      return theme.colorScheme.onPrimary;
                    }
                    return theme.colorScheme.secondaryContainer;
                  },
                ),
              ),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: Text(
                    'Entrar',
                    style: theme.textTheme.headlineMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                    width: 5.0, color: theme.colorScheme.secondaryContainer),
              ),

              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: Text(
                    'Criar conta',
                    style: theme.textTheme.headlineMedium!
                        .copyWith(color: theme.colorScheme.secondaryContainer),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
