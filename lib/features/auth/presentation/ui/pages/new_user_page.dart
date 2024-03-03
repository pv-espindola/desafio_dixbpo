import 'package:desafio_dixbpo/config/app_extensions.dart';
import 'package:desafio_dixbpo/features/auth/presentation/providers/auth_provider.dart';
import 'package:desafio_dixbpo/features/auth/presentation/providers/register_form_provider.dart';
import 'package:desafio_dixbpo/features/auth/presentation/ui/widgets/profile_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/register_form.dart';

class NewUserPage extends StatefulWidget {
  const NewUserPage({super.key});

  @override
  State<NewUserPage> createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {

  @override
  void dispose() {

super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    RegisterFormProvider formProvider = context.read<RegisterFormProvider>();
    return Scaffold(
        body: GestureDetector(
          onTap: ()=> FocusScope.of(context).clearFocus(),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Crie sua conta',
                      style: theme.textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const RegisterForm(),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(onPressed: () {
                      formProvider.buttonAction(context,
                      context.read<AuthProvider>()
                      );
                    }, child: Text(formProvider.buttonLabel)),
                    const SizedBox(height: 8,),
                    OutlinedButton(onPressed: (){

                      context.read<RegisterFormProvider>().reset();
                      Future.delayed(const Duration(milliseconds: 1500), ()=> Navigator.of(context).pop());
                    }, child: const Text('Cancelar'))
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
