import 'package:desafio_dixbpo/config/app_config.dart';
import 'package:desafio_dixbpo/features/auth/presentation/providers/auth_provider.dart';
import 'package:desafio_dixbpo/features/auth/presentation/ui/pages/new_user_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  //String? get getInitialEmail => 'fabioln@ldix.com';
  //String? get getInitialEmail => 'pvespindola.developer@gmail.com';
  String? get getInitialEmail => null;

  //String? get getInitialPassword => '1234567o';
  //String? get getInitialPassword => '123456789!';
  String? get getInitialPassword => null;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = context.read<AuthProvider>();
    ThemeData theme = Theme.of(context);
    print('THEME: ${theme.brightness.toString()}');
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Form(
        key: auth.formKey,
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
              initialValue: getInitialEmail,
              decoration: AppConfig.of(context).loginStyle,
              validator: (value) {
                value ??= '';
                if (value.isEmpty) {
                  return 'Campo Obrigatorio';
                }
                return null;
              },
              onSaved: (value) => auth.loadEmail(value!),
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
              initialValue: getInitialPassword,
              decoration: AppConfig.of(context).loginStyle,
              obscureText: true,
              validator: (value) {
                value ??= '';
                if (value.isEmpty) {
                  return 'Campo Obrigatorio';
                }
                return null;
              },
              onSaved: (value) => auth.loadPassword(value!),
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
              onPressed: () {
                auth.login();
              },
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
              onPressed: () {
                Navigator
                    .of(context)
                    .push(MaterialPageRoute(
                    builder: (_) => const NewUserPage()));
                },
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
